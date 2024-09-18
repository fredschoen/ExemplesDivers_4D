// -----------------------------------------------------------------
// DataStoreManager.bValidate
// -----------------------------------------------------------------
ARRAY TEXT:C222($fieldName_tb; 0)

If (Form event code:C388=On Clicked:K2:4)
	EXECUTE FORMULA:C63("Form.table_es:="+Form:C1466.query_t)
	Form:C1466.entitySelection_c:=Form:C1466.table_es.toCollection()
	OB GET PROPERTY NAMES:C1232(Form:C1466.entitySelection_c[0]; $fieldName_tb)
	
End if 

