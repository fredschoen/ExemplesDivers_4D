//fsch

var $nomFic_t : Text

$nomFic_t:=Folder(fk resources folder).platformPath+"TEMP"+Folder separator+"tempFile.4VP"

VP EXPORT DOCUMENT("ViewProArea"; $nomFic_t)  //fsch
