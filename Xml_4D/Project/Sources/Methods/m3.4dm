//%attributes = {}

CONFIRM:C162("t1")
If (ok=1)
	ADD RECORD:C56([t1:1])
	If (ok=1)
		SAVE RECORD:C53([t1:1])
	End if 
End if 

CONFIRM:C162("t2")
If (ok=1)
	ADD RECORD:C56([t2:2])
	If (ok=1)
		SAVE RECORD:C53([t2:2])
	End if 
End if 