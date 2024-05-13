//%attributes = {}
//Déclaration
#DECLARE($virements_o : Object)


$ref_CstmrCdtTrfInitn:=DOM Create XML element:C865(ref_PmtInf; "CstmrCdtTrfInitn")
$ref_PmtId:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "PmtId")
$ref_InstrId:=DOM Create XML element:C865($ref_PmtId; "InstrId")


DOM SET XML ELEMENT VALUE:C868($ref_InstrId; String:C10($echeance_e.ID))  // je mets le n° ID de la première échéance traitée

$ref_EndToEndId:=DOM Create XML element:C865($ref_PmtId; "EndToEndId")
DOM SET XML ELEMENT VALUE:C868($ref_EndToEndId; Substring:C12("PRLV SEPA "+$myCompany_e.companyName+" "+JJ_MM_AA(dateprél); 1; 35))
//<!-- Max35Text Référence de bout-en-bout qui est restituée au débiteur. -->

$ref_InstdAmt:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "InstdAmt")
DOM SET XML ATTRIBUTE:C866($ref_InstdAmt; "Ccy"; "EUR")
// 05/02/21 GF : Compatibilité avec la version 4D anglais.
//DOM SET XML ELEMENT VALUE($ref_InstdAmt;String($montant_r;"#######0.00"))  // montant prélevé pour une transaction
DOM SET XML ELEMENT VALUE:C868($ref_InstdAmt; Replace string:C233(String:C10($echeance_e.montant; "#######0.00"); ","; "."))
//<!-- Montant du prélévement SEPA en euro, compris entre 0,01 et 999999999,99. -->

$ref_DrctDbtTx:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "DrctDbtTx")  // éléments du mandat

$ref_MndtRltdInf:=DOM Create XML element:C865($ref_DrctDbtTx; "MndtRltdInf")

$ref_MndtId:=DOM Create XML element:C865($ref_MndtRltdInf; "MndtId")
DOM SET XML ELEMENT VALUE:C868($ref_MndtId; $Person_e.rum)  // R.U.M.

$ref_DtOfSgntr:=DOM Create XML element:C865($ref_MndtRltdInf; "DtOfSgntr")
DOM SET XML ELEMENT VALUE:C868($ref_DtOfSgntr; Substring:C12(String:C10($Person_e.birth; ISO date:K1:8); 1; 10))

$ref_AmdmntInd:=DOM Create XML element:C865($ref_MndtRltdInf; "AmdmntInd")
DOM SET XML ELEMENT VALUE:C868($ref_AmdmntInd; "false")


$ref_DbtrAgt:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "DbtrAgt")  //BANQUE DU DEBITEUR

$ref_FinInstnId:=DOM Create XML element:C865($ref_DbtrAgt; "FinInstnId")

$ref_BIC:=DOM Create XML element:C865($ref_FinInstnId; "BIC")  //BIC de la banque du débiteur est facultatif
DOM SET XML ELEMENT VALUE:C868($ref_BIC; $Person_e.bic)
If ($Person_e.bic="")
	$ref_Othr:=DOM Create XML element:C865($ref_FinInstnId; "Othr")  //Utilisé obligatoirement lorsque l'élément BIC n'est pas renseigné
	
	$ref_Id:=DOM Create XML element:C865($ref_Othr; "Id")
	DOM SET XML ELEMENT VALUE:C868($ref_Id; "NOTPROVIDED")
End if 

$ref_Dbtr:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "Dbtr")  //Il s'agit du débiteur titulaire du compte à débiter 

$ref_Nm:=DOM Create XML element:C865($ref_Dbtr; "Nm")
DOM SET XML ELEMENT VALUE:C868($ref_Nm; Uppercase:C13($nom_t))

$ref_DbtrAcct:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "DbtrAcct")  //Numéro du compte du débiteur Seul l'IBAN est autorisé. 

$ref_Id:=DOM Create XML element:C865($ref_DbtrAcct; "Id")

$ref_IBAN:=DOM Create XML element:C865($ref_Id; "IBAN")
DOM SET XML ELEMENT VALUE:C868($ref_IBAN; $Person_e.iban)


$ref_RgltryRptg:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "RgltryRptg")
//Declaration aux autorités de régulation (balance des paiements par ex.)

$ref_DbtCdtRptgInd:=DOM Create XML element:C865($ref_RgltryRptg; "DbtCdtRptgInd")
DOM SET XML ELEMENT VALUE:C868($ref_DbtCdtRptgInd; "CRED")

$ref_Dtls:=DOM Create XML element:C865($ref_RgltryRptg; "Dtls")

$ref_Dt:=DOM Create XML element:C865($ref_Dtls; "Dt")
DOM SET XML ELEMENT VALUE:C868($ref_Dt; Substring:C12(String:C10(Current date:C33; ISO date GMT:K1:10); 1; 10))

$ref_Cd:=DOM Create XML element:C865($ref_Dtls; "Cd")
DOM SET XML ELEMENT VALUE:C868($ref_Cd; "0")

$ref_Amt:=DOM Create XML element:C865($ref_Dtls; "Amt")
DOM SET XML ATTRIBUTE:C866($ref_Amt; "Ccy"; "EUR")
DOM SET XML ELEMENT VALUE:C868($ref_Amt; Replace string:C233(String:C10($echeance_e.montant; "######0.00"); ","; "."))


$ref_RmtInf:=DOM Create XML element:C865($ref_CstmrCdtTrfInitn; "RmtInf")
//Information de remise (l'opération est "structurée" ou "non structurée"
//selon qu'elle solde ou non une opération commerciale)

$ref_Ustrd:=DOM Create XML element:C865($ref_RmtInf; "Ustrd")
DOM SET XML ELEMENT VALUE:C868($ref_Ustrd; "FACTURES PRESTATIONS "+$myCompany_e.companyName)

