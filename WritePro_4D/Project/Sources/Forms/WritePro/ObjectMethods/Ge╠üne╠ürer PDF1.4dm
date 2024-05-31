
//$Txt:=WP Get text(WParea; wk expressions as value)
//$txt:=WP Get body("WP_Area")
//ST Get text(*; WParea; 1; 0)
Form.vTexte:=ST Get text(WP_Area; 1; 0)
$txt:=ST Get text(WP_Area; 1; 0)


//SET TEXT TO PASTEBOARD(zTexte)


C_BLOB($b)

TEXT TO BLOB($txt; $b)

//CLEAR PASTEBOARD
//APPEND DATA TO PASTEBOARD("com.4d.private.text.rtf"; $b)


//ARRAY LONGINT($codesArray_ai; 10)
//ARRAY LONGINT($intCompArray_ai; 10)


SET TEXT TO PASTEBOARD(Form.vTexte)

ARRAY TEXT($signatures4D; 10)
ARRAY TEXT($typesNatifs; 10)
GET PASTEBOARD DATA TYPE($signatures4D; $typesNatifs)
