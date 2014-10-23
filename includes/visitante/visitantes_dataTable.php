<?php
session_start();
/*
 * Script:    DataTables server-side script for PHP and MySQL
 * Copyright: 2014 - Willian Espinosa - Edicion Especial
 */

include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
include_once( '../conexiones/config_local.ini.php' );
global $dbmysql;

$aColumns = array('VIS_COD', 'VIS_NOMBRE', 'VIS_APELLIDO', 'VIS_CEDULA', 'VIS_DIRECCION', 'VIS_TELEFONO', 'VIS_ESTADO','PPL_COD','PPL_NOMBRE','PPL_APELLIDO','PAB_DESCRIPCION','PAR_DESCRIPCION','CEN_COD');
/* Campo de Index */
$sIndexColumn = "VIS_COD";
/* Tabla a Usar */
$sTable = "sys_vw_visitante";
/* Conexion a la Base */
$gaSql['link'] =  mysql_pconnect( HOST_NAME, USER_NAME, USER_PASSWD  ) or
		die( 'Could not open connection to server' );
            mysql_select_db( DB_NAME, $gaSql['link'] ) or 
		die( 'Could not select database'. DB_NAME );
	$sLimit = "";
	if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
	{
		$sLimit = "LIMIT ".mysql_real_escape_string( $_GET['iDisplayStart'] ).", ".
			mysql_real_escape_string( $_GET['iDisplayLength'] );
	}
	/*
	 * Ordenamiento
	 */
	if ( isset( $_GET['iSortCol_0'] ) )
	{
		$sOrder = "ORDER BY  ";
                
		for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
		{
			if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
			{
				$sOrder .= $aColumns[ intval( $_GET['iSortCol_'.$i] ) ]."
				 	".mysql_real_escape_string( $_GET['sSortDir_'.$i] ) .", ";
                                
			}
		}
//		
		$sOrder = substr_replace( $sOrder, "", -2 );
		if ( $sOrder == "ORDER BY USU_COD" )
		{
			$sOrder = "ORDER BY USU_COD DESC";
		}
	}
        
	/* 
	 * Filtering
	 */
	$sWhere = "";
	if ( $_GET['sSearch'] != "" )
	{
		$sWhere = "WHERE (";
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			$sWhere .= $aColumns[$i]." LIKE '%".mysql_real_escape_string( $_GET['sSearch'] )."%' OR ";
		}
		$sWhere = substr_replace( $sWhere, "", -3 );
		$sWhere .= '  )';
	}
	/*
	 * SQL queries
	 * Get data to display
	 */
$condicion = "AND CEN_COD = ".$_SESSION['usu_centro_cod'];	
$sWhere = ($sWhere == '') ? ' WHERE VIS_ESTADO != "E" '.$condicion : $sWhere.' AND VIS_ESTADO != "E" '.$condicion;
$sQuery = "SELECT SQL_CALC_FOUND_ROWS " . str_replace(" , ", " ", implode(",", $aColumns)) . "
		FROM   $sTable
		$sWhere
		$sOrder
		$sLimit";
$rResult = mysql_query($sQuery, $gaSql['link']) or die(mysql_error());

//	echo $sQuery;

/* Data set length after filtering */
$sQuery = "SELECT FOUND_ROWS()";
$rResultFilterTotal = mysql_query($sQuery, $gaSql['link']) or die(mysql_error());
$aResultFilterTotal = mysql_fetch_array($rResultFilterTotal);
$iFilteredTotal = $aResultFilterTotal[0];

/* * ******************************** */

$sQuery = "SELECT COUNT(" . $sIndexColumn . ")
                        FROM   $sTable";
$rResultTotal = mysql_query($sQuery, $gaSql['link']) or die(mysql_error());
$aResultTotal = mysql_fetch_array($rResultTotal);
$iTotal = $aResultTotal[0];

$output = array(
    "sEcho" => intval($_GET['sEcho']),
    "iTotalRecords" => $iTotal,
    "iTotalDisplayRecords" => $iFilteredTotal,
    "aaData" => array());

/*

 * Output

 */

$i = 0;




while ($aRow = mysql_fetch_array($rResult)) {

    /* General output */
    $nombreppl= $aRow['PPL_NOMBRE'] . ' ' . $aRow['PPL_APELLIDO'];
    $nombre = $aRow['VIS_NOMBRE'] . ' ' . $aRow['VIS_APELLIDO'];
    $cadenaParametros = utf8_encode($aRow['VIS_COD'] . ',' . "'$nombre'");
    //'VIS_COD', 'VIS_NOMBRE', 'VIS_APELLIDO', 'VIS_CEDULA', 'VIS_DIRECCION', 'VIS_TELEFONO', 'VIS_ESTADO'
    switch ($aRow['VIS_ESTADO']) {
        case 'S':
            $estado='<span class="label label-danger">Sancionado</span>';
            break;
        case 'N':
            $estado='<span class="label label-warning"><i class="fa fa-question-circle"></i>  No Validado</span>';
            break;
        default:
            $estado='<span class="label label-success"><i class="fa fa fa-check"></i>  Validado</span>';
            break;
    }
    $output['aaData'][] = array('' . utf8_encode($aRow['VIS_COD']) . '',
        '' . utf8_encode($nombre) . '',
        '' . utf8_encode($aRow['VIS_CEDULA']) . '',
        '' . utf8_encode($aRow['VIS_TELEFONO']) . '',
        '' . utf8_encode($aRow['PAR_DESCRIPCION']).'',
        '' . utf8_encode($nombreppl) . '',
        '<div style="text-align:center;"><span class="badge bg-color-blue">'.$aRow['PAB_DESCRIPCION'].'</span></div>',
        ''.$estado.'',
        '<a class="btn btn-primary" title="Editar Visitante" href="javascript:editarVisitante(' . $aRow['VIS_COD'] . ', ' . $aRow['PPL_COD'] . ')">
            <i class="fa fa-pencil"></i> Editar
        </a>');
}
echo json_encode($output);

//ALTER  VIEW `sys_vw_visitante` AS select `vp`.`VIP_COD` AS `VIP_COD`,`vp`.`PPL_COD` AS `PPL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PAB_COD` AS `PAB_COD`,`pab`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`vp`.`PAR_COD` AS `PAR_COD`,`par`.`PAR_DESCRIPCION` AS `PAR_DESCRIPCION`,`v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`pab`.`CEN_COD` AS `CEN_COD` from ((((`sys_visitante` `v` join `sys_visitante_ppl` `vp` on((`v`.`VIS_COD` = `vp`.`VIS_COD`))) join `sys_ppl` `p` on((`p`.`PPL_COD` = `vp`.`PPL_COD`))) join `sys_parentesco` `par` on((`par`.`PAR_COD` = `vp`.`PAR_COD`))) join `sys_pabellones` `pab` on((`pab`.`PAB_COD` = `p`.`PAB_COD`))) where (`v`.`VIS_ESTADO` <> 'E');
?>