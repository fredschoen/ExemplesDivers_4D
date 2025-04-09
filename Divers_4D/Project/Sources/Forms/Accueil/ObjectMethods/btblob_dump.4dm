var $b : Blob
$t1:=Request:C163("texte pour blob_dump :")
If ($t1#"")
	TEXT TO BLOB:C554($t1; $b)
	$t2:=blob_dump($b)
	ALERT:C41($t2)
End if 
