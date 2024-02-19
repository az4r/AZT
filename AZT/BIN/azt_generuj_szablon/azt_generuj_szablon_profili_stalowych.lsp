(defun c:azt_generuj_szablon_profili_stalowych ()

(command "_CMLSTYLE" "STANDARD")
(vl-cmdf "_.erase" (ssget "_ALL") "")
(vl-cmdf "_.-purge" "Blocks" "AZT_PROFIL_WIDOK" "_N")
;(vl-cmdf "_.-purge" "Mlinestyles" "*" "_N")

(setq azt_aktywny_dokument (vla-get-activedocument (vlax-get-acad-object)))
(setq azt_katalog (vla-item (vla-get-dictionaries azt_aktywny_dokument) "ACAD_MLINESTYLE"))
(vlax-for x azt_katalog
  (setq azt_nazwy_styli_mline (cons (vla-getname azt_katalog x) azt_nazwy_styli_mline))
)
  
  ; Rysowanie wielolinii dla każdego stylu
  (foreach style azt_nazwy_styli_mline
    (command "_mline" "_s" "1" "_j" "_z" "_st" style '(0 0) '(10 0) "")
  )
  (setq azt_nazwy_styli_mline nil)
  (princ)
  ;(ssget "_X" (list '(0 . "mline"))
  (command "-block" "AZT_PROFIL_WIDOK" '(0 0) (ssget "_X" (list '(0 . "mline"))) "" )
  (command "_insert" "AZT_PROFIL_WIDOK" '(0 0) "1" "" "")
)
(c:azt_generuj_szablon_profili_stalowych)