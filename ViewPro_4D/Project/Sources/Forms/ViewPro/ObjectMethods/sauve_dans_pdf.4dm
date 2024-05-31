//fsch
_trace

$params:=New object
$params.formula:=Formula(AfterExport)
$params.format:=vp MS Excel format  //".xlsx"
$params.valuesOnly:=True






var $nomFic_t : Text

$nomFic_t:=Folder(fk desktop folder).file("docFred.pdf").platformPath

$param_o:=New object
$param_o.format:=vk pdf format
$param_o.formula:=Formula(AfterExport)
$param_o.valuesOnly:=True
VP EXPORT DOCUMENT("ViewProArea"; $nomFic_t; $param_o)
Form.idEssaiPdf:=1
Form.nomPdf:=$nomFic_t
SET TIMER(60*2)