(defun c:azt_bz_pobierz_dane_pret ()
  (setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setvar "ATTDIA" 0)
  (setq obj (vlax-ename->vla-object (car  (entsel "Wskaz opis aktywny preta"))))
  (setq blkname (vla-get-effectivename obj))
  (setq atts (vlax-invoke obj 'Getattributes))
  (setq azt_bz_dane_blkpret_numer (vla-get-textstring (nth 0 atts)))
  (setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 atts)))
  (setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 atts)))
  (setq azt_bz_dane_blkpret_gatunek (vla-get-textstring (nth 3 atts)))
  (setq azt_bz_dane_blkpret_przekroj (vla-get-textstring (nth 4 atts)))
  (setq azt_bz_dane_blkpret_dlugosc (vla-get-textstring (nth 5 atts)))
  (setq azt_bz_dane_blkpret_uwaga (vla-get-textstring (nth 6 atts)))
  (setq azt_bz_dane_blkpret_metoda_l (vla-get-textstring (nth 7 atts)))
  (setq azt_bz_dane_blkpret_przedr_nr (vla-get-textstring (nth 9 atts)))
  (setq azt_bz_dane_blkpret_przedr_fi (vla-get-textstring (nth 10 atts)))
  (setq azt_bz_dane_blkpret_przedr_l (vla-get-textstring (nth 11 atts)))
  (setq azt_bz_dane_blkpret_przedr_szt (vla-get-textstring (nth 12 atts)))
  (setq azt_bz_dane_blkpret_euro_kod (vla-get-textstring (nth 13 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_segmenty (vla-get-textstring (nth 14 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_hak1 (vla-get-textstring (nth 15 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_hak2 (vla-get-textstring (nth 16 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_id (vla-get-textstring (nth 17 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_id_c (vla-get-textstring (nth 18 atts)))
  (setq azt_bz_dane_blkpret_euro_kod_b_atr_0 (vla-get-textstring (nth 19 atts)))

(vlax-for o (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) blkname)

		;(if (= (vla-get-objectname o) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString o))
        ;)
		
		
		(if (= (vla-get-TagString o) "EURO_KOD_SEGMENTY")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "HAK_1")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "HAK_2")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "ID")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "ID_C")
		  (vla-put-constant o :vlax-false)
        )
		
		(if (= (vla-get-TagString o) "B_ATR_0")
		  (vla-put-constant o :vlax-false)
        )
		
)


(setq azt_bz_dane_blkpret_sztuk (getstring "\nPodaj liczbe pretow: "))
  (if (equal azt_bz_dane_blkpret_sztuk "")
      (setq azt_bz_dane_blkpret_sztuk "1")
      (princ)
  )


  (command "-insert" blkname '(0 0) "1" "" "" azt_bz_dane_blkpret_numer azt_bz_dane_blkpret_pozycja azt_bz_dane_blkpret_sztuk azt_bz_dane_blkpret_gatunek azt_bz_dane_blkpret_przekroj azt_bz_dane_blkpret_dlugosc azt_bz_dane_blkpret_uwaga azt_bz_dane_blkpret_metoda_l azt_bz_dane_blkpret_przedr_nr azt_bz_dane_blkpret_przedr_fi azt_bz_dane_blkpret_przedr_l azt_bz_dane_blkpret_przedr_szt azt_bz_dane_blkpret_euro_kod azt_bz_dane_blkpret_euro_kod_segmenty azt_bz_dane_blkpret_euro_kod_hak1 azt_bz_dane_blkpret_euro_kod_hak2 azt_bz_dane_blkpret_euro_kod_id azt_bz_dane_blkpret_euro_kod_id_c azt_bz_dane_blkpret_euro_kod_b_atr_0)
  (command "_layer" "_S" "bz_odn" "")
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_circle" '(22.20000000 0.00000000) "4.20000000")
  (command "_pline" '(0.00000000 0.00000000) '(18.00000000 0.00000000) "")
  (command "_ZOOM" "_SCALE" "0.0001X")



(vlax-for o (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) blkname)
        

		;(if (= (vla-get-objectname o) "AcDbAttributeDefinition")
		  ;(print (vla-get-TagString o))
        ;)
		
		
		(if (= (vla-get-TagString o) "EURO_KOD_SEGMENTY")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "HAK_1")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "HAK_2")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "ID")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "ID_C")
		  (vla-put-constant o :vlax-true)
        )
		
		(if (= (vla-get-TagString o) "B_ATR_0")
		  (vla-put-constant o :vlax-true)
        )
		
)


(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
(princ)
)

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