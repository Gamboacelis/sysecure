<?php

session_start();
/*
 * Script:    DataTables server-side script for PHP and MySQL
 * Copyright: 2014 - Willian Espinosa - Edicion Especial
 */

include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
global $dbmysql;
$aColumns = array('VSF_COD', 'CEN_COD', 'VIS_COD', 'VIS_NOMBRE', 'VIS_APELLIDO', 'VIS_CEDULA', 'FUN_COD', 'FUN_DESCRIPCION', 'VSF_FECHA_CREA', 'VSF_HORA_ING', 'VSF_HORA_SAL', 'VSF_POSCHAR', 'VSF_POSINT', 'VSF_ESTADO', 'VIF_RAZON');
$sIndexColumn = "VSF_COD";
$sTable = "sys_vw_control_funcionarios4";
if (isset($_GET['iDisplayStart']) && $_GET['iDisplayLength'] != '-1') {
    $sLimit = "LIMIT " . $_GET['iDisplayStart'] . ", " . $_GET['iDisplayLength'];
}
/* * *******************
 * ** Ordenamiento ****
 * ******************* */

if (isset($_GET['iSortCol_0'])) {
    $sOrder = "ORDER BY  ";
    for ($i = 0; $i < intval($_GET['iSortingCols']); $i++) {
        if ($_GET['bSortable_' . intval($_GET['iSortCol_' . $i])] == "true") {
            $sOrder .= $aColumns[intval($_GET['iSortCol_' . $i])] . " " . $_GET['sSortDir_' . $i] . ", ";
        }
    }
    $sOrder = substr_replace($sOrder, "", -2);
    if ($sOrder == "ORDER BY id") {
        $sOrder = "ORDER BY id asc";
    }
}

/* * *******************
 * ** Filtrado ****
 * ******************* */

$sWhere = "";
if ($_GET['sSearch'] != "") {
    $sWhere = "WHERE (";
    for ($i = 0; $i < count($aColumns); $i++) {
        $sWhere .= $aColumns[$i] . " LIKE '%" . $_GET['sSearch'] . "%' OR ";
    }
    $sWhere = substr_replace($sWhere, "", -3);
    $sWhere .= ')';
}
/* Filtrado por Columnas individuales */
for ($i = 0; $i < count($aColumns); $i++) {
    if ($_GET['bSearchable_' . $i] == "true" && $_GET['sSearch_' . $i] != '') {
        if ($sWhere == "") {
            $sWhere = "WHERE ";
        } else {
            $sWhere .= " AND ";
        }
        $sWhere .= $aColumns[$i] . " LIKE '%" . $_GET['sSearch_' . $i] . "%' ";
    }
}

/* * ***********************
 * ** CREACION DEL SQL ****
 * *********************** */
$sWhere = ($sWhere == '') ? " WHERE CEN_COD = " . $_SESSION['usu_centro_cod'] . " " : " AND CEN_COD = " . $_SESSION['usu_centro_cod'];
$sQuery = "SELECT SQL_CALC_FOUND_ROWS " . str_replace(" , ", " ", implode(",", $aColumns)) . "
            FROM $sTable
            $sWhere
            $sOrder
            $sLimit";
//echo $sQuery;
$rResult = $dbmysql->query($sQuery);
if (!$rResult) {
    printf("Error: %s\n", $mysqli->error);
}
/* * **********************************************************
 * ** Longitud conjunto de datos después de la filtración ****
 * ********************************************************** */
$sQuery = "SELECT FOUND_ROWS() as Validas";
$rResultFilterTotal = $dbmysql->query($sQuery) or die($dbmysql->error);
$aResultFilterTotal = $rResultFilterTotal->fetch_object();
$iFilteredTotal = $aResultFilterTotal->Validas; //Total de Registros Validos

$sQuery = "SELECT COUNT(" . $sIndexColumn . ")AS contador FROM   $sTable $sOrder;";
$rResultTotal = $dbmysql->query($sQuery) or die($dbmysql->error);
$aResultTotal = $rResultTotal->fetch_object();
$iTotal = $aResultTotal->Validas;
$output = array(
    "sEcho" => intval($_GET['sEcho']),
    "iTotalRecords" => $iFilteredTotal,
    "iTotalDisplayRecords" => $iFilteredTotal,
    "aaData" => array());
//print_r($output);
/* * **********************
 * ** RESULTADO FINAL ****
 * ********************** */
while ($aRow = $rResult->fetch_object()) {
    /* General output */
    $nombre_visitante = $aRow->VIS_NOMBRE . ' ' . $aRow->VIS_APELLIDO;

    $estado = ($aRow->VSF_ESTADO == 'A') ? '<span class="label label-success">Activo</span>' : '<span class="label label-danger">Finalizado</span>';
    $output['aaData'][] = array('<input type="hidden" class="codVisita" id="cod_' . $aRow->VSF_COD . '" name="codVisita" value="' . $aRow->VSF_COD . '">' . $aRow->VSF_COD . '',
        '' . utf8_encode($nombre_visitante) . '',
        '' . utf8_encode($aRow->VIS_CEDULA) . '',
        '' . utf8_encode($aRow->VSF_FECHA_CREA) . '',
        '' . utf8_encode($aRow->VSF_HORA_ING) . '',
        '<div class="progress progress-striped active no-margin">'
        . '                         <div id="progresoTiempoFun' . $aRow->VSF_COD . '" class="progress-bar progress-bar-success" style="width: 0%" role="progressbar">' . utf8_encode($aRow->VISG_TRANSCURRIDO) . '</div>'
        . '                      </div>',
        '<small class="text-danger fast animated" style="text-align: center;"><h1><b>' . $aRow->VSF_POSCHAR . $aRow->VSF_POSINT . '</b></h1></small>',
        '' . $estado . '');
}
echo json_encode($output);