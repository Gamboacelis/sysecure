<?php

header("Content-type: application/vnd.ms-excel; name='excel'");
header("Content-Disposition: filename=".$_GET['nombre_archivo']."_".date('Y-m-d').".xls");
header("Pragma: no-cache");
header("Expires: 0");
$dados_recebido = iconv('utf-8','iso-8859-1',$_POST['datos_a_enviar']);
echo $dados_recebido;