(vl-load-com)
(defun openRO (fn)
 (vla-activate (vla-open (vla-get-documents (vlax-get-acad-object)) fn :VLAX-TRUE))
)

(defun c:azt_temp_szw ()
(openRO "C:\\AZT\\TEMPLATES\\SZABLON_ZMIANY_WARSTW.dwg")
)

(defun c:azt_temp_new ()
(openRO "C:\\AZT\\TEMPLATES\\SZABLON_2013.dwg")
)