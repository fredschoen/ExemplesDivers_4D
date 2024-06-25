If (Form event code:C388=On Load:K2:1)
	//ds.Ordonnance.all().drop()
	If (ds:C1482.Ordonnance.all().length=0)
		var $tblPrescription_e : cs:C1710.tblOrdonnanceEntity
		$tblPrescription_e:=ds:C1482.Ordonnance.new()
		$tblPrescription_e.objOrdonnance:=New object:C1471("colPrescription1"; New collection:C1472; "colPrescription2"; New collection:C1472)
		$save_o:=$tblPrescription_e.save()
		ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde du paramètre.")
	End if 
	
	Form:C1466.prescription1Dragged_o:=Null:C1517
	Form:C1466.prescriptionDragged_o:=Null:C1517
	Form:C1466.tblPrescription_es:=ds:C1482.Prescription.all().orderBy("pos")
	Form:C1466.tblOrdonnance_e:=ds:C1482.Ordonnance.all().first()
	var $e : cs:C1710.tblPrescriptionEntity
	var $c : Collection
	$c:=New collection:C1472()
	For each ($e; Form:C1466.tblPrescription_es)
		
		$c.push($e)
	End for each 
	Form:C1466.prescription_c:=$c
	
	
End if 

