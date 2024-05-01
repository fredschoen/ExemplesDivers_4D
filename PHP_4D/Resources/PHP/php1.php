<?php
    //
    function versionPHP() {
        $r = phpversion();
        return $r;
    }
    //
    function helloWord($p1, $p2) {
        $r= $p1 . ' cccc'. $p2;
        return $r;
    }
    //
    function getContents($p1) {
        //$r=$p1;
        //$r = file_get_contents('https://www.google.fr/');
        $r = file_get_contents($p1);
        return $r;
    }
    //
    function inclure() {
      include 'x/php0.php';
      //$r='xxx';
      return $r;
    }


    function encode() {
        $r = quoted_printable_encode('Möchten Sie ein paar Äpfel?');
        return $r;
      }
  

      function decode() {
        $r = quoted_printable_decode('M=C3=B6chten Sie ein paar =C3=84pfel?');
        return $r;
      }
  
?>
