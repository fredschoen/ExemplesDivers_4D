If (Form event code:C388=On Data Change:K2:15)
	$save_o:=Form:C1466.Prescription_e.save()
	ASSERT:C1129($o.success; "Erreur dans la sauvegarde du paramètre.")
End if 
