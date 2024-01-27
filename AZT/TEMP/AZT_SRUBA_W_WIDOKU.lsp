(defun c:azt_skleszczenie_sruby ()
  (setq aktualne_skleszczenie_sruby (getreal "\nPodaj skleszczenie sruby: "))
)

(defun c:azt_punkty_skleszczenia_sruby ()
  (setq punkt1_skleszczenia_sruby (getpoint "\nWskaz punkt wstawienia sruby: "))
  (setq punkt2_skleszczenia_sruby (getpoint "\nWskaz kierunek wstawienia sruby: "))
)

(defun c:azt_ucs_sruby ()
  (command "_UCS" punkt1_skleszczenia_sruby (trans punkt2_skleszczenia_sruby 0 1) "")
)

(defun c:przywroc_ucs_sruby ()
  (command "_UCS" "_World")
  (princ)
)

;#######################   SRUBA M16   #######################

(defun c:azt_wprowadz_skleszczenie_sruby ()
  (setq selekcja_sruby_nwid (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 127))))))
  (setq selekcja_sruby_wid (cadr (sssetfirst nil (ssget "_ALL" (list '(62 . 128))))))
  (command "_move" selekcja_sruby_nwid "" '(0.0 0.0 0.0) (list aktualne_skleszczenie_sruby 0.0 0.0))
  (command "_move" selekcja_sruby_wid "" '(0.0 0.0 0.0) (list aktualne_skleszczenie_sruby 0.0 0.0))
  (command "_chprop" selekcja_sruby_wid "" "_C" "ByLayer" "")
  (command "_chprop" selekcja_sruby_nwid "" "_C" "ByLayer" "")
  (command "_.CHPROP" selekcja_sruby_wid "" "_LA" "S_VIEW" "")
  (command "_.CHPROP" selekcja_sruby_nwid "" "_LA" "S_VIEW HIDDEN" "")
)

(defun c:azt_rysuj_leb ()
  (command "_pline" '(-9.0000 -13.8500) '(0.0000 -13.8500) '(0.0000 13.8500) '(-9.0000 13.8500) "")
  (command "_pline" '(-9.0000 -6.9250) '(0.0000 -6.9250) "")
  (command "_pline" '(-9.0000 6.9250) '(0.0000 6.9250) "")
  (command "_arc" '(-9.0000 13.8500) "_C" '(-3.5055 10.3875) '(-9.0000 6.9250))
  (command "_arc" '(-9.0000 6.9250) "_C" '(11.0153 0.5000) '(-10.0000 0.0000))
  (command "_arc" '(-10.0000 0.0000) "_C" '(11.0153 -0.5000) '(-9.0000 -6.9250))
  (command "_arc" '(-9.0000 -6.9250) "_C" '(-3.5055 -10.3875) '(-9.0000 -13.8500))
  (command "_pline" '(-10.0000 -10.3875) '(-10.0000 10.3875) "")
)

(defun c:azt_rysuj_trzpien ()
(command "_pline" '(0.0 8.0) (list aktualne_skleszczenie_sruby 8.0 ) "")
(command "_pline" '(0.0 -8.0) (list aktualne_skleszczenie_sruby -8.0 ) "")
)

(defun c:azt_rysuj_podkladki ()
  (command "_pline" '(0.0000 -15.0000) '(6.0000 -15.0000) '(6.0000 -8.0000) '(0.0000 -8.0000) '(0.0000 -15.0000) "")
  (command "_pline" '(0.0000 -8.5000) '(6.0000 -8.5000) "")
  (command "_pline" '(3.0000 -8.0000) '(3.0000 -15.0000) "")
  (command "_pline" '(0.0000 15.0000) '(0.0000 8.0000) '(6.0000 8.0000) '(6.0000 15.0000) '(0.0000 15.0000) "")
  (command "_pline" '(0.0000 8.5000) '(6.0000 8.5000) "")
  (command "_pline" '(3.0000 8.0000) '(3.0000 15.0000) "")
)

(defun c:azt_rysuj_nakretke ()
  (command "_pline" '(7.0000 -13.8500) '(18.0000 -13.8500) "")
  (command "_pline" '(7.0000 -6.9250) '(18.0000 -6.9250) "")
  (command "_pline" '(7.0000 6.9250) '(18.0000 6.9250) "")
  (command "_pline" '(7.0000 13.8500) '(18.0000 13.8500) "")
  (command "_arc" '(7.0000 13.8500) "_C" '(12.4945 10.3875) '(7.0000 6.9250))
  (command "_arc" '(7.0000 6.9250) "_C" '(27.0153 0.5000) '(6.0000 0.0000))
  (command "_arc" '(6.0000 0.0000) "_C" '(27.0153 -0.5000) '(7.0000 -6.9250))
  (command "_arc" '(7.0000 -6.9250) "_C" '(12.4945 -10.3875) '(7.0000 -13.8500))
  (command "_arc" '(18.0000 -13.8500) "_C" '(12.5055 -10.3875) '(18.0000 -6.9250))
  (command "_arc" '(18.0000 -6.9250) "_C" '(-2.0153 -0.5000) '(19.0000 0.0000))
  (command "_arc" '(19.0000 0.0000) "_C" '(-2.0153 0.5000) '(18.0000 6.9250))
  (command "_arc" '(18.0000 6.9250) "_C" '(12.5055 10.3875) '(18.0000 13.8500))
  (command "_pline" '(6.0000 -10.3875) '(6.0000 10.3875) "")
  (command "_pline" '(19.0000 -10.3875) '(19.0000 10.3875) "")
)

(defun c:azt_rysuj_gwint ()
  (command "_pline" '(19.0000 -8.0000) '(38.0000 -8.0000) '(40.0000 -6.0000) '(40.0000 6.0000) '(38.0000 8.0000) '(19.0000 8.0000) "")
)

(defun c:azt_rysuj_niewidoczna_czesc_sruby ()
  (command "_pline" '(0.0000 -8.0000) '(2.0000 -6.0000) '(40.0000 -6.0000) "")
  (command "_pline" '(0.0000 8.0000) '(2.0000 6.0000) '(40.0000 6.0000) "")
  (command "_pline" '(2.0000 -8.0000) '(2.0000 8.0000) "")
  (command "_pline" '(38.0000 -8.0000) '(38.0000 8.0000) "")
)

(setvar "CECOLOR" "BYLAYER")
(c:azt_skleszczenie_sruby)
(c:azt_punkty_skleszczenia_sruby)
(c:azt_ucs_sruby)
(command "_layer" "_S" "S_VIEW" "")
(command "_ZOOM" "_SCALE" "10000X")
(c:azt_rysuj_leb)
(c:azt_rysuj_trzpien)
(setvar "CECOLOR" "127")
(c:azt_rysuj_niewidoczna_czesc_sruby)
(setvar "CECOLOR" "128")
(c:azt_rysuj_podkladki)
(c:azt_rysuj_nakretke)
(c:azt_rysuj_gwint)
(setvar "CECOLOR" "BYLAYER")
(c:azt_wprowadz_skleszczenie_sruby)
(command "_ZOOM" "_SCALE" "0.0001X")
(c:przywroc_ucs_sruby)

;#######################   KONIEC SRUBY M16   #######################