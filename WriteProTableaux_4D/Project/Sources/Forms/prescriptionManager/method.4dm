If (Form event code:C388=On Load:K2:1)
	Form:C1466.Prescription_es:=ds:C1482.Prescription.all().orderBy("pos")
End if 
