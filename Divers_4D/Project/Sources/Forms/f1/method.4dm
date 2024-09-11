//
Case of 
	: (Form event code:C388=On Load:K2:1)
		OBJECT SET SHORTCUT:C1185(*; "buttonOnEsc"; Shortcut with Escape:K75:20)
		OBJECT SET SHORTCUT:C1185(*; "btReturn"; Shortcut with Carriage Return:K75:16)
		OBJECT SET SHORTCUT:C1185(*; "btEnter"; Shortcut with Enter:K75:17)
		
		Form:C1466.t1_es:=ds:C1482.t1.all()
		Form:C1466.t2_es:=ds:C1482.t2.all()
		
		var hlList; $hSousListe; $vlDépartement; $vlEmployé; $vlDépartementID : Integer
		var $t1_e : cs:C1710.t1Entity
		var $t1_es : cs:C1710.t1Selection
		$t1_es:=ds:C1482.t1.all()
		var $t2_e : cs:C1710.t1Entity
		var $t2_es : cs:C1710.t1Selection
		$t2_es:=ds:C1482.t2.all()
		
		// Créer une nouvelle liste hiérarchique vide
		hlList:=New list:C375
		$hSousListe:=New list:C375
		For each ($t2_e; $t2_es)
			For each ($t1_e; $t1_es)
				APPEND TO LIST:C376($hSousListe; $t1_e.c1+", "+$t1_e.c2; $t1_e.ID)
				
			End for each 
			//si t1 vide, alors " $hSousListe:=0"
		End for each 
		
		APPEND TO LIST:C376(hlList; $t2_e.c1; $t2_e.ID ?+ 31; $hSousListe; $hSousListe#0)
		// Passer l'élément Département en gras pour renforcer la hiérarchie de la liste
		SET LIST ITEM PROPERTIES:C386(hlList; 0; False:C215; Bold:K14:2; 0)
	Else 
		
End case 
