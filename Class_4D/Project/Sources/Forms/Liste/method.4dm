If (Form event code:C388=On Load:K2:1)
	Form:C1466.Sachet_es:=ds:C1482.Sachet.all().orderBy("article.Nom")
	Form:C1466.Article_es:=ds:C1482.Article.all().orderBy("Nom")
End if 
