<?php
session_start();
include_once PATH_PROD.SISTEM_NAME.'/includes/generales.php';
$clGeneral = new general();
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Guayaquil');

function reporte_auditoria() {
        $retval = '';
        $retval = '<article class="col-sm-12 col-md-12 col-lg-12">
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Auditoria del Centro '.$_SESSION["usu_centro_descrip"].' </h2>
                            </header>
                            <div>
                                <div class="jarviswidget-editbox">
                                </div>
                                <div class="widget-body no-padding">
                                    <div class="table-responsive">
                                        <table id="tablaAuditoria" class="table table-bordered table-striped table-hover">
                                            <thead>
                                                    <tr>
                                                            <th>Tipo</th>
                                                            <th>Tabla</th>
                                                            <th>Descripción</th>
                                                            <th>Dirección IP</th>
                                                            <th>Usuario</th>
                                                            <th>Fecha</th>
                                                    </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                    </div>
            </article>';
    return $retval;
}