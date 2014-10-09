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

function reporteVisitas() {
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
    $sql = "SELECT vi.`VISG_COD`, vi.`VISG_FECHA`, vi.`VISG_HORA_INGRESO`, vi.`VISG_HORA_SALIDA` ,v.`VIS_COD`, v.`VIS_NOMBRE`, v.`VIS_APELLIDO`, v.`VIS_CEDULA`, v.`VIS_ESTADO`, p.`PPL_COD`, p.`PAB_COD`, p. `PPL_NOMBRE`, p.`PPL_APELLIDO`, p.`PPL_CEDULA`, p.`PPL_ESTADO` FROM `sys_visitas` vi , `sys_visitante` v , `sys_ppl` p, `sys_visitante_ppl` vp , `sys_pabellones` pa WHERE vi.`VIP_COD`= vp.`VIP_COD` and v.`VIS_COD` = vp.`VIS_COD` and p.`PPL_COD` = vp.`PPL_COD`and p.`PAB_COD` = pa.`PAB_COD` and vi.`VISG_FECHA` BETWEEN '$fdesde' and '$fhasta' order by vi.`VISG_COD` desc ";
    $val = $dbmysql->query($sql);
    while ($row = $val->fetch_object()){
        $lista['items'][] =array(
            "VISG_COD" => $row->VISG_COD,
            "VISG_FECHA" => $row->VISG_FECHA,
            "VISG_HORA_INGRESO" => $row->VISG_HORA_INGRESO,
            "VISG_HORA_SALIDA" => $row->VISG_HORA_SALIDA,
            "VIS_NOMBRE" => $row->VIS_NOMBRE." ".$row->VIS_APELLIDO,
            "VIS_CEDULA" => $row->VIS_CEDULA,      
            "PAB_COD" => $row->PAB_COD,
            "PPL_NOMBRE" => $row->PPL_NOMBRE." ".$row->PPL_APELLIDO,
            "PPL_CEDULA" => $row->PPL_CEDULA,

        );
    }
    print_r($lista);
    echo $encode = json_encode($lista);
}