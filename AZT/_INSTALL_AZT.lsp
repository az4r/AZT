(vla-load (vla-get-menugroups (vlax-get-acad-object)) "C:\\AZT\\azt.cuix")
(command "-TOOLBAR" "AZT" "Float" "400,210" "1")
(command "-TOOLBAR" "AZT_DATA" "Float" "400,240" "1")
(command "-TOOLBAR" "AZT_OLD" "Float" "700,240" "1")
(princ "\n###############################################################")
(princ "\n################### ZAINSTALOWANO AZ TOOLBAR ##################")
(princ "\n###############################################################")
(princ)