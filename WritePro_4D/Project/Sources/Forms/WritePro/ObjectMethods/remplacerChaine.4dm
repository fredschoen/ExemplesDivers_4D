//fsch

//sélectionner tout le doc maitre pour la recherche "find next"
//$userSel:=WP Selection range(*; "WParea")
$userSel:=WP Selection range(WParea)
//remplacer
WP Find next(WParea; $userSel; "***includ***"; wk all insensitive; "xxCOINCOINxx")
//bizarre<<<<<
//pour que le WP Find fonctionne, il faut
// 1. charger
// 2. recharger le formulaire (sortir+re-rentrer) 
// 3. faire "remplacerChaine"
// je supose que: WParea n'est mis à jour que quand on re-rentre dans le formulaire, non ????
//bizarre>>>>>

