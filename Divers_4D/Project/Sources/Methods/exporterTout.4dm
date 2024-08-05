//%attributes = {}
// exporterTout
//

var $nomFichier_t : Text
var $fichierExport_f : 4D:C1709.File

var $fileContent_t : Text
$repertoireExport_fd:=Folder:C1567(fk resources folder:K87:11).folder("export")
If (Not:C34($repertoireExport_fd.exists))
	$repertoireExport_fd.create()
End if 

For ($vlTable; 1; Get last table number:C254)
	If (Is table number valid:C999($vlTable))
		//liste des champs: 1 ligne
		$fileContent_t+=Table name:C256($vlTable)
		$fileContent_t+=Char:C90(Tab:K15:37)
		For ($vlField; 1; Get last field number:C255($vlTable))
			If (Is field number valid:C1000($vlTable; $vlField))
				$fileContent_t+=Field name:C257($vlTable; $vlField)
				$fileContent_t+=Char:C90(Tab:K15:37)
			End if 
		End for 
		//valeur des champs: n lignes (une pas enreg)
		$es:=ds:C1482[Table name:C256($vlTable)].all()
		
		For each ($e; $es)
			$fileContent_t+=Char:C90(Carriage return:K15:38)
			$fileContent_t+=Table name:C256($vlTable)
			For ($vlField; 1; Get last field number:C255($vlTable))
				If (Is field number valid:C1000($vlTable; $vlField))
					$z:=$e[Field name:C257($vlTable; $vlField)]
					$fileContent_t+=Char:C90(Tab:K15:37)
					$fileContent_t+=String:C10($z)
				End if 
			End for 
		End for each 
		
		$nomFichier_t:=Table name:C256($vlTable)+".txt"
		
		$fichierExport_f:=$repertoireExport_fd.file($nomFichier_t)
		$fichierExport_f.setText($fileContent_t)
		
	End if 
End for 

SHOW ON DISK:C922($fichierExport_f.platformPath)
