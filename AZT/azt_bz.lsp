(defun azt_bz_start ()
    (if (equal azt_aktualna_skala_blokow nil)
      (setq azt_aktualna_skala_blokow "1")
      (princ "")
  )
  ;(vl-cmdf "_.-insert" "C:\\AZT\\TEMPLATES\\SZABLON_ZBROJENIE.dwg" '(0. 0. 0.) "" "" "")
  ;(vl-cmdf "_.erase" (entlast) "")
  ;(vl-cmdf "_.-purge" "Blocks" "SZABLON_ZBROJENIE" "_N")
  (princ)
)

(defun c:azt_bz_strzalka ()

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
  
  (setq azt_bz_strzalka_punkt1 (getpoint "\nWskaz punkt zaczepienia opisu"))
  (setq azt_bz_strzalka_punkt2 (getpoint azt_bz_strzalka_punkt1 "\nWskaz punkt wstawienia opisu"))
  (command "_layer" "_S" "bz_odn" "")
  (command "_leader" azt_bz_strzalka_punkt1 azt_bz_strzalka_punkt2 "" "" "_N")
  (command "-dimstyle" "_R" azt_bz_dimstyle_wartosc_domyslna)
)

(defun c:azt_bz_strzalka_rozkladu ()

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
  
  (setq azt_bz_strzalka_punkt1 (getpoint "\nWskaz punkt poczatkowy rozkladu: "))
  (setq azt_bz_strzalka_punkt2 (getpoint azt_bz_strzalka_punkt1 "\nWskaz punkt koncowy rozkladu: "))
  (command "_layer" "_S" "bz_odn" "")
  ;(command "_dimaligned" azt_bz_strzalka_punkt1 azt_bz_strzalka_punkt2 "_T" " " (list (+ (car azt_bz_strzalka_punkt1) (* 2.4 (atoi azt_aktualna_skala_blokow))) (+ (cadr azt_bz_strzalka_punkt1) (* 2.4 (atoi azt_aktualna_skala_blokow)))))
  (command "_dimaligned" azt_bz_strzalka_punkt1 azt_bz_strzalka_punkt2 "_T" " " azt_bz_strzalka_punkt2)
  (vlax-put-property
  (vlax-ename->vla-object (entlast))
  'ExtensionLineExtend 0
  )
  (command "-dimstyle" "_R" azt_bz_dimstyle_wartosc_domyslna)
)

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

(defun c:azt_bz_znacznik_rozkladu ()

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
  
  (setq azt_bz_znacznik_rozkladu_punkt1 (getpoint "\nWskaz punkt zaczepienia opisu"))
  (setq azt_bz_znacznik_rozkladu_punkt2 (getpoint azt_bz_znacznik_rozkladu_punkt1 "\nWskaz punkt wstawienia opisu"))
  (command "_layer" "_S" "bz_odn" "")
  (command "_leader" azt_bz_znacznik_rozkladu_punkt1 azt_bz_znacznik_rozkladu_punkt2 "" "" "_N")
  (vlax-put-property
  (vlax-ename->vla-object (entlast))
  'ArrowheadType 12
)
(vlax-put-property
  (vlax-ename->vla-object (entlast))
  'ArrowheadSize 36
)
  (command "-dimstyle" "_R" azt_bz_dimstyle_wartosc_domyslna)
)



;############################ OPIS PUNKTOWY ###############################


(defun c:azt_bz_punktowy_opis_preta_p ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_poj_p.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPret")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPret")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_poj_p") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPret" "_N")
  (command "-rename" "_B" "azt_bz_opis_poj_p" "bik_BlkOpPret")
  
  
  
  (setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  (setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_numer (vla-get-textstring (nth 0 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_gatunek (vla-get-textstring (nth 3 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przekroj (vla-get-textstring (nth 4 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_dlugosc (vla-get-textstring (nth 5 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_uwaga (vla-get-textstring (nth 6 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_metoda_l (vla-get-textstring (nth 7 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_typ_preta (vla-get-textstring (nth 8 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_nr (vla-get-textstring (nth 9 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_fi (vla-get-textstring (nth 10 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_l (vla-get-textstring (nth 11 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_szt (vla-get-textstring (nth 12 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod (vla-get-textstring (nth 13 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_segmenty (vla-get-textstring (nth 14 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_hak1 (vla-get-textstring (nth 15 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_hak2 (vla-get-textstring (nth 16 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_id (vla-get-textstring (nth 17 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_id_c (vla-get-textstring (nth 18 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_b_atr_0 (vla-get-textstring (nth 19 azt_bz_dane_atrybuty)))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

(setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(22.20000000 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(18.00000000 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
				
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

(defun c:azt_bz_punktowy_opis_preta_l ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_poj_l.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPret")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPret")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_poj_l") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPret" "_N")
  (command "-rename" "_B" "azt_bz_opis_poj_l" "bik_BlkOpPret")
  
  
  
  (setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  (setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_numer (vla-get-textstring (nth 0 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_gatunek (vla-get-textstring (nth 3 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przekroj (vla-get-textstring (nth 4 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_dlugosc (vla-get-textstring (nth 5 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_uwaga (vla-get-textstring (nth 6 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_metoda_l (vla-get-textstring (nth 7 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_typ_preta (vla-get-textstring (nth 8 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_nr (vla-get-textstring (nth 9 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_fi (vla-get-textstring (nth 10 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_l (vla-get-textstring (nth 11 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_szt (vla-get-textstring (nth 12 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod (vla-get-textstring (nth 13 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_segmenty (vla-get-textstring (nth 14 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_hak1 (vla-get-textstring (nth 15 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_hak2 (vla-get-textstring (nth 16 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_id (vla-get-textstring (nth 17 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_id_c (vla-get-textstring (nth 18 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod_b_atr_0 (vla-get-textstring (nth 19 azt_bz_dane_atrybuty)))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

(setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(-22.20000000 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(-18.00000000 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
				
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)


;############################ OPIS POWIERZCHNIOWY ###############################

(defun c:azt_bz_powierzchniowy_opis_preta_p ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_rozkl_p.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPretPow")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPretPow")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_rozkl_p") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPretPow" "_N")
  (command "-rename" "_B" "azt_bz_opis_rozkl_p" "bik_BlkOpPretPow")
  
  
  
  (setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPretPow")
  (setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_numer (vla-get-textstring (nth 0 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_gatunek (vla-get-textstring (nth 3 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przekroj (vla-get-textstring (nth 4 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_dlugosc (vla-get-textstring (nth 5 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_uwaga (vla-get-textstring (nth 6 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_metoda_l (vla-get-textstring (nth 7 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_typ_preta "Pow")
  (setq azt_bz_dane_blkpret_przedr_nr (vla-get-textstring (nth 9 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_fi (vla-get-textstring (nth 10 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_l (vla-get-textstring (nth 11 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_szt (vla-get-textstring (nth 12 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod (vla-get-textstring (nth 13 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_hak1 (vla-get-textstring (nth 15 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_hak2 (vla-get-textstring (nth 16 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_id (vla-get-textstring (nth 17 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_id_c (vla-get-textstring (nth 18 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_b_atr_0 (vla-get-textstring (nth 19 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_e "CO")
  (setq azt_bz_dane_blkpret_rozstaw "")
  (setq azt_bz_dane_blkpret_przedr_u "/")
  (setq azt_bz_dane_blkpret_symbol "")
  (setq azt_bz_dane_blkpret_dlugosc_srd "")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
    
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

(setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  
(setq azt_bz_dane_blkpret_rozstaw (getstring "\nPodaj rozstaw pretow: "))
  (if (equal azt_bz_dane_blkpret_rozstaw "")
      (setq azt_bz_dane_blkpret_rozstaw "XXX")
      (princ)
  )  

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  ;(command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_hak1 azt_bz_dane_blkpret_hak2 azt_bz_dane_blkpret_id azt_bz_dane_blkpret_id_c azt_bz_dane_blkpret_b_atr_0 azt_bz_dane_blkpret_przedr_e azt_bz_dane_blkpret_rozstaw azt_bz_dane_blkpret_przedr_u azt_bz_dane_blkpret_symbol azt_bz_dane_blkpret_dlugosc_srd) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(32.94285714 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(28.74285714 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

(defun c:azt_bz_powierzchniowy_opis_preta_l ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_rozkl_l.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPretPow")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPretPow")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_rozkl_l") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPretPow" "_N")
  (command "-rename" "_B" "azt_bz_opis_rozkl_l" "bik_BlkOpPretPow")
  
  
  
  (setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPretPow")
  (setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_numer (vla-get-textstring (nth 0 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_gatunek (vla-get-textstring (nth 3 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przekroj (vla-get-textstring (nth 4 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_dlugosc (vla-get-textstring (nth 5 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_uwaga (vla-get-textstring (nth 6 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_metoda_l (vla-get-textstring (nth 7 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_typ_preta "Pow")
  (setq azt_bz_dane_blkpret_przedr_nr (vla-get-textstring (nth 9 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_fi (vla-get-textstring (nth 10 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_l (vla-get-textstring (nth 11 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_szt (vla-get-textstring (nth 12 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_euro_kod (vla-get-textstring (nth 13 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_hak1 (vla-get-textstring (nth 15 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_hak2 (vla-get-textstring (nth 16 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_id (vla-get-textstring (nth 17 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_id_c (vla-get-textstring (nth 18 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_b_atr_0 (vla-get-textstring (nth 19 azt_bz_dane_atrybuty)))
  (setq azt_bz_dane_blkpret_przedr_e "CO")
  (setq azt_bz_dane_blkpret_rozstaw "")
  (setq azt_bz_dane_blkpret_przedr_u "/")
  (setq azt_bz_dane_blkpret_symbol "")
  (setq azt_bz_dane_blkpret_dlugosc_srd "")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
    
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

(setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  
(setq azt_bz_dane_blkpret_rozstaw (getstring "\nPodaj rozstaw pretow: "))
  (if (equal azt_bz_dane_blkpret_rozstaw "")
      (setq azt_bz_dane_blkpret_rozstaw "XXX")
      (princ)
  )  

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  ;(command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_hak1 azt_bz_dane_blkpret_hak2 azt_bz_dane_blkpret_id azt_bz_dane_blkpret_id_c azt_bz_dane_blkpret_b_atr_0 azt_bz_dane_blkpret_przedr_e azt_bz_dane_blkpret_rozstaw azt_bz_dane_blkpret_przedr_u azt_bz_dane_blkpret_symbol azt_bz_dane_blkpret_dlugosc_srd) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(-32.94285714 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(-28.74285714 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

;###################### OPIS PUNKTOWY - DOWOLNY #######################################

(defun c:azt_bz_punktowy_opis_preta_dow_p ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_poj_p.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPret")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPret")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_poj_p") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPret" "_N")
  (command "-rename" "_B" "azt_bz_opis_poj_p" "bik_BlkOpPret")
  
  
  
  ;(setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPret")
  ;(setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_pozycja (getstring "\nPodaj numer elementu do ktorego przyporzadkowany bedzie pret: "))
  (setq azt_bz_dane_blkpret_numer (getstring "\nPodaj numer preta: "))
  (setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  (setq azt_bz_dane_blkpret_gatunek "A-IIIN")
  (setq azt_bz_dane_blkpret_przekroj (getstring "\nPodaj srednice pretow (#): "))
  (setq azt_bz_dane_blkpret_dlugosc (getstring "\nPodaj calkowita dlugosc preta (mm): "))
  (setq azt_bz_dane_blkpret_uwaga "")
  (setq azt_bz_dane_blkpret_metoda_l "A")
  (setq azt_bz_dane_blkpret_typ_preta "Wid")
  (setq azt_bz_dane_blkpret_przedr_nr "Nr")
  (setq azt_bz_dane_blkpret_przedr_fi "%%c")
  (setq azt_bz_dane_blkpret_przedr_l "L=")
  (setq azt_bz_dane_blkpret_przedr_szt "szt.")
  (setq azt_bz_dane_blkpret_euro_kod "00")
  (setq azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_dlugosc)
  (setq azt_bz_dane_blkpret_euro_kod_hak1 "0")
  (setq azt_bz_dane_blkpret_euro_kod_hak2 "0")
  (setq azt_bz_dane_blkpret_euro_kod_id "0")
  (setq azt_bz_dane_blkpret_euro_kod_id_c "0")
  (setq azt_bz_dane_blkpret_euro_kod_b_atr_0 "bik_Pret")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(22.20000000 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(18.00000000 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
				
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

(defun c:azt_bz_punktowy_opis_preta_dow_l ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_poj_l.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPret")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPret")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_poj_l") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPret" "_N")
  (command "-rename" "_B" "azt_bz_opis_poj_l" "bik_BlkOpPret")
  
  
  
  ;(setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPret")
  ;(setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_pozycja (getstring "\nPodaj numer elementu do ktorego przyporzadkowany bedzie pret: "))
  (setq azt_bz_dane_blkpret_numer (getstring "\nPodaj numer preta: "))
  (setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  (setq azt_bz_dane_blkpret_gatunek "A-IIIN")
  (setq azt_bz_dane_blkpret_przekroj (getstring "\nPodaj srednice pretow (#): "))
  (setq azt_bz_dane_blkpret_dlugosc (getstring "\nPodaj calkowita dlugosc preta (mm): "))
  (setq azt_bz_dane_blkpret_uwaga "")
  (setq azt_bz_dane_blkpret_metoda_l "A")
  (setq azt_bz_dane_blkpret_typ_preta "Wid")
  (setq azt_bz_dane_blkpret_przedr_nr "Nr")
  (setq azt_bz_dane_blkpret_przedr_fi "%%c")
  (setq azt_bz_dane_blkpret_przedr_l "L=")
  (setq azt_bz_dane_blkpret_przedr_szt "szt.")
  (setq azt_bz_dane_blkpret_euro_kod "00")
  (setq azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_dlugosc)
  (setq azt_bz_dane_blkpret_euro_kod_hak1 "0")
  (setq azt_bz_dane_blkpret_euro_kod_hak2 "0")
  (setq azt_bz_dane_blkpret_euro_kod_id "0")
  (setq azt_bz_dane_blkpret_euro_kod_id_c "0")
  (setq azt_bz_dane_blkpret_euro_kod_b_atr_0 "bik_Pret")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(-22.20000000 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(-18.00000000 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
    (if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
				
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD_SEGMENTY")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

;###################### OPIS POWIERZCHNIOWY - DOWOLNY ###################################

(defun c:azt_bz_powierzchniowy_opis_preta_dow_p ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_rozkl_p.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPretPow")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPretPow")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_rozkl_p") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPretPow" "_N")
  (command "-rename" "_B" "azt_bz_opis_rozkl_p" "bik_BlkOpPretPow")
  
  
  
  ;(setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPretPow")
  ;(setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_pozycja (getstring "\nPodaj numer elementu do ktorego przyporzadkowany bedzie pret: "))
  (setq azt_bz_dane_blkpret_numer (getstring "\nPodaj numer preta: "))
  (setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  (setq azt_bz_dane_blkpret_gatunek "A-IIIN")
  (setq azt_bz_dane_blkpret_przekroj (getstring "\nPodaj srednice pretow (#): "))
  (setq azt_bz_dane_blkpret_dlugosc (getstring "\nPodaj calkowita dlugosc preta (mm): "))
  (setq azt_bz_dane_blkpret_uwaga "")
  (setq azt_bz_dane_blkpret_metoda_l "A")
  (setq azt_bz_dane_blkpret_typ_preta "Pow")
  (setq azt_bz_dane_blkpret_przedr_nr "Nr")
  (setq azt_bz_dane_blkpret_przedr_fi "%%c")
  (setq azt_bz_dane_blkpret_przedr_l "L=")
  (setq azt_bz_dane_blkpret_przedr_szt "szt.")
  (setq azt_bz_dane_blkpret_euro_kod "00")
  (setq azt_bz_dane_blkpret_hak1 "0")
  (setq azt_bz_dane_blkpret_hak2 "0")
  (setq azt_bz_dane_blkpret_id "0")
  (setq azt_bz_dane_blkpret_id_c "0")
  (setq azt_bz_dane_blkpret_b_atr_0 "bik_Pret")
  (setq azt_bz_dane_blkpret_przedr_e "CO")
  (setq azt_bz_dane_blkpret_rozstaw "")
  (setq azt_bz_dane_blkpret_przedr_u "/")
  (setq azt_bz_dane_blkpret_symbol "")
  (setq azt_bz_dane_blkpret_dlugosc_srd "")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
    
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)
  
(setq azt_bz_dane_blkpret_rozstaw (getstring "\nPodaj rozstaw pretow (mm): "))
  (if (equal azt_bz_dane_blkpret_rozstaw "")
      (setq azt_bz_dane_blkpret_rozstaw "XXX")
      (princ)
  )  

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  ;(command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_hak1 azt_bz_dane_blkpret_hak2 azt_bz_dane_blkpret_id azt_bz_dane_blkpret_id_c azt_bz_dane_blkpret_b_atr_0 azt_bz_dane_blkpret_przedr_e azt_bz_dane_blkpret_rozstaw azt_bz_dane_blkpret_przedr_u azt_bz_dane_blkpret_symbol azt_bz_dane_blkpret_dlugosc_srd) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(32.94285714 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(28.74285714 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

(defun c:azt_bz_powierzchniowy_opis_preta_dow_l ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setq azt_bz_insunitdefsource_wartosc_domyslna (getvar "INSUNITSDEFSOURCE"))
  (setvar "ATTDIA" 0)
  (setvar "INSUNITSDEFSOURCE" 4)
  
  
  
  (command "-insert" "C:\\AZT\\BLOCKS\\azt_bz_opis_rozkl_l.dwg" '(0 0 0) "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
   (if (tblsearch "block" "bik_BlkOpPretPow")
      (progn
          (setq bss (ssget "x" '((2 . "bik_BlkOpPretPow")(410 . "Model"))))
        (setq val -1)
        (repeat (sslength bss)
          (setq bdata (entget (ssname bss (setq val (1+ val)))))
           (setq bdata (subst (cons 2 "azt_bz_opis_rozkl_l") (assoc 2 bdata) bdata))
          (entmod bdata)
        )
      )
	)
  (vl-cmdf "_.-purge" "Blocks" "bik_BlkOpPretPow" "_N")
  (command "-rename" "_B" "azt_bz_opis_rozkl_l" "bik_BlkOpPretPow")
  
  
  
  ;(setq azt_bz_dane_obiekt (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  ;(setq azt_bz_dane_nazwa_bloku (vla-get-effectivename azt_bz_dane_obiekt))
  (setq azt_bz_dane_nazwa_bloku "bik_BlkOpPretPow")
  ;(setq azt_bz_dane_atrybuty (vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  (setq azt_bz_dane_blkpret_pozycja (getstring "\nPodaj numer elementu do ktorego przyporzadkowany bedzie pret: "))
  (setq azt_bz_dane_blkpret_numer (getstring "\nPodaj numer preta: "))
  (setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )
  (setq azt_bz_dane_blkpret_gatunek "A-IIIN")
  (setq azt_bz_dane_blkpret_przekroj (getstring "\nPodaj srednice pretow (#): "))
  (setq azt_bz_dane_blkpret_dlugosc (getstring "\nPodaj calkowita dlugosc preta (mm): "))
  (setq azt_bz_dane_blkpret_uwaga "")
  (setq azt_bz_dane_blkpret_metoda_l "A")
  (setq azt_bz_dane_blkpret_typ_preta "Pow")
  (setq azt_bz_dane_blkpret_przedr_nr "Nr")
  (setq azt_bz_dane_blkpret_przedr_fi "%%c")
  (setq azt_bz_dane_blkpret_przedr_l "L=")
  (setq azt_bz_dane_blkpret_przedr_szt "szt.")
  (setq azt_bz_dane_blkpret_euro_kod "00")
  (setq azt_bz_dane_blkpret_hak1 "0")
  (setq azt_bz_dane_blkpret_hak2 "0")
  (setq azt_bz_dane_blkpret_id "0")
  (setq azt_bz_dane_blkpret_id_c "0")
  (setq azt_bz_dane_blkpret_b_atr_0 "bik_Pret")
  (setq azt_bz_dane_blkpret_przedr_e "CO")
  (setq azt_bz_dane_blkpret_rozstaw "")
  (setq azt_bz_dane_blkpret_przedr_u "/")
  (setq azt_bz_dane_blkpret_symbol "")
  (setq azt_bz_dane_blkpret_dlugosc_srd "")

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)

		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
    
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-false)
        )
)
  
(setq azt_bz_dane_blkpret_rozstaw (getstring "\nPodaj rozstaw pretow (mm): "))
  (if (equal azt_bz_dane_blkpret_rozstaw "")
      (setq azt_bz_dane_blkpret_rozstaw "XXX")
      (princ)
  )  

  (setq azt_bz_dane_blkpret_scalenie (ssadd))
  ;(command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_typ_preta azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_hak1 azt_bz_dane_blkpret_hak2 azt_bz_dane_blkpret_id azt_bz_dane_blkpret_id_c azt_bz_dane_blkpret_b_atr_0 azt_bz_dane_blkpret_przedr_e azt_bz_dane_blkpret_rozstaw azt_bz_dane_blkpret_przedr_u azt_bz_dane_blkpret_symbol azt_bz_dane_blkpret_dlugosc_srd) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(-32.94285714 0.00000000) "4.20000000") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_pline" '(0.00000000 0.00000000) '(-28.74285714 0.00000000) "") (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
  (command "_ZOOM" "_SCALE" "0.0001X")
  (command "_group" "_C" "*" "" azt_bz_dane_blkpret_scalenie "")
  (command "_scale" azt_bz_dane_blkpret_scalenie "" '(0 0) azt_aktualna_skala_blokow)
  (command "_move" azt_bz_dane_blkpret_scalenie "" '(0 0))
  (setq azt_bz_dane_blkpret_scalenie (ssadd))

(vlax-for azt_bz_dane_obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) azt_bz_dane_nazwa_bloku)
        
		;(if (= (vla-get-objectname azt_bz_dane_obj) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString azt_bz_dane_obj))
        ;)
          
	    (if (= (vla-get-TagString azt_bz_dane_obj) "GATUNEK")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )	
          
		(if (= (vla-get-TagString azt_bz_dane_obj) "TYP_PRETA")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_NR")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_SZT")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "EURO_KOD")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_1")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "HAK_2")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "ID_C")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "B_ATR_0")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "PRZEDR_U")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
		(if (= (vla-get-TagString azt_bz_dane_obj) "SYMBOL")
		  (vla-put-constant azt_bz_dane_obj :vlax-true)
        )
		
)
  
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(setvar "INSUNITSDEFSOURCE" azt_bz_insunitdefsource_wartosc_domyslna)
(princ)
)

(azt_bz_start)