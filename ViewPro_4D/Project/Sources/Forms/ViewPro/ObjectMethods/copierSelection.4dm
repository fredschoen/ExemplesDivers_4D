//fsch
_trace

$file_t:=Storage.param.path+"documentView.4VP"

//copier
//$CellsTemp_o:=VP Cells("ViewProArea"; $cDebCut_i; $rDebCut_i; $cNbr_i; $rNbr_i)

//coller
//$CellsViewProArea_o:=VP Cells("ViewProArea_b"; $cDebPaste_i; $rDebPaste_i; $cNbr_i; $rNbr_i)



$currentSelection:=VP Cells("ViewProArea"; 0; 0; 6; 60)
VP SET SELECTION($currentSelection)

$result:=VP Get values($currentSelection)

$currentSelection_b:=VP Cells("ViewProArea_b"; 0; 0; 6; 60)
VP SET SELECTION($currentSelection_b)

VP SET VALUES($currentSelection_b; $result)

