Class extends Entity
local Function get redirectLabel : Text
/*------------------------------------------------------------------------------
Fonction : EcheanceEntity.redirectLabel
------------------------------------------------------------------------------
*/
	var $label_t : Text
	
	If (This:C1470.redirect)
		$label_t:=Storage:C1525.redirectLabel[0]
	Else 
		$label_t:=Storage:C1525.redirectLabel[1]
	End if 
	
	return $label_t
	
local Function get timeStampLabel : Text
/*------------------------------------------------------------------------------
Fonction : EcheanceEntity.timeStampLabel
------------------------------------------------------------------------------
*/
	var $label_t : Text
	$label_t:=cwTimestampLire("date"; This:C1470.createTs)+" "+cwTimestampLire("heure"; This:C1470.createTs)
	
	return $label_t