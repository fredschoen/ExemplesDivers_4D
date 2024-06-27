//Form.coche_b:=(Not(Form.coche_b))
If (Form event code:C388=On Load:K2:1)
	Form:C1466.coche_b:=True:C214
End if 
If (Form event code:C388=On Clicked:K2:4)
	ALERT:C41(String:C10(Form:C1466.coche_b))
End if 
