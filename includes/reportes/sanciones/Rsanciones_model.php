<?php

session_start();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'reporteSancion':
        reporteSancion();
        break;
}

function reporteSancion() {
    global $dbmysql;
    $fdesde = $_POST['fdesde'];
    $fhasta = $_POST['fhasta'];
    $mesInicio=01;
    $mesFin=date('m');
    $anio=date('Y');
    
//    $lista = array(
//        "MES_INICIO" => $mesInicio,
//        "MES_FIN" => $mesFin,
//        "ANIO" => $anio,
//        "items" => array());
//    $sql = "SELECT COUNT(sa.VSA_FECHA_INI) AS contador,YEAR(sa.VSA_FECHA_INI) AS ano,MONTH(sa.VSA_FECHA_INI) AS mes
//            FROM `sys_vw_sanciones` sa 
//            WHERE VSA_FECHA_INI BETWEEN '$fdesde' AND '$fhasta'
//            GROUP BY YEAR(sa.VSA_FECHA_INI), MONTH(sa.VSA_FECHA_INI)
//            ORDER BY YEAR(sa.VSA_FECHA_INI), MONTH(sa.VSA_FECHA_INI) ASC;";
//    $val = $dbmysql->query($sql);
//    while ($row = $val->fetch_object()){
//        $lista['items'][] =array(
//            "MES" => $row->mes,
//            "ANO" => $row->ano,
//            "CONTADOR" => $row->contador,
//        );
//    }
    $retval='<div class="botonesSuperiores">
                <fieldset>
                    <a class="btn btn-default txt-color-green" href="javascript:void(0);">
                        <i class="fa fa-table fa-lg"></i> Excel
                    </a>
                    <a class="btn btn-default txt-color-green" href="javascript:void(0);">
                        <i class="fa fa-file fa-lg"></i> Pdf
                    </a>
                </fieldset>
            </div>
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false">
                        <header>
                                <span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
                                <h2>Bar Graph </h2>
                        </header>
                        <div>
                                <table id="listaSanciones" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Sanción</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Observaci&oacute;n</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha Inicio</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha fin</th>
                                    </tr>
                                </thead>
                                <tbody>';
                    $sql = "SELECT sa.*
                            FROM `sys_vw_sanciones` sa 
                            WHERE VSA_FECHA_INI BETWEEN '$fdesde' AND '$fhasta';";
                    $val = $dbmysql->query($sql);
                    while ($row = $val->fetch_object()){
                     $retval .='<tr>'
                             . '    <td>'.$row->VIS_COD.'</td>'
                             . '    <td>'.$row->VIS_NOMBRE.' '.$row->VIS_APELLIDO.'</td>'
                             . '    <td>'.$row->VIS_CEDULA.'</td>'
                             . '    <td>'.$row->SAN_DESCRIPCION.'</td>'
                             . '    <td>'.$row->VSA_NOTA.'</td>'
                             . '    <td>'.$row->VSA_FECHA_INI.'</td>'
                             . '    <td>'.$row->VSA_FECHA_FIN.'</td>'
                             . '</tr>';
                    }
                     $retval .='<tbody>
                            </table>
                        </div>
                </div>
            </article>';
//    print_r($lista);
//    echo $encode = json_encode($lista);
                     echo $retval;
}