(defun aktualizuj_skale_blokow ()
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_1")
      (setq aktualna_skala_blokow "1")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_5")
      (setq aktualna_skala_blokow "5")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_10")
      (setq aktualna_skala_blokow "10")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_20")
      (setq aktualna_skala_blokow "20")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_50")
      (setq aktualna_skala_blokow "50")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_100")
      (setq aktualna_skala_blokow "100")
      (princ "")
  )
  (if (equal (getvar "CMLEADERSTYLE") "ST_KR_200")
      (setq aktualna_skala_blokow "200")
      (princ "")
  )
)

(defun c:azt_wstaw_maly_mtext ()
  (aktualizuj_skale_blokow)
  (command "-layer" "_S" "S_TEXT" "")
  
  (if (equal aktualna_skala_blokow "1")
      (setq aktualna_wysokosc_tekstu "2")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "5")
      (setq aktualna_wysokosc_tekstu "10")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "10")
      (setq aktualna_wysokosc_tekstu "20")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "20")
      (setq aktualna_wysokosc_tekstu "40")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "50")
      (setq aktualna_wysokosc_tekstu "100")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "100")
      (setq aktualna_wysokosc_tekstu "200")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "200")
      (setq aktualna_wysokosc_tekstu "40")
      (princ "")
  )
  
  (setq punkt_wstwienia_mtextu (getpoint "\nPodaj punkt wstawienia tekstu: "))
  (command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu "_S" "Arial Narrow" punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_skala_blokow "_S" "Arial Narrow" punkt_wstwienia_mtextu)
)

(defun c:azt_wstaw_sredni_mtext ()
  (aktualizuj_skale_blokow)
  (command "-layer" "_S" "S_TEXT" "")
  
  (if (equal aktualna_skala_blokow "1")
      (setq aktualna_wysokosc_tekstu "2.5")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "5")
      (setq aktualna_wysokosc_tekstu "12.5")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "10")
      (setq aktualna_wysokosc_tekstu "25")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "20")
      (setq aktualna_wysokosc_tekstu "50")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "50")
      (setq aktualna_wysokosc_tekstu "125")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "100")
      (setq aktualna_wysokosc_tekstu "250")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "200")
      (setq aktualna_wysokosc_tekstu "500")
      (princ "")
  )
  
  (setq punkt_wstwienia_mtextu (getpoint "\nPodaj punkt wstawienia tekstu: "))
  (command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu "_S" "Arial Narrow" punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_skala_blokow "_S" "Arial Narrow" punkt_wstwienia_mtextu)
)

(defun c:azt_wstaw_duzy_mtext ()
  (aktualizuj_skale_blokow)
  (command "-layer" "_S" "S_TEXT" "")
  
  (if (equal aktualna_skala_blokow "1")
      (setq aktualna_wysokosc_tekstu "3")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "5")
      (setq aktualna_wysokosc_tekstu "15")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "10")
      (setq aktualna_wysokosc_tekstu "30")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "20")
      (setq aktualna_wysokosc_tekstu "60")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "50")
      (setq aktualna_wysokosc_tekstu "150")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "100")
      (setq aktualna_wysokosc_tekstu "300")
      (princ "")
  )
  (if (equal aktualna_skala_blokow "200")
      (setq aktualna_wysokosc_tekstu "600")
      (princ "")
  )
  
  (setq punkt_wstwienia_mtextu (getpoint "\nPodaj punkt wstawienia tekstu: "))
  (command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_wysokosc_tekstu "_S" "Arial Narrow" punkt_wstwienia_mtextu (getstring) "")
  ;(command "_mtext" punkt_wstwienia_mtextu "_H" aktualna_skala_blokow "_S" "Arial Narrow" punkt_wstwienia_mtextu)
)
