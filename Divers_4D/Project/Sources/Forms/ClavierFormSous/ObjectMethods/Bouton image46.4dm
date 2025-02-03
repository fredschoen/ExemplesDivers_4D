If (Form event code:C388=On Clicked:K2:4)
	
	If (OBJECT Get visible:C1075(*; "ImgClipMaj"))
		
		OBJECT SET VISIBLE:C603(*; "ImgClipMaj"; True:C214)
		OBJECT SET VISIBLE:C603(*; "Min_@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Maj_@"; True:C214)
	Else 
		
		OBJECT SET VISIBLE:C603(*; "ImgClipMaj"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Min_@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "Maj_@"; False:C215)
		
	End if 
	
End if 
