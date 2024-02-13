(defun c:azt_bz_pobierz_dane_pret ()
(setq azt_bz_attdia_wartosc_domyslna (getvar "ATTDIA"))
(setvar "ATTDIA" 0)
(setq obj (vlax-ename->vla-object (car  (entsel "Pick obj"))))
(setq atts (vlax-invoke obj 'Getattributes))
(setq azt_bz_dane_blkpret_pozycja (vla-get-textstring (nth 1 atts)))
(setq azt_bz_dane_blkpret_sztuk (vla-get-textstring (nth 2 atts)))
(setvar "ATTDIA" azt_bz_attdia_wartosc_domyslna)
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