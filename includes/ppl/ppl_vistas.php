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
                        <button id="agregarEvento" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoPpl();">
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
    $retval .=frmPpl();
//    $retval .=frmCentros();
    return $retval;
}
function frmPpl(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmPPLModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Formulario de Registro </h2>				
                                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-pabellon" class="smart-form" action="javascript:guardarPabellon()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDpabellon" name="IDpabellon">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label class="label">Nivel</label>
                                                                                <label class="select">
                                                                                        <select id="nivel" name="nivel">
                                                                                                <option value="0" selected="" disabled="">-- Niveles --</option>
                                                                                        </select> <i></i> 
                                                                                </label>
                                                                        </section>
                                                                        <section class="col col-6">
                                                                                <label class="label">Ala</label>
                                                                                <label class="input"> <i class="icon-append fa fa-user"></i>
                                                                                    <input type="text" id="ala" name="ala" placeholder="Ala">
                                                                                    <b class="tooltip tooltip-bottom-right">Ingese el Ala en el que se encuentra</b> 
                                                                                </label>
                                                                        </section>
                                                                    </div>
                                                                    <section>
                                                                            <label class="label">Descripción</label>
                                                                            <label class="input"> <i class="icon-append fa fa-envelope-o"></i>
                                                                                    <input type="text" id="descripcion" name="descripcion" placeholder="Descripción del Pabellon">
                                                                                    <b class="tooltip tooltip-bottom-right">Necesario para identificar el Pabellon</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="label">Capacidad</label>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="number" name="capacidad" placeholder="Capacidad Máxima" id="capacidad">
                                                                                    <b class="tooltip tooltip-bottom-right">Debe ingresar la Capacidad de PPL del Pabellon</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="label">Detalles</label>
                                                                            <label class="textarea"> <i class="icon-append fa fa-comment"></i>
                                                                                    <textarea id="detalles"  name="detalles" placeholder="Detalles del Pabellon"></textarea>
                                                                    </section>
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Registrar
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