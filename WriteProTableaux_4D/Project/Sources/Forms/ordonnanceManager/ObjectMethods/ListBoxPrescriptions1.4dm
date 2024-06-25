If (Form event code:C388=On Begin Drag Over:K2:44)
	Form:C1466.prescription1Dragged:=Form:C1466.tblPrescription_e.nomPrescription
End if 

If (Form event code:C388=On Drop:K2:12)
	
	Case of 
			/////////////////////////////////////////////
		: (Form:C1466.prescriptionDragged#"")  //le drag vient de la liste générale
			
			Form:C1466.tblOrdonnance_e.objOrdonnance.colPrescription1.push(New object:C1471("pos"; 99; "nom"; Form:C1466.prescriptionDragged))
			Form:C1466.prescriptionDragged:=""
			
			/////////////////////////////////////////////////////
		: (Form:C1466.prescription1Dragged#"")  //on vient de la liste 1
			If (Undefined:C82(FORM Event:C1606.row))  // on fait un drop bizarre
				return 
			End if 
			$x:=Form:C1466.prescription1PosCurElt
			//// On sauvegarge la nouvelle position avec un retrait de 0,1
			//Form.tblDoc_e.posDoc:=FORM Event.row-0.1
			//Form.tblDoc_e.save()
			
			//// On génére un nouvel ordre.
			//Form.tblDoc_es:=Form.tblDoc_es.orderBy("posDoc")
			
			//// On redefinit la position de chacun.
			//For each ($tblDoc_e; Form.tblDoc_es)
			//$tblDoc_e.posDoc:=$tblDoc_e.indexOf(Form.tblDoc_es)+1
			//$tblDoc_e.save()
			//End for each 
			
			//// On recharge la liste.
			//Form.tblDoc_es.refresh()
			
			Form:C1466.prescription1Dragged:=""
			
	End case 
	
	
End if 




