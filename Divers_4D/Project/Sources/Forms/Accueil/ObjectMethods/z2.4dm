var $tailleMaxi_i : Integer

$tailleMaxi_i:=10
If (Form event code:C388=On After Edit:K2:43)
	If (Length:C16(Get edited text:C655)>$tailleMaxi_i)
		OBJECT SET VALUE:C1742(OBJECT Get name:C1087(Object current:K67:2); Substring:C12(Get edited text:C655; 1; $tailleMaxi_i))
	End if 
End if 
