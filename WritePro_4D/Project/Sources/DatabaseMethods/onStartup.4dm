//sur ouverture

Use (Storage)
	Storage.param:=New shared object()
	Use (Storage.param)
		Storage.param.path:=Get 4D folder(Database folder)
	End use 
End use 

var vBlob4D_b_o : Object

var $e : cs.Table1Entity
If (ds.Table1.all().length=0)
	$e:=ds.Table1.new()
	$o:=$e.save()
End if 

_General

