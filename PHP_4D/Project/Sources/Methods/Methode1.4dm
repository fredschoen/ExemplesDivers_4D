//%attributes = {}
var $folderPHP; $result; $param1; $param2 : Text
var $isOk : Boolean
$folderPHP:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12
$php1:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12+"php1.php"

//
$isOk:=PHP Execute:C1058($php1; "versionPHP"; $result)
ALERT:C41($result)

//
$param1:="Hello"
$param2:="4D world !"
$isOk:=PHP Execute:C1058($php1; "helloWord"; $result; $param1; $param2)
ALERT:C41($result)

//
$param1:="php1.php"
$isOk:=PHP Execute:C1058($php1; "getContents"; $result; $param1)
If ($isOk)
	ALERT:C41($result)
Else 
	PHP GET FULL RESPONSE:C1061($fullResponse)
	ALERT:C41($fullResponse)
End if 

//
$isOk:=PHP Execute:C1058($php1; "inclure"; $result)
ALERT:C41($result)

If (Test path name:C476($php1)=Is a document:K24:1)
	SHOW ON DISK:C922($php1)
Else 
	ALERT:C41($php1+" inexistant")
End if 


