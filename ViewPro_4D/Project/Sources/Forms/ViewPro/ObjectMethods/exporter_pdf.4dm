//fsch
_trace

VP RECOMPUTE FORMULAS("ViewProArea")  //fsch
var $file4d_f : 4D.File
$file_f:=Folder(fk desktop folder).file("document.pdf")
C_OBJECT($printInfo)

//declare print attributes object
$printInfo:=New object
$printInfo.showGridLine:=False
$printInfo.showBorder:=False

$printInfo.showRowHeader:=vk print visibility hide
$printInfo.showColumnHeader:=vk print visibility hide
$printInfo.fitPagesWide:=1
$printInfo.fitPagesTall:=1

//print PDF document
VP SET PRINT INFO("ViewProArea"; $printInfo)

//export the PDF
VP EXPORT DOCUMENT("ViewProArea"; $file_f.platformPath)

//VP PRINT("ViewProArea")  //fsch
