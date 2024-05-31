$vTxtLigne:=""
$vTxtLigne:=$vTxtLigne+Command name:C538(194)+"("  //` "OBJET FIXER TITRE"
$vTxtLigne:=$vTxtLigne+"*"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"Ent1\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"coucou\""
$vTxtLigne:=$vTxtLigne+")"
EXECUTE FORMULA:C63($vTxtLigne)  //EXEC_todo_modifForm


ARRAY TEXT:C222(tCol2; 10)
vEnt:="erer"

$vTxtLigne:=""
$vTxtLigne:=$vTxtLigne+Command name:C538(829)+"("  //` "LISTBOX INSERER COLONNE"
$vTxtLigne:=$vTxtLigne+"*"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"LB1\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"2"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"Col2\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"tCol2"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"Ent2\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"vEnt2"
$vTxtLigne:=$vTxtLigne+")"
EXECUTE FORMULA:C63($vTxtLigne)  //EXEC_todo

$vTxtLigne:=""
$vTxtLigne:=$vTxtLigne+Command name:C538(194)+"("  //` "OBJET FIXER TITRE"
$vTxtLigne:=$vTxtLigne+"*"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"Ent2\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"rere\""
$vTxtLigne:=$vTxtLigne+")"
EXECUTE FORMULA:C63($vTxtLigne)
