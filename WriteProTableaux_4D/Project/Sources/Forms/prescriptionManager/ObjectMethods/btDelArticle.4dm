var $e : cs:C1710.tblPrescriptionEntity
If (Form:C1466.tblPrescriptionSel_es.length>0)
	Form:C1466.tblPrescriptionSel_es.drop()
	Form:C1466.tblPrescription_es:=ds:C1482.tblPrescription.all().orderBy("posPrescription")
	ALERT:C41("suppr OK")
End if 