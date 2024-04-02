$vTxtLigne:=""
$vTxtLigne:=$vTxtLigne+Command name:C538(194)+"("  //` "OBJET FIXER TITRE"
$vTxtLigne:=$vTxtLigne+"*"
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"Entête1\""
$vTxtLigne:=$vTxtLigne+";"
$vTxtLigne:=$vTxtLigne+"\"coucou\""
$vTxtLigne:=$vTxtLigne+")"
EXECUTE FORMULA:C63($vTxtLigne)  //EXEC_todo_modifForm