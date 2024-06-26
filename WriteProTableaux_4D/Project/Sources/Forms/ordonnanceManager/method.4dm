If (Form event code:C388=On Load:K2:1)
	If (ds:C1482.Ordonnance.all().length=0)
		var $Prescription_e : cs:C1710.OrdonnanceEntity
		$Prescription_e:=ds:C1482.Ordonnance.new()
		$Prescription_e.Ordonnance_o:=New object:C1471("Prescription1_c"; New collection:C1472; "Prescription2_c"; New collection:C1472)
		$save_o:=$Prescription_e.save()
		ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde du paramètre.")
	End if 
	
	Form:C1466.Ordonnance_e:=ds:C1482.Ordonnance.all().first()
	Form:C1466.prescription1Dragged_o:=Null:C1517
	Form:C1466.prescriptionDragged_o:=Null:C1517
	CreerFormPrescription()
	
	// Affichage de la zone write
	
	var $b : Blob
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"modeleOrdonnance.4wp"
	If (Test path name:C476($path)#Is a document:K24:1)  // Ouvrir le document
		ALERT:C41($path+" : document non trouvé")
		TRACE:C157
	End if 
	DOCUMENT TO BLOB:C525($path; $b)  // Load the document
	If (OK=0)
		ALERT:C41("DOCUMENT TO BLOB KO")
		TRACE:C157
	Else 
		
	End if 
	WParea:=WP New:C1317($b)
	WP SET DATA CONTEXT:C1786(WParea; Form:C1466.Ordonnance_e)
	WP COMPUTE FORMULAS:C1707(WParea)
	
End if 

WP COMPUTE FORMULAS:C1707(WParea)