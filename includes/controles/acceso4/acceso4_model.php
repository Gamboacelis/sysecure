<?php

session_start();
include_once '../../generales.php';
$clGeneral = new general();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'intervalo':
        intervalo();
        break;

    case 'bloquearAceeso3':
        bloquearAceeso3();
        break;
}

function intervalo() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $hora=date('H:i');
    //CONSULTA DE HORA INGRESO Y SALIDA Y CALCULO DE TIEMPO TRANSCURRIDO
    $sql2 = "SELECT VISG_COD,VISG_FECHA,HOR_COD,VISG_HORA_INGRESO,VISG_HORA_SALIDA FROM `sys_visitas` WHERE VISG_COD=$codigo;";
    $val2 = $dbmysql->query($sql2);
    $row = $val2->fetch_object();
    $hora_entrada=date ('H:i',strtotime($row->VISG_HORA_INGRESO));
    $hora_salida=date ('H:i',strtotime($row->VISG_HORA_SALIDA));
    $tiempoTrans = (strtotime($hora) - strtotime($hora_entrada))/60;
    //CONSULTA TIMEPO TOTAL DEL HORARIO EN MINUTOS
    $sql3 = "SELECT * FROM `sys_horarios` WHERE HOR_COD=$row->HOR_COD;";
    $val3 = $dbmysql->query($sql3);
    $row3 = $val3->fetch_object();
    $horario_ingreso=$row3->HOR_HORA_ING;
    $horario_salida=$row3->HOR_HORA_SAL;
    $tiempoTotal = (strtotime($horario_salida) - strtotime($hora_entrada))/60;
    
    echo $tiempoFinal=($tiempoTrans*100)/$tiempoTotal;
    
    
    
    
    
    
    
//    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$fecha','A');";
//    $val2 = $dbmysql->query($sql2);
//    if ($val2) {echo 1;} else {echo 0;}
}

function bloquearAceeso3() {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codigo'];
    $codVisitante = $_POST['visitante'];
    $descripcionBloqueo = $_POST['razon'];
    $usuario=$_SESSION["user_id"];
    $sql1="INSERT INTO `sys_visitante_sancion` (
            `VIS_COD` ,
            `SAN_COD` ,
            `USU_COD` ,
            `VSA_NOTA`,
            `VSA_FECHA_INI`
            )VALUES ('$codVisitante', 1,'$usuario', '$descripcionBloqueo'.'$fecha');";
    $val1 = $dbmysql->query($sql1);
    
    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$fecha','S');";
    $val2 = $dbmysql->query($sql2);

    $sql3 = "UPDATE `sys_visitante` SET `VIS_ESTADO` ='S' WHERE VIS_COD=$codVisitante;";
    $val3 = $dbmysql->query($sql3);
    if ($val2 and $val2 and $val3) {echo 1;} else {echo 0;}
}
