//fsch
_trace

C_OBJECT($row; $properties)

$row:=VP Row("ViewProArea"; 1)
$properties:=New object("header"; "")

For ($r; 0; 330)
	$properties.header:=String($r+1)
	VP SET ROW ATTRIBUTES(VP Row("ViewProArea"; $r); $properties)
End for 

