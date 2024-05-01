//%attributes = {}
//VP_Set_Custom_Functions_old //fsch
// objet: définir les champs utilisés dans les view (standardisation: une méthode pour tous les modèles VIEW de l'appli)
// $1: text: nom de la zone View

var $1; $vpAreaName_t : Text
var $formule_o : Object

$formule_o:=New object
$vpAreaName_t:=$1

//ajouté pour "Pilotage HA ok"
//variables
$formule_o.vDateJour:=New object
$formule_o.vDateJour.formula:=Formula(vDateJour)

$formule_o.vVoyage:=New object
$formule_o.vVoyage.formula:=Formula(vVoyage)

$formule_o.vTypePresta:=New object
$formule_o.vTypePresta.formula:=Formula(vTypePresta)

$formule_o.vKM:=New object
$formule_o.vKM.formula:=Formula(vKM)

$formule_o.vEte_du:=New object
$formule_o.vEte_du.formula:=Formula(vEte_du)

$formule_o.vHiver_du:=New object
$formule_o.vHiver_du.formula:=Formula(vHiver_du)

$formule_o.vEte_au:=New object
$formule_o.vEte_au.formula:=Formula(vEte_au)

$formule_o.vHiver_au:=New object
$formule_o.vHiver_au.formula:=Formula(vHiver_au)

$formule_o.vPAVT:=New object
$formule_o.vPAVT.formula:=Formula(vPAVT)

$formule_o.vCommentVT:=New object
$formule_o.vCommentVT.formula:=Formula(vCommentVT)

$formule_o.vVolume:=New object
$formule_o.vVolume.formula:=Formula(vVolume)

$formule_o.vAdrDep1:=New object
$formule_o.vAdrDep1.formula:=Formula(vAdrDep1)

$formule_o.vAdrDep2:=New object
$formule_o.vAdrDep2.formula:=Formula(vAdrDep2)

$formule_o.vAdrDep3:=New object
$formule_o.vAdrDep3.formula:=Formula(vAdrDep3)

$formule_o.vCPVilleDep:=New object
$formule_o.vCPVilleDep.formula:=Formula(vCPVilleDep)

$formule_o.vAdrArr1:=New object
$formule_o.vAdrArr1.formula:=Formula(vAdrArr1)

$formule_o.vAdrArr2:=New object
$formule_o.vAdrArr2.formula:=Formula(vAdrArr2)

$formule_o.vAdrArr3:=New object
$formule_o.vAdrArr3.formula:=Formula(vAdrArr3)

$formule_o.vCPVilleAr:=New object
$formule_o.vCPVilleAr.formula:=Formula(vCPVilleAr)

$formule_o.vLogementDep:=New object
$formule_o.vLogementDep.formula:=Formula(vLogementDep)

$formule_o.vAscDep:=New object
$formule_o.vAscDep.formula:=Formula(vAscDep)

$formule_o.vTailleAscDep:=New object
$formule_o.vTailleAscDep.formula:=Formula(vTailleAscDep)

$formule_o.vNbEtD:=New object
$formule_o.vNbEtD.formula:=Formula(vNbEtD)

$formule_o.vStatioDep:=New object
$formule_o.vStatioDep.formula:=Formula(vStatioDep)

$formule_o.vNbMPortageD:=New object
$formule_o.vNbMPortageD.formula:=Formula(vNbMPortageD)

$formule_o.vLogementAr:=New object
$formule_o.vLogementAr.formula:=Formula(vLogementAr)

$formule_o.vAscAr:=New object
$formule_o.vAscAr.formula:=Formula(vAscAr)

$formule_o.vTailleAscAr:=New object
$formule_o.vTailleAscAr.formula:=Formula(vTailleAscAr)

$formule_o.vNbEtA:=New object
$formule_o.vNbEtA.formula:=Formula(vNbEtA)

$formule_o.vStatioAr:=New object
$formule_o.vStatioAr.formula:=Formula(vStatioAr)


//var
$formule_o.fVarTxt:=New object
$formule_o.fVarTxt.formula:=Formula(fVarTxt)

$formule_o.fVarTxt.parameters:=New collection
$formule_o.fVarTxt.parameters.push(New object("name"; "nomVar"; "type"; Is text))


//déclarer fonctions personnalisées
VP SET CUSTOM FUNCTIONS($vpAreaName_t; $formule_o)
