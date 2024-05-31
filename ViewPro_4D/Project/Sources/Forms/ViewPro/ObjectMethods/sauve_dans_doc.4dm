//fsch
_trace

var $nomFic_t : Text

$nomFic_t:=Storage.param.nomComplet4VP

VP EXPORT DOCUMENT("ViewProArea"; $nomFic_t)  //fsch
ALERT("VP EXPORT DOCUMENT(\"ViewProArea\"; "+$nomFic_t+")")
SHOW ON DISK($nomFic_t)