//fsch
var $val_c : Collection
$val_c:=New collection
$val_c.push(New collection("coucou"))
VP SET VALUES(VP Cell("ViewProArea"; 1; 2); $val_c)

VP SET VALUES(VP Cell("ViewProArea"; 2; 2); New collection(New collection(222)))




VP SET TEXT VALUE(VP Cell("ViewProArea"; 1; 3); "yyy")
VP SET NUM VALUE(VP Cell("ViewProArea"; 2; 3); 333)


