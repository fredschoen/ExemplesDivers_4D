//%attributes = {}
//accueil
var $win_i : Integer
HIDE MENU BAR:C432
$win_i:=Open form window:C675("DocManager")
DIALOG:C40("DocManager")
CLOSE WINDOW:C154($win_i)
SHOW MENU BAR:C431