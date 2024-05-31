//fsch
_trace

var $file_t : Text
$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
VP EXPORT DOCUMENT("ViewProArea"; $file_t)
ALERT("a sauver dans "+$file_t)
$vdPrompt:=Request("a sauver dans ;"; $file_t)