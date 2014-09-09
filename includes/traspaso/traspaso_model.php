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
    $idppl = $_POST['ppl'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idpab";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosPabellon'] = array(
        "PAB_COD" => $row->PAB_COD,
        "NVL_COD" => $row->NVL_COD,
        "PAB_ALA" => $row->PAB_ALA,
        "PAB_DESCRIPCION" => $row->PAB_DESCRIPCION,
        "PAB_CAPACIDAD" => $row->PAB_CAPACIDAD,
        "PAB_DETALLES" => $row->PAB_DETALLES
    );
    $sql2 = "SELECT h.*,p.PAB_DESCRIPCION FROM sys_historia_ppl h,`sys_pabellones` p WHERE h.PAB_COD=p.PAB_COD AND h.PPL_COD =$idppl ORDER BY h.`HIS_COD` DESC LIMIT 0,1";
    $val2 = $dbmysql->query($sql2);
    $row2 = $val2->fetch_object();
    $lista['datosAntiguoPabellon'] = array(
        "HIS_COD" => $row2->HIS_COD,
        "USU_COD" => $row2->USU_COD,
        "PPL_COD" => $row2->PPL_COD,
        "PAB_COD" => $row2->PAB_COD,
        "PAB_DESCRIPCION" => $row2->PAB_DESCRIPCION,
        "HIS_FECHA" => $row2->HIS_FECHA,
        "HIS_MOTIVO" => $row2->HIS_MOTIVO
    );
    $sql3 = "SELECT h.*,p.PAB_DESCRIPCION, u.USU_USUARIO FROM sys_historia_ppl h,`sys_pabellones` p, `sys_usuarios` u WHERE u.USU_COD=h.USU_COD AND h.PAB_COD=p.PAB_COD AND h.PPL_COD =$idppl ORDER BY h.`HIS_COD`";
    $val3 = $dbmysql->query($sql3);
    while($row3 = $val3->fetch_object()){
        $lista['datosHistoriaPpl'][] = array(
            "HIS_COD" => $row3->HIS_COD,
            "USU_COD" => $row3->USU_COD,
            "PPL_COD" => $row3->PPL_COD,
            "PAB_COD" => $row3->PAB_COD,
            "PAB_DESCRIPCION" => $row3->PAB_DESCRIPCION,
            "USU_USUARIO" => $row3->USU_USUARIO,
            "HIS_FECHA" => $row3->HIS_FECHA,
            "HIS_MOTIVO" => $row3->HIS_MOTIVO
        );
    }
//    print_r($lista);
    echo $encode = json_encode($lista);
}

function enviarDatosPabellones() {
    global $dbmysql;
    $idpab = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD != $idpab ";
    $val = $dbmysql->query($sql);
    $retval = '';
    while ($row = $val->fetch_object()) {
        $retval.='<option value="' . $row->PAB_COD . '"> Pabellon ' . $row->PAB_DESCRIPCION . '</option>';
    }
    echo $retval;
}

function guardarTraspaso() {

    global $dbmysql;
    $fecha = date('Y-m-d H:i:s');
    $usuario = $_SESSION["user_id"];
    $codigoPpl = $_POST['codigo'];
    $codigoPabellon = $_POST['codigoPabellon'];
    $codigoAnterior = $_POST['anterior'];
    $motivo = $_POST['motivo'];
    $sql = "UPDATE `sys_ppl` SET PAB_COD= $codigoPabellon WHERE PPL_COD=$codigoPpl;";
    $val = $dbmysql->query($sql);

    $sql2 = "INSERT INTO `sys_historia_ppl`(`USU_COD`, `PPL_COD`, `PAB_COD`, `HIS_FECHA`, `HIS_MOTIVO`) VALUES ($usuario,$codigoPpl,$codigoAnterior,'$fecha','$motivo');";
    $val2 = $dbmysql->query($sql2);
    if ($val and $val2) {
        echo 1;
    } else {
        echo 0;
    }
}
