//init la query
If (Form event code=On Data Change)
	
	Form.fieldName_t:=OBJECT Get pointer->currentValue
	Form.query_t:="ds."+Form.tableName_t+".query("+Char(Double quote)+Form.fieldName_t+" "+Form.operator_t+" "+Form.value_t+Char(Double quote)+")"
End if 
