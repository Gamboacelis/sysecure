<?php
 

session_start();

date_default_timezone_set('America/Bogota');

include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';

$dbmysql = new database();

$modulos = isset($_GET['modulo']) ? $_GET['modulo'] : 'ninguno';

switch ($modulos) {

    case 'revisarPpl':

        revisarPpl();

        break;
}


function revisarTraspasoPpl() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10" id="viewPPL">

                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de PPL </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaPplTraspaso" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Imagen</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Estado</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .=aplicarTraspaso();
        return $retval;
}
function aplicarTraspaso(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmAplicarTraspaso" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Realizar Traspaso de PPL</h2>                
                                                </header>
                                                <div> 
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-register" class="smart-form" action="javascript:guardarTraspaso()">
                                                            <fieldset>
                                                                    <input type="hidden" id="IDppl" name="IDppl">
                                                            </fieldset> 
                                                            <fieldset>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="input" id="pabellonActual"> </label>
                                                                    </section>                                                                    
                                                                </div>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="input" id="tiempo_sancion"><strong>Pabellon a transferir:</strong></label>
                                                                                <select id="nuevoPabellon"  name="nuevoPabellon" onchange="transferirApabellon()"  class="form-control">
                                                                                </select>                                                                            
                                                                   </section>
                                                                </div>      
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="input" >Motivo del traspaso</label>
                                                                            <textarea rows="4" cols="50" class="form-control" id="motivo" name="motivo"></textarea>
                                                                   </section>
                                                                </div>                                                                                                                                  
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Transferir
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

