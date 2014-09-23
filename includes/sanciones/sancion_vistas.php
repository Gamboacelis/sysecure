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

function revisarSanciones() {

    $retval = '';

    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">

                <div class="botonesSuperiores">



                </div>

                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">

                    <header>

                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>

                            <h2>Visitantes sancionados </h2>



                    </header>

                    <div>

                        <div class="widget-body no-padding">

                            <table id="listaSanciones" class="table table-striped table-bordered table-hover" width="100%">

                                <thead>

                                    <tr>

                                        <th>ID</th>

                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>

                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>

                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Sanción</th>

                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Estado</th>
                                        
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Observaci&oacute;n</th>

                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha Inicio</th>

                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Fecha fin</th>

                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>                                        



                                    </tr>

                                </thead>

                            </table>

                        </div>

                    </div>

            </div>

        </article>';

    $retval .= editSancion();    
    return $retval;
}

function editSancion() {

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

                                                        <h2>Asignar Sancion</h2>                

                                                </header>

                                                <div> 

                                                    <div class="widget-body no-padding">

                                                        <form id="smart-form-register" class="smart-form" action="javascript:guardarSancion()">


                                                            <fieldset>

                                                                    <input type="hidden" id="IDvisitante" name="IDvisitante">
                                                                    <input type="hidden" id="IDsancion" name="IDsancion">


                                                            </fieldset>

                                                            <fieldset>

                                                                <div class="row">

                                                                    <section class="col col-6">

                                                                            <label class="input" id="select_sancion">Tipo de sanci&oacute;n</label>

                                                                                <select id="sancion" name="sancion" onchange="seleccionSancion()" class="form-control">
                                                                                </select>
                                                                            

                                                                    </section>
                                                                    <section class="col col-6">

                                                                            <label class="input" id="select_sancion">Sanci&oacute;n</label>

                                                                                <select id="sancionItem"  name="sancionItem" onchange="seleccionTiempo()"  class="form-control">
                                                                                </select>
                                                                            

                                                                    </section>                                                                    

                                                                </div>
                                                                <div class="row">

                                                                    <section class="col col-6">

                                                                            <label class="input" id="tiempo_sancion">Dias de  sanci&oacute;n: <small></small></label>

                                                                            
                                                                            
    
                                                                   </section>
                                                         

                                                                </div>                                                                
                                                            </fieldset>

                                                            <footer>

                                                                    <button type="submit" class="btn btn-primary">

                                                                            Generar Sanción

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
