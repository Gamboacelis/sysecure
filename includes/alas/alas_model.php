<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosAlas':
        enviarDatosAlas();
        break;
    case 'guardaDatosAlas':
        guardaDatosAlas();
        break;
    case 'actualizarDatosAlas':
        actualizarDatosAlas();
        break;
    case 'eliminarAlas':
        eliminarAlas();
        break;
    case 'comboAlas':
        comboAlas();
        break;
}

function enviarDatosAlas() {
    global $dbmysql;
    $idAla = $_POST['alas'];
    $sql = "SELECT * FROM `sys_alas` WHERE ALA_COD =$idAla;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosAlas'] = array(
        "ALA_COD" => $row->ALA_COD,
        "PAB_COD" => $row->PAB_COD,
        "ALA_DESCRIPCION" => $row->ALA_DESCRIPCION
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosAlas() {
    global $dbmysql;
    $codigo = $_POST['IDalas'];
    $pabellon = $_POST['pabellon'];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "UPDATE `sys_alas` SET 
                PAB_COD           = $pabellon,
                ALA_DESCRIPCION   = '$descripcion'
            WHERE ALA_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosAlas() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $pabellon = $_POST['pabellon'];
    $centro = $_SESSION["usu_centro_cod"];
    $sql_v = "SELECT * FROM `sys_alas` WHERE ALA_DESCRIPCION = '$descripcion' AND CEN_COD=$centro AND PAB_COD=$pabellon;";
    $val_v = $dbmysql->query($sql_v);
    if($val_v->num_rows==0){   
        $sql = "INSERT INTO `sys_alas`(CEN_COD,PAB_COD,ALA_DESCRIPCION)VALUES
                ('$centro',$pabellon,'$descripcion');";
        $val = $dbmysql->query($sql);
    }
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarAlas() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_pisos` WHERE ALA_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if($val->num_rows==0){
    $sql = "DELETE  FROM `sys_alas` WHERE ALA_COD=$codigo;";
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

function comboAlas(){
    global $dbmysql;
    $pabellon = $_POST['pabellon'];
    $ala = $_POST['ala'];
    $piso = ($_POST['piso']!='')?'llenaPiso('.$_POST['ala'].');':'llenaPiso()';
    $centro=$_SESSION["usu_centro_cod"];
    $retval='<select id="ala" name="ala" onchange="'.$piso.'">
                <option value="" selected="" disabled="">-- Ala --</option>';
    $sql = "SELECT * FROM `sys_alas` WHERE PAB_COD=$pabellon AND CEN_COD=$centro;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
            while ($row = $val->fetch_object()) {
                $select=($ala==$row->ALA_COD)?'selected="selected"':'';
                $retval.='<option value="' . $row->ALA_COD . '" '.$select.'>' . $row->ALA_DESCRIPCION . '</option>';
            }
        }
        $retval .='</select>';
        echo $retval;
}