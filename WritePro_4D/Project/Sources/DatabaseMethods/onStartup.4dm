//sur ouverture

Use (Storage)
	Storage.param:=New shared object()
	Use (Storage.param)
		Storage.param.path:=Get 4D folder(Database folder)
	End use 
End use 

var vBlob4D_b_o : Object

_General

