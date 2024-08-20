
//Mark: Sur appel externe
If (FORM Event:C1606.code=On Load:K2:1)
	Form:C1466.echeance_es:=ds:C1482.Echeance.all()
End if 

//Mark: Sur appel externe
If (FORM Event:C1606.code=On Outside Call:K2:11)
	
	$querySettings_o:=New object:C1471("parameters"; New object:C1471(); "context"; "liste")
	
	$query_t:=" ID>0"
	
	//Mark: redirection
	Case of 
		: (String:C10(OBJECT Get pointer:C1124(Object named:K67:5; "redirectQuery")->currentValue)=Storage:C1525.redirectLabel[0])
			$query_t+=" AND redirect = True"
			
		: (String:C10(OBJECT Get pointer:C1124(Object named:K67:5; "redirectQuery")->currentValue)=Storage:C1525.redirectLabel[1])
			$query_t+=" AND redirect = False"
	End case 
	
	Form:C1466.echeance_es:=ds:C1482.Echeance.query($query_t; $querySettings_o)
	
End if 
