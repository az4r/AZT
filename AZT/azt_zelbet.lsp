(defun zaokragl_w_dol_do_5 (wartosc)
  ;(* 5 (fix (/ wartosc 5)))
  (* 5 (fix (+ (/ wartosc 5) 0.0001)))
)

(defun zaokragl_w_dol_do_rozstawu_pretow (wartosc)
  (* rozstaw_pretow (fix (/ wartosc rozstaw_pretow)))
)

(defun c:pobierz_punkty ()
  (setq punktA (getpoint "\nWskaz punkt A na rysunku: "))
  (setq punktB (getpoint "\nWskaz punkt B na rysunku: "))
  (setq punktC (getpoint "\nWskaz punkt C na rysunku: "))
  (setq punktD (getpoint "\nWskaz punkt D na rysunku: "))
)

(defun c:zmien_ucs ()
  (command "_UCS" punktA (trans punktB 0 1) (trans punktC 0 1))
)

(defun c:korekcja_punktow ()
  (setq AX (car (trans punktA 0 1)))
  (setq AY (cadr (trans punktA 0 1)))
  

  (setq BX (car (trans punktB 0 1)))
  (setq BY (cadr (trans punktB 0 1)))
  

  (setq CX (car (trans punktC 0 1)))
  (setq CY (cadr (trans punktC 0 1)))
  

  (setq DX (car (trans punktD 0 1)))
  (setq DY (cadr (trans punktD 0 1)))
  
  ;(setq komunikat (strcat "Wybrany punkt to A: (" (rtos AX 2 2) ", " (rtos AY 2 2) ")"))
  ;(print komunikat)
  
  ;(setq komunikat (strcat "Wybrany punkt to B: (" (rtos BX 2 2) ", " (rtos BY 2 2) ")"))
  ;(print komunikat)
  
  ;(setq komunikat (strcat "Wybrany punkt to C: (" (rtos CX 2 2) ", " (rtos CY 2 2) ")"))
  ;(print komunikat)
  
  ;(setq komunikat (strcat "Wybrany punkt to D: (" (rtos DX 2 2) ", " (rtos DY 2 2) ")"))
  ;(print komunikat)
)

(defun c:parametry_rozkladu ()  
  (setq odsuniecie_c1 (getreal "\nPodaj odsuniecie rozkladu z pierwszej strony: "))
  (setq odsuniecie_c2 (getreal "\nPodaj odsuniecie rozkladu z drugiej strony: "))
  (setq otulina_c1 (getreal "\nPodaj otuline preta zbrojeniowego na pierwszym koncu: "))
  (setq otulina_c2 (getreal "\nPodaj otuline preta zbrojeniowego na drugim koncu: "))
  
  (setq rozstaw_pretow (getreal "\nPodaj rozstaw pretow zbrojeniowych: "))
  (setq dlugosc_rozkladu (zaokragl_w_dol_do_rozstawu_pretow(-(-(distance punktA punktB) odsuniecie_c1)odsuniecie_c2)))
  (setq komunikat_dl_rozkladu (strcat "Dlugosc rozkladu wynosi: (" (rtos dlugosc_rozkladu 2 2) ")"))
  ;(print komunikat_dl_rozkladu)
  
  (setq dlugosc_preta (zaokragl_w_dol_do_5 (-(-(distance punktA punktC) otulina_c1)otulina_c2)))
  (setq komunikat_dl_preta (strcat "Dlugosc preta zbrojeniowego wynosi: (" (rtos dlugosc_preta 2 2) ")"))
  ;(print komunikat_dl_preta)
  
  (setq ilosc_pretow_zbr (fix (+(/ dlugosc_rozkladu rozstaw_pretow)1)))
  (setq komunikat_ilosc_pretow_zbr (strcat "Ilosc pretow zbrojeniowych w rozkladzie: (" (rtos ilosc_pretow_zbr 2 2) ")"))
  ;(print komunikat_ilosc_pretow_zbr)
)
  
