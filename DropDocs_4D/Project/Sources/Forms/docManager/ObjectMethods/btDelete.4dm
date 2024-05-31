If (Form event code:C388=On Clicked:K2:4)
	
	If (Form:C1466.tblDoc_e=Null:C1517)
		ALERT:C41("rien selectionné")
		return 
	End if 
	
	CONFIRM:C162("Vous voulez supprimer "+String:C10(Form:C1466.tblDocSel_es.length)+" tblDocaire(s) ?"; "Oui"; "Non")
	
	If (OK=1)
		Form:C1466.tblDocSel_es.drop()
		ALERT:C41("ok")
		Form:C1466.tblDoc_es:=ds:C1482.tblDoc.all()
		//blanchir la zone web
		toolWebZoneEmpty("WebZoneDoc")
		
	End if 
	
End if 