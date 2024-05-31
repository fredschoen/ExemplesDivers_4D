//fsch




////$border_o:=New object("color"; "grey"; "style"; vk line style thick)
//$border_o:=New object("color"; "grey"; "style"; vk line style medium)
//$option_o:=New object("all"; True)
//VP SET BORDER(VP Cells("ViewProArea"; 1; 1; 3; 3); $border_o; $option_o)



//VP SET BORDER(VP Cells("ViewProArea"; 1; 1; 3; 3); New object("color"; "grey"; "style"; vk line style medium); New object("all"; True))
//VP SET BORDER(VP Cells("ViewProArea"; 4; 4; 5; 5); New object("color"; "grey"; "style"; vk line style medium); New object("top"; True))
//VP SET BORDER(VP Cells("ViewProArea"; 4; 4; 5; 5); New object("color"; "grey"; "style"; vk line style medium); New object("bottom"; True))

//all Style de la ligne de bordure appliqué à toutes les bordures.
//left Style de la ligne de bordure appliqué à la bordure de gauche.
//top Style de la ligne de bordure appliqué à la bordure supérieure.
//right Style de la ligne de bordure appliqué à la bordure de droite.
//bottom Style de la ligne de bordure appliqué à la bordure inférieure.
//outline Style de la ligne de bordure appliqué uniquemet aux bordures ext.
//inside Style de la ligne de bordure appliqué uniquemet aux bordures int.
//innerHorizontal Style de la ligne de bordure appliqué uniquemet aux bord.
//innerVertical Style de la ligne de bordure appliqué uniquemet aux bordures verticales intérieures.


var $border_o : Object
var $option_o : Object
//
$border_o:=New object("color"; "#c8c8c8"; "style"; vk line style thick)
$option_o:=New object("all"; True)

$border_o:=Null
$border_o:=New object("color"; "#c8c8c8"; "style"; vk line style thick)

VP SET BORDER(VP Cells("ViewProArea"; 6; 6; 7; 7); $border_o; $option_o)
