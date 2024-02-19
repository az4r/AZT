(defun c:LoadMlStyles ()
  (setq folder "C:\\AZT\\DATA\\STEEL\\AZT_PL_WID\\") ;; Ścieżka do katalogu z plikami .mln
  (setq files (vl-directory-files folder "*.mln" 1)) ;; Lista plików .mln w katalogu
  (mapcar 'LoadMln files) ;; Wywołanie funkcji LoadMln dla każdego pliku
  (princ)
)

(defun LoadMln (mlnFile / f mlineDict same newStyle xName)
   (setq f (open (strcat folder mlnFile) "r"))
   (if (= NIL f)
      (princ (strcat "\nInvalid MLN file: " mlnFile "\n"))
      (progn
         (setq mlineDict (dictsearch (namedobjdict) "ACAD_MLINESTYLE"))
         (setq same (list (cons 0 "MLINESTYLE")
                          (cons 100 "AcDbMlineStyle")))
         (while (/= nil (setq mlStyle (ReadObject f)))
            (setq newStyle (append same mlStyle)
                  xName    (entmakex newStyle))
            (dictadd (cdr (assoc -1 mlineDict))
                     (cdr (assoc 2 newStyle))
                     xName))
         (close f))
   )
   (princ)
)

(defun ReadObject (f / ObjectList firstLine code value)
  (setq ObjectList nil)
  ;; Skip the 'MLSTYLE'.
  (setq firstLine (read-line f))
  (if (/= nil firstLine)
   (progn
     (while (/= 0 (setq code (atoi (read-line f))))
        (setq value (vl-string-trim " " (read-line f)))
        (if (or (= code 2)
                (= code 3)
                (= code 6))
           (setq ObjectList (append ObjectList
                                    (list (cons code value)))))
        (if (or (= code 70)
                (= code 62)
                (= code 71))
           (setq ObjectList (append ObjectList
                                    (list (cons code (atoi value))))))
        (if (or (= code 51)
                (= code 52))
          ;; Code 51 and 52 must be converted into degrees.
          (setq ObjectList 
                (append ObjectList 
                        (list (cons code (angtof value 0))))))
        (if (= code 49)
           (setq ObjectList 
                 (append ObjectList
                         (list (cons code (atof value)))))))
   ))
  ObjectList
)
