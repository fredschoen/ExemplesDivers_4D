If (Form:C1466.prescription2PosCurElt>0)
	Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c.remove(Form:C1466.prescription2PosCurElt-1)
	CreerFormPrescription()
Else 
	ALERT:C41("sélectionner une ligne")
End if 
