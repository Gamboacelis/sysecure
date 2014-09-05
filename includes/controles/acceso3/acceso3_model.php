<?php

session_start();
include_once '../../generales.php';
$clGeneral = new general();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'permitirAcceso3':
        permitirAcceso3();
        break;

    case 'bloquearAceeso3':
        bloquearAceeso3();
        break;
}

function permitirAcceso3() {
    global $dbmysql,$clGeneral;
    $fecha = date('Y-m-d'); 
    $codVisita = $_POST['vipcontrol'];
    $codPpl=$_POST['pplcod'];
    $codControl=$_POST['codControl'];
    $horario=$_POST['horario'];
    $horaIng=date('H:i');
    $sql3 = "UPDATE `sys_control` SET `CON_ESTADO` = 'S' WHERE `CON_COD` = ".$codControl;
    $val3 = $dbmysql->query($sql3);
    $horaSal=$clGeneral->obtenerHorarioxCod($horario)->fetch_object();
    $sql1 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`HOR_COD`,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$horario','$fecha','A');";
    $val1 = $dbmysql->query($sql1);
    //CREA REGISTRO VISITA
    $poscedula= explode('/',obtenerPosicioncedula());
    $sql2 = "INSERT INTO `sys_visitas` (`PPL_COD`,`VIP_COD` ,`HOR_COD`,`VISG_FECHA`,`VISG_HORA_INGRESO`,`VISG_HORA_SALIDA`,`VISG_POSCHAR`,`VISG_POSNUM`,`VISG_ESTADO`)
                                VALUES ('$codPpl', '$codVisita','$horario','$fecha','$horaIng','$horaSal->HOR_HORA_SAL','$poscedula[0]','$poscedula[1]','A');";
    $val2 = $dbmysql->query($sql2);
    if ($val1 and $val2 and $val3) {echo 1;} else {echo 0;}
}

function obtenerPosicioncedula(){
    global $dbmysql,$clGeneral;
    $fecha = date('Y-m-d');
    //Consulta Maximo del Literal
    $sql2 = "SELECT MAX(`VISG_POSCHAR`) AS MAXLITERAL FROM `sys_visitas` WHERE `VISG_FECHA` ='$fecha' AND `VISG_ESTADO` ='A';";
    $val2 = $dbmysql->query($sql2);
    $row = $val2->fetch_object();
    $maxLiteral=($row->MAXLITERAL!== null)?$row->MAXLITERAL:'A';
    //Consulta Maximo del Secuencial
    $sql2 = "SELECT MAX(`VISG_POSCHAR`) AS MAXLITERAL,MAX(`VISG_POSNUM`) AS MAXSECUENCIAL FROM `sys_visitas` WHERE `VISG_FECHA` ='$fecha' AND VISG_POSCHAR = '$maxLiteral' AND `VISG_ESTADO` ='A';";
    $val2 = $dbmysql->query($sql2);
    $row = $val2->fetch_object();
    $maxSecuencial=($row->MAXSECUENCIAL!== null)?$row->MAXSECUENCIAL:1;
    ////******************************************/////
    $valParametro=$clGeneral->obtenerValorParametro(3); //Obtiene el Valor del Parametro 3 (ACCESO 3)
    if($maxSecuencial==$valParametro){
        $maxSecuencial=1;
        $maxLiteral=($maxLiteral=='Z')?$maxLiteral='A':++$maxLiteral;
    }else{
        $maxSecuencial=($row->MAXSECUENCIAL == null)?$maxSecuencial:$maxSecuencial+1;
    }
    return $maxLiteral.'/'.$maxSecuencial;
        
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
            )VALUES ('$codVisitante', 1,'$usuario', '$descripcionBloqueo','$fecha');";
    $val1 = $dbmysql->query($sql1);
    
    $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$fecha','S');";
    $val2 = $dbmysql->query($sql2);

    $sql3 = "UPDATE `sys_visitante` SET `VIS_ESTADO` ='S' WHERE VIS_COD=$codVisitante;";
    $val3 = $dbmysql->query($sql3);
    if ($val2 and $val2 and $val3) {echo 1;} else {echo 0;}
}
