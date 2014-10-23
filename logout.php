<?php

session_start();
$_SESSION["autenticado"] = "NO";
session_destroy();

unset($_SESSION['user_id']);
unset($_SESSION['usu_real_nombre']);
unset($_SESSION['usu_usuario']);
unset($_SESSION['rol_usuario']);
unset($_SESSION['usu_avatar']);
unset($_SESSION["usu_mail"]);
unset($_SESSION["usu_avatar"]);
unset($_SESSION["usu_rol_cod"]);
unset($_SESSION["usu_rol_descrip"]);
unset($_SESSION["usu_centro_cod"]);
unset($_SESSION["usu_centro_descrip"]);

header("Location:index.php");
