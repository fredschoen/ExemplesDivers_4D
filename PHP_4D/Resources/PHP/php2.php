<?php
    //
    function genererPdfa($pdf, $facturxXml) {
        //include_once '../vendor/autoload.php';
        include_once 'vendor/autoload.php';
        
        $facturx = new Facturx();
        $facturxPdf = $facturx->generateFacturxFromFiles($pdf, $facturxXml);
        
        return $facturxPdf;
    }
?>
