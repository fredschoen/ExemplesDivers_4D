//%attributes = {}
/*------------------------------------------------------------------------------
MÈthode : _cioToolVPGetValueFromVarName

UtilisÈ via la commande VP SET CUSTOM FUNCTIONS, sert ‡ afficher des variables
[Table]champ OU variable process OU variable interprocess

Historique
18/01/23 - RÈmy Scanu <remy@connect-io.fr> - CrÈation entÍte
------------------------------------------------------------------------------*/
var $0 : Variant
var $1; $arg1 : Text

If (String($1)="")
	$arg1:=""
Else 
	$arg1:=$1
End if 


$arg1:=Replace string($arg1; "'"; Char(Double quote))

If (Storage.constante.inDebug=True)
	$0:="["+$arg1+"]"
Else 
	$0:=Formula from string($arg1).call()
End if 
