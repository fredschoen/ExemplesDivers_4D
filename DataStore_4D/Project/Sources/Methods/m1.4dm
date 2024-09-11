//%attributes = {}

$t:=Table name:C256(1)
$f:=Field name:C257(1; 2)

$querySettings_o:=New object:C1471("parameters"; New object:C1471(); "context"; "liste")

$querySettings_o.parameters.p1:="a@"
$query_t:=$f+" = :p1"

$x:=ds:C1482[$t].query($query_t; $querySettings_o)



$querySettings_o:=New object:C1471("parameters"; New object:C1471(); "context"; "liste")

$f:=Field name:C257(1; 3)
$querySettings_o.parameters.p1:="2@"
$query_t:=$f+" = :p1"

$x:=$x.query($query_t; $querySettings_o)
