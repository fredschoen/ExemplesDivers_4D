<?php
	$contEntree  = file_get_contents("ContactsNEW.csv");
	$lesLignes = preg_split("/\n\n|\n|\n/", $contEntree);
	$contSortie="";
	$pLigne=0;
     
	foreach ($lesLignes as &$uneLigne) {
		echo $pLigne, "\n";
		$go=($pLigne>0);

		if ($go) {
			$lesColonnes = explode("\t",$uneLigne);
			$go=(count($lesColonnes)>29);
		}

		if ($go) {
			
			$iColonnes=0;
			echo count($lesColonnes), "\n";
			foreach($lesColonnes as $unDetail) {
				
	//			echo "[", $unDetail, "," , substr($unDetail,0,1) , "] ";
				if (substr($unDetail,0,1)=="'") {
					$unDetail= substr($unDetail,1,999);
				}
				echo "[", $unDetail, "] ";
				switch ($iColonnes) {
					case 0:
						$org1=$unDetail;
					case 1:
						$org2=$unDetail;
					case 2:
						$n1=$unDetail;
					case 3:
						$n2=$unDetail;
					case 4:
						$n3=$unDetail;
					case 5:
						$n4=$unDetail;
					case 6:
						$n5=$unDetail;
	//				case 7:
	//					$fnDetail;
					case 8:
						$tCell=$unDetail;
					case 9:
						$tHome=$unDetail;
					case 10:
						$tWork=$unDetail;
					case 11:
						$eHome=$unDetail;
					case 12:
						$eWork=$unDetail;
					case 13:
						$aHm1=$unDetail;
					case 14:
						$aHm2=$unDetail;
					case 15:
						$aHm3=$unDetail;
					case 16:
						$aHm4=$unDetail;
					case 17:
						$aHm5=$unDetail;
					case 18:
						$aHm6=$unDetail;
					case 19:
						$aHm7=$unDetail;
					case 20:
						$aWk1=$unDetail;
					case 21:
						$aWk2=$unDetail;
					case 22:
						$aWk3=$unDetail;
					case 23:
						$aWk4=$unDetail;
					case 24:
						$aWk5=$unDetail;
					case 25:
						$aWk6=$unDetail;
					case 26:
						$aWk7=$unDetail;
					case 27:
						$title=$unDetail;
					case 28:
						$url=$unDetail;
					case 29:
						$note=$unDetail;
				}
				++$iColonnes;
			}

			$contSortie.="BEGIN:VCARD"."\n";
			$contSortie.="VERSION:2.1"."\n";
			$contSortie.="N:".$n3.";".$n1.";".$n2.";;".$n4."\n";
//			$contSortie.="FN:".$n1." ".$n2." ". $n3.", ".$n4."\n";
			$contSortie.="TEL;CELL:".substr( $tCell,1,999)."\n"; //enlever le "t"
			$contSortie.="TEL;HOME:".substr($tHome,1,999)."\n"; //enlever le "t"
			$contSortie.="TEL;WORK:".substr($tWork,1,999)."\n"; //enlever le "t"
			$contSortie.="EMAIL;HOME:".$eHome."\n";
			$contSortie.="EMAIL;WORK:".$eWork."\n";
			$contSortie.="ADR;HOME:".$aHm1.";".$aHm2.";".$aHm3.";".$aHm4.";".$aHm5.";".$aHm6.";".$aHm7."\n";
			$contSortie.="ADR;WORK:".$aWk1.";".$aWk2.";".$aWk3.";".$aWk4.";".$aWk5.";".$aWk6.";".$aWk7."\n";
			$contSortie.="ORG:".$org1.";".$org2."\n";
			$contSortie.="TITLE:".$title."\n";
			$contSortie.="URL:".$url."\n";
			$contSortie.="NOTE:".$note."\n";
			$contSortie.="END:VCARD"."\n";
		}


		echo "\n";
		++$pLigne;

	}

    // création du fichier
    $f = fopen("ContactsNEW.vcf", "w");
    // écriture
    fputs($f, $contSortie );
    // fermeture
    fclose($f);

?>