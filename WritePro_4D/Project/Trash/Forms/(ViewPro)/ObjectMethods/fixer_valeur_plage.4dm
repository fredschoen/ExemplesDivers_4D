//fsch

//adapter pv tableau vers colonne

//version 1 , avec collection à 2 niveau -> ici tableau vers 1 ligne

var $valb_c : Collection
$valb_c:=New collection

ARRAY TEXT($valb_t; 4)
$valb_t{1}:="aaaa"
$valb_t{2}:="aaaa"
$valb_t{3}:="aaaa"
$valb_t{4}:="aaaa"

//array vers collection permet d'écrire une ligne VIEW, pouir écrire une colonne, ce serait plus compliqué (à charger dans collection de collection.. élément par élément, je crois: fsch)
ARRAY TO COLLECTION($valb_c; $valb_t)

var $val_c : Collection
$val_c:=New collection($valb_c)

VP SET VALUES(VP Cell("ViewProArea"; 1; 1); $val_c)

/////////////////////////////
//v2: cell par cell

ARRAY TEXT($valc_t; 4)
$valc_t{1}:="bb"
$valc_t{2}:="cc"
$valc_t{3}:="dd"
$valc_t{4}:="ee"

var $posTab : Integer
var $posCell : Integer

$posCell:=3

For ($posTab; 1; Size of array($valb_t))
	VP SET TEXT VALUE(VP Cell("ViewProArea"; 2; $posCell); $valc_t{$posTab})
	$posCell:=$posCell+1
End for 
