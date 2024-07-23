//%attributes = {}
// -----------------------------------------------------------------
// Creer_email
// -----------------------------------------------------------------
// 23/07/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------

$email_o.from:=vMonMail  //fsch
$email_o.to:=vFourniMail_BonCde  //fsch
$email_o.cc:=vCC  //fsch
$email_o.bcc:=vMonMail2  //fsch
$email_o.comments:="Mail envoyé de manière automatique"  //fsch
$email_o.subject:=vMessageObjet  //fsch
$email_o.htmlBody:=vMessage  //fsch
$email_o.attachments:=New collection(MAIL New attachment($pdfpath))  //fsch
$server_o.host:="smtp.xxxx.com"
$server_o.user:="frederic@coucou.fr"
$server_o.password:="xxxx"
$email_o.from:="frederic@coucou.fr"
$email_o.to:="frederic@coucou.fr"
$email_o.cc:=""
$email_o.bcc:=""
$transporter_o:=SMTP New transporter($server_o)
$status_o:=$transporter_o.send($email_o)

