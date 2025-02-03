If (Form event code:C388=On Load:K2:1)
	QUERY:C277([Parametre:1]; [Parametre:1]ID:1=1)
	FIRST RECORD:C50([Parametre:1])
	var tempoVar_h : Time
	Form:C1466.fieldText:="[Parametre]ID"
	tempoVar_h:=?01:02:03?
	$c:=New collection:C1472()
	$c.push(New object:C1471("etat"; "dispo"; "nom"; "patatte"))
	$c.push(New object:C1471("etat"; "non dispo"; "nom"; "carotte"))
	Form:C1466.collection_c:=$c
	Form:C1466.z1:="coucou tutu"
	Form:C1466.z2:="ahah"
	f_TriAccueilListBox1
End if 


Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.event_t:="On Load"
	: (Form event code:C388=On Begin Drag Over:K2:44)
		Form:C1466.event_t:="On Begin Drag Over"
	: (Form event code:C388=On Drop:K2:12)
		Form:C1466.event_t:="On Drop"
	: (Form event code:C388=On Drop:K2:12)
		Form:C1466.event_t:="On Drop"
	Else 
		Form:C1466.event_t:=""
End case 
