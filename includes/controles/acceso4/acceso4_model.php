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
    case 'traerdatosFin':
        traerdatosFin();
        break;
    case 'finVisita':
        finVisita();
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
    
    $tiempoFinal=($tiempoTrans*100)/$tiempoTotal;
    echo $tp=($tiempoFinal>=100)?100:$tiempoFinal;
}

function traerdatosFin(){
    global $dbmysql,$clGeneral;
    $codVisita = $_POST['visCod'];
    
    $hora=date('H:i');
    $sql = "SELECT v.*,vp.*,vis.*,p.* FROM `sys_visitas` v, sys_visitante_ppl vp, sys_visitante vis, sys_ppl p WHERE vp.`VIP_COD`=v.`VIP_COD` AND vp.VIS_COD=vis.VIS_COD AND p.`PPL_COD`=v.`PPL_COD` AND v.`VISG_COD`=$codVisita;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        $row = $val->fetch_object();
        $te = (strtotime($hora) - strtotime($row->VISG_HORA_SALIDA))/60;
        $tiempoExceso = ($te<0)?0:$te;
        $tiempoPermitidoEx=$clGeneral->obtenerValorParametro(4);
        
        $horaIng=explode(':',$row->VISG_HORA_INGRESO);
        $horaIngreso = DateTime::createFromFormat('H:i',$horaIng[0].':'.$horaIng[1] );
        $horaIngreso=$horaIngreso->format('H:i');
//        print_r($horaIngreso); 
        $tt = ((strtotime($hora) - strtotime($horaIngreso))/60)/60;
        $timepotrans =transformarTiempo($tt);
        $mensaje=($tiempoExceso>$tiempoPermitidoEx)?'<p class="text-danger">Visitante Sancionado Excedio: '.$tiempoExceso.' minutos</p>':'<p class="text-success">Visitante Habilitado</p>';
        $sancionado=($tiempoExceso>$tiempoPermitidoEx)?0:1;
        $lista['datosVisita'] = array(
        "VISG_COD"              => $row->VISG_COD,
        "VISG_FECHA"            => $row->VISG_FECHA,
        "VISG_HORA_INGRESO"     => $horaIngreso,
        "VISG_HORA_SALIDA"      => $hora,
        "VISG_TRANSCURRIDO"     => $timepotrans,
        "VISG_POSCHAR"          => $row->VISG_POSCHAR,
        "VISG_POSNUM"           => $row->VISG_POSNUM,
        "VISG_ESTADO"           => $row->VISG_ESTADO,
        "VISG_MENSAJE"          => $mensaje,
        "VISG_SANCION"          => $sancionado,
        "VISG_EXCESO"           => $tiempoExceso,
        "PPL_COD"               => $row->PPL_COD,
        "PAB_COD"               => $row->PAB_COD,
        "PPL_NOMBRE"            => $row->PPL_NOMBRE,
        "PPL_APELLIDO"          => $row->PPL_APELLIDO,
        "PPL_IMG"               => $row->PPL_IMG,
        "VIS_COD"               => $row->VIS_COD,
        "VIS_NOMBRE"            => $row->VIS_NOMBRE,
        "VIS_APELLIDO"          => $row->VIS_APELLIDO,
        "VIS_CEDULA"            => $row->VIS_CEDULA,
        "VIS_IMAGEN"            => $row->VIS_IMAGEN,
        "VIS_ESTADO"            => $row->VIS_ESTADO
    );

    echo $encode = json_encode($lista);
        
    }

}
function transformarTiempo($tt){
    $val=number_format($tt,2);
    $x=  explode('.', $val);
    if($x[1]==60){
        $hora=$x[0]+1;
        $minutos='00';
    }elseif($x[1]>60){
        $hora=$x[0]+1;
        $minutos=$x[1]-60;
    }elseif($x[1]<60){
        $hora=$x[0];
        $minutos=$x[1];
    }
    $horaI = DateTime::createFromFormat('H:i',$hora.':'.$minutos);
    $horafin=$horaI->format('H:i');
    return $horafin;
}
function finVisita() {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita=$_POST['codVisita'];
    $codVisitante=$_POST['codVisitante'];
    $sancion=$$_POST['sancion'];
    $transcurrido=$_POST['transcurrido'].':00';
    $exceso=$_POST['exceso'];
    $usuario=$_SESSION["user_id"];
    $descripcionBloqueo='Demora en salir de la visita: '.$exceso.' minutos de Exceso...';
    $sql1="UPDATE `sys_visitas` SET `VISG_TRANSCURRIDO` = '$transcurrido', `VISG_ESTADO` = 'T' WHERE `VISG_COD` = $codVisita;";
    $val1 = $dbmysql->query($sql1);
    if($sancion==0){
        $sql2="INSERT INTO `sys_visitante_sancion` (
                `VIS_COD` ,
                `SAN_COD` ,
                `USU_COD` ,
                `VSA_NOTA`,
                `VSA_FECHA_INI`
                )VALUES ('$codVisitante', 1,'$usuario', '$descripcionBloqueo','$fecha');";
        $val2 = $dbmysql->query($sql2);
        $sql3 = "UPDATE `sys_visitante` SET `VIS_ESTADO` ='S' WHERE VIS_COD=$codVisitante;";
        $val3 = $dbmysql->query($sql3);
    }
    if ($val1 && $val2 && $val3) {echo 1;} else {echo 0;}
}
