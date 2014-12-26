<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosEtapas':
        enviarDatosEtapas();
        break;
    case 'guardaDatosEtapas':
        guardaDatosEtapas();
        break;
    case 'actualizarDatosEtapas':
        actualizarDatosEtapas();
        break;
    case 'eliminarEtapas':
        eliminarEtapas();
        break;
}

function enviarDatosEtapas() {
    global $dbmysql;
    $idEtapa = $_POST['etapas'];
    $sql = "SELECT * FROM `sys_etapas` WHERE NVL_COD =$idEtapa;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosEtapas'] = array(
        "NVL_COD" => $row->NVL_COD,
        "NVL_DESCRIPCION" => $row->NVL_DESCRIPCION
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosEtapas() {
    global $dbmysql;
    $codigo = $_POST['IDetapa'];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "UPDATE `sys_etapas` SET 
                NVL_DESCRIPCION   = '$descripcion'
            WHERE NVL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosEtapas() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $centro = $_SESSION["usu_centro_cod"];
    $sql_v = "SELECT * FROM `sys_etapas` WHERE NVL_DESCRIPCION = '$descripcion' AND CEN_COD=$centro;";
    $val_v = $dbmysql->query($sql_v);
    if($val_v->num_rows==0){   
        $sql = "INSERT INTO `sys_etapas`(CEN_COD,NVL_DESCRIPCION)VALUES
                ('$centro','$descripcion');";
        $val = $dbmysql->query($sql);
    }
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarEtapas() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE NVL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if($val->num_rows==0){
    $sql = "DELETE  FROM `sys_etapas` WHERE NVL_COD=$codigo;";
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
