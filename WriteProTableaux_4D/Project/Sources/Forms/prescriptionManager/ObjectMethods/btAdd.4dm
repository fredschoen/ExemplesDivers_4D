var $e : cs:C1710.tblPrescriptionEntity
$e:=ds:C1482.tblPrescription.new()
$e.nomPrescription:="nouvel prescription"
$save_o:=$e.save()
ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde du paramètre.")
Form:C1466.tblPrescription_es:=ds:C1482.tblPrescription.all().orderBy("posPrescription")
