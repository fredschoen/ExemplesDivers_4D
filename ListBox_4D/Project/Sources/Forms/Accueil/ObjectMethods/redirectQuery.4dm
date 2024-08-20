// -----------------------------------------------------------------
// EcheanceManager.redirectQuery
// -----------------------------------------------------------------

//Mark: Sur Chargement
If (Form event code=On Load)
	OBJECT Get pointer->:=New object()
	OBJECT Get pointer->values:=New collection("Tous"; Storage.redirectLabel[0]; Storage.redirectLabel[1])
	OBJECT Get pointer->index:=0  //"tous"
End if 

If (Form event code#On Load)
	
	// On lance la recherche via la méthode formulaire
	POST OUTSIDE CALL(Current process)
	
End if 