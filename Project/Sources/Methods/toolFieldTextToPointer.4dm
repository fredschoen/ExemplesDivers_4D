//%attributes = {}
/*------------------------------------------------------------------------------
Méthode : toolFieldTextToPointer
Retourne le pointeur d'un champ depuis son nom en format texte.
Exemple d'appel:
//cas1: la structure
$champs:="[Parametre]Nom"
$ptr:=toolFieldTextToPointer($champs)
ALERTE("type du champs="+Chaîne(Type($ptr->)))
//cas2: le contenu
TOUT SÉLECTIONNER([Parametre])
ALERTE("valeur du champs="+$ptr->)
------------------------------------------------------------------------------*/

#DECLARE($nameField_t : Text)
var $ptrNull : Pointer
var $position_i : Integer
var $table; $champ : Text

$position_i:=Position:C15("]"; $nameField_t; 1)

$table:=Substring:C12($nameField_t; 2; $position_i-2)

$champ:=Substring:C12($nameField_t; $position_i+1)

If (ds:C1482[$table]=Null:C1517)
	return $ptrNull
End if 
$tableNumber:=ds:C1482[$table].getInfo().tableNumber
$fieldNumber:=ds:C1482[$table][$champ].fieldNumber

return Field:C253($tableNumber; $fieldNumber)