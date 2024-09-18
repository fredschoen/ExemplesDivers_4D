//Mark: Sur Chargement
If (Form event code=On Load)
	$c:=New collection("="; "<"; ">"; "#"; ">="; "<=")
	OBJECT Get pointer->:=New object()
	OBJECT Get pointer->values:=$c
	OBJECT Get pointer->index:=0
	
End if 


If (Form event code=On Data Change)
	Form.operator_t:=OBJECT Get pointer->currentValue
	Form.query_t:="ds."+Form.tableName_t+".query("+Char(Double quote)+Form.fieldName_t+" "+Form.operator_t+" "+Form.value_t+Char(Double quote)+")"
	
End if 
