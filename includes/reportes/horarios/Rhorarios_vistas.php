<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function reporteHorarios() {
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
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="select">
                                                    <select id="nivel" name="nivel" placeholder="Niveles">
                                                            <option disabled="" selected="" value="0">-- Selccione --</option>
                                                            '.niveles().'
                                                    </select>
                                            </label>
                                        </div>
                                       
                                    </div>
                                </fieldset>
                                <fieldset style="text-align: center;">
                                    <a class="btn btn-success" href="javascript:reporteHorarios();">
                                        <i class="fa fa-check"></i>
                                        Consultar
                                    </a>
                                </fieldset>
                            </form>
                        </div>
                        <div id="muestraReporteHorarios">
                            
                        </div>
                    </div>
                </div>';
    $retval .= '</article>';
    return $retval;
}

function niveles(){
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM  `sys_etapas`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->NVL_COD . '">' . $row->NVL_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}