<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function reporteHorPab() {
    $retval = '';
    $retval ='<article class="col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
                    <header>
                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                        <h2>Reporte de Horarios de PPL</h2>
                    </header>
                    <div>
                        <div class="widget-body">
                            <form class="smart-form">
                                <fieldset>
                                        <div class="col-sm-4">
                                            <label>Pabellones:</label>
                                            <label class="select">
                                                    <select id="pabellon" name="pabellon">
                                                            <option disabled="" selected="" value=""> Mostrar Todos </option>
                                                            '.pabellonesVista().'
                                                    </select>
                                            </label>
                                        </div>
                                        
                                </fieldset>
                                <footer class="btnConsultaReport" style="text-align: center;">
                                    <div >
                                        <a class="btn btn-success" href="javascript:reporteHorPab();">
                                            <i class="fa fa-check"></i>
                                            Consultar
                                        </a>
                                    </div>
                                </footer>
                            </form>
                        </div>
                        <div id="muestraReporteHorPab">
                            
                        </div>
                    </div>
                </div>';
    $retval .= '</article>';
    return $retval;
}
function pabellonesVista(){
    global $dbmysql;
    $retval = '';
    $centro=$_SESSION['usu_centro_cod'];
    $sql = "SELECT * FROM  `sys_pabellones` WHERE CEN_COD=$centro;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAB_COD . '">' . $row->PAB_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}