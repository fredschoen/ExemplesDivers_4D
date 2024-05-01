//%attributes = {}
/*------------------------------------------------------------------------------
Méthode : toolWebZoneEmpty

Permet de vider une zone web et indiquer un message d'attente dans la zone.

Historique
28/04/23 - Grégory Fromain <gregory@connect-io.fr> - Création
------------------------------------------------------------------------------*/

#DECLARE($nameWebZone_t : Text; $message_t : Text)

ASSERT:C1129($nameWebZone_t#""; "Il manque le paramêtre $nameWebZone_t.")

var $html_t : Text

If ($message_t="")
	$message_t:="Il n'y a pas de document séléctionné."
End if 

$html_t:="<html><body style=\"background-color:#f2f2f2; color: #888; font-family: Arial, sans-serif;\">"
$html_t+="<div style=\"text-align:center; margin: 30% 0;\">"+$message_t+"</div>"
$html_t+="</html>"

WA SET PAGE CONTENT:C1037(*; $nameWebZone_t; $html_t; "")