(defun c:obszar_z_lewej ()
  (setq punktE (list (+ AX odsuniecie_c1) (+ AY otulina_c1)))
  (setq EX (car punktE))
  (setq EY (cadr punktE))
  ;(setq komunikat (strcat "Wybrany punkt to E: (" (rtos EX 2 2) ", " (rtos EY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktF (list (+ AX dlugosc_rozkladu odsuniecie_c1) (+ AY otulina_c1)))
  (setq FX (car punktF))
  (setq FY (cadr punktF))
  ;(setq komunikat (strcat "Wybrany punkt to F: (" (rtos FX 2 2) ", " (rtos FY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktG (list (+ CX odsuniecie_c1) (- CY otulina_c2)))
  (setq GX (car punktG))
  (setq GY (cadr punktG))
  ;(setq komunikat (strcat "Wybrany punkt to G: (" (rtos GX 2 2) ", " (rtos GY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktH (list (+ CX dlugosc_rozkladu odsuniecie_c1) (- CY otulina_c2)))
  (setq HX (car punktH))
  (setq HY (cadr punktH))
  ;(setq komunikat (strcat "Wybrany punkt to H: (" (rtos HX 2 2) ", " (rtos HY 2 2) ")"))
  ;(print komunikat)
)

(defun c:obszar_z_prawej ()
  (setq punktE (list (- BX dlugosc_rozkladu odsuniecie_c2) (+ BY otulina_c1)))
  (setq EX (car punktE))
  (setq EY (cadr punktE))
  ;(setq komunikat (strcat "Wybrany punkt to E: (" (rtos EX 2 2) ", " (rtos EY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktF (list (- BX odsuniecie_c2) (+ BY otulina_c1)))
  (setq FX (car punktF))
  (setq FY (cadr punktF))
  ;(setq komunikat (strcat "Wybrany punkt to F: (" (rtos FX 2 2) ", " (rtos FY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktG (list (- DX dlugosc_rozkladu odsuniecie_c2) (- DY otulina_c2)))
  (setq GX (car punktG))
  (setq GY (cadr punktG))
  ;(setq komunikat (strcat "Wybrany punkt to G: (" (rtos GX 2 2) ", " (rtos GY 2 2) ")"))
  ;(print komunikat)
  
  (setq punktH (list (- DX odsuniecie_c2) (- DY otulina_c2)))
  (setq HX (car punktH))
  (setq HY (cadr punktH))
  ;(setq komunikat (strcat "Wybrany punkt to H: (" (rtos HX 2 2) ", " (rtos HY 2 2) ")"))
  ;(print komunikat)
)

(defun c:wybor_strony ()
  (setq wybor (strcase (getstring "\Wybierz strone rozkladu pretow (L/P): ")))

  (if (= wybor "L")
      (c:obszar_z_lewej)
      (if (= wybor "P")
          (c:obszar_z_prawej)
      )
  )
)

(defun c:rysuj_obszar ()
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_pline" punktE punktF punktH punktG punktE "")
  (command "_ZOOM" "_SCALE" "0.0001X")
)

(defun c:przywroc_ucs ()
  (command "_UCS" "_World")
  (princ)
)

(defun c:azt_obszar_rozkladu ()
  (c:pobierz_punkty)
  (c:zmien_ucs)
  (c:korekcja_punktow)
  (c:parametry_rozkladu)
  (c:wybor_strony)
  ;(c:obszar_z_lewej)
  ;(c:obszar_z_prawej)
  (c:rysuj_obszar)
  (c:przywroc_ucs)
  (print komunikat_dl_rozkladu)
  (print komunikat_dl_preta)
  (print komunikat_ilosc_pretow_zbr)
  (alert (strcat komunikat_dl_rozkladu "\n" komunikat_dl_preta "\n" komunikat_ilosc_pretow_zbr))
)