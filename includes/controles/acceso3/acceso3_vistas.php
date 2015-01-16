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
                            <h2>Listado de Visitantes a PPLs </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaAcceso3" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre Visitante</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula Visitante</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> PPL</th>
                                       <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i>Accion</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .= '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="botonesSuperiores">
                        <fieldset>
                            <button id="agregarPabellon" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:crearVisitanteFuncionario()">
                                <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                                Agregar Visitante a Funcionario
                            </button>
                        </fieldset>
                    </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de Visitantes a Funcionarios </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaAccesoFuncionarios3" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre Visitante</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula Visitante</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Funcionario</th>
                                       <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i>Accion</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    
    $retval .= frmBloqueoVisitante();
    $retval .= frmmostrarCedula();
    $retval .= frmVisitanteFuncionario();
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

function frmmostrarCedula() {

    $retval = '';
    $retval = '<div class="modal fade" id="frmCedulaModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" id="closeModalCedula" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
                                <header>
                                        <h1>Lugar de Almacenamiento de la Cédula</h1>	
                                        <h4 id="txtCedula"></h4>
                                </header>
                                <div>
                                    <div id="verlugarCedula"></div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>';

    return $retval;

}

function frmVisitanteFuncionario(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmVisitaFuncionarioModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" id="closeModalCedula" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
                                 <header>
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Formulario de Registro </h2>				
                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="form-visitante-funcionario" class="smart-form" action="javascript:guardarVisitanteFuncionario()">
                                                                    <input type="hidden" id="IDvisitantef" name="IDvisitantef">
                                                            <fieldset>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Número de Cédula:</label>
                                                                            <label class="input">
                                                                                <input type="number" id="cedulaf" name="cedulaf" placeholder="Número de Cédula">
                                                                            </label>
                                                                    </section>
                                                                </div>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Nombre:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="nombref" name="nombref" placeholder="Nombre">
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label>Apellido:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="apellidof" name="apellidof" placeholder="Apellido">
                                                                            </label>
                                                                    </section>
                                                                </div>
                                                                    <section>
                                                                            <label>Funcionario:</label>
                                                                            <label class="input">
                                                                                    <input type="text" id="funcionario" name="funcionario" placeholder="Nombre y Apellido del Funcionario">
                                                                            </label>
                                                                    </section>
                                                                
                                                                    <section>
                                                                            <label>Razón de la Visita:</label>
                                                                            <label class="textarea">
                                                                                <textarea placeholder="Razón de la Visita" name="razon"  id="razon" rows="3"></textarea>
                                                                            </label>
                                                                    </section>
                                                                    <div class="row">
                                                                    <section class="col col-6">
                                                                        <label>Teléfono:</label>
                                                                        <label class="input">
                                                                            <input type="telf" id="telefonof" name="telefonof" placeholder="Teléfono Celular">
                                                                        </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="input">
                                                                                    <label>Correo Electrónico:</label>
                                                                                    <input type="telf" id="correof" name="correof" placeholder="Correo Electrónico" style="text-transform:lowercase;">
                                                                            </label>
                                                                    </section>
                                                                </div>     
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label>Dirección:</label>
                                                                            <label class="input">
                                                                                    <input type="telf" id="direccionf" name="direccionf" placeholder="Direccion" style=" width: 527px; ">
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