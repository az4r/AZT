(defun c:azt_liczba_pretow ()

(setq azt_liczba_pretow_punkt1 (getpoint "\nWskaz poczatkowy punkt rozkladu"))
 
(setq azt_liczba_pretow_punkt2 (getpoint azt_liczba_pretow_punkt1 "\nWskaz koncowy punkt rozkladu"))

(setq azt_liczba_pretow_rozstaw (getstring "\nPodaj rozstaw pretow: "))

(setq azt_liczba_pretow_odleglosc (distance azt_liczba_pretow_punkt1 azt_liczba_pretow_punkt2)

(setq azt_liczba_pretow_wynik (itoa (ceiling (+ (/ azt_liczba_pretow_odleglosc (atoi azt_liczba_pretow_rozstaw)) 1)))

(princ (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik))

(alert (strcat "Liczba pretow w rozkladzie wynosi: " azt_liczba_pretow_wynik))

)
