<?php

session_start();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'reporteHorarios':
        reporteHorarios();
        break;
    case 'comboPabellonesR':
        comboPabellonesR();
        break;
}

function reporteHorarios() {
    global $dbmysql;
    $nivel = $_POST['nivel'];
    $pabellon=$_POST['pabellon'];
    $centro=$_SESSION['usu_centro_cod'];
    $retval='';
    $pab=($pabellon!='')?" AND p.PAB_COD=".$pabellon:'';
    $sql = "SELECT pab.CEN_COD,p.`PPL_COD`,e.NVL_COD, e.NVL_DESCRIPCION,p.`PAB_COD`,pab.PAB_DESCRIPCION,pab.PAB_ALA,p.`PPL_NOMBRE`,p.`PPL_APELLIDO`,p.`PPL_CEDULA`,p.`PPL_NACIONALIDAD`
                            FROM `sys_ppl` p, `sys_etapas` e, `sys_pabellones` pab
                            WHERE e.NVL_COD=pab.NVL_COD AND pab.`PAB_COD`=p.`PAB_COD` AND pab.CEN_COD=$centro AND e.NVL_COD= $nivel $pab;";
    $val = $dbmysql->query($sql);
    if($val->num_rows>0){
        $retval ='<div class="botonesSuperiores">
                    <fieldset>
                        <form action="includes/reportes/export_excel.php?nombre_archivo=Reporte_Horarios" method="post" target="_blank" id="FormularioExportacionHorarios" style="display: inline-block;">
                            <a class="btn btn-default txt-color-green" href="javascript:exportarHorarios();">
                                <i class="fa fa-table fa-lg"></i> Excel
                            </a>
                            <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                        </form>
                    </fieldset>
                </div>';
    }
    $retval .='<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false" >
                        <header>
                                <span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
                                <h2>Reporte General</h2>
                        </header>
                        <div id="listaReporte">
                                <h2>Reporte de Horarios por Nivel </h2>
                                <table id="listaHorarios" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nivel</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellon</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Ala</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cedula</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nacionalidad</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Horarios</th>
                                    </tr>
                                </thead>
                                <tbody>';
                    
                    $val = $dbmysql->query($sql);
                    while ($row = $val->fetch_object()){
                     $retval .='<tr>
                                    <td>'.$row->NVL_DESCRIPCION.'</td>
                                    <td>'.$row->PAB_DESCRIPCION.'</td>
                                    <td>'.$row->PAB_ALA.'</td>
                                    <td>'.$row->PPL_NOMBRE.' '.$row->PPL_APELLIDO.'</td>
                                    <td tyle="mso-number-format:\'0\';">'.$row->PPL_CEDULA.'</td>
                                    <td>'.$row->PPL_NACIONALIDAD.'</td>
                                    <td>'.consultahijo($row->PAB_COD).'</td>
                                </tr>';
                    }
                     $retval .='</tbody>
                            </table>
                            <i id="datosReporte_pie">Exportado: '.date('Y-m-d H:i').', por: '.$_SESSION['usu_usuario'].'</i>
                        </div>
                </div>
            </article>';
                     $retval .= reporteHorariosExcel($nivel,$pabellon);
                     echo $retval;
}

