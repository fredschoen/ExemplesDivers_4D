//%attributes = {}
//Déclaration
//#DECLARE($virements_o : Object)
var $refNiv0_t : Text
var $refNiv1_t : Text
var $refNiv2_t : Text
var $refNiv3_t : Text
var $nom1_t; $nom2_t; $val1_t; $val2_t : Text
var $ref_t; $val_t : Text


$lot_o:=New object:C1471()
$lot_o.NomDeb_t:="RDC"
$lot_o.IbanDeb_t:="FR76111122223333444455556666777"
$lot_o.BicDeb_t:="AGRIFRPPXXX"
$lot_o.InfoVirDeb_t:="Virement vers les XXXX"
$lot_o.DateVir_d:=!2024-05-01!
$lot_o.IdtMsg_t:=String:C10(Current date:C33; Internal date short)+" "+String:C10(Current time:C178; HH MM SS)+" CIO"

$c:=New collection:C1472()
$c.push(New object:C1471("nomCre_t"; "doudou 11"; "mnt_r"; 1000.00; "IdtMsgCre_t"; "12345"; "NomMsgCre_t"; "blabla"; "InfoVirCre_t"; "oui oui"; "IbanCre_t"; "FRXX5555666677778888"; "BicCre_t"; "AGRIXXXX"))
$c.push(New object:C1471("nomCre_t"; "doudou 22"; "mnt_r"; 3000.02; "IdtMsgCre_t"; "12345"; "NomMsgCre_t"; "blabla"; "InfoVirCre_t"; "oui oui"; "IbanCre_t"; "FRXX5555666677778888"; "BicCre_t"; "AGRIXXXX"))
$lot_o.vir_c:=$c

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
$val_t:=$lot_o.InfoVirDeb_t
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
$val_t:=Substring:C12(String:C10(Current date:C33; ISO date GMT:K1:10); 1; 10)
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/Dbtr
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "Dbtr"); "Nm")
$val_t:=$lot_o.NomDeb_t
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/PmtInf/DbtrAcct
$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv2_t; "DbtrAcct"); "IBAN")
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
	$val_t:=$elt_o.NomMsgCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/Amt
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "Amt"); "InstdAmt"; "Ccy"; "EUR")
	$val_t:=Replace string:C233(String:C10($elt_o.mnt_r; "#######0.00"); ","; ".")
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/CdtrAgt
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "CdtrAgt"); "FinInstnId"); "BIC")
	$val_t:=$elt_o.BicCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/Cdtr
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "Cdtr"); "Nm")
	$val_t:=$elt_o.nomCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/CdtrAcct
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "CdtrAcct"); "Id"); "IBAN")
	$val_t:=$elt_o.IbanCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	//CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf/RmtInf
	$ref_t:=DOM Create XML element:C865(DOM Create XML element:C865($refNiv3_t; "RmtInf"); "Ustrd")
	$val_t:=$elt_o.InfoVirCre_t
	DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
	
End for each 

//exporter
DOM EXPORT TO FILE:C862($refNiv0_t; "")
DOM CLOSE XML:C722($refNiv0_t)



//$ref_MsgId:=DOM Créer élément XML($ref_GrpHdr; "MsgId")
//$id:=Chaîne(Date du jour; Internal date short)+" "+Chaîne(Heure courante; HH MM SS)+" CIO"
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_MsgId; $id)
////35 car Txt Référence du message qui n'est pas utilisée comme référence fonctionnelle
//$ref_CreDtTm:=DOM Créer élément XML($ref_GrpHdr; "CreDtTm")
//// Modification du code du 05/04/18
////DOM SET XML ELEMENT VALUE($ref_CreDtTm;String(Current date;ISO date GMT;Current time))
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_CreDtTm; Chaîne(Date du jour; ISO date; Heure courante))
////Date et heure de création du message
//$ref_NbOfTxs:=DOM Créer élément XML($ref_GrpHdr; "NbOfTxs")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_NbOfTxs; Chaîne($1))
////Nombre de transactions dans le message Max15NumericText
//$ref_CtrlSum:=DOM Créer élément XML($ref_GrpHdr; "CtrlSum")
////DOM SET XML ELEMENT VALUE($ref_CtrlSum;String($2;"######0.00"))
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_CtrlSum; Remplacer chaîne(Chaîne($2/100; "######0.00"); ","; "."))
////somme arithmétique des montants présents au niveau de chaque transaction
//$ref_InitgPty:=DOM Créer élément XML($ref_GrpHdr; "InitgPty")
//$ref_Nm:=DOM Créer élément XML($ref_InitgPty; "Nm")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Nm; Sous chaîne($myCompany_e.companyName; 1; 70))


