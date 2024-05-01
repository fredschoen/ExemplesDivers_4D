If (FORM Event.code=On Load)
	
	Form.doc4d:=WP New()
	tonton_o:=New object()
	tonton_o.prenom:="Jacques"
	
	ALL RECORDS([Table1])
	
End if 