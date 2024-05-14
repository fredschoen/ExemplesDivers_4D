//%attributes = {}
//Déclaration
//#DECLARE($virements_o : Object)
var $ref_Document : Text
var $ref_PmtInf : Text
var $ref_CstmrCdtTrfInitn : Text
var $ref_GrpHdr : Text
var $nom1_t; $nom2_t; $nom3_t; $val1_t; $val2_t; $val3_t : Text
var $ref_t; $val_t : Text
var $ref_InitgPty : Text

$ref_Document:=DOM Create XML Ref:C861("Document")  //création de mon arbre XML SEPA
$nom1_t:="xmlns:xsi"
$val1_t:="http://www.w3.org/2001/XMLSchema-instance"
$nom2_t:="xmlns:xsd"
$val2_t:="http://www.w3.org/2001/XMLSchema"
$nom3_t:="xmlns"
$val3_t:="urn:iso:std:iso:20022:tech:xsd:pain.008.001.02"
DOM SET XML ATTRIBUTE:C866($ref_Document; $nom1_t; $val1_t; $nom2_t; $val2_t; $nom3_t; $val3_t)

//CstmrCdtTrfInitn
$ref_CstmrCdtTrfInitn:=DOM Create XML element:C865($ref_Document; "CstmrCdtTrfInitn")

//CstmrCdtTrfInitn/GrpHdr
$ref_GrpHdr:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "GrpHdr")
//CstmrCdtTrfInitn/GrpHdr/MsgId
$ref_t:=DOM Create XML element:C865($ref_GrpHdr; "MsgId")
$val_t:=String:C10(Current date:C33; Internal date short)+" "+String:C10(Current time:C178; HH MM SS)+" CIO"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/CreDtTm
$ref_t:=DOM Create XML element:C865($ref_GrpHdr; "CreDtTm")
$val_t:=String:C10(Current date:C33; ISO date:K1:8; Current time:C178)
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/NbOfTxs
$ref_t:=DOM Create XML element:C865($ref_GrpHdr; "NbOfTxs")
$val_t:="2"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/CtrlSum
$ref_t:=DOM Create XML element:C865($ref_GrpHdr; "CtrlSum")
$val_t:="3000.00"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)
//CstmrCdtTrfInitn/GrpHdr/InitgPty
$ref_InitgPty:=DOM Create XML element:C865($ref_GrpHdr; "InitgPty")
$ref_t:=DOM Create XML element:C865($ref_InitgPty; "Nm")
$val_t:="regie des créance"
DOM SET XML ELEMENT VALUE:C868($ref_t; $val_t)

//CstmrCdtTrfInitn/PmtInf
$ref_PmtInf:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "PmtInf")

//CstmrCdtTrfInitn/PmtInf/PmtInfId
//CstmrCdtTrfInitn/PmtInf/PmtMtd
//CstmrCdtTrfInitn/PmtInf/BtchBookg
//CstmrCdtTrfInitn/PmtInf/NbOfTxs
//CstmrCdtTrfInitn/PmtInf/CtrlSum
//CstmrCdtTrfInitn/PmtInf/PmtTpInf
//CstmrCdtTrfInitn/PmtInf/ReqdExctnDt
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/
//CstmrCdtTrfInitn/PmtInf/


//exporter
DOM EXPORT TO FILE:C862($ref_Document; "")
DOM CLOSE XML:C722($ref_Document)



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
