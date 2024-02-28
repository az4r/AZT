(defun c:azt_bz_podzial_rozkladu ()
  (vl-load-com)
  (setq azt_bz_podzial_rozkladu_rozklad (entget (car (entsel "Wskaz rozklad: "))))
  (setq azt_bz_podzial_rozkladu_rozstaw_pretow (getstring "Podaj rozstaw pretow (mm): "))
  (setq azt_bz_podzial_rozkladu_punkt1 (list (cadr (assoc 13 azt_bz_podzial_rozkladu_rozklad)) (caddr (assoc 13 azt_bz_podzial_rozkladu_rozklad))))
  (setq azt_bz_podzial_rozkladu_punkt2 (list (cadr (assoc 14 azt_bz_podzial_rozkladu_rozklad)) (caddr (assoc 14 azt_bz_podzial_rozkladu_rozklad))))
  (setq azt_bz_podzial_rozkladu_punkt_przeciecia (getpoint "Wskaz punkt przeciecia rozkladu: "))
  (setq azt_bz_podzial_rozkladu_punkt_przeciecia (list (car azt_bz_podzial_rozkladu_punkt_przeciecia) (cadr azt_bz_podzial_rozkladu_punkt_przeciecia)))
  
  (setq azt_bz_podzial_rozkladu_os (mapcar '- azt_bz_podzial_rozkladu_punkt1 azt_bz_podzial_rozkladu_punkt2)
        azt_bz_podzial_rozkladu_sprowadzony_punkt1 (trans azt_bz_podzial_rozkladu_punkt1 0 azt_bz_podzial_rozkladu_os)
        azt_bz_podzial_rozkladu_punkt_przeciecia (trans azt_bz_podzial_rozkladu_punkt_przeciecia 0 azt_bz_podzial_rozkladu_os)
  )
  (setq azt_bz_podzial_rozkladu_punkt_przeciecia (trans (cons (- (+ (car azt_bz_podzial_rozkladu_sprowadzony_punkt1) (car azt_bz_podzial_rozkladu_sprowadzony_punkt1)) (car azt_bz_podzial_rozkladu_punkt_przeciecia)) (cdr azt_bz_podzial_rozkladu_punkt_przeciecia)) azt_bz_podzial_rozkladu_os 0))
  (setq azt_bz_podzial_rozkladu_punkt_przeciecia (list (car azt_bz_podzial_rozkladu_punkt_przeciecia) (cadr azt_bz_podzial_rozkladu_punkt_przeciecia)))
  
  
  (setq azt_bz_podzial_rozkladu_dlugosc_rozkladu (distance azt_bz_podzial_rozkladu_punkt1 azt_bz_podzial_rozkladu_punkt2))
  (setq azt_bz_podzial_rozkladu_dlugosc_rozkladu1 (distance azt_bz_podzial_rozkladu_punkt1 azt_bz_podzial_rozkladu_punkt_przeciecia))
  (setq azt_bz_podzial_rozkladu_dlugosc_rozkladu1 (* (atoi azt_bz_podzial_rozkladu_rozstaw_pretow) (fix (+ (/ azt_bz_podzial_rozkladu_dlugosc_rozkladu1 (atoi azt_bz_podzial_rozkladu_rozstaw_pretow)) 0.0001))))
  ;(setq azt_bz_podzial_rozkladu_dlugosc_rozkladu2 (distance azt_bz_podzial_rozkladu_punkt2 azt_bz_podzial_rozkladu_punkt_przeciecia))
  ;(setq azt_bz_podzial_rozkladu_dlugosc_rozkladu2 (* (atoi azt_bz_podzial_rozkladu_rozstaw_pretow) (fix (+ (/ azt_bz_podzial_rozkladu_dlugosc_rozkladu2 (atoi azt_bz_podzial_rozkladu_rozstaw_pretow)) 0.0001))))
  (setq azt_bz_podzial_rozkladu_dlugosc_rozkladu2  (-(- azt_bz_podzial_rozkladu_dlugosc_rozkladu azt_bz_podzial_rozkladu_dlugosc_rozkladu1) (atoi azt_bz_podzial_rozkladu_rozstaw_pretow)))
  (entdel (cdr (assoc -1 azt_bz_podzial_rozkladu_rozklad)))
  (azt_bz_strzalka_podzielonego_rozkladu)
  (princ)
)

(defun azt_bz_strzalka_podzielonego_rozkladu ()

  (vl-load-com)
  (vl-cmdf "_.-insert" "C:\\AZT\\TEMPLATES\\SZABLON_ZBROJENIE.dwg" '(0. 0. 0.) "" "" "")
  (vl-cmdf "_.erase" (entlast) "")
  (vl-cmdf "_.-purge" "Blocks" "SZABLON_ZBROJENIE" "_N")

(setq azt_bz_dimstyle_wartosc_domyslna (getvar "DIMSTYLE"))

  (if (equal azt_aktualna_skala_blokow "1")
	  (command "-dimstyle" "_R" "BZ_ST_1_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "5")
	  (command "-dimstyle" "_R" "BZ_ST_5_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "10")
	  (command "-dimstyle" "_R" "BZ_ST_10_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "20")
	  (command "-dimstyle" "_R" "BZ_ST_20_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "50")
	  (command "-dimstyle" "_R" "BZ_ST_50_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "100")
	  (command "-dimstyle" "_R" "BZ_ST_100_mm")
      (princ "")
  )
  (if (equal azt_aktualna_skala_blokow "200")
	  (command "-dimstyle" "_R" "BZ_ST_200_mm")
      (princ "")
  )
  
  (setq azt_bz_strzalka_podzielonego_rozkladu_kat1 (angle azt_bz_podzial_rozkladu_punkt1 azt_bz_podzial_rozkladu_punkt2))
  (setq azt_bz_strzalka_podzielonego_rozkladu_kat2 (angle azt_bz_podzial_rozkladu_punkt2 azt_bz_podzial_rozkladu_punkt1))
  (setq azt_bz_strzalka_podzielonego_rozkladu_punkt1 azt_bz_podzial_rozkladu_punkt1)
  (setq azt_bz_strzalka_podzielonego_rozkladu_punkt2 (polar azt_bz_strzalka_podzielonego_rozkladu_punkt1 azt_bz_strzalka_podzielonego_rozkladu_kat1 azt_bz_podzial_rozkladu_dlugosc_rozkladu1))
  (setq azt_bz_strzalka_podzielonego_rozkladu_punkt3 azt_bz_podzial_rozkladu_punkt2)
  (setq azt_bz_strzalka_podzielonego_rozkladu_punkt4 (polar azt_bz_strzalka_podzielonego_rozkladu_punkt3 azt_bz_strzalka_podzielonego_rozkladu_kat2 azt_bz_podzial_rozkladu_dlugosc_rozkladu2))
  
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_dimaligned" azt_bz_strzalka_podzielonego_rozkladu_punkt1 azt_bz_strzalka_podzielonego_rozkladu_punkt2 "_T" " " azt_bz_strzalka_podzielonego_rozkladu_punkt2)
  (vlax-put-property
  (vlax-ename->vla-object (entlast))
  'ExtensionLineExtend 0
  )
  (command "_dimaligned" azt_bz_strzalka_podzielonego_rozkladu_punkt3 azt_bz_strzalka_podzielonego_rozkladu_punkt4 "_T" " " azt_bz_strzalka_podzielonego_rozkladu_punkt4)
  (vlax-put-property
  (vlax-ename->vla-object (entlast))
  'ExtensionLineExtend 0
  )
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "-dimstyle" "_R" azt_bz_dimstyle_wartosc_domyslna)
  (princ)
)