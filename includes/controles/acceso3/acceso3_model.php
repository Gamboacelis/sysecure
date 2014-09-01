<?php

session_start();
include_once '../../generales.php';
$clGeneral = new general();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'permitirAcceso2':
        permitirAcceso3();
        break;
    
    case 'bloquearAceeso3':
        bloquearAceeso3();
        break;

}

function permitirAcceso3() {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codigo'];

    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$fecha','A');";
    $val2 = $dbmysql->query($sql2);
    if ($val2) {
        echo 1;
    } else {
        echo 0;
    }

}


function bloquearAceeso3()
{
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codigo'];
    $codVisitante = $_POST['visitante'];    
    $descripcionBloqueo = $_POST['razon'];
    
    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$fecha','B');";
    $val2 = $dbmysql->query($sql2);
    
    $sql3 = "INSERT INTO `sys_sanciones` (`TPS_COD` ,`SAN_DESCRIPCION` ,`SAN_TIEMPO`,`COD_VIS`)VALUES (1, '$descripcionBloqueo','$fecha',$codVisitante);";
    $val3 = $dbmysql->query($sql3);  
    
    
    if ($val2 and $val3 ) {
        echo 1;
    } else {
        echo 0;
    }
     
    

}
