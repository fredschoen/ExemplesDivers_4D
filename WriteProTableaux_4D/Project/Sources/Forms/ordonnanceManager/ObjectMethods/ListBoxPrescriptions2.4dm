If (Form event code:C388=On Begin Drag Over:K2:44)
	Form:C1466.prescription2Dragged_o:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c[Form:C1466.prescription2PosCurElt-1]
	
End if 

If (Form event code:C388=On Drop:K2:12)
	
	Case of 
			/////////////////////////////////////////////
		: (Form:C1466.prescriptionDragged_o#Null:C1517)  //le drag vient de la liste générale
			
			Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c.push(Form:C1466.prescriptionDragged_o)
			// redefinir la position de chacun.
			
			Form:C1466.prescriptionDragged_o:=Null:C1517
			
			/////////////////////////////////////////////////////
		: (Form:C1466.prescription2Dragged_o#Null:C1517)  //on vient de la liste 1
			If (Undefined:C82(FORM Event:C1606.row))  // si on fait un drop "exotique"
				return 
			End if 
			
			//modifier l'élément du "begin drag"
			$posDrop:=Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c[FORM Event:C1606.row-1].nLigne-0.1
			Form:C1466.Ordonnance_e.Ordonnance_o.Prescription2_c[Form:C1466.prescription2PosCurElt-1].nLigne:=$posDrop
			
			//init le drag
			Form:C1466.prescription2Dragged_o:=Null:C1517
			
	End case 
	
	// reorg
	CreerFormPrescription()
	
End if 



