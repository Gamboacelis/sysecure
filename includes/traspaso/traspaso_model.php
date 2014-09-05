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

    $idpab = $_POST['codigo'];


    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD != $idpab ";

    $val = $dbmysql->query($sql);

    $retval = '';
    
    while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAB_COD. '"> Pabellon ' . $row->PAB_DESCRIPCION . '</option>';
    }

    echo $retval;
}

function guardarTraspaso() {

    global $dbmysql;
    $fecha = date('Y-m-d'); 
    $usuario=$_SESSION["user_id"];
    $codigoPpl = $_POST['codigo'];
    $codigoPabellon = $_POST['codigoPabellon'];
    $motivo = $_POST['motivo'];
    $sql = "UPDATE `sys_ppl` SET PAB_COD= $codigoPabellon WHERE PPL_COD=$codigoPpl;";
    $val = $dbmysql->query($sql);

    $sql2 = "INSERT INTO `sys_historia_ppl`(`USU_COD`, `PPL_COD`, `PAB_COD`, `HIS_FECHA`, `HIS_MOTIVO`) VALUES ($usuario,$codigoPpl,$codigoPabellon,'$fecha','$motivo');";
    $val2 = $dbmysql->query($sql2);
    if ($val and $val2) {
        echo 1;
    } else {
        echo 0;
    }
}

