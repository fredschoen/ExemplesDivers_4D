//%attributes = {}
var $folderPHP; $result; $param1; $param2 : Text
var $isOk : Boolean
$folderPHP:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12
$filePHP:=Folder:C1567(fk resources folder:K87:11).platformPath+"PHP"+Folder separator:K24:12+"vcfconvert-master"+Folder separator:K24:12+"index.php"

//
$isOk:=PHP Execute:C1058($filePHP; "versionPHP"; $result)
ALERT:C41($result)

//
$param1:="Hello"
$param2:="4D world !"
$isOk:=PHP Execute:C1058($filePHP; "helloWord"; $result; $param1; $param2)
ALERT:C41($result)

//
$param1:="php1.php"
$isOk:=PHP Execute:C1058($filePHP; "getContents"; $result; $param1)
If ($isOk)
	ALERT:C41($result)
Else 
	PHP GET FULL RESPONSE:C1061($fullResponse)
	ALERT:C41($fullResponse)
End if 

//
$isOk:=PHP Execute:C1058($filePHP; "inclure"; $result)
ALERT:C41($result)

If (Test path name:C476($filePHP)=Is a document:K24:1)
	SHOW ON DISK:C922($filePHP)
Else 
	ALERT:C41($filePHP+" inexistant")
End if 


