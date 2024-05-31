//%attributes = {}
/*------------------------------------------------------------------------------
MÈthode : VP_Set_Custom_Functions

DÈfinir les champs utilisÈs dans une zone 4D VIEW PRO

Historique
18/01/23 - RÈmy Scanu <remy@connect-io.fr> - CrÈation entÍte
------------------------------------------------------------------------------*/
var $1 : Text

var $vpAreaName_t : Text
var $formule_o : Object

$formule_o:=New object
$vpAreaName_t:=$1

$formule_o.getValue:=New object
$formule_o.getValue.formula:=Formula(_cioToolVPGetValueFromVarName)
$formule_o.getValue.parameters:=New collection
$formule_o.getValue.parameters.push(New object("name"; "nomVar"; "type"; Is text))

// DÈclarer fonctions personnalisÈes
VP SET CUSTOM FUNCTIONS($vpAreaName_t; $formule_o)