// atNames scrollable area object method
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		atNames{0}:="ffff"
	: (Form event code:C388=On Load:K2:1)
		// Initialize the array (as shown further above)
		ARRAY TEXT:C222(atNames; 0)
		APPEND TO ARRAY:C911(atNames; "aa")
		APPEND TO ARRAY:C911(atNames; "zz")
		APPEND TO ARRAY:C911(atNames; "ee")
		APPEND TO ARRAY:C911(atNames; "rr")
		APPEND TO ARRAY:C911(atNames; "yy")
		atNames{0}:="0"
		ARRAY TEXT:C222(atRefs; 0)
		APPEND TO ARRAY:C911(atRefs; "x1")
		APPEND TO ARRAY:C911(atRefs; "x2")
		APPEND TO ARRAY:C911(atRefs; "x3")
		APPEND TO ARRAY:C911(atRefs; "x4")
		APPEND TO ARRAY:C911(atRefs; "x5")
		atNames{0}:="dddd"
		
	: (Form event code:C388=On Unload:K2:2)
		// We no longer need the array
		CLEAR VARIABLE:C89(atNames)
		
	: (Form event code:C388=On Clicked:K2:4)
		If (atNames#0)
			If (atNames#Num:C11(atNames{0}))
				vtInfo:="You clicked on: "+atNames{atNames}+" and it was not selected before."
				atNames{0}:=String:C10(atNames)
			End if 
		End if 
		
		
		
	: (Form event code:C388=On Double Clicked:K2:5)
		If (atNames#0)
			ALERT:C41("You double clicked on: "+atNames{atNames})
		End if 
End case 
