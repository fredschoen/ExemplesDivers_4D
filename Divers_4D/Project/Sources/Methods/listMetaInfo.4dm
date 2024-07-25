//%attributes = {}
// -----------------------------------------------------------------
// listMetaInfo
// -----------------------------------------------------------------
// 22/07/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------
#DECLARE($etat_t : Text)->$metatInfo_o : Object

$metatInfo_o:=New object:C1471()
If ($etat_t="dispo")
	$metatInfo_o.stroke:=color SVG green
Else 
	$metatInfo_o.stroke:=color SVG red
End if 
