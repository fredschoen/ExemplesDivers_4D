If (ds:C1482.Article.all().length=0)
	var $a : cs:C1710.ArticleEntity
	$a:=ds:C1482.Article.new()
	$a.ID:=1
	$a.Nom:="patatte"
	$o:=$a.save()
	$a:=ds:C1482.Article.new()
	$a.ID:=2
	$a.Nom:="carotte"
	$o:=$a.save()
	
End if 

If (ds:C1482.Sachet.all().length=0)
	var $s : cs:C1710.SachetEntity
	$s:=ds:C1482.Sachet.new()
	$s.Nom:="craft"
	$s.ID_Article:=1
	$o:=$s.save()
	$s:=ds:C1482.Sachet.new()
	$s.ID:=2
	$s.Nom:="papier"
	$s.ID_Article:=1
	$o:=$s.save()
	
	$s:=ds:C1482.Sachet.new()
	$s.Nom:="craft"
	$s.ID_Article:=2
	$o:=$s.save()
	
	$s:=ds:C1482.Sachet.new()
	$s.Nom:="papier"
	$s.ID_Article:=2
	$o:=$s.save()
	
End if 



