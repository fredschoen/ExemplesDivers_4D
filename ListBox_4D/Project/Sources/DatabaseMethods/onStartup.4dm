//Mark: Redirection
$lib_c:=New collection:C1472
$lib_c.push("avec redirection")
$lib_c.push("sans redirection")

Use (Storage:C1525)
	Storage:C1525.redirectLabel:=$lib_c.copy(ck shared:K85:29)
End use 

afficherAccueil()