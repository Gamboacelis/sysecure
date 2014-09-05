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
    
    $retval .= frmFinalizaVisitante();
    return $retval;
}

function frmFinalizaVisitante(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmTerminarModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Finalizar Visita</h2>				
                                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-horarios" class="smart-form" action="javascript:guardarHorario()">
                                                            <header>Datos del Visitante</header>
                                                            <fieldset>
                                                                    <section class="col col-6">
                                                                            <label class="label">Imagen Visitante</label>
                                                                            <div id="imgPpl">
                                                                                <input id="imagPpl" name="imagPpl" type="hidden" />
                                                                                <img id="imagenPPL" alt="imagenPPL" src="img/avatars/male.png" class="img-thumbnail" style="width: 200px">
                                                                            </div>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                        <div class="row">
                                                                            <section class="col col-12">
                                                                                    <h1 id="txtSancion" class="text-danger">Visitante Sancionado</h1>
                                                                                    <h2 id="txtNombre" class="text-primary"></h2>
                                                                                    <h2 id="txtApellido" class="text-primary"></h2>
                                                                                    <h2 id="txtCedula"><strong></strong></h2>
                                                                                    <h4>Hora de Ingreso: <p id="txtHoraIng"></p></h4>
                                                                                    <h4>Hora de Salida: <p id="txtHoraSal"></p></h4>
                                                                            </section>
                                                                        </div>
                                                                    </section>
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Terminar visita
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