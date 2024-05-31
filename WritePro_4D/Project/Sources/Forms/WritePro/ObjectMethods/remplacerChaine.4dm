//fsch

//sélectionner tout le doc maitre pour la recherche "find next"
//$userSel:=WP Selection range(*; "WP_Area")
$userSel:=WP Selection range(WP_Area)
//remplacer
WP Find next(WP_Area; $userSel; "***includ***"; wk all insensitive; "xxCOINCOINxx")
//bizarre<<<<<
//pour que le WP Find fonctionne, il faut
// 1. charger
// 2. recharger le formulaire (sortir+re-rentrer) 
// 3. faire "remplacerChaine"
// je supose que: WP_Area n'est mis à jour que quand on re-rentre dans le formulaire, non ????
//bizarre>>>>>

