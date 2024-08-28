Class extends DataClass
// -----------------------------------------------------------------
// Echeance
// -----------------------------------------------------------------


Function newEntity()->$echeance_e : cs:C1710.EcheanceEntity
	$echeance_e:=ds:C1482.Echeance.new()
	$echeance_e.createTs:=cwTimestamp()
	