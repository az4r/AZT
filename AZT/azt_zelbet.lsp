(defun azt_liczba_pretow_start ()
  (setq azt_aktualna_liczba_pretow_rozstaw "150")
)

(defun azt_dlugosc_preta_start ()
  (setq azt_aktualna_dlugosc_preta_otulina1 "0")
  (setq azt_aktualna_dlugosc_preta_otulina2 "0")
)

(defun c:azt_liczba_pretow ()
  (setq azt_liczba_pretow_punkt1 (getpoint "\nWskaz poczatkowy punkt rozkladu"))
  (setq azt_liczba_pretow_punkt2 (getpoint azt_liczba_pretow_punkt1 "\nWskaz koncowy punkt rozkladu"))  
  
  (setq azt_liczba_pretow_rozstaw (getstring (strcat "\nPodaj rozstaw pretow (mm): <" azt_aktualna_liczba_pretow_rozstaw ">")))
  (if (equal azt_liczba_pretow_rozstaw "")
      (setq azt_liczba_pretow_rozstaw azt_aktualna_liczba_pretow_rozstaw)
      (princ)
  )
  (setq azt_aktualna_liczba_pretow_rozstaw azt_liczba_pretow_rozstaw)
  
  (setq azt_liczba_pretow_odleglosc (distance azt_liczba_pretow_punkt1 azt_liczba_pretow_punkt2))
  (setq azt_liczba_pretow_wynik (rtos ((lambda ( azt_liczba_pretow_licznik ) (cond ((equal 0.0 azt_liczba_pretow_licznik 1e-8) (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1)) ((< (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1) 0) (- (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1) azt_liczba_pretow_licznik)) ((+ (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1) (- 1 azt_liczba_pretow_licznik))))) (rem (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1) 1))))
  (princ (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik))
  (alert (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik))
  (princ)
)

(defun c:azt_dlugosc_preta ()
  (setq azt_dlugosc_preta_punkt1 (getpoint "\nWskaz poczatek preta: "))
  (setq azt_dlugosc_preta_punkt2 (getpoint azt_dlugosc_preta_punkt1 "\nWskaz koniec preta"))
  
  (setq azt_dlugosc_preta_otulina1 (getstring (strcat "\nPodaj otuline poczatku preta (mm): <" azt_aktualna_dlugosc_preta_otulina1 ">")))
  (if (equal azt_dlugosc_preta_otulina1 "")
      (setq azt_dlugosc_preta_otulina1 azt_aktualna_dlugosc_preta_otulina1)
      (princ)
  )
  (setq azt_dlugosc_preta_otulina1 azt_aktualna_dlugosc_preta_otulina1)
  
  (setq azt_dlugosc_preta_otulina2 (getstring (strcat "\nPodaj otuline konca preta (mm): <" azt_aktualna_dlugosc_preta_otulina2 ">")))
  (if (equal azt_dlugosc_preta_otulina2 "")
      (setq azt_dlugosc_preta_otulina2 azt_aktualna_dlugosc_preta_otulina2)
      (princ)
  )
  (setq azt_dlugosc_preta_otulina2 azt_aktualna_dlugosc_preta_otulina2)
  
  (setq azt_dlugosc_preta_rzeczywista_dl_preta (* 5 (fix (+ (/ (-(-(distance azt_dlugosc_preta_punkt1 azt_dlugosc_preta_punkt2) (atoi azt_dlugosc_preta_otulina1))(atoi azt_dlugosc_preta_otulina2)) 5) 0.0001))))
  
  (if (> azt_dlugosc_preta_rzeczywista_dl_preta 12000)
     (setq azt_dlugosc_preta_zbrojeniowego "12000")
     (setq azt_dlugosc_preta_zbrojeniowego (rtos (* 5 (fix (+ (/ (-(-(distance azt_dlugosc_preta_punkt1 azt_dlugosc_preta_punkt2) (atoi azt_dlugosc_preta_otulina1))(atoi azt_dlugosc_preta_otulina2)) 5) 0.0001)))))
  )
  
  (setq azt_dlugosc_preta_zbrojeniowego_komunikat (strcat "Maksymalna dlugosc preta wynosi: " azt_dlugosc_preta_zbrojeniowego " mm"))
  
  ;(setq azt_dlugosc_preta_zbrojeniowego (strcat "Maksymalna dlugosc preta wynosi: " (rtos (* 5 (fix (+ (/ (-(-(distance azt_dlugosc_preta_punkt1 azt_dlugosc_preta_punkt2) (atoi azt_dlugosc_preta_otulina1))(atoi azt_dlugosc_preta_otulina2)) 5) 0.0001))))" mm"))
  (princ azt_dlugosc_preta_zbrojeniowego_komunikat)
  (alert azt_dlugosc_preta_zbrojeniowego_komunikat)
  (princ)

)

;####################################### AZT_ZELBET_OLD #################################################################

(defun zaokragl_w_dol_do_5 (wartosc)
  ;(* 5 (fix (/ wartosc 5)))
  (* 5 (fix (+ (/ wartosc 5) 0.0001)))
)

(defun zaokragl_w_dol_do_rozstawu_pretow (wartosc)
  (* rozstaw_pretow (fix (/ wartosc rozstaw_pretow)))
)

(defun c:pobierz_punkty ()
  (setq punktA (getpoint "\nWskaz poczatkowy skrajny punkt rozkladu z pierwszej strony (od lewej strony): "))
  (setq punktB (getpoint "\nWskaz koncowy skrajny punkt rozkladu z pierwszej strony: "))
  (setq punktC (getpoint "\nWskaz poczatkowy skrajny punkt rozkladu z drugiej strony (z lewej strony): "))
  (setq punktD (getpoint "\nWskaz koncowy skrajny punkt rozkladu z drugiej strony: "))
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
  (setq odsuniecie_c1 (getreal "\nPodaj odsuniecie rozkladu od poczatku rozkladu: "))
  (setq odsuniecie_c2 (getreal "\nPodaj odsuniecie rozkladu od konca rozkladu: "))
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
  (setq wybor (strcase (getstring "\Wyrownaj rozklad pretow wzgledem lewej lub prawej strony okreslonego obszaru (L/P): ")))

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

(azt_liczba_pretow_start)
(azt_dlugosc_preta_start)