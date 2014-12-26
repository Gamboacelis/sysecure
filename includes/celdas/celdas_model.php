<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosCeldas':
        enviarDatosCeldas();
        break;
    case 'guardaDatosCeldas':
        guardaDatosCeldas();
        break;
    case 'actualizarDatosCeldas':
        actualizarDatosCeldas();
        break;
    case 'eliminarCeldas':
        eliminarCeldas();
        break;
}

function enviarDatosCeldas() {
    global $dbmysql;
    $idCeldas = $_POST['celdas'];
    $sql = "SELECT * FROM `sys_celdas` WHERE CEL_COD =$idCeldas;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosCeldas'] = array(
        "CEL_COD" => $row->CEL_COD,
        "CEN_COD" => $row->CEN_COD,
        "PAB_COD" => $row->PAB_COD,
        "ALA_COD" => $row->ALA_COD,
        "PIS_COD" => $row->PIS_COD,
        "CEL_DESCRIPCION" => $row->CEL_DESCRIPCION
    );
    echo $encode = json_encode($lista);
}

function actualizarDatosCeldas() {
    global $dbmysql;
    $codigo = $_POST['IDceldas'];
    $pabellon = $_POST['pabellon'];
    $alas = $_POST['ala'];
    $piso = $_POST['piso'];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "UPDATE `sys_celdas` SET 
                PAB_COD           = $pabellon,
                ALA_COD           = $alas,
                PIS_COD           = $piso,
                CEL_DESCRIPCION   = '$descripcion'
            WHERE CEL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosCeldas() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $pabellon = $_POST['pabellon'];
    $alas = $_POST['ala'];
    $piso = $_POST['piso'];
    $centro = $_SESSION["usu_centro_cod"];
    $sql_v = "SELECT * FROM `sys_celdas` WHERE CEL_DESCRIPCION = '$descripcion' AND CEN_COD=$centro AND PAB_COD=$pabellon AND ALA_COD=$alas AND PIS_COD=$piso;";
    $val_v = $dbmysql->query($sql_v);
    if($val_v->num_rows==0){   
       $sql = "INSERT INTO `sys_celdas`(CEN_COD,PAB_COD,ALA_COD,PIS_COD,CEL_DESCRIPCION)VALUES
                ('$centro',$pabellon,$alas,$piso,'$descripcion');";
        $val = $dbmysql->query($sql);
    }
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarCeldas() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_ppl` WHERE CEL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if($val->num_rows==0){
    $sql = "DELETE  FROM `sys_celdas` WHERE CEL_COD=$codigo;";
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