function consultahijo($pabellon){
    global $dbmysql;
     $retval ='';
    $sql2 = "SELECT h.`HOR_COD`,h.`PAB_COD`,h.`TPV_COD`, th.TPV_DESCRIPCION, h.`HOR_DESCRIPCION`,h.`HOR_DIAS`,h.`HOR_HORA_ING`,h.`HOR_HORA_SAL`,h.`HOR_ESTADO` FROM `sys_horarios` h, `sys_tipovisita` th WHERE h.`TPV_COD`=th.`TPV_COD` AND h.`HOR_ESTADO`='A' AND `PAB_COD` = $pabellon";
    $val2 = $dbmysql->query($sql2);
    if($val2->num_rows>0){
                        $retval .='<table class="table table-striped table-bordered table-hover tablehijoReporte" width="100%">
                                        <thead>
                                            <tr class="txtHorariosHijo">
                                                <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">Dias</th>
                                                <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">Hora Ingreso</th>
                                                <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">Hora Salida</th>
                                                <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;">Tipo Visita</th>
                                            </tr> 
                                        </thead>
                                        <tbody>';
                            while ($row2 = $val2->fetch_object()){
                            $retval .='<tr>
                                           <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row2->HOR_DIAS.'</td>
                                           <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row2->HOR_HORA_ING.'</td>
                                           <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row2->HOR_HORA_SAL.'</td>
                                           <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row2->TPV_DESCRIPCION.'</td>
                                       </tr>';

                            }
                        $retval .='</tbody>
                                    </table>';
                    }else{
                        $retval .='<i style="color:red;">No tiene horarios</i>';
                    }
    
    return $retval;
}

function reporteHorariosExcel($nivel,$pabellon) {
    global $dbmysql;
//    $nivel = $_POST['nivel'];
    $pab=($pabellon!='')?" AND p.PAB_COD=".$pabellon:'';
    $centro=$_SESSION['usu_centro_cod'];
    $retval='';
    $retval='<div id="listaReporteHorarios">
                                <h2>Reporte de Horarios por Nivel </h2>
                                <table id="listaHorariosExcel" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nivel</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellon</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Ala</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cedula</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nacionalidad</th>
                                        <th style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;border-top:dotted #999999 1px;"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Horarios</th>
                                    </tr>
                                </thead>
                                <tbody>';
                        
                        $sql = "SELECT pab.CEN_COD,p.`PPL_COD`,e.NVL_COD, e.NVL_DESCRIPCION,p.`PAB_COD`,pab.PAB_DESCRIPCION,pab.PAB_ALA,p.`PPL_NOMBRE`,p.`PPL_APELLIDO`,p.`PPL_CEDULA`,p.`PPL_NACIONALIDAD`
                                                FROM `sys_ppl` p, `sys_etapas` e, `sys_pabellones` pab
                                                WHERE e.NVL_COD=pab.NVL_COD AND pab.`PAB_COD`=p.`PAB_COD` AND pab.CEN_COD=$centro AND e.NVL_COD= $nivel $pab;";
                        $val = $dbmysql->query($sql);
                    while ($row = $val->fetch_object()){
                     $retval .='<tr>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->NVL_DESCRIPCION.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PAB_DESCRIPCION.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PAB_ALA.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PPL_NOMBRE.' '.$row->PPL_APELLIDO.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PPL_CEDULA.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.$row->PPL_NACIONALIDAD.'</td>
                                    <td style="border-bottom:dotted #999999 1px;border-right:dotted #999999 1px;">'.consultahijo($row->PAB_COD).'</td>
                                </tr>';
                    }
                     $retval .='</tbody>
                            </table>
                            <i id="datosReporte_pie">Exportado: '.date('Y-m-d H:i').', por: '.$_SESSION['usu_usuario'].'</i>
                        </div>';
                     return $retval;
}

function comboPabellonesR(){
    global $dbmysql;
    $nivel=$_POST['nivel'];
    $retval='';
    $retval='<label>Pabellón:</label>
             <label class="select">
                <select id="pabellon" name="pabellon">
                        <option disabled="" selected="" value="0">-- Selccione --</option>
                        <option value=""> TODOS </option>
                        '.pabellones($nivel).'
                </select>
            </label>';
    echo $retval;
}

function pabellones($nivel){
    global $dbmysql;
    $retval = '';
    $centro=$_SESSION['usu_centro_cod'];
    $sql = "SELECT * FROM  `sys_pabellones` WHERE CEN_COD=$centro AND NVL_COD = $nivel;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAB_COD . '">' . $row->PAB_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}