//%attributes = {}
//fVarTxt
//1$: nom de la variable text (text)
//0$: valeur texte
var $1; $nomVarTxt : Text
var $0; $resultTxt : Text

$nomVarTxt:=$1

Case of 
		
	: $nomVarTxt="NOMCLIENT"
		$resultTxt:="coin coin du doudou"
	Else 
		$resultTxt:="!!nom variable inconnu (cf. fVarTxt) !!!"
End case 

$0:=$resultTxt