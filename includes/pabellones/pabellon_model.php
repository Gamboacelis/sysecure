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
    case 'actualizarDatosPabellon':
        actualizarDatosPabellon();
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
        "PAB_DESCRIPCION" => $row->PAB_DESCRIPCION,
        "PAB_CAPACIDAD" => $row->PAB_CAPACIDAD,
        "PAB_DETALLES" => $row->PAB_DETALLES
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosPabellon() {
    global $dbmysql;
    $codigo = $_POST['IDpabellon'];
    $ala = strtoupper($_POST["ala"]);
    $descripcion = strtoupper($_POST["descripcion"]);
    $capacidad = $_POST["capacidad"];
    $detalles = strtoupper($_POST["detalles"]);
    $nivel = $_POST["nivel"];

    $sql = "UPDATE `sys_pabellones` SET 
                NVL_COD    = '$nivel',
                PAB_DESCRIPCION   = '$descripcion',
                PAB_CAPACIDAD     = '$capacidad',
                PAB_DETALLES   = '$detalles'
            WHERE PAB_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosPabellon() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $capacidad = $_POST["capacidad"];
    $detalles = strtoupper($_POST["detalles"]);
    $nivel = $_POST["nivel"];
    $centro = $_SESSION["usu_centro_cod"];


    $sql_v = "SELECT * FROM `sys_pabellones` WHERE PAB_DESCRIPCION = '$descripcion'";
    $val_v = $dbmysql->query($sql_v);
    $row_v = $val_v->fetch_object();
    
    if($row_v->PAB_DESCRIPCION != $descripcion)
    {   

        $sql = "INSERT INTO `sys_pabellones`(CEN_COD,NVL_COD,PAB_DESCRIPCION,PAB_CAPACIDAD,PAB_DETALLES)VALUES
                ('$centro','$nivel','$descripcion','$capacidad','$detalles');";
        $val = $dbmysql->query($sql);

    }

    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarPabellon() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_alas` WHERE PAB_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if($val->num_rows==0){
    $sql = "DELETE  FROM `sys_pabellones` WHERE PAB_COD=$codigo;";
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
