If (Form event code:C388=On Load:K2:1)
	
	OBJECT SET CORNER RADIUS:C1323(*; "Rect@"; 20)
	
	WINDOW LIST:C442($alWindow)
	$tMenuRef:=Create menu:C408
	For ($i; 1; Size of array:C274($alWindow))
		APPEND MENU ITEM:C411($tMenuRef; Get window title:C450($alWindow{$i}))  // Title of menu item
		SET MENU ITEM PARAMETER:C1004($tMenuRef; -1; String:C10($alWindow{$i}))  // Value returned by menu item
	End for 
	$tWindowRef:=Dynamic pop up menu:C1006($tMenuRef)
	RELEASE MENU:C978($tMenuRef)
	
End if 
