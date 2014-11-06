<?php
session_start();
	/*
	 * Script:    DataTables server-side script for PHP and MySQL
	 * Copyright: 2014 - Willian Espinosa - Edicion Especial
	 */	

include_once '../../conexiones/db_local.inc.php';
    $dbmysql = new database();
    date_default_timezone_set('America/Bogota');
include_once( '../../conexiones/config_local.ini.php' );



		



global $dbmysql;
        $aColumns = array('CON_COD','VIP_COD','HOR_COD','CON_FECHA','CON_ESTADO','GAR_COD','VIS_COD','VIS_NOMBRE','VIS_APELLIDO','PAR_COD','VIS_CEDULA','VIS_DIRECCION','VIS_TELEFONO','VIS_CORREO','VIS_IMAGEN','VIS_ESTADO','PPL_COD','CEL_COD','PPL_NOMBRE','PPL_APELLIDO','PPL_CEDULA','PPL_IMG','PPL_ESTADO','CEN_COD');
	/* Campo de Index */
	$sIndexColumn = "CON_COD";
	/* Tabla a Usar */
	$sTable =  "sys_vw_control2";
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
	/* Individual column filtering */
//	for ( $i=0 ; $i<count($aColumns) ; $i++ )
//	{
//		if ( $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
//		{
//			if ( $sWhere == "" )
//			{
//				$sWhere = "WHERE ";
//			}
//			else
//			{
//				$sWhere .= " AND ";
//			}
//			$sWhere .= $aColumns[$i]." LIKE '%".mysql_real_escape_string($_GET['sSearch_'.$i])."%' ";
//		}
//	}
	/*
	 * SQL queries
	 * Get data to display
	 */
        $sWhere =($sWhere=='')?" WHERE VIS_ESTADO!='E' AND CEN_COD = ".$_SESSION['usu_centro_cod']."  ":$sWhere." AND VIS_ESTADO!='E' AND CEN_COD = ".$_SESSION['usu_centro_cod'];
	$sQuery = "
		SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , "," ", implode(",", $aColumns))."
		FROM   $sTable
		$sWhere
		$sOrder
		$sLimit";
	$rResult = mysql_query( $sQuery, $gaSql['link'] ) or die(mysql_error());
//	echo $sQuery;
	/* Data set length after filtering */
	$sQuery = "SELECT FOUND_ROWS()";
	$rResultFilterTotal = mysql_query( $sQuery, $gaSql['link'] ) or die(mysql_error());
	$aResultFilterTotal = mysql_fetch_array($rResultFilterTotal);
	$iFilteredTotal = $aResultFilterTotal[0];
        /***********************************/
        
            $sQuery = "SELECT COUNT(".$sIndexColumn.")
                        FROM   $sTable";
            $rResultTotal = mysql_query( $sQuery, $gaSql['link'] ) or die(mysql_error());
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
        $i=0;
        
	while ( $aRow = mysql_fetch_array( $rResult ) ){
                /* General output */
                    $nombre_visitante=utf8_encode($aRow[ 'VIS_NOMBRE' ].' '.$aRow[ 'VIS_APELLIDO' ]);
//                    $nombre_ppl =$aRow[ 'PPL_NOMBRE' ].' '.$aRow[ 'PPL_APELLIDO' ].$rowPDatosVisitante->VIS_COD;
                    $nombre_ppl =$aRow[ 'PPL_NOMBRE' ].' '.$aRow[ 'PPL_APELLIDO' ];
                    $estado=($aRow['VIS_ESTADO']=='A')?'<span class="label label-success"><i class="fa fa fa-check"></i>  Validado</span>':'<span class="label label-warning"><i class="fa fa-question-circle"></i>  No Validado</span>';
                    $btn=($aRow['VIS_ESTADO']=='N')?'<a class="btn btn-info" title="Actualizar" href="javascript:editarVisitante('.$aRow[ 'VIS_COD' ].','.$aRow[ 'PPL_COD' ].')"><i class="fa fa-pencil"></i> Editar Visitante</a>':'<a class="btn btn-success" title="Permitir acceso" href="javascript:permitirAcceso(\''.$nombre_visitante.'\','.$aRow[ 'VIP_COD' ].','.$aRow[ 'CON_COD' ].','.$aRow[ 'HOR_COD'].','.$aRow[ 'VIS_COD' ].')"><i class="fa fa-check"></i>Permitir Acceso</a>';
                    $output['aaData'][] =array( '<input type="hidden" class="codVisA2" id="cod_'.$aRow[ 'VIS_COD' ].'" name="codVisA2" value="'.$aRow[ 'VIS_COD' ].'">'.utf8_encode($aRow[ 'CON_COD' ]).'',
                    	                	''.utf8_encode($nombre_visitante).'',
                                                ''.utf8_encode($aRow[ 'VIS_CEDULA' ]).'',
                                                ''.utf8_encode($nombre_ppl).'',
                                                ''.$estado.'',
                                                ''.$btn.'
                                                    ');
        }
	echo json_encode( $output );
?>