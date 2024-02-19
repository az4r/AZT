(defun c:azt_wylacz_stale ()
  (vl-load-com)
  (setq blockname "bik_BlkOpPret")
  (if (tblsearch "block" blockname)
    (progn
      (setq blk (tblsearch "block" blockname))
      (setq blkname (cdr (assoc 2 blk)))
      (vlax-for o (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) blkname)
        

		;(if (= (vla-get-objectname o) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString o))
        ;)
		
		
		(if (= (vla-get-TagString o) "EURO_KOD_SEGMENTY")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "HAK_1")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "HAK_2")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "ID")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "ID_C")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "B_ATR_0")
		  (vla-put-constant o :vlax-false)
        )
		
      )
      ;(command "attsync" "name" blkname)
    )
    (prompt (strcat "Block named \"" blockname "\" not found."))
  )
)

(defun c:azt_wlacz_stale ()
  (vl-load-com)
  (setq blockname "bik_BlkOpPret")
  (if (tblsearch "block" blockname)
    (progn
      (setq blk (tblsearch "block" blockname))
      (setq blkname (cdr (assoc 2 blk)))
      (vlax-for o (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) blkname)
        

		;(if (= (vla-get-objectname o) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString o))
        ;)
		
		
		(if (= (vla-get-TagString o) "EURO_KOD_SEGMENTY")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "HAK_1")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "HAK_2")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "ID")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "ID_C")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "B_ATR_0")
		  (vla-put-constant o :vlax-true)
        )
		
      )
      ;(command "attsync" "name" blkname)
    )
    (prompt (strcat "Block named \"" blockname "\" not found."))
  )
)