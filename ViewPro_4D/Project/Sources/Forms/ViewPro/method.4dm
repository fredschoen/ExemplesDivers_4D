If (Form event code=On Load)
	ALL RECORDS([Table1])
	FIRST RECORD([Table1])
	
	VP_Set_Custom_Functions("ViewProArea")  //fsch: établir la liste des fonctions personnamisées VIEW
	VP_Set_Custom_Functions("ViewProArea_b")  //fsch: établir la liste des fonctions personnamisées VIEW
	
	Form.nomComplet4VP:=Storage.param.nomComplet4VP
	Form.idEssaiPdf:=9999
	Form.nomPdf:=""
	Form.var1:="coucou"
	Form.var2:="grrrrrrrrrrrrrrr"
	
End if 


If (Form event code=On Timer)
	If (Form.nomPdf>"")
		If (Test path name(Form.nomPdf)=Is a document)
			SET TIMER(0)
			ALERT(Form.nomPdf+" créé")
			SHOW ON DISK(Form.nomPdf)
		Else 
			If (Form.idEssaiPdf>20)
				SET TIMER(0)
				ALERT("échec création"+Form.nomPdf)
				TRACE
				Form.nomPdf:=""
				Form.idEssaiPdf:=9999
			Else 
				SET TIMER(60*2)
				Form.idEssaiPdf:=Form.idEssaiPdf+1
			End if 
			
		End if 
		
	End if 
End if 
