// -----------------------------------------------------------------
// EcheanceManager.redirectLabel
// -----------------------------------------------------------------

//Mark: Sur Chargement
If (Form event code:C388=On Load:K2:1)
	
	Form:C1466.selectModePaiement_o:=New object:C1471
	
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=Storage:C1525.redirectLabel.copy()
	OBJECT Get pointer:C1124->index:=-1
End if 

//Mark: Sur Clic
If (Form event code:C388=On Clicked:K2:4)
	
	Form:C1466.echeance_e.redirect:=(OBJECT Get pointer:C1124->currentValue=Storage:C1525.redirectLabel[0])  //vrai ou faux
	
	$save_o:=Form:C1466.echeance_e.save()
	If (Not:C34($save_o.success))
		Form:C1466.notification_ic.popUp("error"; "Sauvegarde de l'échéance"; "Erreur dans l'enregistrement de l'échéance : "+$save_o.statusText)
	End if 
	
End if 