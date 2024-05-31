//%attributes = {}
var $fd : 4D:C1709.Folder
var $img : Picture
var $file_f : 4D:C1709.File
$path:=Select folder:C670("dossier")
If (OK=0)
	return 
End if 
$fd:=Folder:C1567($path; fk platform path:K87:2)
$c:=$fd.files(fk recursive:K87:7)
For each ($file_f; $c)
	READ PICTURE FILE:C678($file_f.platformPath; $img)
	DELAY PROCESS:C323(Current process:C322; 60)
	
End for each 

//ALERT("fin")
TRACE:C157
