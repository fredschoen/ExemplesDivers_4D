If (Form event code:C388=On Load:K2:1)
	LstHie_Creer()
End if 
If (Form event code:C388=On Unload:K2:2)
	CLEAR LIST:C377(hlGenreQuoi; *)
End if 


If (Form event code:C388=On Clicked:K2:4)
	$vlElementPos_i:=Selected list items:C379(hlGenreQuoi)
	If ($vlElementPos_i#0)
		// récupérer l'ID de la famille cliqué
		GET LIST ITEM:C378(hlGenreQuoi; $vlElementPos_i; $vlElementRef_i; $vsElementText_t; $vlElementSousListe; $vbElementDéploye_b)
		$x:=Form:C1466.GenreQuoi_c.query("ID = :1"; $vlElementRef_i)
		If ($x.length=0)
			return 
		End if 
		Form:C1466.Niv0:=$x.first().Niv0
		Form:C1466.Niv1:=$x.first().Niv1
	End if 
	
End if 
