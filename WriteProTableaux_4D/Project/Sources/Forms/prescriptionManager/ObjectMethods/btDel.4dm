var $e : cs:C1710.PrescriptionEntity
If (Form:C1466.PrescriptionSel_es.length>0)
	Form:C1466.PrescriptionSel_es.drop()
	Form:C1466.Prescription_es:=ds:C1482.Prescription.all().orderBy("pos")
	ALERT:C41("suppr OK")
End if 