//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_InstrId; Chaîne($echeance_e.ID))  // je mets le n° ID de la première échéance traitée
//$ref_EndToEndId:=DOM Créer élément XML($ref_PmtId; "EndToEndId")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_EndToEndId; Sous chaîne("PRLV SEPA "+$myCompany_e.companyName+" "+JJ_MM_AA(dateprél); 1; 35))
//$ref_InstdAmt:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "InstdAmt")
//DOM ÉCRIRE ATTRIBUT XML($ref_InstdAmt; "Ccy"; "EUR")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_InstdAmt; Remplacer chaîne(Chaîne($echeance_e.montant; "#######0.00"); ","; "."))
//$ref_DrctDbtTx:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "DrctDbtTx")  // éléments du mandat
//$ref_MndtRltdInf:=DOM Créer élément XML($ref_DrctDbtTx; "MndtRltdInf")
//$ref_MndtId:=DOM Créer élément XML($ref_MndtRltdInf; "MndtId")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_MndtId; $Person_e.rum)  // R.U.M.
//$ref_DtOfSgntr:=DOM Créer élément XML($ref_MndtRltdInf; "DtOfSgntr")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_DtOfSgntr; Sous chaîne(Chaîne($Person_e.birth; ISO date); 1; 10))
//$ref_AmdmntInd:=DOM Créer élément XML($ref_MndtRltdInf; "AmdmntInd")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_AmdmntInd; "false")
//$ref_DbtrAgt:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "DbtrAgt")  //BANQUE DU DEBITEUR
//$ref_FinInstnId:=DOM Créer élément XML($ref_DbtrAgt; "FinInstnId")
//$ref_BIC:=DOM Créer élément XML($ref_FinInstnId; "BIC")  //BIC de la banque du débiteur est facultatif
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_BIC; $Person_e.bic)
//Si ($Person_e.bic="")
//$ref_Othr:=DOM Créer élément XML($ref_FinInstnId; "Othr")  //Utilisé obligatoirement lorsque l'élément BIC n'est pas renseigné
//$ref_Id:=DOM Créer élément XML($ref_Othr; "Id")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Id; "NOTPROVIDED")
//Fin de si 
//$ref_Dbtr:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "Dbtr")  //Il s'agit du débiteur titulaire du compte à débiter 
//$ref_Nm:=DOM Créer élément XML($ref_Dbtr; "Nm")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Nm; Majusc($nom_t))
//$ref_DbtrAcct:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "DbtrAcct")  //Numéro du compte du débiteur Seul l'IBAN est autorisé. 
//$ref_Id:=DOM Créer élément XML($ref_DbtrAcct; "Id")
//$ref_IBAN:=DOM Créer élément XML($ref_Id; "IBAN")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_IBAN; $Person_e.iban)
//$ref_RgltryRptg:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "RgltryRptg")
//$ref_DbtCdtRptgInd:=DOM Créer élément XML($ref_RgltryRptg; "DbtCdtRptgInd")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_DbtCdtRptgInd; "CRED")
//$ref_Dtls:=DOM Créer élément XML($ref_RgltryRptg; "Dtls")
//$ref_Dt:=DOM Créer élément XML($ref_Dtls; "Dt")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Dt; Sous chaîne(Chaîne(Date du jour; ISO date GMT); 1; 10))
//$ref_Cd:=DOM Créer élément XML($ref_Dtls; "Cd")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Cd; "0")
//$ref_Amt:=DOM Créer élément XML($ref_Dtls; "Amt")
//DOM ÉCRIRE ATTRIBUT XML($ref_Amt; "Ccy"; "EUR")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Amt; Remplacer chaîne(Chaîne($echeance_e.montant; "######0.00"); ","; "."))
//$ref_RmtInf:=DOM Créer élément XML($ref_CstmrCdtTrfInitn; "RmtInf")
//$ref_Ustrd:=DOM Créer élément XML($ref_RmtInf; "Ustrd")
//DOM ÉCRIRE VALEUR ÉLÉMENT XML($ref_Ustrd; "FACTURES PRESTATIONS "+$myCompany_e.companyName)
