//Mark: Sur Chargement
If (Form event code:C388=On Load:K2:1)
	$c:=New collection:C1472("="; "<"; ">"; "#"; ">="; "<=")
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=$c
	OBJECT Get pointer:C1124->index:=0
	
	
End if 

