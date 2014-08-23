<?php



session_start();

include_once '../conexiones/db_local.inc.php';

$dbmysql = new database();

date_default_timezone_set('America/Bogota');

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';

switch ($funcion) {

    case 'enviarDatosVisitante':

        enviarDatosVisitante();

        break;

    case 'guardaDatosVisitante':

        guardaDatosVisitante();

        break;   

    case 'actualizarDatosVisitante':

        actualizarDatosVisitante();

        break;       

    case 'eliminarVisitante':
        
         eliminarVisitante();         

         break;
 


}



function enviarDatosVisitante() {

    global $dbmysql;

    $idpro = $_POST['codigoVis'];

    $sql = "SELECT * FROM `sys_visitante` WHERE VIS_COD =$idpro";

    $val = $dbmysql->query($sql);

    $row = $val->fetch_object();

    $lista['datosVisitante'] = array(

        "VIS_COD" => $row->VIS_COD,

        "VIS_NOMBRE" => $row->VIS_NOMBRE,

        "VIS_APELLIDO" => $row->VIS_APELLIDO,

        "VIS_CEDULA" => $row->VIS_CEDULA,

        "VIS_HUELLA" => $row->VIS_HUELLA,

        "VIS_DIRECCION" => $row->VIS_DIRECCION,

        "VIS_TELEFONO" => $row->VIS_TELEFONO,

        "VIS_CORREO" => $row->VIS_CORREO

    );



    echo $encode = json_encode($lista);

}


function guardaDatosVisitante() {

    global $dbmysql;

    $nombre = $_POST["nombre"];

    $apellido = $_POST["apellido"];

    $telefono = $_POST["telefono"];

    $cedula = $_POST["cedula"];

    $huella = $_POST["huella"];

    $direccion = $_POST["direccion"];

    $correo = $_POST["correo"];    



    $sql = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_TELEFONO,VIS_CEDULA, VIS_HUELLA,VIS_DIRECCION,VIS_CORREO)VALUES

            ('$nombre','$apellido','$telefono','$cedula');";

    $val = $dbmysql->query($sql);

   if ($val) {

    echo 1;

    } else {

        echo 0;

    }

  
}


function actualizarDatosVisitante() {

    global $dbmysql;

    $codigo = $_POST['IDvisitante'];

    $nombre = $_POST["nombre"];

    $apellido = $_POST["apellido"];

    $telefono = $_POST["telefono"];

    $cedula = $_POST["cedula"];

    $huella = $_POST["huella"];

    $direccion = $_POST["direccion"];

    $correo = $_POST["correo"];    



    $sql = "UPDATE `sys_visitante` SET 

                VIS_NOMBRE    = '$nombre',

                VIS_APELLIDO  = '$apellido',

                VIS_TELEFONO   = '$telefono',

                VIS_CEDULA    = '$cedula',

                VIS_HUELLA  = '$huella',

                VIS_DIRECCION   = '$direccion',

                VIS_CORREO    = '$correo'




            WHERE VIS_COD=$codigo;";



    $val = $dbmysql->query($sql);

   if ($val) {

        echo 1;

    } else {

        echo 0;

    }

}


function eliminarVisitante()
{

    global $dbmysql;

    $codigo = $_POST['codigo'];

    $sql = "UPDATE `sys_visitante` SET 

            VIS_ESTADO   = 'E'

        WHERE VIS_COD=$codigo";



    $val = $dbmysql->query($sql);

   if ($val) {

        echo 1;

    } else {

        echo 0;

    }

}