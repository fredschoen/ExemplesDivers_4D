//fsch
_trace

$file_t:=Storage.param.path+"documentView.4VP"

var $CellsCut_o; $CellsPaste_o; $CellsAll_o; $CellsFind_o; $CellsFred_o : Object


$CellsCut_o:=New object
$CellsPaste_o:=New object
$CellsAll_o:=New object
$CellsFind_o:=New object
$CellsFred_o:=New object




var $cDebCut_i; $rDebCut_i : Integer
var $cDebPaste_i; $rDebPaste_i : Integer
var $cNbr_i; $rNbr_i : Integer

$cDebCut_i:=1
$rDebCut_i:=1
$cNbr_i:=5
$rNbr_i:=14

//copier
$CellsCut_o:=VP Cells("ViewProArea"; $cDebCut_i; $rDebCut_i; $cNbr_i; $rNbr_i)

//chercher dans b
$CellsAll:=VP All("ViewProArea_b")
$CellsFind_o:=VP Find($CellsAll; "xxx")
If ($CellsFind_o.ranges.length=0)
	ALERT("Aucune cellule xxx trouvée dans b")
Else 
	//copier valeurs
	$cDebPaste_i:=$CellsFind_o.ranges[0].column
	$rDebPaste_i:=$CellsFind_o.ranges[0].row
	
	//coller
	$CellsPaste_o:=VP Cells("ViewProArea_b"; $cDebPaste_i; $rDebPaste_i; $cNbr_i; $rNbr_i)
	
	var $result_c : Collection
	$result_c:=VP Get values($CellsCut_o)
	VP SET VALUES($CellsPaste_o; $result_c)
End if 



////copier format
//$cellStyle:=VP Get cell style($CellsCut_o)
//VP SET CELL STYLE($CellsPaste_o; $cellStyle)

//copier formules
//VP SET FORMULAS($CellsPaste_o; $result_c)
//$result_c:=VP Get formulas($CellsCut_o)
//$result_c:=VP Get formulas(VP Cells("ViewProArea_b"; 2; 3; 5; 3))
//VP SET FORMULAS(VP Cell("ViewProArea"; 1; 1); $result_c)




