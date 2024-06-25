var $e : cs:C1710.PrescriptionEntity
$e:=ds:C1482.Prescription.new()
$e.nom:="nouvel prescription"
$save_o:=$e.save()
ASSERT:C1129($save_o.success; "Erreur dans la sauvegarde du paramètre.")
Form:C1466.Prescription_es:=ds:C1482.Prescription.all().orderBy("pos")
