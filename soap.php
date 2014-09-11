<?php
$client = new SoapClient('http://webservice01.registrocivil.gob.ec:9763/services/WS_MJUSTICIA_BCEDULA_INTDB_DES_RUN?wsdl');
$result = $client->runJob('1720985066');
var_dump($result);