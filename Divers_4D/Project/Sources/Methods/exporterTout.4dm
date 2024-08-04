//%attributes = {}
// exporterTout
//
var $txt : Text
$x:=ds:C1482["Parametre"].all()
$y:=ds:C1482["Parametre"]["ID"].type

For ($vlTable; 1; Get last table number:C254)
	If (Is table number valid:C999($vlTable))
		//liste des champs: 1 ligne
		$txt+=Table name:C256($vlTable)
		$txt+=Char:C90(Tab:K15:37)
		For ($vlField; 1; Get last field number:C255($vlTable))
			If (Is field number valid:C1000($vlTable; $vlField))
				$txt+=Field name:C257($vlTable; $vlField)
				$txt+=Char:C90(Tab:K15:37)
			End if 
		End for 
		$txt+=Char:C90(Carriage return:K15:38)
		//valeur des champs: n lignes (une pas enreg)
		$es:=ds:C1482[Table name:C256($vlTable)].all()
		
		For each ($e; $es)
			$txt+=Table name:C256($vlTable)
			$txt+=Char:C90(Tab:K15:37)
			For ($vlField; 1; Get last field number:C255($vlTable))
				If (Is field number valid:C1000($vlTable; $vlField))
					$z:=$e[Field name:C257($vlTable; $vlField)]
					$txt+=String:C10($z)
					$txt+=Char:C90(Tab:K15:37)
				End if 
			End for 
			$txt+=Char:C90(Carriage return:K15:38)
		End for each 
		
	End if 
End for 
SET TEXT TO PASTEBOARD:C523($txt)
ALERT:C41("cf. presse papier")
