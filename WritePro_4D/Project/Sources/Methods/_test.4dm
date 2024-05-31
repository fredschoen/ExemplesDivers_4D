//%attributes = {}
////WRITE PRO SEEB
//WRITE PRO SEEB

// à la création courrier (en création de commande par exemple), accepter un blob à 0 octets
If (BLOB size($xxx_Texte_)=0)  //fsch_blob0
	WPArea:=WP New()  //fsch_blob0
Else   //fsch_blob0
	WPArea:=WP New($xxx_Texte_)  //fsch
End if   //fsch_blob0

WP EXPORT VARIABLE(WParea; $fff_Facturation_Texte_; wk 4wp)  //fsch

$WParea_o:=WP New($fff_Facturation_Texte_)  //fsch (plus lisible)
$fff_Texte_Fact:=WP Get text($WParea_o; wk expressions as value)  //fsch (plus lisible)

$pdfpath:=$vhDocRef+"B_Cdes_Fournisseurs.pdf"  //fsch 
SET CURRENT PRINTER(Generic PDF driver)  //fsch
SET PRINT OPTION(Destination option; 3; $pdfpath)  //fsch
SET PRINT OPTION(Spooler document name option; "courrier "+$xxx_N_Refs)  //fsch
WP PRINT(WParea)  //fsch
ALERT("fichier "+$pdfpath+" créé")
SET CURRENT PRINTER("")

$email_o.from:=vMonMail  //fsch
$email_o.to:=vFourniMail_BonCde  //fsch
$email_o.cc:=vCC  //fsch
$email_o.bcc:=vMonMail2  //fsch
$email_o.comments:="Mail envoyé de manière automatique"  //fsch
$email_o.subject:=vMessageObjet  //fsch
$email_o.htmlBody:=vMessage  //fsch
$email_o.attachments:=New collection(MAIL New attachment($pdfpath))  //fsch
$server_o.host:="smtp.office365.com"  //TODO_pourTest: envoi mail à frederic
$server_o.user:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
$server_o.password:="fConnectIO06+n"  //TODO_pourTest: envoi mail à frederic
$email_o.from:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
$email_o.to:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
$email_o.cc:=""  //TODO_pourTest: pas de cc
$email_o.bcc:=""  //TODO_pourTest: pas de bcc
$transporter_o:=SMTP New transporter($server_o)
$status_o:=$transporter_o.send($email_o)

WP SET ATTRIBUTES(WP Text range(WParea_Livraison_Texte_; wk start text; wk end text); wk font; "Arial")  //fsch

WP FREEZE FORMULAS(WParea)  //fsch

//Supprime l'en-tête et le pied
C_OBJECT($section)  //fsch
$section:=WP Get section(WParea; 1)  //fsch
WP DELETE HEADER($section)  //fsch
WP DELETE FOOTER($section)  //fsch


//AJOUTE l'en-tête et le pied
var $header : Object
$header:=WP Get header(WParea; 1)  //1er essai
If ($header=Null)
	C_OBJECT($section; $header)
	//Retrieve the first section
	$section:=WP Get section(WParea; 1)  //création entete si nécessaire
	$header:=WP New header($section)
End if 
//$header:=WP Get header(WParea; 1)  //2ème essai
$rangeTarget:=WP Text range($header; wk start text; wk end text)
WP INSERT PICTURE($rangeTarget; vLogo; wk replace)  // pour être aligné sur le texte
$oPicts:=WP Picture range($rangeTarget)
WP SET ATTRIBUTES($oPicts; wk width; "160px"; wk height; "135px")  //redim : 25%

C_OBJECT($footer)
$footer:=WP Get footer(WParea; 1)
If ($footer=Null)
	$section:=WP Get section(WParea; 1)
	$footer:=WP New footer($section)
End if 
$rangeTarget:=WP Text range($footer; wk start text; wk end text)
$xx:=WP New(vPiedPage)
WP INSERT DOCUMENT($footer; $xx; wk replace)

WParea:=WP Import document($ccc_Chemin_Accès)  //fsch

WPArea:=WP New($xxx_Texte_)  //fsch

OBJECT SET ENABLED(WParea; False)  //fsch




