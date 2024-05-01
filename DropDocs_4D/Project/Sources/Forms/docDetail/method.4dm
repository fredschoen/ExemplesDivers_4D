//DocDetail
If (Form event code:C388=On Load:K2:1)
	WA OPEN URL:C1020(*; "WebZoneDoc"; Form:C1466.tblDoc_e.showInWebZone())
End if 