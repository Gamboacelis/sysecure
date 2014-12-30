<?php

session_start();
/*
 * Script:    DataTables server-side script for PHP and MySQL
 * Copyright: 2014 - Willian Espinosa - Edicion Especial
 */
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Guayaquil');
$sOrder = '';
$centro = $_SESSION["usu_centro_cod"];
$aColumns = array('AUD_COD', 'CEN_COD','AUD_TIPO', 'AUD_TABLA', 'AUD_DESCRIPCION', 'AUD_IP', 'AUD_DOMINIO', 'AUD_USUARIO', 'AUD_FECHAHORA');
$sIndexColumn = "AUD_COD";
$sTable = "sys_auditoria";
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
if ($sOrder == "ORDER BY  id asc") {
    $sOrder = "ORDER BY id DESC";
}
$sWhere=($sWhere=='')?'WHERE CEN_COD='.$centro:$sWhere.' AND CEN_COD='.$centro;
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
    /*     * ******************************
     * *** VALIDACIONES GENERALES ****
     * ****************************** */
    switch ($aRow->AUD_TIPO) {
        case 'I':
            $btn = '<span class="label label-primary">Insertar</span>';
            break;
        case 'A':
            $btn = '<span class="label label-success">Actualizar</span>';
            break;
        case 'E':
            $btn = '<span class="label label-warning">Eliminar</span>';
            break;
    }
    
    /*     * ********************************
     * ** CREACION DE ARRAY GENERAL ****
     * ******************************** */
    $output['aaData'][] = array('' . $btn . '',
                                '' . $aRow->AUD_TABLA . '',
                                '' . $aRow->AUD_DESCRIPCION . '',
                                '' . $aRow->AUD_IP . '',
                                '' . $aRow->AUD_USUARIO . '',
                                '' . $aRow->AUD_FECHAHORA . '');
}
echo json_encode($output);