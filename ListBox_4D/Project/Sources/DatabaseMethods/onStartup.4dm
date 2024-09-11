//Mark: Redirection

Use (Storage:C1525)
	
	//redirectionLabel
	$lib_c:=New collection:C1472
	$lib_c.push("avec redirection")
	$lib_c.push("sans redirection")
	Storage:C1525.redirectLabel:=$lib_c.copy(ck shared:K85:29)
	
	//type d'un événement
	Storage:C1525.recEvent:=New shared object:C1526
	Use (Storage:C1525.recEvent)
		Storage:C1525.recEvent.type:=New shared collection:C1527(\
			"mail"; \
			"commentaire")
	End use 
	
	//statut d'un événement (dépendant du type ce l'événement)
	var $recEventStatus_c : Collection:=[\
		{type: "mail"; values: [""; "brouillon"; "envoyé"; "reçu"]}; \
		{type: "commentaire"; values: [""; "info"; "alerte"]}]
	
	Storage:C1525.recEventStatus:=$recEventStatus_c.copy(ck shared:K85:29)
	
End use 

afficherAccueil()