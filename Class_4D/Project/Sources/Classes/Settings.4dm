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
	//si méthode à part: %attributes = {"invisible":true,"executedOnServer":true,"preemptive":"capable"}
	$dataFolder:=Folder:C1567(Get 4D folder:C485(Data folder:K5:33; *); fk platform path:K87:2)
	$settingsFolder:=$dataFolder.folder("Settings")
	$settingsFolder.create()
	
	$settingsFile:=$settingsFolder.file("settings.4DSettings")
	
	var $stamp : Integer
	
	$stamp:=1
	
	If ($settingsFile.exists)
		
		$path:=$settingsFile.platformPath
		
		$dom:=DOM Parse XML source:C719($path)
		
		$preferences:=DOM Find XML element:C864($dom; "/preferences")
		
		DOM GET XML ATTRIBUTE BY NAME:C728($preferences; "stamp"; $stamp)
		
		DOM SET XML ATTRIBUTE:C866($preferences; "stamp"; $stamp)
		
		DOM EXPORT TO FILE:C862($dom; $path)
		
	End if 
	
	$settings:=cs:C1710.Settings.new()
	
	$XML:=$settings.createDefaultSettings($stamp)
	
	$settingsFile.setText($XML; "utf-8")
	
	