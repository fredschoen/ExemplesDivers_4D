If (Form event code:C388=On Begin Drag Over:K2:44)
	Form:C1466.prescription1Dragged_o:=Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1[Form:C1466.prescription1PosCurElt-1]
	
End if 

If (Form event code:C388=On Drop:K2:12)
	
	Case of 
			/////////////////////////////////////////////
		: (Form:C1466.prescriptionDragged_t#"")  //le drag vient de la liste générale
			
			Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1.push(New object:C1471("pos"; 999; "nom"; Form:C1466.prescriptionDragged_t))
			// redefinir la position de chacun.
			$i:=0
			For each ($elt; Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1)
				$i+=1
				$elt.pos:=$i
			End for each 
			
			Form:C1466.prescriptionDragged_t:=""
			
			/////////////////////////////////////////////////////
		: (Form:C1466.prescription1Dragged_o#Null:C1517)  //on vient de la liste 1
			If (Undefined:C82(FORM Event:C1606.row))  // si on fait un drop "exotique"
				return 
			End if 
			
			//modifier l'élément du "begin drag"
			$posDrop:=Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1[FORM Event:C1606.row-1].pos-0.1
			Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1[Form:C1466.prescription1PosCurElt-1].pos:=$posDrop
			
			// tri
			Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1:=Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1.orderBy("pos")
			
			// redefinir la position de chacun.
			$i:=0
			For each ($elt; Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1)
				$i+=1
				$elt.pos:=$i
			End for each 
			
			//init le drag
			Form:C1466.prescription1Dragged_o:=Null:C1517
			
	End case 
	
End if 




