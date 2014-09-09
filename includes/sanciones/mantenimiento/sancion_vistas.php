<?php
session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
$modulos = isset($_GET['modulo']) ? $_GET['modulo'] : 'ninguno';
switch ($modulos) {
    case 'revisarSanciones':
        revisarSanciones();
        break;
}

function revisarTipoSanciones() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                <div class="botonesSuperiores">
                    <fieldset>
                        <button id="agregarEvento" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoTipoSancion()">
                            <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                            Agregar Tipo Sanci&oacute;n
                        </button>
                    </fieldset>
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Tipo de sanciones </h2>
                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaTipoSanciones" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-exclamation-triangle txt-color-blue hidden-md hidden-sm hidden-xs"></i> Tipo de Sancion</th>
                                        <th><i class="fa fa-fw fa-exclamation-triangle txt-color-blue hidden-md hidden-sm hidden-xs"></i> Accion</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';

    $retval .= editTipoSancion();
    $retval .= frmSanciones();
    return $retval;
}

function editTipoSancion() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmTipoSancion" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
                                                <header>
                                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                                        <h2>Editar Tipo de Sanci&oacute;n</h2>                
                                                </header>
                                                <div> 
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-register" class="smart-form" action="javascript:guardarTipoSancion()">
                                                            <fieldset>
                                                                    <input type="hidden" id="IDtipoSancion" name="IDtipoSancion">
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="input" id="select_sancion">Tipo de sanci&oacute;n</label>
                                                                            <input id="tipoSancion" name="tipoSancion" class="form-control">
                                                                   </section>
                                                                </div>                                                                
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Registrar Tipo de Sanci&oacute;n
                                                                    </button>
                                                            </footer>
                                                        </form>                     
                                                </div>
                                            </div>
                                        </div>
                                </div>
                        </div>
                    </div>
                </div>';

    return $retval;
}

function frmSanciones() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmSancionesModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
                                                <header>
                                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                                        <input type="hidden" id="IDtipoSancion1" name="IDtipoSancion1">
                                                </header>
                                                <div>
                                                    <div class="widget-body">
                                                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div id="wid-id-4" class="jarviswidget jarviswidget-color-darken" data-widget-editbutton="false" style="" role="widget" data-widget-attstyle="jarviswidget-color-teal">
                                                                <header>
                                                                        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                                        <h2>Listado de Sanciones <spam id="totalSeleccionados"></spam></h2>
                                                                        <div class="widget-toolbar">
                                                                            <div class="btn-group">
                                                                                    <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevaSancion()">
                                                                                        <i class="fa fa-fw fa-plus"></i>  Agregar Sanci&oacute;n
                                                                                    </button>
                                                                            </div>
                                                                        </div>
                                                                </header>
                                                                <div>
                                                                    <div class="widget-body no-padding">
                                                                        <div class="table-responsive">
                                                                            <table id="listaSanciones" class="table table-bordered table-striped table-condensed table-hover smart-form has-tickbox" style="text-align:center">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th><i class="fa fa-check"></i><input type="hidden" id="IDpplNew" name="IDpplNew"></th>
                                                                                        <th><i class="fa fa-user"></i> Sanci&oacute;n</th>
                                                                                        <th><i class="fa fa-user"></i> d&iacute;as</th>
                                                                                        <th><i class="fa fa-user"></i> Acciones</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            
                        </div>
                    </div>
                </div>';
    return $retval;
}
