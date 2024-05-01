//%attributes = {}
/*------------------------------------------------------------------------------
Méthode : toolFieldTextToPointer

Retourne le pointeur d'un champ depuis son nom en format texte (ou d'une variable process)

Historique
16/02/24 - Grégory Fromain <gregory@connect-io.fr> - Création
17/04/24 - frederic@connect-io.fr - adapté à une variable process
Exemple d'appel:
// - afficher le type d'une variable process
var tempoVar_h:time
$ptr:=toolFieldTextToPointer("tempoVar_h")
ALERTE("type du champs="+Chaîne(Type($ptr->)))

// - afficher le type d'un champs 4d, puis son contenu
TOUT SÉLECTIONNER([Parametre])
$ptr:=toolFieldTextToPointer("[Parametre]Nom")
ALERTE("type du champs="+Chaîne(Type($ptr->)))
ALERTE("valeur du champs="+$ptr->)
------------------------------------------------------------------------------*/

#DECLARE($nameField_t : Text)
var $ptrNull : Pointer
var $position_i : Integer
var $table; $champ : Text

$position_i:=Position:C15("]"; $nameField_t; 1)

If ($position_i<1)
	//$nameField_t correspond à une variable process
	return Get pointer:C304($nameField_t)
End if 

$table:=Substring:C12($nameField_t; 2; $position_i-2)
$champ:=Substring:C12($nameField_t; $position_i+1)
If (ds:C1482[$table]=Null:C1517)
	//champs 4d non trouvé
	return $ptrNull
End if 

//$nameField_t correspond à un champs 4d
$tableNumber:=ds:C1482[$table].getInfo().tableNumber
$fieldNumber:=ds:C1482[$table][$champ].fieldNumber


return Field:C253($tableNumber; $fieldNumber)