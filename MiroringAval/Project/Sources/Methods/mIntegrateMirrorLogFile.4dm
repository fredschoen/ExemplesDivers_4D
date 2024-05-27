//%attributes = {}
//mIntegrateMirrorLogFile
var $operationNum : Real
var $pathName : Text
$r:=Select document:C905(System folder:C487(Documents folder:K41:18); ".journal"; "log file (journal ?)"; Use sheet window:K24:11)
If (OK=1)
	$pathName:=document
Else 
	return 
End if 
$operationNum:=-2
INTEGRATE MIRROR LOG FILE:C1312($pathName; $operationNum)
