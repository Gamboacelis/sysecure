<?php 
 


session_start();

include_once '../conexiones/db_local.inc.php';

$dbmysql = new database();

date_default_timezone_set('America/Bogota');

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';

switch ($funcion) {

    case 'enviarDatosPabellon':

        enviarDatosPabellon();

        break;

    case 'enviarDatosPabellones':

        enviarDatosPabellones();

        break;   

    case 'guardarTraspaso':

        guardarTraspaso();

        break;           


}



function enviarDatosPabellon() { 

    global $dbmysql;

    $idpab = $_POST['codigo'];

    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idpab";

    $val = $dbmysql->query($sql);

    $row = $val->fetch_object();

    echo $row->PAB_DESCRIPCION;
   

}


function enviarDatosPabellones() {

    global $dbmysql;

    $sql = "SELECT * FROM `sys_pabellones` ";

    $val = $dbmysql->query($sql);

    $retval = '';
    
    while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAB_COD. '"> Pabellon ' . $row->PAB_DESCRIPCION . '</option>';
    }

    echo $retval;
}

function guardarTraspaso() {

    global $dbmysql;
    $codigoPpl = $_POST['codigo'];
    $codigoPabellon = $_POST['codigoPabellon'];
    $sql = "UPDATE `sys_ppl` SET PAB_COD= $codigoPabellon WHERE PPL_COD=$codigoPpl;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

