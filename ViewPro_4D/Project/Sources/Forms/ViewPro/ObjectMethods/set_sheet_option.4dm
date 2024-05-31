//fsch
_trace

// Activate protection on the current sheet
C_OBJECT($options)
$options:=New object
//$options.isProtected:=True

$options.backgroundImage:="/Resources/fred.png"
VP SET SHEET OPTIONS("ViewProArea"; $options)
// mark cells C5:D10 as 'unlocked'
VP SET CELL STYLE(VP Cells("ViewProArea"; 2; 4; 2; 6); New object("locked"; False))


$style:=New object
$style.hAlign:=vk horizontal align left
$style.font:="12pt papyrus"
//$style.backColor:="#E6E6FA"  //light purple color
$style.backgroundImage:="/Resources/fred.png"

VP SET DEFAULT STYLE("ViewProArea"; $style)