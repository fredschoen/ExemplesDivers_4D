var tempoVar_v : Variant
var tempoVar_v : Variant

tempoVar_v:=!2024-01-01!
If (tempoVar_v=!2024-01-01!)
	ALERT:C41(String:C10(tempoVar_v))
End if 

tempoVar_v:=?10:30:50?
If (tempoVar_v=?10:30:50?)
	ALERT:C41(String:C10(tempoVar_v))
End if 

tempoVar_v:=21
If (tempoVar_v=21)
	ALERT:C41(String:C10(tempoVar_v))
End if 


tempoVar_v:="coucou"
If (tempoVar_v="coucou")
	ALERT:C41(String:C10(tempoVar_v))
End if 

tempoVar_v:=True:C214
If (tempoVar_v=True:C214)
	ALERT:C41(String:C10(tempoVar_v))
End if 


