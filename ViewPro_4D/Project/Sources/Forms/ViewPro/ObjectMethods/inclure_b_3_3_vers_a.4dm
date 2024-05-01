//fsch
_trace

$file_t:=Storage.param.path+"documentView.4VP"

var $CellsViewProArea_o : Object
var $CellsTemp_o : Object
var $result_c : Collection
var $cDebCut_i; $rDebCut_i : Integer
var $cDebPaste_i; $rDebPaste_i : Integer
var $cNbr_i; $rNbr_i : Integer

$CellsTemp_o:=New object

$cDebCut_i:=0
$rDebCut_i:=0
$cNbr_i:=6
$rNbr_i:=60

$cDebPaste_i:=0
$rDebPaste_i:=0

//copier
$CellsTemp_o:=VP Cells("ViewProArea"; $cDebCut_i; $rDebCut_i; $cNbr_i; $rNbr_i)

//coller
$CellsViewProArea_o:=VP Cells("ViewProArea_b"; $cDebPaste_i; $rDebPaste_i; $cNbr_i; $rNbr_i)
$result_c:=VP Get values($CellsTemp_o)
VP SET VALUES($CellsViewProArea_o; $result_c)
