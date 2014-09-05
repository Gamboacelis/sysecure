<?php
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function frm_revisarAcceso4() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="botonesSuperiores">
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de Visitas </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaAcceso4" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre Visitante</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula Visitante</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha Visita</th>
                                        <th><i class="fa fa-fw fa-clock-o  txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora de Ingreso</th>
                                        <th><i class="fa fa-fw fa-clock-o  txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora de Salida</th>
                                        <th><i class="fa fa-fw fa-dashboard txt-color-blue hidden-md hidden-sm hidden-xs"></i> Tiepo Transcurrido</th>
                                        <th><i class="fa fa-fw fa-credit-card txt-color-blue hidden-md hidden-sm hidden-xs"></i> Lugar Cédula</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Estado</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    
//    $retval .= frmBloqueoVisitante();
    return $retval;
}