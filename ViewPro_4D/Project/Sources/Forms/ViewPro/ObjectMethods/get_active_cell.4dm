//fsch
_trace


$activeCell:=VP Get active cell("ViewProArea")

ALERT("$activeCell.ranges[0].column="+String($activeCell.ranges[0].column))
ALERT("$activeCell.ranges[0].row="+String($activeCell.ranges[0].row))

