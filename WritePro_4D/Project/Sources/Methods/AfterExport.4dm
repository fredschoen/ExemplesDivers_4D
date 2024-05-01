//%attributes = {}
//AfterExport

C_TEXT($1; $2)
C_OBJECT($3; $4)
$areaName:=$1
$filePath:=$2
$params:=$3
$status:=$4

If ($status.success=False)
	ALERT($status.errorMessage)
Else 
	ALERT("ok "+$filePath)
End if 