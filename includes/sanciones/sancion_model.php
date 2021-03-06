<?php



session_start();

include_once '../conexiones/db_local.inc.php';

$dbmysql = new database();

date_default_timezone_set('America/Bogota');

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';

switch ($funcion) {

    case 'enviarDatosSanciones':

        enviarDatosSanciones();

        break;

    case 'guardarDatosSanciones':

        guardarDatosSanciones();

        break;   
    case 'enviarDatosTipoSanciones':

        enviarDatosTipoSanciones();

        break;   

    case 'enviarDatosTiempo':

        enviarDatosTiempo();

        break;  
        
    case 'eliminarSancion':

        eliminarSancion();

        break;     

}

function enviarDatosTipoSanciones() {

    global $dbmysql;


    $sql = "SELECT * FROM `sys_tipo_sancion` WHERE TPS_COD != 1";

    $val = $dbmysql->query($sql);

    $retval = '';
    
    while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->TPS_COD . '">' . $row->TPS_DESCRIPCION . '</option>';
    }

    echo $retval;
}

function enviarDatosSanciones() {

    global $dbmysql;

    $tipo_sancion = $_POST['tipo_sancion'];
    $sql = "SELECT * FROM `sys_sanciones` WHERE SAN_COD != 1 AND TPS_COD = $tipo_sancion";

    $val = $dbmysql->query($sql);

    $retval = '';
    
    while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->SAN_COD . '">' . $row->SAN_DESCRIPCION . '</option>';
    }

    echo $retval;
}

function  enviarDatosTiempo(){
    global $dbmysql;

    $sancion = $_POST['sancion'];
    $sql = "SELECT * FROM `sys_sanciones` WHERE  SAN_COD = $sancion";

    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();

    $retval = $row->SAN_TIEMPO.' '. $row->SAN_TIEMPO_DES;
    
    echo $retval;
}

function guardarDatosSanciones() {

    global $dbmysql;

    $sancion = strtoupper($_POST["sancionItem"]);
    $IDvisitante = $_POST["IDvisitante"];
    $IDsancion = $_POST["IDsancion"]; 

    $sql_dias = "SELECT SAN_TIEMPO FROM `sys_sanciones` WHERE SAN_COD = ".$sancion;
    $val = $dbmysql->query($sql_dias);
    $row = $val->fetch_object();
    $dias_sancion =  $row->SAN_TIEMPO;

    $sql_fecha_inicio = "SELECT VSA_FECHA_INI FROM `sys_visitante_sancion` WHERE VSA_COD = ".$IDsancion;
    $val1 = $dbmysql->query($sql_fecha_inicio);
    $row1 = $val1->fetch_object();
    $fecha_inicio =  $row1->VSA_FECHA_INI;

    $fecha = date('Y-m-d',strtotime($fecha_inicio) + (24*3600*$dias_sancion));

    $sql = "UPDATE `sys_visitante_sancion` SET 
                VSA_FECHA_FIN    = '$fecha', SAN_COD = $sancion
            WHERE VSA_COD=$IDsancion;";
    $val = $dbmysql->query($sql);
    if ($val) {echo 1;} else {echo 0;}    
}

function eliminarSancion()
{
    global $dbmysql;
    $IDvisitante = $_POST["IDvisitante"];
    $sql = "UPDATE `sys_visitante` SET VIS_ESTADO = 'A'  WHERE VIS_COD=$IDvisitante;";
    $val = $dbmysql->query($sql);
    if ($val) {echo 1;} else {echo 0;}    

}


