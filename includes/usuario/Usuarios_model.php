<?php

session_start();
include_once '../conexiones/db_local.inc.php';
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
    case 'obtenerCentrosMenu':
        obtenerCentrosMenu();
        break;
    case 'obtenerCentrosListado':
        obtenerCentrosListado();
        break;
    case 'agregaCentrosTabla':
        agregaCentrosTabla();
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
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $usuario = strtolower($_POST["usuario"]);
    $email = strtolower($_POST["email"]);
    $celular = $_POST["celular"];
    $cedula = $_POST["cedula"];
    $tipoUsuario = $_POST["tipoUsuario"];
//    $sql_rol = "SELECT * FROM `sys_usuarios` WHERE USU_COD=$codigo;";
//    $val_rol = $dbmysql->query($sql_rol);
//    $row = $val_rol->fetch_object();
//    if($row->ROL_COD!=$tipoUsuario){
//        
//    }
    $sql = "UPDATE `sys_usuarios` SET 
                USU_NOMBRE    = '$nombre',
                USU_APELLIDO  = '$apellido',
                USU_USUARIO   = '$usuario',
                USU_EMAIL     = '$email',
                USU_CELULAR   = '$celular',
                USU_CEDULA    = '$cedula',
                ROL_COD       = '$tipoUsuario'
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
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $usuario = strtolower($_POST["usuario"]);
    $password = $_POST["password"];
    $email = strtolower($_POST["email"]);
    $celular = $_POST["celular"];
    $cedula = $_POST["cedula"];
    $tipoUsuario = $_POST["tipoUsuario"];
    $centro = $_POST["centro"];

    $sql = "INSERT INTO `sys_usuarios`(USU_NOMBRE,USU_APELLIDO,USU_USUARIO,USU_CLAVE,USU_EMAIL,USU_CELULAR,USU_CEDULA,ROL_COD)VALUES
            ('$nombre','$apellido','$usuario',MD5('$password'),'$email','$celular','$cedula','$tipoUsuario');";
    $val = $dbmysql->query($sql);
    if ($val) {
        $maxid = $dbmysql->lastid();
        $sql_usuario_centro = "INSERT INTO `sys_usuario_centro`(USU_COD,CEN_COD,ROL_COD)VALUES
                               ($maxid,$centro,$tipoUsuario);";
        $val = $dbmysql->query($sql_usuario_centro);
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarUsuario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "DELETE  FROM `sys_usuarios` WHERE USU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        $sql = "DELETE  FROM `sys_usuario_centro` WHERE USU_COD=$codigo;";
        $dbmysql->query($sql);
        echo 1;
    } else {
        echo 0;
    }
}

function cambioClaveUsuario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $password = $_POST["clave"];
    $sql = "UPDATE `sys_usuarios` SET 
            USU_CLAVE     = MD5('$password')
           WHERE USU_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function obtenerCentrosMenu() {
    global $dbmysql;
    $retval = '';
    $codUsuario=$_POST['codUsuario'];
    
    
    $sql = "SELECT * FROM `sys_centro`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $sql_uc = "SELECT * FROM `sys_usuario_centro`WHERE USU_COD=$codUsuario AND CEN_COD=$row->CEN_COD;";
            $val_uc = $dbmysql->query($sql_uc);
            if ($val_uc->num_rows == 0) {
                $retval.='<li><a href="javascript:agregaCentroTabla(' . $row->CEN_COD . ','.$codUsuario.');">' . $row->CEN_DESCRIPCION . '</a></li>';
            }
        }
    }
    echo $retval;
}

function obtenerCentrosListado() {
    global $dbmysql;
    $retval = '';
    $codUsuario=$_POST['codUsuario'];
    $sql = "SELECT uc.*,c.* FROM `sys_usuario_centro` uc,sys_centro c WHERE c.`CEN_COD`=uc.`CEN_COD` AND `USU_COD` = $codUsuario;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
              $retval.='<tr>
                            <td>' . $row->CEN_COD . '</td>
                            <td>' . $row->CEN_DESCRIPCION . '</td>
                            <td>' . $row->CEN_DIRECCION . '</td>
                            <td>' . $row->CEN_TELEFONO  . '</td>
                        </tr>';
        }
    }
    echo $retval;
}
function agregaCentrosTabla() {
    global $dbmysql;
    $retval = '';
    $codCentro=$_POST['codCentro'];
    $codUsuario=$_POST['codUsuario'];
    $sql_usu = "SELECT * FROM sys_usuarios WHERE `USU_COD` = $codUsuario;";
    $val_usu = $dbmysql->query($sql_usu);
    $row_usu = $val_usu->fetch_object();
    //INSERCION DEL USUARIO CENTRO
    $sql_cuc = "SELECT * FROM sys_usuario_centro WHERE `USU_COD` = $codUsuario AND CEN_COD=$codCentro;";
    $val_cuc = $dbmysql->query($sql_cuc);
    if($val_cuc->num_rows==0){
        $sql_usuario_centro = "INSERT INTO `sys_usuario_centro`(USU_COD,CEN_COD,ROL_COD)VALUES
                               ($codUsuario,$codCentro,$row_usu->ROL_COD);";
        $val_uc = $dbmysql->query($sql_usuario_centro);
    }
    //////////////////////////////////
    
        $sql = "SELECT uc.*,c.* FROM `sys_usuario_centro` uc,sys_centro c WHERE c.`CEN_COD`=uc.`CEN_COD` AND `USU_COD` = $codUsuario;";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            while ($row = $val->fetch_object()) {
                  $retval.='<tr>
                                <td>' . $row->CEN_COD . '</td>
                                <td>' . $row->CEN_DESCRIPCION . '</td>
                                <td>' . $row->CEN_DIRECCION . '</td>
                                <td>' . $row->CEN_TELEFONO  . '</td>
                            </tr>';
            }
        }
        echo $retval;
    
}
