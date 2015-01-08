<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosPisos':
        enviarDatosPisos();
        break;
    case 'guardaDatosPisos':
        guardaDatosPisos();
        break;
    case 'actualizarDatosPisos':
        actualizarDatosPisos();
        break;
    case 'eliminarPisos':
        eliminarPisos();
        break;
     case 'comboPiso':
        comboPiso();
        break;
}

function enviarDatosPisos() {
    global $dbmysql;
    $idPisos = $_POST['pisos'];
    $sql = "SELECT * FROM `sys_pisos` WHERE PIS_COD =$idPisos;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosPisos'] = array(
        "PIS_COD" => $row->PIS_COD,
        "CEN_COD" => $row->CEN_COD,
        "PAB_COD" => $row->PAB_COD,
        "ALA_COD" => $row->ALA_COD,
        "PIS_DESCRIPCION" => $row->PIS_DESCRIPCION
    );
    echo $encode = json_encode($lista);
}

function actualizarDatosPisos() {
    global $dbmysql;
    $codigo = $_POST['IDpisos'];
    $pabellon = $_POST['pabellon'];
    $alas = $_POST['ala'];
    $descripcion = strtoupper($_POST["descripcion"]);

    $sql = "UPDATE `sys_pisos` SET 
                PAB_COD           = $pabellon,
                ALA_COD           = $alas,
                PIS_DESCRIPCION   = '$descripcion'
            WHERE PIS_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosPisos() {
    global $dbmysql;
    $descripcion = strtoupper($_POST["descripcion"]);
    $pabellon = $_POST['pabellon'];
    $alas = $_POST['ala'];
    $cantCeldas = $_POST['cantCeldas'];
    $centro = $_SESSION["usu_centro_cod"];
    $sql_v = "SELECT * FROM `sys_pisos` WHERE PIS_DESCRIPCION = '$descripcion' AND CEN_COD=$centro AND PAB_COD=$pabellon AND ALA_COD=$alas;";
    $val_v = $dbmysql->query($sql_v);
    if($val_v->num_rows==0){   
        $sql = "INSERT INTO `sys_pisos`(CEN_COD,PAB_COD,ALA_COD,PIS_DESCRIPCION)VALUES
                ('$centro',$pabellon,$alas,'$descripcion');";
        $val = $dbmysql->query($sql);
        $piso=$dbmysql->lastid();
    }
    if($cantCeldas!==''){ 
        for($x=1;$x<=$cantCeldas;$x++){
            $descripcionCelda=$descripcion.'-'.$x;
            $sql = "INSERT INTO `sys_celdas`(CEN_COD,PAB_COD,ALA_COD,PIS_COD,CEL_DESCRIPCION)VALUES
                    ('$centro',$pabellon,$alas,$piso,'$descripcionCelda');";
            $val = $dbmysql->query($sql);
        }
    }
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarPisos() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_celdas` WHERE PIS_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if($val->num_rows==0){
    $sql = "DELETE  FROM `sys_pisos` WHERE PIS_COD=$codigo;";
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
function comboPiso(){
    global $dbmysql;
    $pabellon = $_POST['pabellon'];
    $ala = $_POST['ala'];
    $piso = ($_POST['piso']!='')?$_POST['piso']:'';
    $centro=$_SESSION["usu_centro_cod"];
    $retval='<select id="piso" name="piso">
                <option value="" selected="" disabled="">-- Piso --</option>';
    $sql = "SELECT * FROM `sys_pisos` WHERE PAB_COD=$pabellon AND CEN_COD=$centro AND ALA_COD=$ala;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
            while ($row = $val->fetch_object()) {
                $select=($piso==$row->PIS_COD)?'selected="selected"':'';
                $retval.='<option value="' . $row->PIS_COD . '" '.$select.'>' . $row->PIS_DESCRIPCION . '</option>';
            }
        }
        $retval .='</select>';
        echo $retval;
}