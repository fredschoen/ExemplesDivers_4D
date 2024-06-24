//%attributes = {}
var $txt : Text
For ($vlTable; 1; Get last table number:C254)
	If (Is table number valid:C999($vlTable))
		For ($vlField; 1; Get last field number:C255($vlTable))
			If (Is field number valid:C1000($vlTable; $vlField))
				$txt+=String:C10($vlTable)+Char:C90(Tab:K15:37)+Table name:C256($vlTable)+Char:C90(Tab:K15:37)
				$txt+=String:C10($vlField)+Char:C90(Tab:K15:37)+Field name:C257($vlTable; $vlField)
				$txt+=Char:C90(Carriage return:K15:38)
			End if 
		End for 
		
	End if 
End for 
SET TEXT TO PASTEBOARD:C523($txt)
ALERT:C41("cf. presse papier")
