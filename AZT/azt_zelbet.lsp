(defun azt_liczba_pretow_start ()
  (setq azt_aktualna_liczba_pretow_rozstaw "150")
)

(defun azt_dlugosc_preta_start ()
  (setq azt_aktualna_dlugosc_preta_otulina1 "0")
  (setq azt_aktualna_dlugosc_preta_otulina2 "0")
)

(defun azt_pret_przekrojowy_start ()
  (setq azt_aktualny_pret_przekrojowy_pojedynczy_srednica "10")
  (princ)
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
  (setq azt_liczba_pretow_dlugosc_rozkladu (rtos (*(- (atoi azt_liczba_pretow_wynik) 1) (atoi azt_liczba_pretow_rozstaw))))
  (princ (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik "\nWymagana dlugosc rozkladu dla tej liczby pretow wynosi: " azt_liczba_pretow_dlugosc_rozkladu " mm"))
  (alert (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik "\nWymagana dlugosc rozkladu dla tej liczby pretow wynosi: " azt_liczba_pretow_dlugosc_rozkladu " mm"))
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
  (setq azt_aktualna_dlugosc_preta_otulina1 azt_dlugosc_preta_otulina1)
  
  (setq azt_dlugosc_preta_otulina2 (getstring (strcat "\nPodaj otuline konca preta (mm): <" azt_aktualna_dlugosc_preta_otulina2 ">")))
  (if (equal azt_dlugosc_preta_otulina2 "")
      (setq azt_dlugosc_preta_otulina2 azt_aktualna_dlugosc_preta_otulina2)
      (princ)
  )
  (setq azt_aktualna_dlugosc_preta_otulina2 azt_dlugosc_preta_otulina2)
  
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

(defun c:azt_pret_przekrojowy_pojedynczy_pelny ()
  (setq azt_pret_przekrojowy_pojedynczy_pelny_scalenie (ssadd))
  (setq azt_pret_przekrojowy_pojedynczy_pelny_srednica (getstring (strcat "Podaj srednice preta [6/8/10/12/16/20/25/28/32]: <" azt_aktualny_pret_przekrojowy_pojedynczy_srednica ">")))
  (if (equal azt_pret_przekrojowy_pojedynczy_pelny_srednica "")
      (setq azt_pret_przekrojowy_pojedynczy_pelny_srednica azt_aktualny_pret_przekrojowy_pojedynczy_srednica)
      (princ)
  )
  (setq azt_aktualny_pret_przekrojowy_pojedynczy_srednica azt_pret_przekrojowy_pojedynczy_pelny_srednica)
  (setq azt_pret_przekrojowy_pojedynczy_pelny_punkt_wstawienia (getpoint "\nWskaz punkt wstawienia preta: "))
  (setvar "CECOLOR" "4")
  (command "_circle" azt_pret_przekrojowy_pojedynczy_pelny_punkt_wstawienia (rtos (/ (atoi azt_pret_przekrojowy_pojedynczy_pelny_srednica) 2))) (ssadd (entlast) azt_pret_przekrojowy_pojedynczy_pelny_scalenie)
  (command "_hatch" "_S" (entlast) "") (ssadd (entlast) azt_pret_przekrojowy_pojedynczy_pelny_scalenie)
  (command "_group" "_C" "*" "" azt_pret_przekrojowy_pojedynczy_pelny_scalenie "")
  (setq azt_pret_przekrojowy_pojedynczy_pelny_scalenie (ssadd))
  (setvar "CECOLOR" "BYLAYER")
  (princ)
)

(defun c:azt_pret_przekrojowy_pojedynczy_pusty ()
  (setq azt_pret_przekrojowy_pojedynczy_pusty_scalenie (ssadd))
  (setq azt_pret_przekrojowy_pojedynczy_pusty_srednica (getstring (strcat "Podaj srednice preta [6/8/10/12/16/20/25/28/32]: <" azt_aktualny_pret_przekrojowy_pojedynczy_srednica ">")))
  (if (equal azt_pret_przekrojowy_pojedynczy_pusty_srednica "")
      (setq azt_pret_przekrojowy_pojedynczy_pusty_srednica azt_aktualny_pret_przekrojowy_pojedynczy_srednica)
      (princ)
  )
  (setq azt_aktualny_pret_przekrojowy_pojedynczy_srednica azt_pret_przekrojowy_pojedynczy_pusty_srednica)
  (setq azt_pret_przekrojowy_pojedynczy_pusty_punkt_wstawienia (getpoint "\nWskaz punkt wstawienia preta: "))
  (setvar "CECOLOR" "4")
  (command "_circle" azt_pret_przekrojowy_pojedynczy_pusty_punkt_wstawienia (rtos (/ (atoi azt_pret_przekrojowy_pojedynczy_pusty_srednica) 2))) (ssadd (entlast) azt_pret_przekrojowy_pojedynczy_pusty_scalenie)
  (command "_group" "_C" "*" "" azt_pret_przekrojowy_pojedynczy_pusty_scalenie "")
  (setq azt_pret_przekrojowy_pojedynczy_pusty_scalenie (ssadd))
  (setvar "CECOLOR" "BYLAYER")
  (princ)
)

;####################################### AZT_ZELBET_OLD #################################################################

(defun azt_obszar_rozkladu_zaokragl_w_dol_do_5 (azt_obszar_rozkladu_wartosc)
  ;(* 5 (fix (/ azt_obszar_rozkladu_wartosc 5)))
  (* 5 (fix (+ (/ azt_obszar_rozkladu_wartosc 5) 0.0001)))
)

(defun azt_obszar_rozkladu_zaokragl_w_dol_do_rozstawu_pretow (azt_obszar_rozkladu_wartosc)
  (* azt_obszar_rozkladu_rozstaw_pretow (fix (/ azt_obszar_rozkladu_wartosc azt_obszar_rozkladu_rozstaw_pretow)))
)

(defun c:azt_obszar_rozkladu_pobierz_punkty ()
  (setq azt_obszar_rozkladu_punktA (getpoint "\nWskaz poczatkowy skrajny punkt rozkladu z pierwszej strony (od lewej strony): "))
  (setq azt_obszar_rozkladu_punktB (getpoint "\nWskaz koncowy skrajny punkt rozkladu z pierwszej strony: "))
  (setq azt_obszar_rozkladu_punktC (getpoint "\nWskaz poczatkowy skrajny punkt rozkladu z drugiej strony (z lewej strony): "))
  (setq azt_obszar_rozkladu_punktD (getpoint "\nWskaz koncowy skrajny punkt rozkladu z drugiej strony: "))
)

(defun c:azt_obszar_rozkladu_zmien_ucs ()
  (command "_UCS" azt_obszar_rozkladu_punktA (trans azt_obszar_rozkladu_punktB 0 1) (trans azt_obszar_rozkladu_punktC 0 1))
)

(defun c:azt_obszar_rozkladu_korekcja_punktow ()
  (setq azt_obszar_rozkladu_AX (car (trans azt_obszar_rozkladu_punktA 0 1)))
  (setq azt_obszar_rozkladu_AY (cadr (trans azt_obszar_rozkladu_punktA 0 1)))
  

  (setq azt_obszar_rozkladu_BX (car (trans azt_obszar_rozkladu_punktB 0 1)))
  (setq azt_obszar_rozkladu_BY (cadr (trans azt_obszar_rozkladu_punktB 0 1)))
  

  (setq azt_obszar_rozkladu_CX (car (trans azt_obszar_rozkladu_punktC 0 1)))
  (setq azt_obszar_rozkladu_CY (cadr (trans azt_obszar_rozkladu_punktC 0 1)))
  

  (setq azt_obszar_rozkladu_DX (car (trans azt_obszar_rozkladu_punktD 0 1)))
  (setq azt_obszar_rozkladu_DY (cadr (trans azt_obszar_rozkladu_punktD 0 1)))
)

(defun c:azt_obszar_rozkladu_parametry_rozkladu ()  
  (setq azt_obszar_rozkladu_odsuniecie_c1 (getreal "\nPodaj odsuniecie rozkladu od poczatku rozkladu: "))
  (setq azt_obszar_rozkladu_odsuniecie_c2 (getreal "\nPodaj odsuniecie rozkladu od konca rozkladu: "))
  (setq azt_obszar_rozkladu_otulina_c1 (getreal "\nPodaj otuline preta zbrojeniowego na pierwszym koncu: "))
  (setq azt_obszar_rozkladu_otulina_c2 (getreal "\nPodaj otuline preta zbrojeniowego na drugim koncu: "))
  
  (setq azt_obszar_rozkladu_rozstaw_pretow (getreal "\nPodaj rozstaw pretow zbrojeniowych: "))
  (setq azt_obszar_rozkladu_dlugosc_rozkladu (azt_obszar_rozkladu_zaokragl_w_dol_do_rozstawu_pretow(-(-(distance azt_obszar_rozkladu_punktA azt_obszar_rozkladu_punktB) azt_obszar_rozkladu_odsuniecie_c1)azt_obszar_rozkladu_odsuniecie_c2)))
  (setq azt_obszar_rozkladu_komunikat_dl_rozkladu (strcat "Dlugosc rozkladu wynosi: (" (rtos azt_obszar_rozkladu_dlugosc_rozkladu 2 2) ")"))
  
  (setq azt_obszar_rozkladu_dlugosc_preta (azt_obszar_rozkladu_zaokragl_w_dol_do_5 (-(-(distance azt_obszar_rozkladu_punktA azt_obszar_rozkladu_punktC) azt_obszar_rozkladu_otulina_c1)azt_obszar_rozkladu_otulina_c2)))
  (setq azt_obszar_rozkladu_komunikat_dl_preta (strcat "Dlugosc preta zbrojeniowego wynosi: (" (rtos azt_obszar_rozkladu_dlugosc_preta 2 2) ")"))
  
  (setq azt_obszar_rozkladu_ilosc_pretow_zbr (fix (+(/ azt_obszar_rozkladu_dlugosc_rozkladu azt_obszar_rozkladu_rozstaw_pretow)1)))
  (setq komunikat_azt_obszar_rozkladu_ilosc_pretow_zbr (strcat "Ilosc pretow zbrojeniowych w rozkladzie: (" (rtos azt_obszar_rozkladu_ilosc_pretow_zbr 2 2) ")"))
)
  
(defun c:azt_obszar_rozkladu_obszar_z_lewej ()
  (setq azt_obszar_rozkladu_punktE (list (+ azt_obszar_rozkladu_AX azt_obszar_rozkladu_odsuniecie_c1) (+ azt_obszar_rozkladu_AY azt_obszar_rozkladu_otulina_c1)))
  (setq azt_obszar_rozkladu_EX (car azt_obszar_rozkladu_punktE))
  (setq azt_obszar_rozkladu_EX (cadr azt_obszar_rozkladu_punktE))
  
  (setq azt_obszar_rozkladu_punktF (list (+ azt_obszar_rozkladu_AX azt_obszar_rozkladu_dlugosc_rozkladu azt_obszar_rozkladu_odsuniecie_c1) (+ azt_obszar_rozkladu_AY azt_obszar_rozkladu_otulina_c1)))
  (setq azt_obszar_rozkladu_FX (car azt_obszar_rozkladu_punktF))
  (setq azt_obszar_rozkladu_FY (cadr azt_obszar_rozkladu_punktF))
  
  (setq azt_obszar_rozkladu_punktG (list (+ azt_obszar_rozkladu_CX azt_obszar_rozkladu_odsuniecie_c1) (- azt_obszar_rozkladu_CY azt_obszar_rozkladu_otulina_c2)))
  (setq azt_obszar_rozkladu_GX (car azt_obszar_rozkladu_punktG))
  (setq azt_obszar_rozkladu_GY (cadr azt_obszar_rozkladu_punktG))
  
  (setq azt_obszar_rozkladu_punktH (list (+ azt_obszar_rozkladu_CX azt_obszar_rozkladu_dlugosc_rozkladu azt_obszar_rozkladu_odsuniecie_c1) (- azt_obszar_rozkladu_CY azt_obszar_rozkladu_otulina_c2)))
  (setq azt_obszar_rozkladu_HX (car azt_obszar_rozkladu_punktH))
  (setq azt_obszar_rozkladu_HY (cadr azt_obszar_rozkladu_punktH))
)

(defun c:azt_obszar_rozkladu_obszar_z_prawej ()
  (setq azt_obszar_rozkladu_punktE (list (- azt_obszar_rozkladu_BX azt_obszar_rozkladu_dlugosc_rozkladu azt_obszar_rozkladu_odsuniecie_c2) (+ azt_obszar_rozkladu_BY azt_obszar_rozkladu_otulina_c1)))
  (setq azt_obszar_rozkladu_EX (car azt_obszar_rozkladu_punktE))
  (setq azt_obszar_rozkladu_EX (cadr azt_obszar_rozkladu_punktE))
  
  (setq azt_obszar_rozkladu_punktF (list (- azt_obszar_rozkladu_BX azt_obszar_rozkladu_odsuniecie_c2) (+ azt_obszar_rozkladu_BY azt_obszar_rozkladu_otulina_c1)))
  (setq azt_obszar_rozkladu_FX (car azt_obszar_rozkladu_punktF))
  (setq azt_obszar_rozkladu_FY (cadr azt_obszar_rozkladu_punktF))
  
  (setq azt_obszar_rozkladu_punktG (list (- azt_obszar_rozkladu_DX azt_obszar_rozkladu_dlugosc_rozkladu azt_obszar_rozkladu_odsuniecie_c2) (- azt_obszar_rozkladu_DY azt_obszar_rozkladu_otulina_c2)))
  (setq azt_obszar_rozkladu_GX (car azt_obszar_rozkladu_punktG))
  (setq azt_obszar_rozkladu_GY (cadr azt_obszar_rozkladu_punktG))
  
  (setq azt_obszar_rozkladu_punktH (list (- azt_obszar_rozkladu_DX azt_obszar_rozkladu_odsuniecie_c2) (- azt_obszar_rozkladu_DY azt_obszar_rozkladu_otulina_c2)))
  (setq azt_obszar_rozkladu_HX (car azt_obszar_rozkladu_punktH))
  (setq azt_obszar_rozkladu_HY (cadr azt_obszar_rozkladu_punktH))
)

(defun c:azt_obszar_rozkladu_wybor_strony ()
  (setq azt_obszar_rozkladu_wybor (strcase (getstring "\Wyrownaj rozklad pretow wzgledem lewej lub prawej strony okreslonego obszaru (L/P): ")))

  (if (= azt_obszar_rozkladu_wybor "L")
      (c:azt_obszar_rozkladu_obszar_z_lewej)
      (if (= azt_obszar_rozkladu_wybor "P")
          (c:azt_obszar_rozkladu_obszar_z_prawej)
      )
  )
)

(defun c:azt_obszar_rozkladu_rysuj_obszar ()
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_pline" azt_obszar_rozkladu_punktE azt_obszar_rozkladu_punktF azt_obszar_rozkladu_punktH azt_obszar_rozkladu_punktG azt_obszar_rozkladu_punktE "")
  (command "_ZOOM" "_SCALE" "0.0001X")
)

(defun c:azt_obszar_rozkladu_przywroc_ucs ()
  (command "_UCS" "_World")
  (princ)
)

(defun c:azt_obszar_rozkladu ()
  (c:azt_obszar_rozkladu_pobierz_punkty)
  (c:azt_obszar_rozkladu_zmien_ucs)
  (c:azt_obszar_rozkladu_korekcja_punktow)
  (c:azt_obszar_rozkladu_parametry_rozkladu)
  (c:azt_obszar_rozkladu_wybor_strony)
  (c:azt_obszar_rozkladu_rysuj_obszar)
  (c:azt_obszar_rozkladu_przywroc_ucs)
  (print azt_obszar_rozkladu_komunikat_dl_rozkladu)
  (print azt_obszar_rozkladu_komunikat_dl_preta)
  (print komunikat_azt_obszar_rozkladu_ilosc_pretow_zbr)
  (alert (strcat azt_obszar_rozkladu_komunikat_dl_rozkladu "\n" azt_obszar_rozkladu_komunikat_dl_preta "\n" komunikat_azt_obszar_rozkladu_ilosc_pretow_zbr))
)

(azt_liczba_pretow_start)
(azt_dlugosc_preta_start)
(azt_pret_przekrojowy_start)