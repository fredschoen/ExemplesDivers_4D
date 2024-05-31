//%attributes = {}
//_m_testCode_ViewPro
//===========

//BLOB TO VARIABLE([Table1]Blob4D; ViewProArea)

ViewProArea:=[Table1]Obj4D

//======================

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


//==========================

//$vpObj:=New object()
//$vpObj:=VP Convert from 4D View(ViewProArea)

[Table1]Obj4D:=ViewProArea

VARIABLE TO BLOB(ViewProArea; [Table1]Blob4D)
