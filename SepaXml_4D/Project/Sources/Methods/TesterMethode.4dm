//%attributes = {}
// -----------------------------------------------------------------
// TesterMethode
// -----------------------------------------------------------------
// 19/08/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------

var $lot_o : Object
var $vir_c : Collection
var $vir_o : Object
$lot_o:=New object:C1471()
$lot_o.NomDeb_t:="Débiteur"
$lot_o.IbanDeb_t:="FR7619106006764470584417571"
$lot_o.IbanDeb_t:="FR7611112222333344445555666"
$lot_o.BicDeb_t:="AGRIFRPP891"
$lot_o.PmtInfId_t:="Virements pour XML 14-05-2024"
$lot_o.DateVir_d:=!2024-05-14!
$lot_o.IdtMsg_t:="15/05/2024 09:57:07 RDC"

$vir_c:=New collection:C1472()

$vir_o:=New object:C1471()
$vir_o.nomCre_t:="Créancier"
$vir_o.mnt_r:=1.99
$vir_o.IdtMsgCre_t:="20240514001"
$vir_o.EndToEndId_t:="VIR-COM2024-0001"
$vir_o.InfoVirCre_t:="Commission pour XML 14/05/2024"
$vir_o.IbanCre_t:="FR7677778888999900001111222"
$vir_o.IbanCre_t:="FR7619106006764470573439693"
$vir_o.BicCre_t:="AGRIFRPP891"

$vir_c.push($vir_o)
$lot_o.vir_c:=$vir_c

CreerXmlVirement_DOM($lot_o)