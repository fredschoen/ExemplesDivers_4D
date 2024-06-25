If (Form event code:C388=On Load:K2:1)
	Form:C1466.tblPrescription_es:=ds:C1482.tblPrescription.all().orderBy("pos")
End if 
