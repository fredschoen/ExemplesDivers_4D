//%attributes = {}
//méthode dispo sur le forum 4d. cf. https://discuss.4d.com/t/crc-8-euskadi-ticketbai/10686/4

_calculer_crc_iniTable()

// -----------------------------------------------------------------
// _calculer_crc
// -----------------------------------------------------------------
var $input_b : Blob
var $offset : Integer

TEXT TO BLOB:C554("1"; $input_b; UTF8 text without length:K22:17)  //ici, test sur 1 caractère
$crc:=0x0000  // init le premier résultat du xor
For ($offset; 0; BLOB size:C605($input_b)-1)
	$crc:=table_b{($crc ^| $input_b{$offset})}  // cf. https://docs.4d.com/4Dv18/4D/18.4/Operateurs-sur-les-bits.300-5233276.fe.html
End for 

$crc:=$crc ^| 0x00FF

//exemple fred:
// char(65) = "A"
// 65 = 0x0041 , cf. https://www.rapidtables.org/fr/convert/number/decimal-to-hex.html
// CRC16 de "A" = CRC16 de 0x0041 = 0x30C0 , cf. https://www.lammertbies.nl/comm/info/crc-calculation
// cette méthode donne : 63 en décimal = 0x0037

//exemple EMA:
//1 ; 1 ; 63 ; 1 ; 39 
//SET BLOB SIZE($table_b; 5; 0x0000)
//$input_b{0}:=1
//$input_b{1}:=1
//$input_b{2}:=63  //3F
//$input_b{3}:=1
//$input_b{4}:=39  //27

// entree: 01013F0127
// resultat -> 71;109 = 47;6D

//205 = 00CD
