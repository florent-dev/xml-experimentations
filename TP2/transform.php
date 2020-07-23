<?php
// parse the xsl stylesheet

$file = 1;

if (isset($_GET['id']) && !empty($_GET['id'])) {
    switch ($_GET['id']) {
        case 1:
        case 'partie1':
        case 'partie1.xsl':
            $file = 1; break;
        case 2:
        case 'partie2':
        case 'partie2.xsl':
            $file = 2; break;
        case 3:
        case 'partie3':
        case 'partie3.xsl':
            $file = 3; break;
    }
}

$xsty = new DOMDocument();
$xsty->load('partie'.$file.'.xsl');

// create the xslt tranformer object

$xslt = new XSLTProcessor(); 
$xslt->setSecurityPrefs(0);
$xslt->importStylesheet($xsty); 


// parse the source xml;
$xsource = new DOMDocument();
$xsource->load('countries.xml');

//transformation
$result = $xslt->transformToXML($xsource);     
echo $result;

?>
