(defun c:attsnotconstant (/ b n)
  (vl-load-com)
  (while (setq b (tblnext "block" (not b)))
    (setq n (cdr (assoc 2 b)))
    (vlax-for o	(vla-item (vla-get-blocks
			    (vla-get-activedocument
			      (vlax-get-acad-object)
			    )
			  )
			  n
		)
      (if (= (vla-get-objectname o) "AcDbAttributeDefinition")
	(vla-put-constant o :vlax-false)
      )
    )
    (command "attsync" "name" n)
  )
)
(c:attsnotconstant)
