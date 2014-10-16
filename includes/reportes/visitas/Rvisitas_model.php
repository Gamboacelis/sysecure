<?php

session_start();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'reporteVisitas':
        reporteVisitas();
        break;
}

function reporteVisitas() {
    global $dbmysql;
    $fdesde = $_POST['fdesde'];
    $fhasta = $_POST['fhasta'];
    $mesInicio=01;
    $mesFin=date('m');
    $anio=date('Y');
    $retval='<div class="botonesSuperiores">
                <fieldset>
                    <form action="includes/reportes/export_excel.php?nombre_archivo=Reporte_Visitas" method="post" target="_blank" id="FormularioExportacionVisitas" style="display: inline-block;">
                        <a class="btn btn-default txt-color-green" href="javascript:exportarVisitas();">
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
                        <div id="listaReporteVisitas">
                                <h2>Reporte de Sancionados entre el: '.$fdesde.' hasta el '.$fhasta.' </h2>
                                <table id="listaSanciones" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">Id</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Código</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha de visita</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora de ingreso</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora de salida</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre visitante</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula visitante</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellón</th>                                        
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre de PPL</th>                                        
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula PPL</th>                                        

                                    </tr>
                                </thead>
                                <tbody>';
    
    $sql = "SELECT vi.`VISG_COD`, vi.`VISG_FECHA`, vi.`VISG_HORA_INGRESO`, vi.`VISG_HORA_SALIDA` ,v.`VIS_COD`, v.`VIS_NOMBRE`, v.`VIS_APELLIDO`, v.`VIS_CEDULA`, v.`VIS_ESTADO`, p.`PPL_COD`, p.`PAB_COD`, pa.`PAB_DESCRIPCION`, p. `PPL_NOMBRE`, p.`PPL_APELLIDO`, p.`PPL_CEDULA`, p.`PPL_ESTADO` FROM `sys_visitas` vi , `sys_visitante` v , `sys_ppl` p, `sys_visitante_ppl` vp , `sys_pabellones` pa WHERE vi.`VIP_COD`= vp.`VIP_COD` and v.`VIS_COD` = vp.`VIS_COD` and p.`PPL_COD` = vp.`PPL_COD`and p.`PAB_COD` = pa.`PAB_COD` and vi.`VISG_FECHA` BETWEEN '$fdesde' and '$fhasta' order by vi.`VISG_COD` desc ";
    $val = $dbmysql->query($sql);
    while ($row = $val->fetch_object()){
        $retval .='<tr>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VISG_COD.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VISG_FECHA.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VISG_HORA_INGRESO.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VISG_HORA_SALIDA.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VIS_NOMBRE." ".$row->VIS_APELLIDO.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->VIS_CEDULA.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PAB_DESCRIPCION.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PPL_NOMBRE." ".$row->PPL_APELLIDO.'</td>'
            .'    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PPL_CEDULA.'</td>'
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