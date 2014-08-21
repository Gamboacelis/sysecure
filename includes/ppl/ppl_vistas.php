<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function revisarPpl() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                <div class="botonesSuperiores">
                    <fieldset>
                        <button id="agregarEvento" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoUsuario()">
                            <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                            Agregar PPL
                        </button>
                    </fieldset>
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de PPL </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaPpl" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Imagen</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
//    $retval .=frmUsuario();
//    $retval .=frmCentros();
    return $retval;
}
