var $form_o : Object
var $win_i : Integer

If (Form event code:C388=On Drop:K2:12)
	
	//si on drop du systeme de fichiers
	If (Get file from pasteboard:C976(1)#"")
		
		//charger tous les fichiers sélectionnés par "Drag"
		var $file_f : 4D:C1709.File
		
		C_TEXT:C284($vfileArray)
		C_LONGINT:C283($n)
		$n:=1
		//calcul du max posDoc
		$es:=Form:C1466.tblDoc_es.orderBy("posDoc desc")
		If ($es.length>0)
			$posDocMax:=$es.first().posDoc
		Else 
			$posDocMax:=1
		End if 
		
		Repeat 
			$vfileArray:=Get file from pasteboard:C976($n)
			If ($vfileArray#"")
				
				//charger un fichier
				$file_f:=File:C1566($vfileArray; fk platform path:K87:2)
				
				$tblDoc_e:=ds:C1482.tblDoc.new()
				$state_t:=$tblDoc_e.fileImport($file_f)
				
				If ($state_t#"ok")
					ALERT:C41("ko: "+$state_t)
					return 
				End if 
				
				$posDocMax+=1
				$tblDoc_e.posDoc:=$posDocMax
				
				$save_o:=$tblDoc_e.save()
				
				If (Not:C34($save_o.success))
					ALERT:C41("ko save")
					return 
				End if 
				
			End if 
			
			//fichier suivant
			$n:=$n+1
			
		Until ($vfileArray="")
		
		
		//recharger la liste
		
		Form:C1466.tblDoc_es:=ds:C1482.tblDoc.all()
		
		
		
	Else 
		
		//sinon, on est dans un drag/drop vertical
		
		If (Not:C34(Undefined:C82(FORM Event:C1606.row)))  // on fait bien un drop
			// On sauvegarge la nouvelle position avec un retrait de 0,1
			Form:C1466.tblDoc_e.posDoc:=FORM Event:C1606.row-0.1
			Form:C1466.tblDoc_e.save()
			
			// On génére un nouvel ordre.
			Form:C1466.tblDoc_es:=Form:C1466.tblDoc_es.orderBy("posDoc")
			
			// On redefinit la position de chacun.
			For each ($tblDoc_e; Form:C1466.tblDoc_es)
				$tblDoc_e.posDoc:=$tblDoc_e.indexOf(Form:C1466.tblDoc_es)+1
				$tblDoc_e.save()
			End for each 
			
			// On recharge la liste.
			Form:C1466.tblDoc_es.refresh()
		End if 
		
	End if 
	
	
	
End if 





If (FORM Event:C1606.code=On Selection Change:K2:29)
	If (Form:C1466.tblDoc_e=Null:C1517)
		
		toolWebZoneEmpty("WebZoneDoc")
		return 
	End if 
	
	WA OPEN URL:C1020(*; "WebZoneDoc"; Form:C1466.tblDoc_e.showInWebZone())
	
End if 

If (Form event code:C388=On Double Clicked:K2:5)
	If (Form:C1466.tblDoc_e#Null:C1517)
		$form_o:=New object:C1471()
		$form_o.tblDoc_e:=Form:C1466.tblDoc_e
		$win_i:=Open form window:C675("DocDetail")
		DIALOG:C40("DocDetail"; $form_o)
		CLOSE WINDOW:C154($win_i)
	End if 
End if 
