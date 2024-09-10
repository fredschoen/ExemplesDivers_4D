If (Form event code:C388=On Clicked:K2:4)
	var $e : cs:C1710.JockeysEntity
	$e:=ds:C1482.Jockeys.new()
	$e.Name:="nouveau"
	$o:=$e.save()
	Form:C1466.currentSelection:=ds:C1482.Jockeys.all()
	
End if 
