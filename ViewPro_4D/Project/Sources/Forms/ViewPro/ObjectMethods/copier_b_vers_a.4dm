//fsch
_trace

//copierCells

var $CellsCut; $CellsPaste; $CellsAll; $CellsFind : Object

$CellsCut:=New object

//copier
$CellsCut:=VP Cells("ViewProArea_b"; 1; 1; 5; 14)

//chercher
$CellsAll:=VP All("ViewProArea")
$CellsPaste:=VP Cells("ViewProArea"; 1; 1; 5; 14)

//coller
$CellsPaste.ranges:=$CellsCut.ranges

// Rechercher un objet de plage vide
//$CellsFind:=VP Find($CellsAll; "xxx")
//If ($CellsFind.ranges.length=0)
//ALERT("Aucun résultat trouvé")
//Else 
//ALERT(String($CellsFind.ranges.length)+" résultats trouvés")
//End if 
