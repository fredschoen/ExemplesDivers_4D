
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.tblDoc_e=Null:C1517)
			ALERT:C41("Aucun tblDoc sélectionné.")
			return 
		End if 
		
		$save_o:=Form:C1466.tblDoc_e.save()
		
		If ($save_o.success=False:C215)
			ALERT:C41("error modification lien contact")
			return 
		End if 
		
		ALERT:C41("ok")
End case 