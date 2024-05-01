//%attributes = {}
/*------------------------------------------------------------------------------
Méthode : _cpImageImportBinary

Ecriture de toutes les images dans la bibliotheque.

Historique
17/01/23 - Rémy Scanu <remy@connect-io.fr> - Création entête
------------------------------------------------------------------------------*/
var $importFolder_t; $nameImage_t : Text
var $refImage_i : Integer
var $picture_p : Picture
var $file_c : Collection

var $file_o : 4D:C1709.File

$importFolder_t:=Select folder:C670("Sélection du dossier d'import des images"; "")

If ($importFolder_t#"")
	$file_c:=Folder:C1567($importFolder_t; fk platform path:K87:2).files()
	
	For each ($file_o; $file_c)
		READ PICTURE FILE:C678($file_o.platformPath; $picture_p)
		
		$refImage_i:=Num:C11(Substring:C12($file_o.name; Position:C15("#"; $file_o.name)))
		$nameImage_t:=Substring:C12($file_o.name; 1; Position:C15("#"; $file_o.name)-1)
		
		SET PICTURE TO LIBRARY:C566($picture_p; $refImage_i; $nameImage_t)
	End for each 
	
End if 
ALERT:C41("cpImageImportBinary ok")