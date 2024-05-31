//fsch

$style:=New object
$style.font:="8pt Arial"
$style.backColor:="Azure"
$style.foreColor:="red"
$style.hAlign:=1
$style.isVerticalText:=True
$style.borderBottom:=New object("color"; "#800080"; "style"; vk line style thick)

$style.backgroundImage:="/Resources/fred.png"

VP SET CELL STYLE(VP Cell("ViewProArea"; 1; 1); $style)

//VP SET CELL STYLE(VP Cell("ViewProArea"; 1; 1); New object("hAlign"; 1)))
