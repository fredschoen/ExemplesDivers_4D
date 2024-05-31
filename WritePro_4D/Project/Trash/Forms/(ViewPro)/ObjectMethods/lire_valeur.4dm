//fsch

var $val_r : Real
var $val_t : Text
var $val_o : Object
var $val_v : Variant

$val_o:=VP Get value(VP Cell("ViewProArea"; 2; 2))

$fred:=Value type($val_o.value)


$var_t:=2
$test:=(String(Num($var_t))=String($var_t))

$var_t:="2"
$test:=(String(Num($var_t))=String($var_t))
$var_t:="2.2"
$test:=(String(Num($var_t))=String($var_t))
$var_t:="2,2"
$test:=(String(Num($var_t))=String($var_t))

$var_t:="coucou"
$test:=(String(Num($var_t))=String($var_t))



//Is BLOBLongint 30
//Is BooleanLongint 6
//Is collectionLongint 42
//Is dateLongint 4
//Is longintLongint 9
//Is nullLongint 255
//Is objectLongint 38
//Is pictureLongint 3
//Is pointerLongint 23
//Is realLongint 1
////Is textLongint 2
////Is timeLongint 11
////Is undefinedLongint 5
////Is variantLongint 12
////Object arrayLongint 39

////$val_i:=Num($val_o.value)
////$val_r:=$val_o.value
////ALERT(String($val_r))

//$val_v:=$val_o.value
//ALERT(String($val_v))

////ALERT(VP Get value(VP Cell("ViewProArea"; 2; 2)).value)
//ALERT(String(VP Get value(VP Cell("ViewProArea"; 2; 2)).value))

//$val_v:=VP Get value(VP Cell("ViewProArea"; 2; 2)).value
//ALERT($val_v)


//ALERT(String(Type(VP Get value(VP Cell("ViewProArea"; 2; 2)).value)=Is text))