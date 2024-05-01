Class constructor
	
Function createDefaultSettings($stamp : Integer)->$XML : Text
	
	$dom:=DOM Create XML Ref:C861("preferences")
	
	$stamp:=$stamp+1
	
	DOM SET XML ATTRIBUTE:C866($dom; "stamp"; $stamp)
	
	$cancel_input_form:=DOM Create XML element:C865($dom; "/preferences/com.4d/interface/shortcuts/cancel_input_form")
	DOM SET XML ATTRIBUTE:C866($cancel_input_form; "alt"; False:C215; "command"; False:C215; "ctrl"; False:C215; "key_code"; 0; "shift"; False:C215)
	
	$accept_input_form:=DOM Create XML element:C865($dom; "/preferences/com.4d/interface/shortcuts/accept_input_form")
	DOM SET XML ATTRIBUTE:C866($accept_input_form; "alt"; False:C215; "command"; False:C215; "ctrl"; False:C215; "key_code"; 0; "shift"; False:C215)
	
	$add_subform:=DOM Create XML element:C865($dom; "/preferences/com.4d/interface/shortcuts/add_subform")
	DOM SET XML ATTRIBUTE:C866($add_subform; "alt"; False:C215; "command"; False:C215; "ctrl"; False:C215; "key_code"; 0; "shift"; False:C215)
	
	DOM EXPORT TO VAR:C863($dom; $XML)
	
	DOM CLOSE XML:C722($dom)
	
Function disableStandardShortcuts()
	
	get_settings_file_s