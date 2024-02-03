(defun azt_schody_start ()
  (setq azt_schody_aktualna_wysokosc_miedzy_stopniami "175")
  (setq azt_schody_aktualny_odstep "250")
)

(defun c:azt_schody ()
  (setq azt_schody_roznica_poziomow (getstring "\nPodaj roznice poziomow (mm): "))
  
  (setq azt_schody_wysokosc_miedzy_stopniami (getstring (strcat "\nPodaj wstepna wysokosc stopnia (mm): <" azt_schody_aktualna_wysokosc_miedzy_stopniami ">")))
    (if (equal azt_schody_wysokosc_miedzy_stopniami "")
      (setq azt_schody_wysokosc_miedzy_stopniami azt_schody_aktualna_wysokosc_miedzy_stopniami)
      (princ "")
  )
  (setq azt_schody_aktualna_wysokosc_miedzy_stopniami azt_schody_wysokosc_miedzy_stopniami)
  
  (setq azt_schody_odstep (getstring (strcat "\nPodaj szerokosc stopnia (mm): <" azt_schody_aktualny_odstep ">")))
    (if (equal azt_schody_odstep "")
      (setq azt_schody_odstep azt_schody_aktualny_odstep)
      (princ "")
  )
  (setq azt_schody_aktualny_odstep azt_schody_odstep)
  
  (setq azt_schody_aktualna_ilosc_stopni (rtos (/ (atoi azt_schody_roznica_poziomow) (atoi azt_schody_wysokosc_miedzy_stopniami)) 2 0))
  (setq azt_schody_ilosc_stopni (getstring (strcat "\nPodaj ilosc stopni: <" azt_schody_aktualna_ilosc_stopni ">")))
    (if (equal azt_schody_ilosc_stopni "")
      (setq azt_schody_ilosc_stopni azt_schody_aktualna_ilosc_stopni)
      (princ "")
  )
  (setq azt_schody_aktualna_ilosc_stopni azt_schody_ilosc_stopni)
  
  (setq azt_schody_aktualna_wysokosc_miedzy_stopniami (rtos (/ (atoi azt_schody_roznica_poziomow) (atoi azt_schody_ilosc_stopni)) 2 0))
  (setq azt_schody_wysokosc_miedzy_stopniami (getstring (strcat "\nPodaj wysokosc stopnia (mm): <" azt_schody_aktualna_wysokosc_miedzy_stopniami ">")))
    (if (equal azt_schody_wysokosc_miedzy_stopniami "")
      (setq azt_schody_wysokosc_miedzy_stopniami azt_schody_aktualna_wysokosc_miedzy_stopniami)
      (princ "")
  )
  (setq azt_schody_aktualna_wysokosc_miedzy_stopniami azt_schody_wysokosc_miedzy_stopniami)
  
  (setq azt_schody_parametr_s (strcat "@" azt_schody_odstep "<0"))
  (setq azt_schody_parametr_h (strcat "@" azt_schody_wysokosc_miedzy_stopniami "<90"))
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_pline" '(0 0) azt_schody_parametr_s azt_schody_parametr_h "")
  (setq azt_bieg_schodowy (ssadd))
  (ssadd (entlast) azt_bieg_schodowy)
  (repeat (1- (atoi azt_schody_ilosc_stopni))
    (command "_pline" "@0<0" azt_schody_parametr_s azt_schody_parametr_h "")
	(ssadd (entlast) azt_bieg_schodowy)
  )
  (command "_pedit" "_M" azt_bieg_schodowy "" "_J" "" "")
  (command "_pline" '(0 0) (strcat "@" (rtos (* (atoi azt_schody_ilosc_stopni) (atoi azt_schody_odstep)) 2 0) "," (rtos (* (atoi azt_schody_ilosc_stopni) (atoi azt_schody_wysokosc_miedzy_stopniami)) 2 0)) "")
  (command "_ZOOM" "_SCALE" "0.0001X")
  (ssadd (entlast) azt_bieg_schodowy)
  
  (alert (strcat "Warunek wynosi: 2h+s=" (rtos (+(* (atoi azt_schody_wysokosc_miedzy_stopniami) 2)(atoi azt_schody_odstep)) 2 0) " (dop. 600-650)"))
  (command "_move" azt_bieg_schodowy "" '(0 0))
  (setq azt_bieg_schodowy (ssadd))
)
(azt_schody_start)
(c:azt_schody)
(princ)
(princ "\n#### UWAGI: arza@niras.com ####")
(princ)