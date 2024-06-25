
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$save_o:=Form:C1466.tblOrdonnance_e.save()
		ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde.")
		
		
		ALERT:C41("ok")
End case 