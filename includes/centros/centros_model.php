<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosCentro':
        enviarDatosCentro();
        break;
    case 'guardaDatosCentro':
        guardaDatosCentro();
        break;
    case 'actualizarDatosCentro':
        actualizarDatosCentro();
        break;
    case 'eliminarCentro':
        eliminarCentro();
        break;
    case 'consultaCentro':
        consultaCentro();
        break;
}

function enviarDatosCentro() {
    global $dbmysql;
    $idcentro = $_POST['centro'];
    $sql = "SELECT * FROM `sys_centro` WHERE CEN_COD =$idcentro";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosCentro'] = array(
        "CEN_COD"           => $row->CEN_COD,
        "CIU_COD"           => $row->CIU_COD,
        "CEN_DESCRIPCION"   => $row->CEN_DESCRIPCION,
        "CEN_DIRECCION"     => $row->CEN_DIRECCION,
        "CEN_TELEFONO"      => $row->CEN_TELEFONO,
        "CEN_TIPO"          => $row->CEN_TIPO
    );

    echo $encode = json_encode($lista);
}


function guardaDatosCentro() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $ciudad = $_POST["ciudad"];
    $tipo = $_POST["tipo"];
    $sql = "INSERT INTO `sys_centro`(CIU_COD,CEN_DESCRIPCION,CEN_DIRECCION,CEN_TELEFONO,CEN_TIPO)VALUES
            ('$ciudad','$descripcion','$direccion','$telefono','$tipo');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function actualizarDatosCentro() {
    global $dbmysql;
    $codigo = $_POST['IDcentro'];
    $descripcion = strtoupper($_POST["descripcion"]);
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $ciudad = $_POST["ciudad"];
    $tipo = $_POST["tipo"];

    $sql = "UPDATE `sys_centro` SET 
                CIU_COD         = '$ciudad',
                CEN_DESCRIPCION = '$descripcion',
                CEN_DIRECCION   = '$direccion',
                CEN_TELEFONO    = '$telefono',
                CEN_TIPO = '$tipo'
            WHERE CEN_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarCentro() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "DELETE  FROM `sys_centro` WHERE CIU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function consultaCentro() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE CEN_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows>0) {
        echo 1;
    } else {
        echo 0;
    }
}