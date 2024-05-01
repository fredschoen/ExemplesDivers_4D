//%attributes = {}
var $folderPHP; $result; $param1; $param2 : Text
var $isOk : Boolean
$folderPHP:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12
$php1:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12+"php1.php"

//
$isOk:=PHP Execute:C1058($php1; "encode"; $result)
If ($isOk)
	ALERT:C41($result)
	SET TEXT TO PASTEBOARD:C523($result)
Else 
	PHP GET FULL RESPONSE:C1061($fullResponse)
	ALERT:C41($fullResponse)
	SET TEXT TO PASTEBOARD:C523($fullResponse)
End if 


$isOk:=PHP Execute:C1058($php1; "decode"; $result)
If ($isOk)
	ALERT:C41($result)
	SET TEXT TO PASTEBOARD:C523($result)
Else 
	PHP GET FULL RESPONSE:C1061($fullResponse)
	ALERT:C41($fullResponse)
	SET TEXT TO PASTEBOARD:C523($fullResponse)
End if 


If (Test path name:C476($php1)=Is a document:K24:1)
	SHOW ON DISK:C922($php1)
Else 
	ALERT:C41($php1+" inexistant")
End if 


