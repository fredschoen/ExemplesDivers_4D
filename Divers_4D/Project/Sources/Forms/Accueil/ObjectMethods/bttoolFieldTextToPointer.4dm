//cas1: la structure
$ptr:=toolFieldTextToPointer(Form:C1466.fieldText)

$txt:=""
$txt+="type du champs="+String:C10(Type:C295($ptr->))
$txt+=Char:C90(Carriage return:K15:38)
$txt+="valeur du champs="+String:C10($ptr->)

ALERT:C41($txt)
