// Déclaration de la classe OffscreenArea (ko)
Class constructor
	C_TEXT($1) & nbsp; 
	This.filePath:=$1
	
	//  Cette fonction sera appelée sur chaque événement de la zone hors écran
Function onEvent
	Case of 
		: (FORM Event.code=On VP Ready)
			VP IMPORT DOCUMENT(This.area; This.filePath)
			This.result:=VP Get value(VP Cell(This.area; 6; 22))
			
			ALERT("La cellule G23 contient la valeur : "+String(This.result)) & nbsp; 
	End case 