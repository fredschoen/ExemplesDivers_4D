//%attributes = {}
var $frameGet : Integer
$wp:=WP New()
$poste1:="001-coucou"
$poste2:="002-zzzz"
$txt:=""
$txt+=$poste1
$txt+=Char(Carriage return)+"001-001"
$txt+=Char(Carriage return)+"001-002"
$txt+=$poste2
$txt+=Char(Carriage return)+"002-001"
$txt+=Char(Carriage return)+"002-002"

WP SET TEXT($wp; $txt; wk append)
$objCible:=WP Find all($wp; $poste1; wk all insensitive)
WP SET ATTRIBUTES($objCible[0]; wk background color; color SVG aliceblue)


$path:=Get 4D folder(Database folder)+"Export"+Folder separator
//$path:=Select document($path; ".4wp"; " title"; File name entry)
$path:=Select document($path; ".pdf"; " title"; File name entry)


WP SET ATTRIBUTES(WP Text range($wp; wk start text; wk end text); wk font; "Arial")  //fsch



If ($path#"")
	//WP EXPORT DOCUMENT($wp; document; wk 4wp)
	WP EXPORT DOCUMENT($wp; document)
	SHOW ON DISK(document)
End if 
