//%attributes = {}
// -----------------------------------------------------------------
// blob_dump
// -----------------------------------------------------------------
var $b; $1 : Blob
var $msg_t; $0 : Text
var $i : Integer
$msg_t:=""
$b:=$1

For ($i; 0; BLOB size:C605($b)-1)
	$msg_t+=String:C10($b{$i})+" ; "
End for 

$0:=$msg_t


