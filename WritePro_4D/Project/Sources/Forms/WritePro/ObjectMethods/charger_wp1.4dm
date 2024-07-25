// -----------------------------------------------------------------
// WritePro.charger_wp1
// -----------------------------------------------------------------
// 24/07/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------

var $b : Blob
$path:=Storage.myConst.WriteProPath+"wp1.4wp"
If (Test path name($path)#Is a document)  // Ouvrir le document
	ALERT($path+" : document non trouvé")
	return 
End if 
DOCUMENT TO BLOB($path; $b)  // Load the document
If (OK=0)
	ALERT("DOCUMENT TO BLOB KO")
	return 
Else 
	
End if 
WParea:=WP New($b)