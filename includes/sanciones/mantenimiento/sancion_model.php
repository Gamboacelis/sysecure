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

    case 'mostrarSanciones':

        mostrarSanciones();

        break;
    case 'guardarEdicionSancion':

        guardarEdicionSancion();

        break;        

    case 'guardarNuevaSanciones':

        guardarNuevaSanciones();

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


function mostrarSanciones()
{

    global $dbmysql;
    $codigoTipoSancion = $_POST["codigoTipoSancion"];
    $retval = '';
    $x = 0;
    $sql = "SELECT * FROM `sys_sanciones` WHERE `TPS_COD` = $codigoTipoSancion ORDER BY SAN_COD DESC;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $x++;
            $retval.='<tr id="sancion' . $row->SAN_COD . '">
                        <td>' . $x . '</td>
                        <td><div class="txtVisDatos" id="txtDescripcionSancion">' . $row->SAN_DESCRIPCION . '</div><input type="text" id="DescripcionSancion" name="DescripcionSancion" class="visDatos" style="width: 180px;" value="' . $row->SAN_DESCRIPCION . '"></td>
                        <td><div class="txtVisDatos" id="txtTiempoSancion">' . $row->SAN_TIEMPO . '</div><input type="text" id="TiempoSancion" name="TiempoSancion" class="visDatos"  value="' . $row->SAN_TIEMPO . '"></td>
                        <td><a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambio" href="javascript:GuardarCambioSancion(' . $row->SAN_COD . ')">
                                <i class="fa fa-save"></i>
                            </a>
                            <a class="btn btn-success btn-xs visBtnDatos" title="Editar Sancion" href="javascript:editarSancion(' . $row->SAN_COD . ')">
                                <i class="fa fa-pencil"></i>
                            </a>
                            </td>    
                      </tr>';
        }
    } else {
        $retval.='<tr><td collspan="5"> No Existen Sanciones pertenecientes al tipo</td></tr>';
    }
    echo $retval;

}

function guardarEdicionSancion() {
    global $dbmysql;
    $codigoSancion = $_POST["codigoSancion"];
    $sancion = $_POST["sancion"];
    $tiempo = $_POST["tiempo"];

    $sql = "UPDATE `sys_sanciones` SET SAN_DESCRIPCION = '$sancion', SAN_TIEMPO='$tiempo'  WHERE SAN_COD=$codigoSancion;";
    $val = $dbmysql->query($sql);
    if ($val) {

        $datos['datosActualizados'] = array("codigoSancion" => $codigoSancion, "sancion" => $sancion, "tiempo" => $tiempo);
        echo json_encode($datos);
    } else {
        echo 0; //NO SE EJECUTO EL QUERY
    }
}


function guardarNuevaSanciones() {
    global $dbmysql;
    $sancion = $_POST["sancion"];
    $tiempo = $_POST["tiempo"];
    $codigoTipoSancion = $_POST["codigoTipoSancion"];

    $sql = "INSERT INTO `sys_sanciones`(SAN_DESCRIPCION,SAN_TIEMPO,TPS_COD)
            VALUES('$sancion','$tiempo',$codigoTipoSancion);";
       
    $val = $dbmysql->query($sql);
    if ($val) {
        $codigoSancion = $dbmysql->maxid('SAN_COD', 'sys_sanciones');
       
        $datos['datosActualizados'] = array("codigoSancion" => $codigoSancion, "sancion" => $sancion, "tiempo" => $tiempo, "codigoTipoSancion" => $codigoTipoSancion);
        echo json_encode($datos); // RESULTADO EXITOSO
    } else {
        echo 0; //NO SE EJECUTO EL QUERY
    }
    
}