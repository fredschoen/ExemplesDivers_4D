//%attributes = {}
//CreerFormPrescription
Form:C1466.prescription_c:=ds:C1482.Prescription.all().orderBy("pos").toCollection()
$c:=New collection:C1472()
For each ($elt; Form:C1466.prescription_c)
	
	$x1:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription1_c.query("pos = :1"; $elt.pos)
	$x2:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c.query("pos = :1"; $elt.pos)
	If ($x1.count()=0) & ($x2.count()=0)
		$c.push($elt)
	End if 
End for each 
Form:C1466.prescription_c:=$c