//// à la création courrier (en création de commande par exemple), accepter un blob à 0 octets
//If (BLOB size($xxx_Texte_)=0)  //fsch_blob0
//WPArea:=WP New()  //fsch_blob0
//Else   //fsch_blob0
//WPArea:=WP New($xxx_Texte_)  //fsch
//End if   //fsch_blob0

//WP EXPORT VARIABLE(WParea; $fff_Facturation_Texte_; wk 4wp)  //fsch

//$WParea_o:=WP New($fff_Facturation_Texte_)  //fsch (plus lisible)
//$fff_Texte_Fact:=WP Get text($WParea_o; wk expressions as value)  //fsch (plus lisible)

//$pdfpath:=$vhDocRef+"B_Cdes_Fournisseurs.pdf"  //fsch 
//SET CURRENT PRINTER(Generic PDF driver)  //fsch
//SET PRINT OPTION(Destination option; 3; $pdfpath)  //fsch
//SET PRINT OPTION(Spooler document name option; "courrier "+$xxx_N_Refs)  //fsch
//WP PRINT(WParea)  //fsch
//ALERT("fichier "+$pdfpath+" créé")
//SET CURRENT PRINTER("")

//$email_o.from:=vMonMail  //fsch
//$email_o.to:=vFourniMail_BonCde  //fsch
//$email_o.cc:=vCC  //fsch
//$email_o.bcc:=vMonMail2  //fsch
//$email_o.comments:="Mail envoyé de manière automatique"  //fsch
//$email_o.subject:=vMessageObjet  //fsch
//$email_o.htmlBody:=vMessage  //fsch
//$email_o.attachments:=New collection(MAIL New attachment($pdfpath))  //fsch
//$server_o.host:="smtp.office365.com"  //TODO_pourTest: envoi mail à frederic
//$server_o.user:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
//$server_o.password:="fConnectIO06+n"  //TODO_pourTest: envoi mail à frederic
//$email_o.from:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
//$email_o.to:="frederic@connect-io.fr"  //TODO_pourTest: envoi mail à frederic
//$email_o.cc:=""  //TODO_pourTest: pas de cc
//$email_o.bcc:=""  //TODO_pourTest: pas de bcc
//$transporter_o:=SMTP New transporter($server_o)
//$status_o:=$transporter_o.send($email_o)

//WP SET ATTRIBUTES(WP Text range(WParea_Livraison_Texte_; wk start text; wk end text); wk font; "Arial")  //fsch

//WP FREEZE FORMULAS(WParea)  //fsch

////Supprime l'en-tête et le pied
//C_OBJECT($section)  //fsch
//$section:=WP Get section(WParea; 1)  //fsch
//WP DELETE HEADER($section)  //fsch
//WP DELETE FOOTER($section)  //fsch


////AJOUTE l'en-tête et le pied
//var $header : Object
//$header:=WP Get header(WParea; 1)  //1er essai
//If ($header=Null)
//C_OBJECT($section; $header)
////Retrieve the first section
//$section:=WP Get section(WParea; 1)  //création entete si nécessaire
//$header:=WP New header($section)
//End if 
////$header:=WP Get header(WParea; 1)  //2ème essai
//$rangeTarget:=WP Text range($header; wk start text; wk end text)
//WP INSERT PICTURE($rangeTarget; vLogo; wk replace)  // pour être aligné sur le texte
//$oPicts:=WP Picture range($rangeTarget)
//WP SET ATTRIBUTES($oPicts; wk width; "160px"; wk height; "135px")  //redim : 25%

//C_OBJECT($footer)
//$footer:=WP Get footer(WParea; 1)
//If ($footer=Null)
//$section:=WP Get section(WParea; 1)
//$footer:=WP New footer($section)
//End if 
//$rangeTarget:=WP Text range($footer; wk start text; wk end text)
//$xx:=WP New(vPiedPage)
//WP INSERT DOCUMENT($footer; $xx; wk replace)

//WParea:=WP Import document($ccc_Chemin_Accès)  //fsch

//WPArea:=WP New($xxx_Texte_)  //fsch

//OBJECT SET ENABLED(WParea; False)  //fsch



