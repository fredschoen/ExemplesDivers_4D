// -----------------------------------------------------------------
// _General.bt14465
// -----------------------------------------------------------------
// 23/07/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------

var $win_i : Integer
var $nomForm_t : Text
var $form_o : Object
Case of 
	: (Form event code=On Clicked)
		$nomForm_t:="modele_saisie"
		$win_i:=Open form window($nomForm_t)
		$form_o:=New object
		$form_o.nomModele_t:="Modele1"
		
		DIALOG($nomForm_t; $form_o)
		CLOSE WINDOW($win_i)
End case 