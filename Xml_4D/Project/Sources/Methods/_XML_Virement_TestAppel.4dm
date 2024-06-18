//%attributes = {}
$lot_o:=New object:C1471()
$lot_o.NomDeb_t:="DEBOITEUR DEDEDE"
$lot_o.IbanDeb_t:="FR76999999999999999955555555"
$lot_o.BicDeb_t:="AGRIFRPP891"
$lot_o.InfoVirDeb_t:="Virements du 14-05-2024"
$lot_o.DateVir_d:=!2024-05-14!
$lot_o.IdtMsg_t:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)+" RDC"

$c:=New collection:C1472()
$c.push(New object:C1471("nomCre_t"; "COUCOU coincoin"; "mnt_r"; 1.99; "IdtMsgCre_t"; "20240514001"; "NomMsgCre_t"; "VIR-COM2024-0001"; \
"InfoVirCre_t"; "Commission 14/05/2024"; "IbanCre_t"; "FR7611111111222222222225555"; "BicCre_t"; "AGRIFRPP333"))

$c.push(New object:C1471("nomCre_t"; "S.A.S. CONNECT IO"; "mnt_r"; 9.01; "IdtMsgCre_t"; "20240514002"; "NomMsgCre_t"; "VIR-REMB2024-0001"; \
"InfoVirCre_t"; "remboursement pour XML 14/05/2024"; "IbanCre_t"; "FR7615555555555555555558888"; "BicCre_t"; "AGRIFRPP999"))
$lot_o.vir_c:=$c

CreerXmlVirement_DOM($lot_o)
