//%attributes = {}
/*------------------------------------------------------------------------------
Methode projet : SEPA_XML_HDR



Historique
07/01/2021 titouan@connect-io.fr - Création entête
------------------------------------------------------------------------------*/

//Déclaration
var $1; $Vir_o : Object

$Vir_o:=New object:C1471()
$Vir_o.DebtName:="RDC"
//je crée mon arbre XML, la balise Document
ref_Document:=DOM Create XML Ref:C861("Document")  //création de mon arbre XML SEPA
$nom_attribut1:="xmlns:xsi"
$val_attribut1:="http://www.w3.org/2001/XMLSchema-instance"
$nom_attribut2:="xmlns:xsd"
$val_attribut2:="http://www.w3.org/2001/XMLSchema"
$nom_attribut3:="xmlns"
$val_attribut3:="urn:iso:std:iso:20022:tech:xsd:pain.008.001.02"
DOM SET XML ATTRIBUTE:C866(ref_Document; $nom_attribut1; $val_attribut1; $nom_attribut2; $val_attribut2; $nom_attribut3; $val_attribut3)
ref_CstmrDrctDbtInitn:=DOM Create XML element:C865(ref_Document; "CstmrDrctDbtInitn")
//En tete du message
$ref_GrpHdr:=DOM Create XML element:C865(ref_CstmrDrctDbtInitn; "GrpHdr")

$ref_MsgId:=DOM Create XML element:C865($ref_GrpHdr; "MsgId")
$id:=String:C10(Current date:C33; Internal date short:K1:7)+" "+String:C10(Current time:C178; HH MM SS:K7:1)+" CIO"
DOM SET XML ELEMENT VALUE:C868($ref_MsgId; $id)
//35 car Txt Référence du message qui n'est pas utilisée comme référence fonctionnelle

$ref_CreDtTm:=DOM Create XML element:C865($ref_GrpHdr; "CreDtTm")
// Modification du code du 05/04/18
//DOM SET XML ELEMENT VALUE($ref_CreDtTm;String(Current date;ISO date GMT;Current time))
DOM SET XML ELEMENT VALUE:C868($ref_CreDtTm; String:C10(Current date:C33; ISO date:K1:8; Current time:C178))
//Date et heure de création du message

$ref_NbOfTxs:=DOM Create XML element:C865($ref_GrpHdr; "NbOfTxs")
DOM SET XML ELEMENT VALUE:C868($ref_NbOfTxs; String:C10($1))
//Nombre de transactions dans le message Max15NumericText

$ref_CtrlSum:=DOM Create XML element:C865($ref_GrpHdr; "CtrlSum")
// 05/02/21 GF : Compatibilité avec la version 4D anglais.
//DOM SET XML ELEMENT VALUE($ref_CtrlSum;String($2;"######0.00"))
DOM SET XML ELEMENT VALUE:C868($ref_CtrlSum; Replace string:C233(String:C10($2/100; "######0.00"); ","; "."))
//somme arithmétique des montants présents au niveau de chaque transaction

$ref_InitgPty:=DOM Create XML element:C865($ref_GrpHdr; "InitgPty")

$ref_Nm:=DOM Create XML element:C865($ref_InitgPty; "Nm")
DOM SET XML ELEMENT VALUE:C868($ref_Nm; Substring:C12($Vir_o.DebtName; 1; 70))
