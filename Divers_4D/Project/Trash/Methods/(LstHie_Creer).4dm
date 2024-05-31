//%attributes = {}
//Liste_Charger_hlList
//ENTRÉE:
// - Form.hlListPlier_b: O/N
// - Form.ID_Chapeau
//charger la liste hiérarchique Internet
var $deplier_b : Boolean
var hlList; $hSousListeN1; $hSousListeN2; $hSousListeN3 : Integer
var $r1_es : cs:C1710.RelationFamilleSelection
var $r1_e : cs:C1710.RelationFamilleEntity
var $r2_es : cs:C1710.RelationFamilleSelection
var $r2_e : cs:C1710.RelationFamilleEntity
var $r3_es : cs:C1710.RelationFamilleSelection
var $r3_e : cs:C1710.RelationFamilleEntity
var $r4_es : cs:C1710.RelationFamilleSelection
var $r4_e : cs:C1710.RelationFamilleEntity

$deplier_b:=(Not:C34(Form:C1466.hlListPlier_b))

// Créer une nouvelle liste hiérarchique vide
hlList:=New list:C375

//niveau1
$r1_es:=ds:C1482.RelationFamille.query("FamilleParent_ID = :1"; Form:C1466.ID_Chapeau).orderBy("Sequence")
For each ($r1_e; $r1_es)
	
	//niveau2
	$hSousListeN1:=New list:C375
	$r2_es:=$r1_e.famille.relationsEnfants.query("Famille_ID>0").orderBy("Sequence")
	For each ($r2_e; $r2_es)
		
		//niveau3
		$hSousListeN2:=New list:C375
		//ne pas prendre les niveaux "variété":
		$r3_es:=$r2_e.famille.relationsEnfants.query("Famille_ID > 0").orderBy("Sequence")
		For each ($r3_e; $r3_es)
			
			//niveau4
			$hSousListeN3:=New list:C375
			//ne pas prendre les niveaux "variété":
			$r4_es:=$r3_e.famille.relationsEnfants.query("Famille_ID > 0").orderBy("Sequence")
			For each ($r4_e; $r4_es)
				APPEND TO LIST:C376($hSousListeN3; $r4_e.famille.Nom; $r4_e.famille.ID)  //pas de niveau 5
				//grisé
				If ($r4_e.famille.isGreyFamille())
					SET LIST ITEM PROPERTIES:C386($hSousListeN3; 0; False:C215; 0; 0; color RGB blue)
				End if 
				
			End for each 
			
			APPEND TO LIST:C376($hSousListeN2; $r3_e.famille.Nom; $r3_e.famille.ID; $hSousListeN3; $deplier_b)
			//grisé
			If ($r3_e.famille.isGreyFamille())
				SET LIST ITEM PROPERTIES:C386($hSousListeN2; 0; False:C215; 0; 0; color RGB blue)
			End if 
			
		End for each 
		//ajouter l'élément du niveau2
		APPEND TO LIST:C376($hSousListeN1; $r2_e.famille.Nom; $r2_e.famille.ID; $hSousListeN2; $deplier_b)
		//grisé
		If ($r2_e.famille.isGreyFamille())
			SET LIST ITEM PROPERTIES:C386($hSousListeN1; 0; False:C215; 0; 0; color RGB blue)
		End if 
	End for each 
	
	//ajouter l'élément du niveau1 ("en gras")
	APPEND TO LIST:C376(hlList; $r1_e.famille.Nom; $r1_e.famille.ID; $hSousListeN1; $deplier_b)
	// Passer l'élément en gras pour renforcer la hiérarchie de la liste
	SET LIST ITEM PROPERTIES:C386(hlList; 0; False:C215; Bold:K14:2; 0)
	
End for each 

// Forcer la hauteur de ligne minimale à 14 Pts
SET LIST PROPERTIES:C387(hlList; 0; 0; 14)

// raz des données dépendant dans le formulaire llié
Form:C1466.Article_c:=Null:C1517
Form:C1466.Variete_es:=Null:C1517
Form:C1466.RelationFamille_e:=Null:C1517
Form:C1466.Famille_e:=Null:C1517

OBJECT SET VISIBLE:C603(*; "LB_Variete_Onglet4"; False:C215)
OBJECT SET VISIBLE:C603(*; "LB_Article_Onglet4"; False:C215)

OBJECT SET VISIBLE:C603(*; "bAjoutRelationVariete"; False:C215)
OBJECT SET VISIBLE:C603(*; "bSupprRelationVariete"; False:C215)

OBJECT SET VISIBLE:C603(*; "bAddArticle"; False:C215)
