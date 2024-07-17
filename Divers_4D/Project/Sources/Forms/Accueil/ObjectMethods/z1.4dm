If (Form event code:C388=On Load:K2:1)
	Form:C1466.z1:="coucou tutu"
	return 
End if 
If (Form event code:C388=On Clicked:K2:4)
	Form:C1466.z1_save:=Form:C1466.z1
	return 
End if 

If (Form event code:C388=On Data Change:K2:15)
	Form:C1466.z1:=Form:C1466.z1_save
	ALERT:C41("non modifiable")
End if 
