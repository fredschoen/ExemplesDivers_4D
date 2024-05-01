//%attributes = {}
//méthode appelant le OffscreenArea
var $resultViewOA_t : Text
var $paramViewOA_o : Object
var $viewOA_o : Object
var $lig : Integer
var $col : Integer
var $go : Boolean
$go:=True
$lig:=2
$col:=3
//$paramViewOA_o:=New object("nomCompletDoc"; Storage.param.nomComplet4VP; "fonction"; "F1")

$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
BLOB TO DOCUMENT($file_t; [Table1]Blob4D_a)

$viewOA_o:=cs.OffscreenArea.new()

$viewOA_o.dataIn:=New object()
$viewOA_o.dataIn.functionName:="BLOB_VERS_PDF"
$viewOA_o.dataIn.functionArg:=New object()
$viewOA_o.dataIn.functionArg.pdfName:=Folder(fk desktop folder).file("doc_010.pdf").platformPath
$viewOA_o.dataIn.functionArg.blobVP:=[Table1]Blob4D_a

$resultViewOA_t:=VP Run offscreen area($viewOA_o)

ALERT("retour VP Run offscreen area="+Char(Carriage return)+$resultViewOA_t)


//export the PDF
VP EXPORT DOCUMENT($viewOA_o.area; $viewOA_o.dataIn.functionArg.pdfName)


SHOW ON DISK($viewOA_o.dataIn.functionArg.pdfName)
