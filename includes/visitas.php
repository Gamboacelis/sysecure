<?php

include_once("conexiones/db_local.inc.php");
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$funcion = isset($_GET['funcion']) ? $_GET['funcion'] : 'ninguno';
switch ($funcion) {
    case 'consultadatosVisitante':
        consultadatosVisitante();
        break;
    case 'registraVisitante':
        registraVisitante();
        break;
}

function reporte_visitantes() {
    global $dbmysql;
    $retval = '';
    $retval = '<div class="logo-principal">
                    <img src="img/logo/Logo-6.png" style="width: 70%"/>
               </div>';
return $retval;
}
