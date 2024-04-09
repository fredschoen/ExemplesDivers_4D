//btoolIsChampsVide

$nomChamps:=Request:C163("nom de champs"; "[Parametre]ID")
$x:=toolIsChampsVide($nomChamps)
ALERT:C41(String:C10($x))