//bToolFieldTextToPointer
//cas1: la structure
//$ptr:=toolFieldTextToPointer(Form.fieldText)

$txt:="type du champs="+String:C10(Type:C295(toolFieldTextToPointer(Form:C1466.fieldText)->))
$txt+=Char:C90(Retour chariot:K15:38)
$txt+="valeur du champs="+String:C10(toolFieldTextToPointer(Form:C1466.fieldText)->)
ALERT:C41($txt)

var tempoVar_h : Time
tempoVar_h:=?01:02:03?
$txt:="type de tempoVar_h="+String:C10(Type:C295(toolFieldTextToPointer("tempoVar_h")->))
$txt+=Char:C90(Retour chariot:K15:38)
$txt+="valeur de tempoVar_h="+String:C10(toolFieldTextToPointer("tempoVar_h")->)
ALERT:C41($txt)


$i:=Type:C295(toolFieldTextToPointer("tempoVar_h")->)
ALERT:C41("type de tempoVar_h="+String:C10($i))

ARRAY TEXT:C222(tabText; 5)
$i:=Size of array:C274(toolFieldTextToPointer("tabText")->)
ALERT:C41("taille de tabText="+String:C10($i))
