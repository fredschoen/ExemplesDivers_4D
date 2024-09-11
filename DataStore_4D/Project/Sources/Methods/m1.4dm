//%attributes = {}

$t:=Table name:C256(1)
$f:=Field name:C257(1; 1)

$querySettings_o:=New object:C1471("parameters"; New object:C1471(); "context"; "liste")

$querySettings_o.parameters.p1:="a"
$query_t:=$f+" > :p1"

$x:=ds:C1482[$t].query($query_t; $querySettings_o)
