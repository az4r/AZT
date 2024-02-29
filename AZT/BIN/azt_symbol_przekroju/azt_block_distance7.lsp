;; Set Dynamic Block Property Value  -  Lee Mac
;; Modifies the value of a Dynamic Block property (if present)
;; blk - [vla] VLA Dynamic Block Reference object
;; prp - [str] Dynamic Block property name (case-insensitive)
;; val - [any] New value for property
;; Returns: [any] New value if successful, else nil

(defun LM:setdynpropvalue ( blk prp val )
    (setq prp (strcase prp))
    (vl-some
       '(lambda ( x )
            (if (= prp (strcase (vla-get-propertyname x)))
                (progn
                    (vla-put-value x (vlax-make-variant val (vlax-variant-type (vla-get-value x))))
                    (cond (val) (t))
                )
            )
        )
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)

(LM:setdynpropvalue (vlax-ename->vla-object (car (entsel))) "long" 60)


(setq azt_nazwa_atrybutu (strcase "long"))

(vla-get-propertyname (vlax-ename->vla-object (car (entsel))))

(vla-put-value (vlax-ename->vla-object (car (entsel))) (vlax-make-variant 60 (vlax-variant-type (vla-get-value (vlax-ename->vla-object (car (entsel)))))))

(vla-get-propertyname)

(vla-get-propertyname (car (vlax-invoke (vlax-ename->vla-object (car (entsel))) 'getdynamicblockproperties)))
(vla-put-value x (vlax-make-variant val (vlax-variant-type (vla-get-value x))))

(vla-put-value (vlax-ename->vla-object (car (entsel))) (vla-get-propertyname (car (vlax-invoke (vlax-ename->vla-object (car (entsel))) 'getdynamicblockproperties))) 60)

(vla-put-value  (vlax-ename->vla-object (car (entsel))) (vlax-make-variant 60 (vlax-variant-type (vla-get-value (vlax-ename->vla-object (car (entsel)))))))


(setq azt_nazwa_atrybutu (strcase "long"))
(car (vlax-invoke (vlax-ename->vla-object (car (entsel))) 'getdynamicblockproperties))
(vla-get-propertyname (car (vlax-invoke (vlax-ename->vla-object (car (entsel))) 'getdynamicblockproperties)))
(vla-put-value (vlax-ename->vla-object (car (entsel))) (vlax-make-variant 60 (vlax-variant-type (vla-get-value (car (vlax-invoke (vlax-ename->vla-object (car (entsel))) 'getdynamicblockproperties))))))