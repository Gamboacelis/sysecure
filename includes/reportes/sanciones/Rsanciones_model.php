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
    $retval='<div class="botonesSuperiores">
                <fieldset>
                    <form action="includes/reportes/export_excel.php?nombre_archivo=Reporte_Sancionados" method="post" target="_blank" id="FormularioExportacion" style="display: inline-block;">
                        <a class="btn btn-default txt-color-green" href="javascript:exportarRsanciones();">
                            <i class="fa fa-table fa-lg"></i> Excel
                        </a>
                        <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form>
                </fieldset>
            </div>
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false" >
                        <header>
                                <span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
                                <h2>Reporte General</h2>
                        </header>
                        <div id="listaReporteSancionados">
                                <h2>Reporte de Sancionados entre el: '.$fdesde.' hasta el '.$fhasta.' </h2>
                                <table id="listaSanciones" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">ID</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Sanción</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Observaci&oacute;n</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha Inicio</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha fin</th>
                                    </tr>
                                </thead>
                                <tbody>';
                    $sql = "SELECT sa.*
                            FROM `sys_vw_sanciones` sa 
                            WHERE VSA_FECHA_INI BETWEEN '$fdesde' AND '$fhasta';";
                    $val = $dbmysql->query($sql);
                    while ($row = $val->fetch_object()){
                     $retval .='<tr>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VIS_COD.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VIS_NOMBRE.' '.$row->VIS_APELLIDO.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VIS_CEDULA.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->SAN_DESCRIPCION.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VSA_NOTA.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VSA_FECHA_INI.'</td>'
                             . '    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VSA_FECHA_FIN.'</td>'
                             . '</tr>';
                    }
                     $retval .='<tbody>
                            </table>
                            <i id="datosReporte_pie">Exportado: '.date('Y-m-d H:i').', por: '.$_SESSION['usu_usuario'].'</i>
                        </div>
                </div>
            </article>';
                     echo $retval;
}