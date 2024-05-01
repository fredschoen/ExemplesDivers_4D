
<?php
	$contEntree  = file_get_contents("Contacts.vcf");
	$contEntree=quoted_printable_decode($contEntree);
	$contEntree=str_replace(";CHARSET=UTF-8;ENCODING=QUOTED-PRINTABLE","",$contEntree);
	$contEntree=str_replace(";PREF:",":",$contEntree);
	$contEntree=str_replace(";X-INTERNET:",":",$contEntree);
	$contEntree=str_replace(";PREF;X-INTERNET:",":",$contEntree);
	
    // création du fichier
    $f = fopen("Contacts_decode.vcf", "w");
    // écriture
    fputs($f, $contEntree );
    // fermeture
    fclose($f);

	$contEntree=str_replace("\r","",$contEntree);
	$lesLignes = preg_split("/\n\n|\n|\n/", $contEntree);
	$nTrait=0;
	$contSortie="";
	$contSortie.="Org1\tOrg2\t";
	$contSortie.="N1\tN2\tN3\tN4\tN5"."\t";
	$contSortie.="FN\t";
	$contSortie.="tCELL\t";
	$contSortie.="tHOME\t";
	$contSortie.="tWORK\t";
	$contSortie.="eHOME\t";
	$contSortie.="eWORK\t";
	$contSortie.="aHm1\taHm2\taHm3\taHm4\taHm5\taHm6\taHm7\t";
	$contSortie.="aWk1\taWk2\taWk3\taWk4\taWk5\taWk6\taWk7\t";
	$contSortie.="TITLE\t";
	$contSortie.="URL\t";
	$contSortie.="NOTE\t";
	$contSortie.="\n";
     
	foreach ($lesLignes as &$uneLigne) {
    $lesPartiesDeLaLigne = explode(":",$uneLigne);
	$nParties=count($lesPartiesDeLaLigne);
	echo $nParties, "    ";
	//éliminer un ":" dans le "valeur"
	if ($nParties==3) {
		$uneLigne=$lesPartiesDeLaLigne[0].":".$lesPartiesDeLaLigne[1].$lesPartiesDeLaLigne[2];
		$lesPartiesDeLaLigne = explode(":",$uneLigne);
		$nParties=count($lesPartiesDeLaLigne);
	}

	if ($nParties==2) {
		$nomRubrique=$lesPartiesDeLaLigne[0];
		$valRubrique=$lesPartiesDeLaLigne[1];

		switch ($nomRubrique) {
			case "END":
				$contSortie.=$org1."\t".$org2."\t";
				$contSortie.=$n1."\t".$n2."\t".$n3."\t".$n4."\t".$n5."\t";
				$contSortie.=$fn."\t";
				$contSortie.="t".$telCell."\t"; //ne pas avoir de cellule numérique
				$contSortie.="t".$telHome."\t"; //ne pas avoir de cellule numérique
				$contSortie.="t".$telWork."\t"; //ne pas avoir de cellule numérique
				$contSortie.=$eMailHome."\t";
				$contSortie.=$eMailWork."\t";
				$contSortie.=$adrHome1."\t".$adrHome2."\t".$adrHome3."\t".$adrHome4."\t".$adrHome5."\t".$adrHome6."\t".$adrHome7."\t";
				$contSortie.=$adrWork1."\t".$adrWork2."\t".$adrWork3."\t".$adrWork4."\t".$adrWork5."\t".$adrWork6."\t".$adrWork7."\t";
				$contSortie.=$title."\t";
				$contSortie.=$url."\t";
				$contSortie.=$note."\t";
				$contSortie.="\n";
				++$nTrait;
				break;
			case "BEGIN":
				$version="";
				$n1="";
				$n2="";
				$n3="";
				$n4="";
				$n5="";
				$fn="";
				$telCell="";
				$telHome="";
				$telWork="";
				$eMailHome="";
				$eMailWork="";
				$adrHome1="";
				$adrHome2="";
				$adrHome3="";
				$adrHome4="";
				$adrHome5="";
				$adrHome6="";
				$adrHome7="";
				$adrWork1="";
				$adrWork2="";
				$adrWork3="";
				$adrWork4="";
				$adrWork5="";
				$adrWork6="";
				$adrWork7="";
				$version="";
				$org1="";
				$org2="";
				$title="";
				$url="";
				$note="";
				break;
			case "N":
				$lesPartiesDeVal = explode(";",$valRubrique);
				$n1=$lesPartiesDeVal[0];
				$n2=$lesPartiesDeVal[1];
				$n3=$lesPartiesDeVal[2];
				$n4=$lesPartiesDeVal[3];
				$n5=$lesPartiesDeVal[4];
				break;
			case "FN":
				$fn=$valRubrique;
				break;
			case "TEL;CELL":
				$telCell="'".$valRubrique;
				break;
			case "TEL;HOME":
				$telHome="'".$valRubrique;
				break;
			case "TEL;WORK":
				$telWork="'".$valRubrique;
				break;
			case "EMAIL;HOME":
				$eMailHome="'".$valRubrique;
				break;
			case "EMAIL;WORK":
				$eMailWork="'".$valRubrique;
				break;
			case "ADR;HOME":
				$lesPartiesDeVal = explode(";",$valRubrique);
				$adrHome1=$lesPartiesDeVal[0];
				$adrHome2=$lesPartiesDeVal[1];
				$adrHome3=$lesPartiesDeVal[2];
				$adrHome4=$lesPartiesDeVal[3];
				$adrHome5=$lesPartiesDeVal[4];
			$adrHome6=$lesPartiesDeVal[5];
				$adrHome7=$lesPartiesDeVal[6];
				break;
			case "ADR;HOME":
				$lesPartiesDeVal = explode(";",$valRubrique);
				$adrWork1=$lesPartiesDeVal[0];
				$adrWork2=$lesPartiesDeVal[1];
				$adrWork3=$lesPartiesDeVal[2];
				$adrWork4=$lesPartiesDeVal[3];
				$adrWork5=$lesPartiesDeVal[4];
				$adrWork6=$lesPartiesDeVal[5];
				$adrWork7=$lesPartiesDeVal[6];
				break;
			case "ORG":
				$lesPartiesDeVal = explode(";",$valRubrique);
				$org1=$lesPartiesDeVal[0];
				if (count($lesPartiesDeVal)>1) {
					$org2=$lesPartiesDeVal[1];
				}
				break;
			case "TITLE":
				$title="'".$valRubrique;
				break;
			case "URL":
				$url="'".$valRubrique;
				break;
			case "NOTE":
				$note="'".$valRubrique;
				break;
		}
		
		echo  $nomRubrique, " ---> ";
		$lesDetails=explode(";",$valRubrique);
		$nDetails=count($lesDetails);
		foreach($lesDetails as $unDetail) {
			echo "[", $unDetail, "] ";
		}

		echo  "\n";
	}
	else
	{
		echo "xxxxxxxxxxxxxxxxxxxxxxxxx KOKOKOKOKO xxxxxxxxxxxxxxxxxxxxxxxx:",$uneLigne; "\n";
	}
//   print_r($lesPartiesDeLaLigne);

}

//echo $contSortie;

    // création du fichier
    $f = fopen("Contacts.csv", "w");
    // écriture
    fputs($f, $contSortie );
    // fermeture
    fclose($f);

?>
