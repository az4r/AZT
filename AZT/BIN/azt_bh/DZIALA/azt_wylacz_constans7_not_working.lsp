(defun c:changeattsnotconstant ()
  (vl-load-com)
  (setq blockname "bik_BlkOpPret")
  (if (tblsearch "block" blockname)
    (progn
      (setq blk (tblsearch "block" blockname))
      (setq blkname (cdr (assoc 2 blk)))
      (vlax-for o (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) blkname)
        ;(if (= (vla-get-objectname o) "AcDbAttributeDefinition")
          ;(vla-put-constant o :vlax-false)
        ;)
		
		
		(setq obj (vlax-ename->vla-object (car  (entsel "Pick obj"))))
		(vla-put-constant (nth 17 (vlax-invoke obj 'Getattributes)) :vlax-false)
		
		
		
		
      )
      ;(command "attsync" "name" blkname)
    )
    (prompt (strcat "Block named \"" blockname "\" not found."))
  )
)

(c:changeattsnotconstant)
