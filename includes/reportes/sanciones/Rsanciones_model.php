<?php

session_start();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'reporteSancion':
        reporteSancion();
        break;
}

function reporteSancion() {
    global $dbmysql;
    $fdesde = $_POST['fdesde'];
    $fhasta = $_POST['fhasta'];
    $mesInicio=01;
    $mesFin=date('m');
    $anio=date('Y');
    
    $lista = array(
        "MES_INICIO" => $mesInicio,
        "MES_FIN" => $mesFin,
        "ANIO" => $anio,
        "items" => array());
    echo $sql = "SELECT COUNT(sa.VSA_FECHA_INI) AS contador,YEAR(sa.VSA_FECHA_INI) AS ano,MONTH(sa.VSA_FECHA_INI) AS mes
            FROM `sys_vw_sanciones` sa 
            WHERE VSA_FECHA_INI BETWEEN '$fdesde' AND '$fhasta'
            GROUP BY YEAR(sa.VSA_FECHA_INI), MONTH(sa.VSA_FECHA_INI)
            ORDER BY YEAR(sa.VSA_FECHA_INI), MONTH(sa.VSA_FECHA_INI) ASC;";
    $val = $dbmysql->query($sql);
    while ($row = $val->fetch_object()){
        $lista['items'][] =array(
            "MES" => $row->mes,
            "ANO" => $row->ano,
            "CONTADOR" => $row->contador,
        );
    }
    print_r($lista);
    echo $encode = json_encode($lista);
}