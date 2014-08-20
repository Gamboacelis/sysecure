<?php

session_start();
include_once("../includes/conexiones/db_local.inc.php");
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosUsuario':
        enviarDatosUsuario();
        break;
    case 'guardaDatosUsuario':
        guardaDatosUsuario();
        break;
    case 'actualizarDatosUsuario':
        actualizarDatosUsuario();
        break;
    case 'eliminarUsuario':
        eliminarUsuario();
        break;
    case 'cambioClaveUsuario':
        cambioClaveUsuario();
        break;
}

function enviarDatosUsuario() {
    global $dbmysql;
    $idpro = $_POST['codigoUsu'];
    $sql = "SELECT * FROM `sys_usuarios` WHERE USU_COD =$idpro";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosUsuario'] = array(
        "USU_COD" => $row->USU_COD,
        "USU_NOMBRE" => $row->USU_NOMBRE,
        "USU_APELLIDO" => $row->USU_APELLIDO,
        "USU_USUARIO" => $row->USU_USUARIO,
        "USU_EMAIL" => $row->USU_EMAIL,
        "USU_CELULAR" => $row->USU_CELULAR,
        "USU_AVATAR" => $row->USU_AVATAR,
        "USU_CEDULA" => $row->USU_CEDULA,
        "ROL_COD" => $row->ROL_COD
    );
    echo $encode = json_encode($lista);
}

function actualizarDatosUsuario() {
    global $dbmysql;
    $codigo = $_POST['IDuser'];
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $usuario = $_POST["usuario"];
    $email = $_POST["email"];
    $celular = $_POST["celular"];
    $grupo = $_POST["grupo"];
    $cargo = $_POST["cargo"];

    $sql = "UPDATE `sys_usuarios` SET 
            CAR_COD       = '$cargo',
            USU_NOMBRE    = '$nombre',
            USU_APELLIDO  = '$apellido',
            USU_USUARIO   = '$usuario',
            USU_EMAIL     = '$email',
            USU_CELULAR   = '$celular',
            GRP_COD       = '$grupo'
           WHERE USU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosUsuario() {
    global $dbmysql;
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $usuario = $_POST["usuario"];
    $password = $_POST["password"];
    $email = $_POST["email"];
    $celular = $_POST["celular"];
    $cedula = $_POST["cedula"];
    $tipoUsuario = $_POST["tipoUsuario"];
    $centro=$_POST["centro"];
    
    $sql = "INSERT INTO `sys_usuarios`(USU_NOMBRE,USU_APELLIDO,USU_USUARIO,USU_CLAVE,USU_EMAIL,USU_CELULAR,USU_CEDULA,ROL_COD)VALUES(
          '$cargo','$nombre','$apellido','$usuario',MD5('$password'),'$email','$celular','$cedula','$tipoUsuario');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarUsuario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "DELETE  FROM `dsf_usuarios` WHERE USU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function cambioClaveUsuario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $password = $_POST["clave"];
    $sql = "UPDATE `dsf_usuarios` SET 
            USU_CLAVE     = MD5('$password')
           WHERE USU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}
