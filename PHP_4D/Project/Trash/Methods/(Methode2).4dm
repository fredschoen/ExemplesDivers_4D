//%attributes = {}
//
var $isOK_b : Boolean
var $result_v : Variant

var $filePHP1_f; $filePHP2_f; $fileXML_f; $filePDF_f : 4D:C1709.File

//$filePHP1_f:=Folder(fk resources folder).file("PHP/php1.php")
$filePHP2_f:=Folder:C1567(fk resources folder:K87:11).file("PHP/php2.php")

$filePDF_f:=Folder:C1567(fk resources folder:K87:11).file("DOC/factureAnacom")
$fileXML_f:=Folder:C1567(fk resources folder:K87:11).file("DOC/factur-x.xml")

//$isOK_b:=PHP Execute($filePHP1_f.platformPath; "getContents"; $result_v; "https://www.google.fr/")

//$isOK_b:=PHP Execute($filePHP_f.platformPath; "genererPdfa"; $result_v; $filePDF_f.platformPath; $fileXML_f.platformPath)

//$xml:="factur-x.xml"
//$pdf:="factureAnacom.xml"

$xml:=$fileXML_f.platformPath
$pdf:=$fileXML_f.platformPath

If (Test path name:C476($xml)=Is a document:K24:1)
	SHOW ON DISK:C922($xml)
Else 
	ALERT:C41($xml+" inexistant")
End if 


If (Test path name:C476($pdf)=Is a document:K24:1)
	SHOW ON DISK:C922($pdf)
Else 
	ALERT:C41($pdf+" inexistant")
End if 




$isOk:=PHP Execute:C1058($filePHP2_f.platformPath; "genererPdfa"; $result_v; $pdf; $xml)
If ($isOk)
	ALERT:C41($result)
Else 
	PHP GET FULL RESPONSE:C1061($fullResponse)
	ALERT:C41($fullResponse)
	SET TEXT TO PASTEBOARD:C523($fullResponse)
End if 