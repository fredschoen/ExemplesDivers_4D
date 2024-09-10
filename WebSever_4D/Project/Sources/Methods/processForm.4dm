//%attributes = {"publishedWeb":true}
//processForm
C_TEXT:C284($1)  //obligatoire pour le mode compilé
C_LONGINT:C283($vName)
C_TEXT:C284(vName; vLIST)
ARRAY TEXT:C222($arrNames; 0)
ARRAY TEXT:C222($arrVals; 0)
WEB GET VARIABLES:C683($arrNames; $arrVals)  //on récupère toutes les variables du formulaire
$vName:=Find in array:C230($arrNames; "vName")
vName:=$arrVals{$vName}
If (Find in array:C230($arrNames; "vExact")=-1)  //Si l’option n’a pas été cochée
	vName:=vName+"@"
End if 
QUERY:C277([Jockeys:1]; [Jockeys:1]Name:2=vName)
FIRST RECORD:C50([Jockeys:1])
While (Not:C34(End selection:C36([Jockeys:1])))
	vLIST:=vLIST+[Jockeys:1]Name:2+" "+[Jockeys:1]Tel:3+"<br/>"
	NEXT RECORD:C51([Jockeys:1])
End while 
WEB SEND FILE:C619("results.html")  //Envoi de la liste dans le formulaire 
//results.htm, qui contient une référence à la variable vLIST,
//par exemple <!--4DHTML vLIST-->
//...