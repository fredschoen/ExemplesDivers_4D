//%attributes = {}
//tools_IsChampsVide
//$1=nom du champs : text
//$0=est vide O/N : boolean

var $1; $vNomChamp : Text
var $0; tempVar_b : Boolean

var tempoVar_i : Integer

$vNomChamp:=$1
$vTxtLigne:="tempoVar_i"+":="+Command name:C538(295)+"("+$vNomChamp+")"  //`  "Type"
EXECUTE FORMULA:C63($vTxtLigne)
Case of 
	: (tempoVar_i=Est un BLOB:K8:12)
		$vTxtLigne:="tempoVar_b"+":="+"("+Command name:C538(605)+"("+$vNomChamp+")"+"="+"0"+")"  //`  "Taille blob"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est un booléen:K8:9)
		tempoVar_b:=True:C214
	: ((tempoVar_i=Est un entier:K8:5) | (tempoVar_i=Est un entier long:K8:6) | (tempoVar_i=Est un numérique:K8:4))
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+"0"+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est un texte:K8:3)
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+Char:C90(34)+Char:C90(34)+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est un champ alpha:K8:1)
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+Char:C90(34)+Char:C90(34)+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est une date:K8:7)
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+"!00/00/00!"+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est une heure:K8:8)
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+"?00:00:00?"+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est une image:K8:10)
		$vTxtLigne:="tempoVar_b"+":="+"("+Command name:C538(356)+"("+$vNomChamp+")"+"="+"0"+")"  //`  "Taille image"
		EXECUTE FORMULA:C63($vTxtLigne)
	: (tempoVar_i=Est une sous table:K8:11)
		tempoVar_b:=False:C215
	: (tempoVar_i=Est un objet:K8:27)
		$vTxtLigne:="tempoVar_b"+":="+"("+$vNomChamp+"="+"Null"+")"
		EXECUTE FORMULA:C63($vTxtLigne)
	Else 
		tempoVar_b:=False:C215
End case 
$0:=tempoVar_b