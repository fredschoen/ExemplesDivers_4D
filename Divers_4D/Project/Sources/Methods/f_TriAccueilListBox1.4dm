//%attributes = {}
// f_TriAccueilListBox1
//
Case of 
	: (triAccueilListbox1ColNom=1)
		$orderBy_t:="nom asc, etat asc"
	: (triAccueilListbox1ColNom=2)
		$orderBy_t:="nom desc, etat desc"
	: (triAccueilListbox1Col2=1)
		$orderBy_t:="etat asc, nom asc"
	: (triAccueilListbox1Col2=2)
		$orderBy_t:="etat desc, nom desc"
	Else 
		$orderBy_t:="nom asc, etat asc"
End case 

Form:C1466.collection_c:=Form:C1466.collection_c.orderBy($orderBy_t)