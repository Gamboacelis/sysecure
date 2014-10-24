<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosParentesco':
        enviarDatosParentesco();
        break;
    case 'guardaDatosParentesco':
        guardaDatosParentesco();
        break;
    case 'actualizarDatosParentesco':
        actualizarDatosParentesco();
        break;
    case 'eliminarParentesco':
        eliminarParentesco();
        break;
}

function enviarDatosParentesco() {
    global $dbmysql;
    $idparentesco = $_POST['parentesco'];
    $sql = "SELECT * FROM `sys_parentesco` WHERE PAR_COD =$idparentesco";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosParentesco'] = array(
        "PAR_COD" => $row->PAR_COD,
        "TPV_COD" => $row->TPV_COD,
        "PAR_DESCRIPCION" => $row->PAR_DESCRIPCION
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosParentesco() {
    global $dbmysql;
    $codigo = $_POST['IDparentesco'];
    $tpparentesco = $_POST["tpparentesco"];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "UPDATE `sys_parentesco` SET 
                TPV_COD  = $tpparentesco,
                PAR_DESCRIPCION   = '$descripcion'
            WHERE PAR_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosParentesco() {
    global $dbmysql;
    $tpparentesco = $_POST["tpparentesco"];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "INSERT INTO `sys_parentesco`(TPV_COD,PAR_DESCRIPCION)VALUES
            ($tpparentesco,'$descripcion');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarParentesco() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql_veri = "SELECT * FROM `sys_visitante_ppl` WHERE PAR_COD=$codigo;";
    $val_veri = $dbmysql->query($sql_veri);
    if($val_veri->num_rows==0){
        $sql = "DELETE  FROM `sys_parentesco` WHERE PAR_COD=$codigo;";
        $val = $dbmysql->query($sql);
        if ($val) {
            echo 1;
        } else {
            echo 0;
        }
    }else{
        echo 2;
    }
}
