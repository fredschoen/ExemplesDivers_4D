//%attributes = {}
// importAllData
//


C_OBJECT:C1216($ref)
ARRAY OBJECT:C1221($sel; 0)
ARRAY OBJECT:C1221($sel2; 0)
C_TEXT:C284(v_String)

OB SET:C1220($ref; "name"; "->[Company]Company Name")
OB SET:C1220($ref; "city"; "->[Company]City")

APPEND TO ARRAY:C911($sel; $ref)
APPEND TO ARRAY:C911($sel; $ref)
// $sel{1}={"name":"4D SAS","city":"Clichy"}
// $sel{2}={"name":"MyComp","city":"Lyon"}
// ...

v_String:=JSON Stringify array:C1228($sel)
// v_String= [{"name":"4D SAS","city":"Clichy"},{"name":"MyComp","city":"Lyon"}...]
JSON PARSE ARRAY:C1219(v_String; $sel2)
// $sel2{1}={"name":"4D SAS","city":"Clichy"}
// $sel2{2}={"name":"MyComp","city":"Lyon"}
//...



var $importFile_f : 4D:C1709.File
var $fileName_t; $fileContent_t; $line_t; $fieldName_t; $fieldType_t; $fieldValue_t : Text
var $line_c; $column_c; $columnName_c : Collection
var $lineNumber_i; $columnNumber_i; $tableNumber_i; $ID_Max_i : Integer
var $tableToSearch_p : Pointer

//repertoire de l'import
$exportFolder_fd:=Folder:C1567(fk resources folder:K87:11)
If (Not:C34($exportFolder_fd.exists))
	ALERT:C41($exportFolder_fd.platformPath+"inexistant")
	return 
End if 

//une table
$fileName_t:="test.json"

$importFile_f:=$exportFolder_fd.file($fileName_t)
If (Not:C34($importFile_f.exists))
	ALERT:C41($importFile_f.platformPath+" non trouvé")
	return 
End if 

$fileContent_t:=$importFile_f.getText()

ARRAY OBJECT:C1221($tab; 0)

JSON PARSE ARRAY:C1219($fileContent_t; $tab)

$txt:=""
$i:=0
While ($i<2000)
	$i+=1
	If ($i>Size of array:C274($tab))
		continue
	End if 
	If ($tab{$i}.severity="error")
		//$txt+=$tab{$i}.severity+Caractère(Tabulation)+$tab{$i}.tableName+Caractère(Tabulation)+$tab{$i}.form+Caractère(Tabulation)+$tab{$i}.object+Caractère(Tabulation)+$tab{$i}.message+Caractère(Tabulation)+Caractère(Retour à la ligne)
		If (Undefined:C82($tab{$i}.tableName))
			$tableName:=""
		Else 
			$tableName:=$tab{$i}.tableName
			
		End if 
		If (Undefined:C82($tab{$i}.form))
			$form:=""
		Else 
			$form:=$tab{$i}.form
			
		End if 
		
		$txt+=$tab{$i}.severity+Char:C90(Tab:K15:37)+$tableName+Char:C90(Tab:K15:37)+$form+Char:C90(Tab:K15:37)+$tab{$i}.object+Char:C90(Tab:K15:37)+$tab{$i}.message+Char:C90(Tab:K15:37)+Char:C90(Line feed:K15:40)
	End if 
End while 
SET TEXT TO PASTEBOARD:C523($txt)

ALERT:C41("OK, cf. presse papier")
