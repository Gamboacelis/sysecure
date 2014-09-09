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
    case 'guardaDatosTipoSancion':

        guardaDatosTipoSancion();

        break;
    case 'editaDatosTipoSancion':

        editaDatosTipoSancion();

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


function guardaDatosTipoSancion()
{
    global $dbmysql;

    $tipoSancion = $_POST["tipoSancion"];

    $sql = "INSERT INTO `sys_tipo_sancion`(TPS_DESCRIPCION) VALUES ('$tipoSancion');";

    $val = $dbmysql->query($sql);

    if ($val) {

        echo 1;

    } else {

        echo 0;

    }    
}


function editaDatosTipoSancion()
{
    global $dbmysql;

    $IDtipoSancion = $_POST['IDtipoSancion'];

    $tipoSancion = $_POST["tipoSancion"];

   
    $sql = "UPDATE `sys_tipo_sancion` SET 

                TPS_DESCRIPCION    = '$tipoSancion'

            WHERE TPS_COD = $IDtipoSancion;";



    $val = $dbmysql->query($sql);

    if ($val) {


        echo 1;

    } else {

        echo 0;

    }  
      
}

