If (Form event code:C388=On Begin Drag Over:K2:44)
	Form:C1466.prescription1Dragged_o:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription1_c[Form:C1466.prescription1PosCurElt-1]
	
End if 

If (Form event code:C388=On Drop:K2:12)
	
	Case of 
			/////////////////////////////////////////////
		: (Form:C1466.prescriptionDragged_o#Null:C1517)  //le drag vient de la liste générale
			$o:=Form:C1466.prescriptionDragged_o
			$o.nLigne:=999
			Form:C1466.Ordonnance_e.Ordonnance_o.Prescription1_c.push($o)
			
			Form:C1466.redraw_b:=True:C214
			Form:C1466.prescriptionDragged_o:=Null:C1517
			
			/////////////////////////////////////////////////////
		: (Form:C1466.prescription1Dragged_o#Null:C1517)  //on vient de la liste 1
			If (Undefined:C82(FORM Event:C1606.row))  // si on fait un drop "exotique"
				return 
			End if 
			
			//modifier l'élément du "begin drag"
			$nLigneDrop:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription1_c[FORM Event:C1606.row-1].nLigne-0.1
			Form:C1466.Ordonnance_e.Ordonnance_o.Prescription1_c[Form:C1466.prescription1PosCurElt-1].nLigne:=$nLigneDrop
			Form:C1466.redraw_b:=True:C214
			
			//init le drag
			Form:C1466.prescription1Dragged_o:=Null:C1517
			
			/////////////////////////////////////////////////////
		: (Form:C1466.prescription2Dragged_o#Null:C1517)  //on vient de la liste 2
			ALERT:C41("drad drop de liste 2 vers liste 1: à développer !!!")
			//init le drag
			Form:C1466.prescription2Dragged_o:=Null:C1517
			
			
			
			
	End case 
	
	// réorg
	CreerFormPrescription()
	
End if 




