//%attributes = {}

If ($1=Null:C1517)
	$formName:="Accueil"
Else 
	$formName:=$1
End if 
$form_o:=New object:C1471()

$refFenIdentification_t:=Open form window:C675($formName; Form dialogue modal déplaçable:K39:8; Centrée horizontalement:K39:1; Centrée verticalement:K39:4)
DIALOG:C40($formName; $form_o)
