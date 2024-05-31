//fsch
_trace

// autre soution pour copier "tout":
//.  clipBoardOptions: vk clipboard paste options all : 
//.  Colle tous les objets de données, y compris les valeurs, formatage et formules.

var $CellsCut_o; $CellsPaste_o; $CellsAll_o; $CellsFind_o; $cellStyle_o : Object



C_OBJECT($row; $properties)

$row:=VP Row("ViewProArea"; 1)
$properties:=New object("header"; String(1))



For ($r; 0; 330)
	
	VP SET ROW ATTRIBUTES(VP Row($nomAreaVP_t; $r+$Ligne; 1); $attr_c[$r])
End for 








//range copier
$CellsCut_o:=VP Cells("ViewProArea"; 0; 0; 5; 50)

//range coller
$CellsPaste_o:=VP Cells("ViewProArea_b"; 0; 0; 5; 50)

//copier formule et style
var $result_c : Collection

$result_c:=VP Get values($CellsCut_o)
VP SET VALUES($CellsPaste_o; $result_c)

$result_c:=VP Get formulas($CellsCut_o)
VP SET FORMULAS($CellsPaste_o; $result_c)


For ($r; 0; 5)
	For ($c; 0; 50)
		$cellStyle_o:=VP Get cell style(VP Cell("ViewProArea"; $c; $r))
		VP SET CELL STYLE(VP Cell("ViewProArea_b"; $c; $r); $cellStyle_o)
	End for 
End for 


//get
C_COLLECTION($attr)
$attr:=VP Get column attributes(VP Column("ViewProArea"; 0; 10))
//set

For ($r; 0; 5)
	VP SET COLUMN ATTRIBUTES(VP Column("ViewProArea_b"; $r; 1); $attr[$r])
End for 


//get
C_COLLECTION($attr)
$attr:=VP Get row attributes(VP Row("ViewProArea"; 0; 10))
//set

For ($r; 0; 5)
	VP SET ROW ATTRIBUTES(VP Row("ViewProArea_b"; $r; 1); $attr[$r])
End for 

C_COLLECTION($list)
$list:=VP Get names("ViewProArea"; 2)  //noms de la 3e feuille