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
    case 'permitirAccesoFuncionario3':
        permitirAccesoFuncionario3();
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
    $centro=$_SESSION["usu_centro_cod"];
    $sql3 = "UPDATE `sys_control` SET `CON_ESTADO` = 'S' WHERE `CON_COD` = ".$codControl;
    $val3 = $dbmysql->query($sql3);
    $horaSal=$clGeneral->obtenerHorarioxCod($horario)->fetch_object();
    $sql1 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`HOR_COD`,`CON_FECHA` ,`CON_ESTADO`)VALUES ('3', '$codVisita','$horario','$fecha','A');";
    $val1 = $dbmysql->query($sql1);
    
    //CREA REGISTRO VISITA
    $poscedula= explode('/',obtenerPosicioncedula());
    $sql2 = "INSERT INTO `sys_visitas` (`PPL_COD`,CEN_COD,`VIP_COD` ,`HOR_COD`,`VISG_FECHA`,`VISG_HORA_INGRESO`,`VISG_HORA_SALIDA`,`VISG_POSCHAR`,`VISG_POSNUM`,`VISG_ESTADO`)
                                VALUES ('$codPpl', $centro,'$codVisita','$horario','$fecha','$horaIng','$horaSal->HOR_HORA_SAL','$poscedula[0]','$poscedula[1]','A');";
    $val2 = $dbmysql->query($sql2);
    if ($val1 and $val2 and $val3) {
        $sql_Visita="SELECT `sys_visitas`.*, sys_visitante_ppl.*,sys_visitante.*,sys_ppl.*,sys_horarios.*,sys_tipovisita.*,sys_pabellones.* 
                        FROM `sys_visitas`, sys_visitante_ppl,sys_visitante,sys_ppl,sys_horarios,sys_tipovisita,sys_pabellones 
                        WHERE
                        `sys_visitas`.`VIP_COD`=sys_visitante_ppl.`VIP_COD` AND
                        sys_visitante.`VIS_COD`=sys_visitante_ppl.`VIS_COD` AND
                        sys_ppl.`PPL_COD`=sys_visitante_ppl.`PPL_COD` AND
                        sys_horarios.`HOR_COD`=`sys_visitas`.`HOR_COD` AND
                        sys_tipovisita.TPV_COD=sys_horarios.TPV_COD AND
                        sys_pabellones.PAB_COD=sys_horarios.PAB_COD AND
                        `sys_visitas`.`PPL_COD`= $codPpl AND
                        `sys_visitas`.`CEN_COD`= $centro AND
                        `sys_visitas`.`VIP_COD`= $codVisita AND
                        `sys_visitas`.`HOR_COD`= $horario";
        $val_Visita = $dbmysql->query($sql_Visita);
        $row_Visita = $val_Visita->fetch_object();
        $nombrePPl=$row_Visita->PPL_NOMBRE.' '.$row_Visita->PPL_APELLIDO;
        $nombreVisitante=$row_Visita->VIS_NOMBRE.' '.$row_Visita->VIS_APELLIDO;
        $lista=array(
                    "codigoPabellon"=>$row_Visita->PAB_COD,
                    "nombrePabellon"=>$row_Visita->PAB_DESCRIPCION,
                    "horaEntrada"=>$row_Visita->HOR_HORA_ING,
                    "horaSalida"=>$row_Visita->HOR_HORA_SAL,
                    "codigoCentro"=>$row_Visita->CEN_COD,
                    "centroPabellon"=>$row_Visita->CEN_COD.'-'.$row_Visita->PAB_COD,
                    "codigoHorario"=>$row_Visita->HOR_COD,
                    "nombreHorario"=>$row_Visita->HOR_DESCRIPCION,
                    "tipoVisita"=>$row_Visita->TPV_DESCRIPCION,
                    "codigoPpl"=>$row_Visita->PPL_COD,
                    "nombrePpl"=>$nombrePPl,
                    "fotoPpl"=>($row_Visita->PPL_IMG!='')?$row_Visita->PPL_IMG:'../../img/avatars/male.png',
                    "codigoVisitante"=>$row_Visita->VIS_COD,
                    "nombreVisitante"=>$nombreVisitante,
                    "fotoVisitante"=>($row_Visita->VIS_IMAGEN!='')?$row_Visita->VIS_IMAGEN:'../../img/avatars/male.png',
                    "ubicaCedula"=>$poscedula[0].$poscedula[1]
        );
        echo json_encode($lista);
        
    } else {echo 0;}
}

function permitirAccesoFuncionario3() {
    global $dbmysql,$clGeneral;
    $fecha = date('Y-m-d'); 
    $codVisita = $_POST['visCod'];
    $horaIng=date('H:i');
    $centro=$_SESSION["usu_centro_cod"];
    $poscedula= explode('/',obtenerPosicioncedula());
    $sql3 = "UPDATE `sys_visitas_funcionarios` SET
                `VSF_FECHA` = '$fecha', 
                `VSF_HORA_ING` = '$horaIng', 
                `VSF_POSCHAR` = '$poscedula[0]', 
                `VSF_POSINT` = '$poscedula[1]',
                `VSF_ESTADO` = 'A'
            WHERE `VSF_COD` = ".$codVisita;
    $val3 = $dbmysql->query($sql3);
    if ($val3) {
        echo 1;
    } else {echo 0;}
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
    $descripcionBloqueo = strtoupper($_POST['razon']);
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
