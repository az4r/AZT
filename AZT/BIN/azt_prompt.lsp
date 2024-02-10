(defun c:azt_prompt ()
(setq azt_profil_widok_lista (vl-directory-files "C:\\AZT\\DATA\\STEEL\\AZT_PL_WID" "HEA*.mln")) ; Lista plikow
(setq azt_profil_widok_lista_wybor "[")
(setq i 0)
(foreach file azt_profil_widok_lista
  (setq i (1+ i))
  (setq azt_profil_widok_lista_wybor (strcat azt_profil_widok_lista_wybor (vl-string-trim "HEA" (vl-filename-base file))))
  (if (< i (length azt_profil_widok_lista))
    (setq azt_profil_widok_lista_wybor (strcat azt_profil_widok_lista_wybor "/"))
  )
)
(setq azt_profil_widok_lista_wybor (strcat azt_profil_widok_lista_wybor "]"))
(setq azt_typ_profil_widok (getstring (strcat "\nWybierz typ profilu " azt_profil_widok_lista_wybor ": <" azt_aktualny_typ_profil_widok ">")))
)

(c:azt_prompt)

;(vl-string-left-trim "HEA" "HEA200")
;(vl-string-right-trim "HEA" "HEA200")
;(vl-string-trim "HEA" "HEA200")