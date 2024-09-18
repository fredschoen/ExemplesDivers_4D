// -----------------------------------------------------------------
// Accueil.lbTable
// -----------------------------------------------------------------
var $table_c : Collection
ARRAY TEXT:C222($table_tb; 0)
var $field_c : Collection
ARRAY TEXT:C222($field_tb; 0)
$table_c:=New collection:C1472()
$field_c:=New collection:C1472()

//Mark: Sur Chargement
If (Form event code:C388=On Load:K2:1)
	
	OB GET PROPERTY NAMES:C1232(ds:C1482; $table_tb)
	
	$table_c:=New collection:C1472
	
	ARRAY TO COLLECTION:C1563($table_c; $table_tb)
	//For ($vlTable; 1; Get last table number)
	//If (Is table number valid($vlTable))
	//$table_c.push(Table name($vlTable))
	//End if 
	//End for 
	$table_c:=$table_c.orderBy()
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=$table_c
	OBJECT Get pointer:C1124->index:=0
	
	//init la query
	
	Form:C1466.tableName_t:=$table_tb{1}  // sinon KO: OBJECT Get pointer->currentValue
	Form:C1466.operator_t:="="
	Form:C1466.value_t:=Char:C90(Quote:K15:44)+"xxx"+Char:C90(Quote:K15:44)
	
	Form:C1466.query_t:="ds."+Form:C1466.tableName_t+".all()"
	
	//init la lb des champs
	OB GET PROPERTY NAMES:C1232(ds:C1482[$table_tb{1}]; $field_tb)
	ARRAY TO COLLECTION:C1563($field_c; $field_tb)
	
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->:=New object:C1471()
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->values:=$field_c
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->index:=0
	
	Form:C1466.fieldName_t:=$field_c[0]
	Form:C1466.fieldName_c:=$field_c  // pour les entete de colonne
	
End if 

If (Form event code:C388=On Data Change:K2:15)
	
	Form:C1466.tableName_t:=OBJECT Get pointer:C1124->currentValue
	
	OB GET PROPERTY NAMES:C1232(ds:C1482[Form:C1466.tableName_t]; $field_tb)
	ARRAY TO COLLECTION:C1563($field_c; $field_tb)
	
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->values:=$field_c
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->index:=0
	
	//init la query
	Form:C1466.query_t:="ds."+Form:C1466.tableName_t+".all()"
	
End if 