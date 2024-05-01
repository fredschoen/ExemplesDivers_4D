//fsch

//copierCells format

$file_t:=Storage.param.path+"documentView.4VP"

var $CellsCut_o; $CellsPaste_o; $CellsAll_o; $CellsFind_o : Object

//copier
$CellsCut_o:=VP Cells("ViewProArea"; 0; 0; 5; 14)

//coller
$CellsPaste_o:=VP Cells("ViewProArea_b"; 0; 0; 5; 14)


//copier valeurs
var $result_c : Collection
$result_c:=VP Get formulas($CellsCut_o)
VP SET VALUES($CellsPaste_o; $result_c)

$cellStyle:=VP Get cell style($CellsCut_o)
VP SET CELL STYLE($CellsPaste_o; $cellStyle)

//VP SET FORMULAS($CellsPaste_o; $result_c)
//$result_c:=VP Get formulas($CellsCut_o)
//$result_c:=VP Get formulas(VP Cells("ViewProArea_b"; 2; 3; 5; 3))
//VP SET FORMULAS(VP Cell("ViewProArea"; 1; 1); $result_c)




