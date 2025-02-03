var $cursorPos_i : Integer
var $textBefore_t : Text
var $textAfter_t : Text

If (Form event code:C388=On Clicked:K2:4)
	$cursorPos_i:=Position:C15("_"; SessionCommentaire_t)
	
	If ($cursorPos_i>1)
		$textBefore_t:=Substring:C12(SessionCommentaire_t; 1; $cursorPos_i-2)
		$textAfter_t:=Substring:C12(SessionCommentaire_t; $cursorPos_i-1; Length:C16(SessionCommentaire_t)-$cursorPos_i+2)
		$textAfter_t:=Substring:C12($textAfter_t; 1; 1)+Substring:C12($textAfter_t; 3; Length:C16($textAfter_t)-2)
		
		SessionCommentaire_t:=$textBefore_t+"_"+$textAfter_t
	End if 
End if 
