//bTestCodeVP
//===========

//définir largeur colonne
$col_o:=New object()
$prop_o:=New object()  //propriétés
var $posCol_i : Integer
var $nbCol_i : Integer

$posCol_i:=1
$nbCol_i:=5
$col_o:=VP Column("ViewProArea"; $posCol_i; $nbCol_i)
$prop_o:=New object("width"; 100)
VP SET COLUMN ATTRIBUTES($col_o; $prop_o)
