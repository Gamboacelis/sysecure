<?php
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function revisarPpl() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                <div class="botonesSuperiores">
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de PPL </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaAcceso1" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellon</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Estado</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .=frmVisitas();
    $retval .=frmVisitante2();
    return $retval;
}
function frmVisitas(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmVisitasModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Lista de Visitantes Permitidos </h2>				
                                                </header>
                                                <div>
                                                    <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2" data-widget-editbutton="false">
                                                        <header>
                                                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                            <h2>Visitantes notificados por el PPL</h2>
                                                        </header>
                                                        <div>
                                                            <div class="jarviswidget-editbox">
                                                            </div>
                                                            <div class="widget-body no-padding">
                                                                        <div id="tablaVisitantes" class="table-responsive">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                        </div>
                    </div>
                </div>';
    return $retval;
    
}
function frmVisitante2() { 
    $retval = '';
    $retval = '<div class="modal fade" id="frmVisitanteModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="form-visitante" class="smart-form" action="javascript:guardarVisitante(2)">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDvisitante" name="IDvisitante">
                                                                    <input type="hidden" id="IDvisPpl" name="IDvisPpl">
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="row">
                                                                    <section class="col-md-2" style="width:50%;text-align:center;" >
                                                                        <label class="input">Foto:</label>
                                                                        <div id="my_camera" >asas</div>
                                                                        <a id="botonCamara" class="btn btn-danger btn-xs" href="javascript:tomarFoto()"><i class="fa fa fa-camera"></i> Tomar Foto</a>
                                                                        
                                                                        <input type="hidden" id="codeImage" name="codeImage">
                                                                    </section>
                                                                    <section class="col-md-2" style="width:50%;text-align:center;">
                                                                        <label class="input">Foto Actual:</label>
                                                                        <div id="my_result"></div> 
                                                                    </section>
                                                                </div>    
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Número de Cédula:</label>
                                                                            <label class="input">
                                                                                    <input type="telf" id="cedula" name="cedula" placeholder="Número de Cédula">
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label>Huella Dactilar:</label>
                                                                            <label class="input">
                                                                                    <input type="telf" id="huella" name="huella" placeholder="Codigo de Huella">
                                                                            </label>
                                                                    </section>
                                                                </div>
                                                                    <section id="encuentraCedula">
                                                                        <div class="alert alert-success fade in">
                                                                            <button class="close" data-dismiss="alert"> × </button>
                                                                            <i class="fa-fw fa fa-check"></i>
                                                                            <strong>Satisfactorio</strong>
                                                                            El número de Cédula si existe con los siguientes datos:
                                                                        </div>
                                                                    </section>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Nombre:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre">
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label>Apellido:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="apellido" name="apellido" placeholder="Apellido">
                                                                            </label>
                                                                    </section>
                                                                </div>
                                                                    <section>
                                                                            <label>PPL:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="nombrePpl" name="nombrePpl" placeholder="Nombre PPL"  disabled="disabled">
                                                                            </label>
                                                                    </section>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Parentesco:</label>
                                                                            <label class="select">
                                                                                    <select id="parentesco" name="parentesco" class="form-control"></select>
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                        <label>Teléfono:</label>
                                                                        <label class="input">
                                                                            <input type="telf" id="telefono" name="telefono" placeholder="Teléfono Celular">
                                                                        </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="input">
                                                                                    <label>Correo Electrónico:</label>
                                                                                    <input type="telf" id="correo" name="correo" placeholder="Correo Electrónico" style="text-transform:lowercase;">
                                                                            </label>
                                                                    </section>
                                                                </div>     
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Dirección:</label>
                                                                            <label class="input">
                                                                                    <input type="telf" id="direccion" name="direccion" placeholder="Direccion" style=" width: 527px; ">
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