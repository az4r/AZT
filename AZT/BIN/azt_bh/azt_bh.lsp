(defun azt_bh_start ()
    (if (equal azt_aktualna_skala_blokow nil)
      (setq azt_aktualna_skala_blokow "1")
      (princ "")
  )
  (princ)
)

(defun c:azt_bz_strzalka ()

(setq azt_bz_aktualny_styl_wymiarow (getvar "DIMSTYLE"))

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
  (command "-dimstyle" "_R" azt_bz_aktualny_styl_wymiarow)
)

(defun c:azt_bz_punktowy_opis_preta ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setvar "ATTDIA" 0)
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
  (command "-insert" azt_bz_dane_nazwa_bloku '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0) (ssadd (entlast) azt_bz_dane_blkpret_scalenie)
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
(princ)
)

(azt_bh_start)

;bik_BlkOpPret

;POZYCJA <0>:
;SZTUK <2x200>:
;GATUNEK <A-IIIN>:
;PRZEKROJ <10>:
;DLUGOSC <1000>:
;UWAGA <CO 200>:
;METODA_L <A>:
;PRZEDR_NR <Nr>:
;PRZEDR_FI <
;PRZEDR_L <L=>:
;PRZEDR_SZT <szt.>:
;EURO_KOD <00>:



;bik_BlkOpPretPow

;NUMER <3>:
;POZYCJA <0>:
;SZTUK <2x11>:
;PRZEKROJ <10>:
;DLUGOSC <900>:
;UWAGA < >:
;METODA_L <A>:
;PRZEDR_FI <
;PRZEDR_L <L=>:
;PRZEDR_E <co>:
;ROZSTAW <200>:
;DLUGOSC_SRD: