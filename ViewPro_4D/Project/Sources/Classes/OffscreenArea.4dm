// class: OffscreenArea
// OffscreenArea class declaration 

Class constructor
	
	
Function onEvent
	Case of 
		: (FORM Event.code=On Load)
			
			This.result:=""
			
			If (OB Get type(This; "dataIn")=Is object)
			Else 
				This.result:="manque This.dataIn (text)"
				return 
			End if 
			If (OB Get type(This.dataIn; "functionName")=Is text)
			Else 
				This.result:="manque This..dataIn.functionName (text)"
				return 
			End if 
			
			If (OB Get type(This.dataIn; "functionArg")=Is object)
			Else 
				This.result:="manque This..dataIn.functionArg (object)"
				return 
			End if 
			
		: (FORM Event.code=On VP Ready)
			
			If (This.result#"")
				return 
			End if 
			
			Case of 
					
					////////////////////////////////////////////////
				: (This.dataIn.functionName="BLOB_VERS_PDF")
					
					If (OB Get type(This.dataIn.functionArg; "pdfName")=Is text)
					Else 
						This.result:="manque This.dataIn.functionArg.pdfName (text)"
						return 
					End if 
					
					If (OB Get type(This.dataIn.functionArg; "blobVP")=Is object)
					Else 
						This.result:="manque This.dataIn.functionArg.blobVP (blob VP)"
						return 
					End if 
					
					////////////////////////////////////////////////
				Else 
					This.result:="fonction non prévue dans ma classe OffscreenArea "
					return 
			End case 
			
			
			$file_t:=Folder(fk desktop folder).file("tempVP.4VP").platformPath
			BLOB TO DOCUMENT($file_t; This.dataIn.functionArg.blobVP)
			VP IMPORT DOCUMENT(This.area; Folder(fk desktop folder).file("tempVP.4VP").platformPath)
			
			//pour test
			
			$value:=VP Get value(VP Cell(This.area; 0; 1))
			$value:=VP Get value(VP Cell(This.area; 0; 2))
			$value:=VP Get value(VP Cell(This.area; 0; 3))
			
			
			//export the PDF
			VP EXPORT DOCUMENT(This.area; Folder(fk desktop folder).file("docVP.4VP").platformPath)
			VP EXPORT DOCUMENT(This.area; Folder(fk desktop folder).file("docVP.pdf").platformPath; New object("format"; vk pdf format))
			
			
	End case 
	