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
	
	//OBJECT Get pointer->values:=Storage.recEventStatus.query("type is :1"; "mail")[0].values
	
	OB GET PROPERTY NAMES:C1232(ds:C1482[$table_tb{1}]; $field_tb)
	ARRAY TO COLLECTION:C1563($field_c; $field_tb)
	
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->:=New object:C1471()
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->values:=$field_c
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->index:=0
	
End if 

If (Form event code:C388=On Data Change:K2:15)
	
	$tableName_t:=OBJECT Get pointer:C1124->currentValue
	
	OB GET PROPERTY NAMES:C1232(ds:C1482[$tableName_t]; $field_tb)
	ARRAY TO COLLECTION:C1563($field_c; $field_tb)
	
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->values:=$field_c
	OBJECT Get pointer:C1124(Object named:K67:5; "lbField")->index:=0
	
End if 