//cas1: la structure
$champs:="[Parametre]Nom"
$ptr:=toolFieldTextToPointer($champs)
ALERT:C41("type du champs="+String:C10(Type:C295($ptr->)))
//cas2: le contenu
ALL RECORDS:C47([Parametre:1])
ALERT:C41("valeur du champs="+$ptr->)