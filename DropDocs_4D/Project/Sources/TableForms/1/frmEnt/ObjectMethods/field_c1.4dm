//
If (Form event code:C388=On Drop:K2:12)
	GET PASTEBOARD DATA TYPE:C958($tTxt_4Dsignatures; $tTxt_nativeTypes; $tTxt_formatNames)
	
End if 

If (Form event code:C388=On Drop:K2:12)
	ARRAY TEXT:C222($filesArray; 0)
	C_TEXT:C284($vfileArray)
	C_LONGINT:C283($n)
	$n:=1
	[tblDoc:1]nomDoc:2:=""
	Repeat 
		$vfileArray:=Get file from pasteboard:C976($n)
		If ($vfileArray#"")
			[tblDoc:1]nomDoc:2:=[tblDoc:1]nomDoc:2+Char:C90(Carriage return:K15:38)+$vfileArray
			$n:=$n+1
		End if 
	Until ($vfileArray="")
End if 

If (Form event code:C388=On Drop:K2:12)
End if 

