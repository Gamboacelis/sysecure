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
        permitirAcceso2();
        break;

}

function permitirAcceso2() {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codigo'];
    $codControl = $_POST['control'];
    
    $sql3 = "UPDATE `sys_control` SET `CON_ESTADO` = 'S' WHERE `CON_COD` = ".$codControl;
    $val3 = $dbmysql->query($sql3);

    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('2', '$codVisita','$fecha','A');";
    $val2 = $dbmysql->query($sql2);

    if ($val2) {
        echo 1;
    } else {
        echo 0;
    }

}
