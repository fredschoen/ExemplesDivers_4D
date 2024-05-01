Class extends Entity

local Function fileImport($file_f : 4D:C1709.File) : Text
	
	// Controle
	If (Not:C34($file_f.exists))
		return "Impossible de stocker le document dans la GED, le fichier n'existe pas."
	End if 
	
	If ($file_f.size=0)
		return "Impossible de stocker le document dans la GED, le fichier à une taille de 0 octet."
	End if 
	
	This:C1470.nomDoc:=$file_f.name
	This:C1470.extDoc:=$file_f.extension
	This:C1470.contenuDoc:=$file_f.getContent()
	
	return "Ok"
	
	
	
	
local Function showInWebZone() : Text
	var $file_f : 4D:C1709.File
	
	If (This:C1470=Null:C1517)
		return "About:blank"
	End if 
	
	If (BLOB size:C605(This:C1470.contenuDoc)=0)
		return "About:blank"
	End if 
	
	$file_f:=File:C1566(Folder:C1567(fk resources folder:K87:11).folder("Cache").platformPath+"tempo"+This:C1470.extDoc; fk platform path:K87:2)
	$file_f.setContent(This:C1470.contenuDoc)
	return "file://"+$file_f.path
	