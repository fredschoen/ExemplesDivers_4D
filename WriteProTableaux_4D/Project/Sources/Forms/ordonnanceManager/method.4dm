If (Form event code:C388=On Load:K2:1)
	//ds.Ordonnance.all().drop()
	If (ds:C1482.Ordonnance.all().length=0)
		var $Prescription_e : cs:C1710.OrdonnanceEntity
		$Prescription_e:=ds:C1482.Ordonnance.new()
		$Prescription_e.Ordonnance_o:=New object:C1471("Prescription1_c"; New collection:C1472; "Prescription2_c"; New collection:C1472)
		$save_o:=$Prescription_e.save()
		ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde du paramètre.")
	End if 
	
	Form:C1466.Ordonnance_e:=ds:C1482.Ordonnance.all().first()
	Form:C1466.prescription1Dragged_o:=Null:C1517
	Form:C1466.prescriptionDragged_o:=Null:C1517
	CreerFormPrescription()
	
End if 

