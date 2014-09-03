<?php
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function frm_revisarAcceso3() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="botonesSuperiores">
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de PPL </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaAcceso3" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Foto Visitante</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre Visitante</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula Visitante</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> PPL</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Foto PPL</th>
                                       <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i>Accion</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    
    $retval .= frmBloqueoVisitante();
    return $retval;
}



function frmBloqueoVisitante() {

    $retval = '';

    $retval = '<div class="modal fade" id="frmBloqueoModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">

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

                                                        <h2>Formulario de Bloqueo </h2>				

                                                </header>

                                                <div>

                                                    <div class="widget-body no-padding">

                                                        <form id="smart-form-register" class="smart-form" action="javascript:guardarVisitante()">

                                                            <header>

                                                                    Formulario de Registro

                                                            </header>

                                                            <fieldset>

                                                                    <input type="hidden" id="IDvisitante" name="IDvisitante">





                                                            </fieldset>

                                                            <fieldset>

                                                                <div class="row">

                                                                    <section class="col col-6">

                                                                            <label class="input">

                                                                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre">

                                                                            </label>

                                                                    </section>

                                                                    <section class="col col-6">

                                                                            <label class="input">

                                                                                    <input type="text" id="apellido" name="apellido" placeholder="Apellido">

                                                                            </label>

                                                                    </section>

                                                                </div>

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
