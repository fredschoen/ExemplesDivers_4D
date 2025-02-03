var $cursorPos_i : Integer

If (Form event code:C388=On Clicked:K2:4)
	$cursorPos_i:=Position:C15("_"; SessionCommentaire_t)
	
	SessionCommentaire_t:=Substring:C12(SessionCommentaire_t; 1; $cursorPos_i-1)+"P"+"_"+Substring:C12(SessionCommentaire_t; $cursorPos_i+1; Length:C16(SessionCommentaire_t)-$cursorPos_i)
End if 