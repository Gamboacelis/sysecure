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
    case 'guardaDatosPabellon':
        guardaDatosPabellon();
        break;
    case 'actualizaValorParametro':
        actualizaValorParametro();
        break;
    case 'eliminarPabellon':
        eliminarPabellon();
        break;
}

function enviarDatosPabellon() {
    global $dbmysql;
    $idpabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idpabellon";
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

    echo $encode = json_encode($lista);
}

function actualizaValorParametro() {
    global $dbmysql;
    $parCod = $_POST['parCod'];
    $valor = $_POST["valor"];
    $sql = "UPDATE `sys_parametros` SET 
                PAR_VALOR    = '$valor'
            WHERE PAR_COD=$parCod;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosPabellon() {
    global $dbmysql;
    $ala = strtoupper($_POST["ala"]);
    $descripcion = strtoupper($_POST["descripcion"]);
    $capacidad = $_POST["capacidad"];
    $detalles = strtoupper($_POST["detalles"]);
    $nivel = $_POST["nivel"];
    $centro = $_SESSION["usu_centro_cod"];
    $sql = "INSERT INTO `sys_pabellones`(CEN_COD,NVL_COD,PAB_ALA,PAB_DESCRIPCION,PAB_CAPACIDAD,PAB_DETALLES)VALUES
            ('$centro','$nivel','$ala','$descripcion','$capacidad','$detalles');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarPabellon() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "DELETE  FROM `sys_pabellones` WHERE PAB_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}
