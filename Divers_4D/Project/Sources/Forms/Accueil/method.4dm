If (Form event code:C388=On Load:K2:1)
	QUERY:C277([Parametre:1]; [Parametre:1]ID:1=1)
	FIRST RECORD:C50([Parametre:1])
	var tempoVar_h : Time
	Form:C1466.fieldText:="[Parametre]ID"
	tempoVar_h:=?01:02:03?
	$c:=New collection:C1472()
	$c.push(New object:C1471("etat"; "dispo"))
	$c.push(New object:C1471("etat"; "non dispo"))
	Form:C1466.collection_c:=$c
	Form:C1466.z1:="coucou tutu"
	Form:C1466.z2:="ahah"
End if 
