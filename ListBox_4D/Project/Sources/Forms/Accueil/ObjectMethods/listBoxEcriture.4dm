If (Form event code:C388=On Selection Change:K2:29)
	If (Form:C1466.echeance_e=Null:C1517)
		OBJECT Get pointer:C1124(Object named:K67:5; "redirectLabel")->currentValue:=""
		return 
	End if 
	
	OBJECT Get pointer:C1124(Object named:K67:5; "redirectLabel")->index:=-1
	OBJECT Get pointer:C1124(Object named:K67:5; "redirectLabel")->currentValue:=Form:C1466.echeance_e.redirectLabel
	
End if 