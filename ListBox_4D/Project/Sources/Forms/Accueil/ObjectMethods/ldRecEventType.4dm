//ldRecEventType

//Mark: Sur Chargement
If (Form event code=On Load)
	OBJECT Get pointer->:=New object()
	OBJECT Get pointer->values:=Storage.recEvent.type
	OBJECT Get pointer->index:=0  // 0 <=> ""
End if 

//Mark: Sur data change
If (Form event code=On Data Change)
	//OBJECT Get pointer->values:=Storage.recEventStatus.query("type is :1"; "mail")[0].values
	OBJECT Get pointer(Object named; "ldRecEventStatus")->values:=Storage.recEventStatus.query("type is :1"; OBJECT Get pointer->currentValue)[0].values
	
	If (Form.RecEvent_e=Null)
		OBJECT Get pointer->currentValue:=""
		return 
	End if 
	
	Form.RecEvent_e.type:=OBJECT Get pointer->currentValue
	
End if 
