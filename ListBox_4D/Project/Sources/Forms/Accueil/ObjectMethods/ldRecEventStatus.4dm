//ldRecEventStatus

//Mark: Sur Chargement
If (Form event code=On Load)
	
	OBJECT Get pointer->:=New object()
	//OBJECT Get pointer->values:=Storage.recEvent.status
	OBJECT Get pointer->values:=""
	
	OBJECT Get pointer->index:=0  // 0 <=> ""
End if 

//Mark: Sur data change
If (Form event code=On Data Change)
	If (Form.RecEvent_e=Null)
		OBJECT Get pointer->currentValue:=""
		return 
	End if 
	Form.RecEvent_e.status:=OBJECT Get pointer->currentValue
End if 
