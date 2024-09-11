// -----------------------------------------------------------------
// Accueil.lbTable
// -----------------------------------------------------------------
var $c : Collection

//Mark: Sur Chargement
If (Form event code:C388=On Load:K2:1)
	$c:=New collection:C1472()
	For ($vlTable; 1; Get last table number:C254)
		If (Is table number valid:C999($vlTable))
			$c.push(Table name:C256($vlTable))
		End if 
	End for 
	$c:=$c.orderBy()
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=$c
	OBJECT Get pointer:C1124->index:=0
	
	$x:=OBJECT Get pointer:C1124(Object named:K67:5; "lbTable")->currentValue
	
End if 

If (Form event code:C388#On Load:K2:1)
	
	//todoi: liste table
End if 