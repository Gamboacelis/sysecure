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
function guardaDatosPabellon() {
    global $dbmysql;
    $pabellon = $_POST["pabellon"];
    $celda = $_POST["celda"];
    $nombre = $_POST["nombre"];
    $apellido= $_POST["apellido"];
    $cedula = $_POST["cedula"];
    $huella = $_POST["huella"];
    $imagen = $_POST["fileImagen"];
    $sql = "INSERT INTO `sys_ppl`(CEL_COD,PPL_NOMBRE,PPL_APELLIDO,PPL_CEDULA,PPL_IMG,PPL_HUELLA,PPL_ESTADO)VALUES
            ('$celda','$nombre','$apellido','$cedula','$imagen','$huella','A');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}
