//fsch

var $font : Object
var $style : Object
var $cells_o : Object

$cells_o:=VP Cells("ViewProArea"; 1; 2; 3; 4)
$style:=VP Get cell style($cells_o)

$font:=VP Font to object($style.font)
$font.family:="Arial"
$font.size:="24pt"
$font.style:=vk font style italic
$font.weight:=vk font weight bold
$font.size:="24pt"
$style.font:=VP Object to font($font)

$style.backColor:="Azure"
$style.foreColor:="red"
$style.hAlign:=vk horizontal align center
//$style.borderBottom:=New object("color"; "#800080"; "style"; vk line style thick)


VP SET CELL STYLE($cells_o; $style)
