(defun c:azt_schody ()
  (setq azt_schody_roznica_poziomow (getint "\nPodaj roznice poziomow: "))
  (setq azt_schody_ilosc_stopni (getint "\nPodaj ilosc stopni: "))
  (setq azt_schody_ilosc_stopni (rtos (1- azt_schody_ilosc_stopni) 2 0))
  (setq azt_schody_ilosc_stopni (atoi azt_schody_ilosc_stopni))
  ;(setq azt_schody_ilosc_stopni (atof azt_schody_ilosc_stopni))
  (setq azt_schody_wysokosc_miedzy_stopniami (/ azt_schody_roznica_poziomow azt_schody_ilosc_stopni))
  (setq azt_schody_odstep 250)
  ;(setq azt_schody_x1 0)
  ;(setq azt_schody_y1 0)
  ;(setq azt_schody_x2 (+ 0 azt_schody_odstep))
  ;(setq azt_schody_y2 (+ 0 azt_schody_wysokosc_miedzy_stopniami))
  ;(repeat azt_schody_ilosc_stopni
    ;(command "_pline" '(azt_schody_x1 azt_schody_y1) '(azt_schody_x2 azt_schody_y2) "")
    ;(setq azt_schody_x1 (+ azt_schody_x1 azt_schody_odstep))
    ;(setq azt_schody_y1 (+ azt_schody_y1 azt_schody_wysokosc_miedzy_stopniami))
    ;(setq azt_schody_x2 (+ azt_schody_x2 azt_schody_odstep))
    ;(setq azt_schody_y2 (+ azt_schody_y2 azt_schody_wysokosc_miedzy_stopniami))    
  ;)
  
  ;(command "_pline" '(0 0) "_L"
  ;(repeat azt_schody_ilosc_stopni
    ;"@250<0" "@170<90"
  ;)
  ;)
  (command "_pline" '(0 0) "@250<0" "@170<90" "")
  (repeat azt_schody_ilosc_stopni
    (command "_pline" "@0<0" "@250<0" "@170<90" "")
  )
)