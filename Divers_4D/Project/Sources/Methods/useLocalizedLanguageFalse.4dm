//%attributes = {}
// useLocalizedLanguageFalse

var $version4D; $cheminFichierParam; $cheminDossierParam; $cheminUser : Text
var $refParam; $refBalise; $refOptions; $refMethodEditor; $valueParam : Text
var $isLangageFrench; $needRestart; $isRoamingDefined; $isParamDefined : Boolean
var $refDoc : Time
var ERREUR_TYPE; $codeErreur; $nomMethodeErreur : Text

$needRestart:=False:C215
$codeErreur:=""

$cheminUser:=System folder:C487(Préférences utilisateur:K41:4)
$version4D:=Substring:C12(Application version:C493; 0; 2)

$cheminDossierParam:=$cheminUser+"AppData\\roaming\\4D"
$cheminFichierParam:=$cheminUser+"AppData\\roaming\\4D\\4D Preferences v"+String:C10($version4D)+".4DPreferences"

$isRoamingDefined:=(Test path name:C476($cheminDossierParam)=Est un dossier:K24:2)
$isParamDefined:=(Test path name:C476($cheminFichierParam)=Est un document:K24:1)

$nomMethodeErreur:=Method called on error:C704
ON ERR CALL:C155("ERR_XML_LANG_GetOption")

If (($isRoamingDefined=True:C214) & ($isParamDefined=True:C214))
	// Ouverture du fichier XML pour analyse
	$refParam:=DOM Parse XML source:C719($cheminFichierParam)
	
	If (ERREUR_TYPE="")
		// Recherche de l'élément "options de code"
		$refBalise:=DOM Get first child XML element:C723($refParam; $name; $val)
		
		//TABLEAU TEXTE($tabRefsOptionsXML; 0)
		//$refOptions:=DOM Chercher élément XML($refBalise; "/com.4d/method_editor/options"; $tabRefsOptionsXML)
		$refOptions:=DOM Get first child XML element:C723($refBalise; $nom_option; $valeur_option)
		If ($nom_option#"method_editor")
			Repeat 
				$refOptions:=DOM Get next sibling XML element:C724($refOptions; $nom_option; $valeur_option)
			Until (OK=0) | ($nom_option="method_editor")
		End if 
		
		If ($nom_option="method_editor")
			$refBalise:=$refOptions
			$refOptions:=DOM Get first child XML element:C723($refBalise; $nom_option; $valeur_option)
			If ($nom_option#"options")
				Repeat 
					$refOptions:=DOM Get next sibling XML element:C724($refOptions; $nom_option; $valeur_option)
				Until (OK=0) | ($nom_option="options")
			End if 
		End if 
		
		If ($nom_option="options")  // On a trouvé l'élément XML "options"
			// Lecture de la valeur du paramètre "Utiliser langue régionale"
			$valueParam:="true"
			DOM GET XML ATTRIBUTE BY NAME:C728($refOptions; "use_localized_language"; $valueParam)
			
			If (ERREUR_TYPE="-9930@")  // Element non trouvé
				ALERT:C41("noeud XML 'options' non trouvé")
				return 
			End if 
			
			$isLangageFrench:=Bool:C1537($valueParam="true")
			
			If ($isLangageFrench=True:C214)
				DOM SET XML ATTRIBUTE:C866($refOptions; "use_localized_language"; "false")
				If (ERREUR_TYPE="")
					// Si pas d'erreur d'exécution, on sauvegarde le param.
					DOM EXPORT TO FILE:C862($refParam; $cheminFichierParam)
				End if 
				
				If (ERREUR_TYPE="")
					// Si pas d'erreur d'exécution, il faut redémarrer 4D !
					$needRestart:=True:C214
				End if 
				
			End if 
			
		Else   // On a pas trouvé l'élément XML "options"
			// créer élément XML options en français
			//$refMethodEditor:=DOM Find XML element($refBalise; "/com.4d/method_editor/")
			$refOptions:=DOM Create XML element:C865($refBalise; "options"; "use_localized_language"; "true")
			
			If (ERREUR_TYPE="")
				// Si pas d'erreur d'exécution, on sauvegarde le param.
				DOM EXPORT TO FILE:C862($refParam; $cheminFichierParam)
			End if 
			
			If (ERREUR_TYPE="")
				// Si pas d'erreur d'exécution, il faut redémarrer 4D !
				$needRestart:=True:C214
			End if 
			
		End if 
		
		DOM CLOSE XML:C722($refParam)
		
	Else 
		$codeErreur:="-2 : Impossible de charger le fichier de paramétrage."
	End if 
Else 
	$codeErreur:="-1 : Fichier de paramétrage introuvable."
End if 

If (ERREUR_TYPE#"") & ($codeErreur="")
	$codeErreur:=ERREUR_TYPE
End if 
ON ERR CALL:C155($nomMethodeErreur)

// Message d'erreur : impossible d'identifier le paramétrage applicatif
If ($codeErreur#"")
	$messError:="Impossible d'accéder aux paramètres régionaux du poste utilisateur."
	$messError:=$messError+Char:C90(10)+"Veuillez vous assurer que le paramétrage régional des méthodes est activé et veuillez redémarrer l'application."
	$messError:=$messError+Char:C90(10)+"Erreur : "+$codeErreur
	ALERT:C41($messError)
End if 

// Redémarrage de la base si le paramétrage a changé.
If ($needRestart=True:C214)
	ALERT:C41("Paramètres régionaux chargés. Redémarrage de l'application nécessaire.")
	QUIT 4D:C291
End if 