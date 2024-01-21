(defun zmiana_warstw_structural ()
  (command "-layer" "_S" "0" "")
  (command "_laymrg" "N" "ST_WIC" "" "N" "S_VIEW THIN" "Y")
  (command "_laymrg" "N" "ST_WIS" "" "N" "S_VIEW" "Y")
  (command "_laymrg" "N" "ST_WIG" "" "N" "S_VIEW SECTION" "Y")
  (command "_laymrg" "N" "ST_OSD" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_LPM" "" "N" "S_VIEW HIDDEN" "Y")
  (command "_laymrg" "N" "ST_LPD" "" "N" "S_CUT LINE" "Y")
  (command "_laymrg" "N" "ST_POM" "" "N" "S_HELPER LINE" "Y")
  (command "_laymrg" "N" "ST_REV" "" "N" "S_REVISION" "Y")
  (command "_laymrg" "N" "ST_VP" "" "N" "Defpoints" "Y")
  (command "_laymrg" "N" "ST_SZR" "" "N" "S_HATCH" "Y")
  (command "_laymrg" "N" "ST_DMLSH" "" "N" "S_DEMOLISH" "Y")
  (command "_laymrg" "N" "ST_xref" "" "N" "S_XREF" "Y")
  (command "_laymrg" "N" "ST_WYM" "" "N" "S_DIMENSION" "Y")
  (command "_laymrg" "N" "ST_TXC" "" "N" "S_TEXT" "Y")
  (command "_laymrg" "N" "ST_TXS" "" "N" "S_TEXT" "Y")
  (command "_laymrg" "N" "ST_TXG" "" "N" "S_TEXT" "Y")
  (command "_laymrg" "N" "ST_DSC" "" "N" "S_TEXT" "Y")
  (command "_laymrg" "N" "ST_GH5" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_GH10" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_GH20" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_GH50" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_GH100" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_GH200" "" "N" "S_GRIDS" "Y")
  (command "_laymrg" "N" "ST_EXISTING" "" "N" "S_HATCH" "Y")
)

(defun zmiana_warstw_advance ()
  ;(setq lay (ssget "_X" (list '(0 . "*LINE") (cons 8 layername) (cons 6 linetype))))
  ;(command "_.LAYER" "_UNlock" "0" "_Thaw" "0" "_ON" "0" "_Set" "0" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 3))))))
  (command "_.CHPROP" avss "" "_LA" "S_VIEW" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 9))))))
  (command "_.CHPROP" avss "" "_LA" "S_HATCH" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 1))))))
  (command "_.CHPROP" avss "" "_LA" "S_GRIDS" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 7) (cons 6 "Continuous"))))))
  (command "_.CHPROP" avss "" "_LA" "S_CUT LINE" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 7) (cons 6 "ZIGZAG"))))))
  (command "_.CHPROP" avss "" "_LA" "S_CUT LINE" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 256) (cons 8 "0"))))))
  (command "_.CHPROP" avss "" "_LA" "S_HATCH" "")
  (command "_.CHPROP" avss "" "_C" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LT" "ByLayer" "")
  (command "_.CHPROP" avss "" "_LW" "ByLayer" "")
  (setq avss (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 7) (cons 8 "0"))))))
  (command "_erase" avss "")
  (setq avss (cadr (sssetfirst nil (ssget "_X" (list '(0 . "TEXT") (cons 7 "Simplex.shx"))))))
  (command "_erase" avss "")
)

(defun c:azt_zmw_st ()
   (zmiana_warstw_structural)
)

(defun c:azt_zmw_as ()
   (zmiana_warstw_advance)
)