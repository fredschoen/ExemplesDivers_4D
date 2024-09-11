//%attributes = {}
#DECLARE($formName_t : Text; $form_o : Object; $nouveauProcess_b : Boolean)

If ($nouveauProcess_b)
	// Gestion des fenêtres en multi process
	$ProcessId:=New process:C317("formDialog"; 0; "Fenetre "+$formName_t; $formName_t; $form_o)
	return 
End if 

$refFen:=Open form window:C675($formName_t; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40($formName_t; $form_o)

CLOSE WINDOW:C154($refFen)