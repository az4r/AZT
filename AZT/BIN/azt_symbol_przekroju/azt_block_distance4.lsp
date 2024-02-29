(defun set:distance (blk dis)
  (vl-some '(lambda (x)
              (and (eq "Odległość" (vla-get-propertyname x)) (vlax-put x 'Value dis))
            )
           (vlax-invoke (vlax-ename->vla-object blk) 'getdynamicBlockproperties)
           )
) (vl-load-com)

;USAGE: (set:distance <BlockEntityName> <DistanceValue>)
(set:distance (cdr (assoc -1 (entget (entlast)))) 50)
;(set:distance (vlax-ename->vla-object (entlast)) "50")
;(vlax-ename->vla-object (entlast))




(vlax-invoke (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))) 'getdynamicBlockproperties)
(and (eq "Odległość" (vla-get-propertyname (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))))))

(vla-get-propertyname (car (vlax-invoke (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))) 'getdynamicBlockproperties)))
(vla-get-propertyname (cdr (vlax-invoke (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))) 'getdynamicBlockproperties)))


(vlax-put (vla-get-propertyname (car (vlax-invoke (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))) 'getdynamicBlockproperties))) 'Value 60)