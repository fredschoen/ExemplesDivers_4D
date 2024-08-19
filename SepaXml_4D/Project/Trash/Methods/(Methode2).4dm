//%attributes = {}
//CreerXmlVirement_DOM
//entrée: Liste de tous les virements SEPA à émettre de la part d'un débiteur (Object). Exemple:
// $lot_o.NomDeb_t:="S.A.S. REGIE DES CREANCES"
// $lot_o.IbanDeb_t:="FR7619106006764470584417571"
// $lot_o.BicDeb_t:="AGRIFRPP891"
// $lot_o.PmtInfId_t:="Virements pour XML 14-05-2024"
// $lot_o.DateVir_d:=!2024-05-14!
// $lot_o.IdtMsg_t:="15/05/2024 09:57:07 RDC"
// $lot_o.vir_c: les virements (collection d'objects)
// $lot_o.vir_c[1].nomCre_t    :="S.A.S. Régie des Créances"
// $lot_o.vir_c[1].mnt_r       :=1.99 
// $lot_o.vir_c[1].IdtMsgCre_t :="20240514001"
// $lot_o.vir_c[1].EndToEndId_t :="VIR-COM2024-0001"
// $lot_o.vir_c[1].InfoVirCre_t:="Commission pour XML 14/05/2024"
// $lot_o.vir_c[1].IbanCre_t   :="FR7619106006764470573439693"
// $lot_o.vir_c[1].BicCre_t    :="AGRIFRPP891"

//Déclaration
#DECLARE($lot_o : Object)
var $refNiv0_t : Text
var $refNiv1_t : Text
var $refNiv2_t : Text
var $refNiv3_t : Text
var $nom1_t; $nom2_t; $val1_t; $val2_t : Text
var $ref_t; $val_t : Text


$refNiv0_t:=DOM Create XML Ref:C861("Document")  //création de mon arbre XML SEPA
$nom1_t:="xmlns"
$val1_t:="urn:iso:std:iso:20022:tech:xsd:pain.001.001.03"
$nom2_t:="xmlns:xsi"
$val2_t:="http://www.w3.org/2001/XMLSchema-instance"
DOM SET XML ATTRIBUTE:C866($refNiv0_t; $nom1_t; $val1_t; $nom2_t; $val2_t)

//CstmrCdtTrfInitn
$refNiv1_t:=DOM Create XML element:C865($refNiv0_t; "CstmrCdtTrfInitn")

//CstmrCdtTrfInitn/GrpHdr
$refNiv2_t:=DOM Create XML element:C865($refNiv1_t; "GrpHdr")

//CstmrCdtTrfInitn/GrpHdr/MsgId
$ref_t:=DOM Create XML element:C865($refNiv2_t; "MsgId")
$val_t:=$lot_o.IdtMsg_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/CreDtTm
$ref_t:=DOM Create XML element:C865($refNiv2_t; "CreDtTm")
$val_t:=String:C10(Current date:C33; ISO date:K1:8; Current time:C178)
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/NbOfTxs
$ref_t:=DOM Create XML element:C865($refNiv2_t; "NbOfTxs")
$val_t:=String:C10($lot_o.vir_c.count())
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/CtrlSum
$ref_t:=DOM Create XML element:C865($refNiv2_t; "CtrlSum")
$val_t:=Replace string:C233(String:C10($lot_o.vir_c.sum("mnt_r"); "#######0.00"); ","; ".")
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/InitgPty
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "InitgPty"); "Nm")
$val_t:=$lot_o.NomDeb_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)

//CstmrCdtTrfInitn/PmtInf
$refNiv2_t:=DOM Create XML element:C865($refNiv1_t; "PmtInf")

//CstmrCdtTrfInitn/PmtInf/PmtInfId
$ref_t:=DOM Create XML element:C865($refNiv2_t; "PmtInfId")
$val_t:=$lot_o.PmtInfId_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/PmtMtd
$ref_t:=DOM Create XML element:C865($refNiv2_t; "PmtMtd")
$val_t:="TRF"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/BtchBookg
$ref_t:=DOM Create XML element:C865($refNiv2_t; "BtchBookg")
$val_t:="false"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/NbOfTxs
$ref_t:=DOM Create XML element:C865($refNiv2_t; "NbOfTxs")
$val_t:=String:C10($lot_o.vir_c.count())
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/CtrlSum
$ref_t:=DOM Create XML element:C865($refNiv2_t; "CtrlSum")
$val_t:=Replace string:C233(String:C10($lot_o.vir_c.sum("mnt_r"); "#######0.00"); ","; ".")
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/PmtTpInf/SvcLvl/Cd
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "PmtTpInf"); "SvcLvl"); "Cd")
$val_t:="SEPA"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/ReqdExctnDt
$ref_t:=DOM Create XML element:C865($refNiv2_t; "ReqdExctnDt")
$val_t:=String:C10($lot_o.ReqdExctnDt_d; "yyyy-MM-dd")
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/Dbtr
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "Dbtr"); "Nm")
$val_t:=$lot_o.NomDeb_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/DbtrAcct
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "DbtrAcct"); "Id"); "IBAN")
$val_t:=$lot_o.IbanDeb_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/DbtrAgt
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "DbtrAgt"); "FinInstnId"); "BIC")
$val_t:=$lot_o.BicDeb_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/ChrgBr
$ref_t:=DOM Create XML element:C865($refNiv2_t; "ChrgBr")
$val_t:="SLEV"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)

//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf

For each ($elt_o; $lot_o.vir_c)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf
	$refNiv3_t:=DOM Create XML element:C865($refNiv2_t; "CdtTrfTxInf")
	
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/PmtId
	$refNiv4_t:=DOM Create XML element:C865($refNiv3_t; "PmtId")
	
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/PmtId/InstrId
	$ref_t:=DOM Create XML element:C865($refNiv4_t; "InstrId")
	$val_t:=$elt_o.IdtMsgCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/PmtId/EndToEndId
	$ref_t:=DOM Create XML element:C865($refNiv4_t; "EndToEndId")
	$val_t:=$elt_o.EndToEndId_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/Amt
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "Amt"); "InstdAmt"; "Ccy"; "EUR")
	$val_t:=Replace string:C233(String:C10($elt_o.mnt_r; "#######0.00"); ","; ".")
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	
	////CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/CdtrAgt
	//$ref_t:=DOM Create XML element(DOM Create XML element(DOM Create XML element($refNiv3_t; "CdtrAgt"); "FinInstnId"); "BIC")
	//$val_t:=$elt_o.BicCre_t
	//DOM SET XML ELEMENT VALUE($ref_t; $val_t)
	
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/Cdtr
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "Cdtr"); "Nm")
	$val_t:=$elt_o.nomCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/CdtrAcct
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "CdtrAcct"); "Id"); "IBAN")
	$val_t:=$elt_o.IbanCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	
End for each 


$path:=Select document:C905(""; ".xml"; "virements"; File name entry:K24:17)

If ($path#"")
	DOM EXPORT TO FILE:C862($refNiv0_t; document)
	SHOW ON DISK:C922(document)
End if 

DOM CLOSE XML:C722($refNiv0_t)
