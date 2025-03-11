//%attributes = {}
//__ListeChamps4D
$refDoc_h:=Open document:C264(""; "4DCatalog")
CLOSE DOCUMENT:C267($refDoc_h)
If (ok=0)
	return 
End if 
var $file_f : 4D:C1709.File

$file_f:=File:C1566(document; fk platform path:K87:2)  // pour test

//__ListeChamps4D
$txt:="idChamps"+Char:C90(Tab:K15:37)+"nomChamps"+Char:C90(Tab:K15:37)+"Type"+Char:C90(Tab:K15:37)+"Commentaire"+Char:C90(Carriage return:K15:38)
//xml_Child_Ref0:=DOM Parse XML source("/Users/fredericschoen/Downloads/2024 01 24 catalog.xml")
$xml_Child_Ref0:=DOM Parse XML source:C719($file_f.platformPath)
$xml_Brother_Ref1:=DOM Get first child XML element:C723($xml_Child_Ref0)
DOM GET XML ELEMENT NAME:C730($xml_Brother_Ref1; $ele)  //le 1er fils est le schéma
$xml_Brother_Ref1:=DOM Get next sibling XML element:C724($xml_Brother_Ref1; $ele)

While (ok=1)
	
	If ($ele="table")
		$tabId:=0
		$tabName:=""
		$nAtt:=DOM Count XML attributes:C727($xml_Brother_Ref1)
		For ($i1; 1; $nAtt)
			DOM GET XML ATTRIBUTE BY INDEX:C729($xml_Brother_Ref1; $i1; $attName; $attVal)
			If (($attName="name"))
				$tabName:=$attVal
			End if 
			If ($attName="id")
				$tabId:=Num:C11($attVal)
			End if 
		End for 
		
		$xml_Brother_Ref2:=DOM Get first child XML element:C723($xml_Brother_Ref1)
		
		While (ok=1)
			DOM GET XML ELEMENT NAME:C730($xml_Brother_Ref2; $ele)
			
			If ($ele="field")
				$type:=""
				$fldId:=0
				$fldName:=""
				$commentaire:=""
				
				$nAtt:=DOM Count XML attributes:C727($xml_Brother_Ref2)
				For ($i1; 1; $nAtt)
					DOM GET XML ATTRIBUTE BY INDEX:C729($xml_Brother_Ref2; $i1; $attName; $attVal)
					If (($attName="name"))
						$fldName:=$attVal
					End if 
					If ($attName="id")
						$fldId:=Num:C11($attVal)
					End if 
					If ($attName="id" | ($attName="name") | ($attName="type"))
					End if 
					If ($attName="type")
						Case of 
							: $attVal="1"
								$type:="booléen"
							: $attVal="3"
								$type:="entier16"
							: $attVal="4"
								$type:="entier32"
							: $attVal="5"
								$type:="entier64"
							: $attVal="6"
								$type:="réel"
							: $attVal="8"
								$type:="date"
							: $attVal="9"
								$type:="heure"
							: $attVal="10"
								$type:="alpha"
							: $attVal="12"
								$type:="image"
							: $attVal="14"
								$type:="texte"
							: $attVal="15"
								$type:="sousTable"
							: $attVal="18"
								$type:="blob"
							: $attVal="21"
								$type:="objet"
							Else 
								$type:=$attVal
						End case 
					End if 
				End for 
				
				//commentaire
				$xml_Brother_Ref3:=DOM Get first child XML element:C723($xml_Brother_Ref2)
				If (ok=1)  //on est sur "field extra"
					$xml_Brother_Ref4:=DOM Get first child XML element:C723($xml_Brother_Ref3)
					
					If (ok=1)  //on est sur "comment"
						//prendre le 2ème "comment" qui est en "text"
						$xml_Brother_Ref4:=DOM Get next sibling XML element:C724($xml_Brother_Ref4; $ele)
						If (ok=1)
							DOM GET XML ELEMENT VALUE:C731($xml_Brother_Ref4; $value; $cdata)
							If ($value="")
								$cdata:=Replace string:C233($cdata; Char:C90(Line feed:K15:40); " / ")
								$commentaire:=$cdata
							Else 
								$commentaire:=$value
							End if 
						End if 
					End if 
					
				End if 
				
				$txt+=String:C10($tabId; "t000")+" "+String:C10($fldId; "c000")+Char:C90(Tab:K15:37)+$tabName+", "+$fldName+Char:C90(Tab:K15:37)+$type+Char:C90(Tab:K15:37)+$commentaire+Char:C90(Carriage return:K15:38)
				
			End if 
			
			$xml_Brother_Ref2:=DOM Get next sibling XML element:C724($xml_Brother_Ref2; $ele)
			
		End while 
		
	End if 
	$xml_Brother_Ref1:=DOM Get next sibling XML element:C724($xml_Brother_Ref1; $ele)
End while 

SET TEXT TO PASTEBOARD:C523($txt)
ALERT:C41("cf. le presse papier")
//SHOW ON DISK($file_f.platformPath)
