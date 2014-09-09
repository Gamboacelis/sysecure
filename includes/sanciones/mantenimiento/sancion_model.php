<?php



session_start();

include_once '../../conexiones/db_local.inc.php';

$dbmysql = new database();

date_default_timezone_set('America/Bogota');

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';

switch ($funcion) {

    case 'enviarDatosTipoSanciones':

        enviarDatosTipoSanciones();

        break;

   

}

function enviarDatosTipoSanciones() {

    global $dbmysql;

    $codigoTipoSancion = $_POST['codigoTipoSancion'];

    $sql = "SELECT * FROM `sys_tipo_sancion` WHERE TPS_COD = $codigoTipoSancion";

    $val = $dbmysql->query($sql);
     $row = $val->fetch_object();

    $listaTipoSancion['datosTipoSancion'] = array(

        "TPS_COD" => $row->TPS_COD,

        "TPS_DESCRIPCION" => $row->TPS_DESCRIPCION,

    );

    echo $encode = json_encode($listaTipoSancion);
}



