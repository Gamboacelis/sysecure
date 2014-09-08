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

    case 'enviarDatosParentesco':
        
         enviarDatosParentesco();         

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

    $direccion = $_POST["direccion"];

    $correo = $_POST["correo"];
    
    $parentesco = $_POST["parentesco"];     

    $codeImage = $_POST["codeImage"]; 




    $sql = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_TELEFONO,VIS_CEDULA, VIS_DIRECCION,VIS_CORREO,VIS_ESTADO,PAR_COD)VALUES

            ('$nombre','$apellido','$telefono','$cedula','$direccion','$correo','A',$parentesco);";

    $val = $dbmysql->query($sql);

    $id = $dbmysql->maxid('VIS_COD','sys_visitante'); 

   if ($val) {


    if($codeImage != "")
    {    
        saveImage($codeImage,$id);
    }    

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


    $direccion = $_POST["direccion"];

    $correo = $_POST["correo"];   

    $parentesco = $_POST["parentesco"];    

    $codeImage = $_POST["codeImage"];



    $sql = "UPDATE `sys_visitante` SET 

                VIS_NOMBRE    = '$nombre',

                VIS_APELLIDO  = '$apellido',

                VIS_TELEFONO   = '$telefono',

                VIS_CEDULA    = '$cedula',

          

                VIS_DIRECCION   = '$direccion',

                VIS_CORREO    = '$correo',

                PAR_COD =  $parentesco




            WHERE VIS_COD=$codigo;";



    $val = $dbmysql->query($sql);

    

   if ($val) {

        if($codeImage != "")
        {    
            saveImage($codeImage,$codigo);
        }    

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

function saveImage($base64img,$id){
    define('UPLOAD_DIR', '../../uploads/imagenes/visitante/');
    $base64img = str_replace('data:image/jpeg;base64,', '', $base64img);
    $data = base64_decode($base64img);
    $file = UPLOAD_DIR . $id .'.jpg';
    file_put_contents($file, $data);
}

function enviarDatosParentesco() {

    global $dbmysql;

    $visitante = $_POST['visitante'];



    $sql = "SELECT * FROM `sys_parentesco`";

    $val = $dbmysql->query($sql);

    $retval = '';



    $sqlPariente = "SELECT  PAR_COD FROM `sys_visitante` WHERE VIS_COD = $visitante";

    $valPariente = $dbmysql->query($sqlPariente);

    $rowPariente = $valPariente->fetch_object();

    if ($visitante == 0 )
    {
        $codigoPariente = "";
    }
    else
    {
        $codigoPariente = $rowPariente->PAR_COD;
    }
    
    while ($row = $val->fetch_object()) {

            if($row->PAR_COD == $codigoPariente )
            {
                $selected = 'selected';
            }
            else
            {
                $selected = '';
            }

            $retval.='<option value="' . $row->PAR_COD . '"  '.$selected.'>' . $row->PAR_DESCRIPCION . '</option>';
    }

    echo $retval;
}

