//%attributes = {}
ARRAY TEXT($_BookmarkNames; 0)
WP GET BOOKMARKS(WP_Area; $_BookmarkNames)  //lire les signets du template
$targetRange:=WP New  //créer un nouveau document vide (sera le document final)

$p:=Find in array($_BookmarkNames; "Main_Header")  //traiter l'entête principal nommé "Main_Header"
If ($p>0)
	$Range:=WP Get bookmark range(WParea; $_BookmarkNames{$p})  //sélectionner la plage
	$RangeDoc:=WP New($Range)  //créer un nouveau document depuis la plage
	WP INSERT DOCUMENT($targetRange; $RangeDoc; wk append+wk freeze expressions)  //wk append=après remplacement, $buildRange est égal à la fin du texte remplacé
End if 