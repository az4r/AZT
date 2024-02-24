(defun c:azt_zmiana_strzalki ()
(vl-load-com)
(vlax-put-property
  (vlax-ename->vla-object (car (entsel)))
  'ArrowheadSize
  3.0
)
)
(c:azt_zmiana_strzalki)