<?php

session_start();
include_once("conexiones/db_local.inc.php");
$dbmysql = new database();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function registrar_acceso() {
    global $dbmysql;
    $usuario=$_SESSION["user_id"];
    $centro=$_SESSION["usu_centro_cod"];
    $fechaHora=date('Y-m-d H:i:s');
    $ip=obtenerIp();
    $nombreEquipo=obtenerNombreEquipo();
    $sql = "INSERT INTO `sys_accesos` (`USU_COD`, `CEN_COD`, `ACC_FECHA`, `ACC_IP`, `ACC_EQUIPO`)
            VALUES ('$usuario', '$centro', '$fechaHora', '$ip', '$nombreEquipo');";
    $dbmysql->query($sql);
}
function obtenerIp(){
    $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"] ? $_SERVER["HTTP_CF_CONNECTING_IP"] : $_SERVER["REMOTE_ADDR"];
    return $_SERVER['REMOTE_ADDR'];
}
function obtenerNombreEquipo(){
    return gethostname();
}