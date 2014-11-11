<?php
include_once 'includes/generales.php';
$clGeneral = new general();
include_once("includes/conexiones/db_local.inc.php");
$db = new database();
date_default_timezone_set('America/Bogota');
$user=$_POST['usuario'];
$pass=$_POST['clave'];
$centro=$_POST['centro'];
$sql = "SELECT uc.*, u.*, c.*, r.* FROM `sys_usuario_centro` uc,sys_usuarios u,sys_centro c,sys_roles r WHERE uc.`USU_COD`=u.`USU_COD` AND uc.`CEN_COD`=c.`CEN_COD` AND uc.`ROL_COD`=r.`ROL_COD` 
        AND u.USU_USUARIO ='".$user."' 
        AND u.USU_CLAVE = MD5('$pass')
        AND uc.CEN_COD = '$centro'";
$consulta = $db->query($sql);
$row = $consulta->fetch_object();
if($consulta->num_rows>0){
	session_start();
        $clGeneral->pulirRegistros();
            $_SESSION["autenticado"]= "SI";
            $_SESSION["menu"]= 1;
            $_SESSION["user_id"]=$row->USU_COD;
            $_SESSION["usu_real_nombre"]=$row->USU_NOMBRE.' '.$row->USU_APELLIDO;
            $_SESSION["usu_usuario"]=$row->USU_USUARIO;
            $_SESSION["usu_mail"]=$row->USU_EMAIL;
            $_SESSION["usu_avatar"]=$row->USU_AVATAR;
            $_SESSION["usu_rol_cod"]=$row->ROL_COD;
            $_SESSION["usu_rol_descrip"]=$row->ROL_DESCRIPCION;
            $_SESSION["usu_centro_cod"]=$row->CEN_COD;
            $_SESSION["usu_centro_descrip"]=$row->CEN_DESCRIPCION;
        $clGeneral->registrar_acceso();
//        window.open("url.html","algo","type=fullWindow, fullscreen=yes, resizable=yes").focus();
//        echo $open=($_SESSION["usu_rol_cod"]!=4)?"ok":"pab";
	echo $open="ok";
}
else{
	echo "no";
}
?>