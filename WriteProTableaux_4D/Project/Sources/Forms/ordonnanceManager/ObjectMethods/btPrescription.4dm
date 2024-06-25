
var $win_i : Integer

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$win_i:=Open form window:C675("prescriptionManager")
		DIALOG:C40("prescriptionManager")
		CLOSE WINDOW:C154($win_i)
End case 