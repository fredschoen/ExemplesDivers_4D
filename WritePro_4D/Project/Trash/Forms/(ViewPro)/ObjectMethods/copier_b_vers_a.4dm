//fsch

//copierCells

//$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
$file_t:=Storage.param.path+"documentView.4VP"
BLOB TO DOCUMENT($file_t; [Table1]Blob4D_b)
VP IMPORT DOCUMENT("ViewProArea_b"; $file_t)

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
