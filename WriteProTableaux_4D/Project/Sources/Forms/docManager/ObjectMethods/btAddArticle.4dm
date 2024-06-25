var $e : cs:C1710.tblPrescriptionEntity
$e:=ds:C1482.Prescription.new()
$e.nom:="nouvelle prescription"
$save_o:=$e.save()
ASSERT:C1129($o.success; "Erreur dans la sauvegarde du paramètre.")
Form:C1466.tblPrescription_es:=ds:C1482.Prescription.all().orderBy("pos")
