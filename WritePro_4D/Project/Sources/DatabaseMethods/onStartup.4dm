// -----------------------------------------------------------------
// Sur ouverture
// -----------------------------------------------------------------

var $folderWP_fd : 4D.Folder
var $folderWP_Anciens_fd : 4D.Folder

//vérifier la présence des répertoires WP, et les créer si absents
$folderWP_fd:=Folder(fk resources folder).folder("WritePro")
If (Not($folderWP_fd.exists))
	$folderWP_fd.create()
End if 
$folderWP_Anciens_fd:=Folder(fk resources folder).folder("WritePro").folder("Anciens")
If (Not($folderWP_Anciens_fd.exists))
	$folderWP_Anciens_fd.create()
End if 

Use (Storage)
	Storage.myConst:=New shared object()
	Use (Storage.myConst)
		Storage.myConst.WriteProPath:=$folderWP_fd.platformPath
	End use 
End use 

var vBlob4D_b_o : Object

var $e : cs.Table1Entity
If (ds.Table1.all().length=0)
	$e:=ds.Table1.new()
	$o:=$e.save()
End if 

_General

