<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
$modulos = isset($_GET['modulo']) ? $_GET['modulo'] : 'ninguno';
switch ($modulos) {
    case 'revisarUsuarios':
        revisarUsuarios();
        break;
}

function revisarUsuarios() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                <div class="botonesSuperiores">
                    <fieldset>
                        <button id="agregarEvento" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoUsuario()">
                            <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                            Agregar Usuario
                        </button>
                    </fieldset>
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Usuarios del Sistema </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaUsuarios" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Usuario</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> E-Mail</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Tipo Usuario</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .=frmUsuario();
    $retval .=frmCentros();
    $retval .=frmCambioClave();
    return $retval;
}

function frmUsuario() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmUsuarioModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="smart-form-register" class="smart-form" action="javascript:guardarUsuario()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDuser" name="IDuser">
                                                                    <section>
                                                                            <label class="input"> <i class="icon-append fa fa-user"></i>
                                                                                    <input type="text" id="usuario" name="usuario" placeholder="Usuario">
                                                                                    <b class="tooltip tooltip-bottom-right">Necesario para Registrar al Usuario, Mínimo 6 Caracteres</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="input"> <i class="icon-append fa fa-envelope-o"></i>
                                                                                    <input type="email" id="email" name="email" placeholder="E-mail">
                                                                                    <b class="tooltip tooltip-bottom-right">Necesario para Validar la Cuenta</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="password" name="password" placeholder="Password" id="password">
                                                                                    <b class="tooltip tooltip-bottom-right">Debe ingresar una Contraseña de mínimo 8 y Máximo 20 Caracreres</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="password" id="passwordConfirm"  name="passwordConfirm" placeholder="Confirmar Password">
                                                                                    <b class="tooltip tooltip-bottom-right">Debe ser la misma contraseña del campo anterior</b> </label>
                                                                    </section>
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
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="input">
                                                                                    <input type="telf" id="celular" name="celular" placeholder="Teléfono Celular">
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="input">
                                                                                    <input type="telf" id="cedula" name="cedula" placeholder="Número de Cédula">
                                                                            </label>
                                                                    </section>
                                                                </div>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="select">
                                                                                    <select id="tipoUsuario" name="tipoUsuario">
                                                                                            <option value="0" selected="" disabled="">-- Tipo Usuario --</option>
                                                                                            ' . comboTipoUsuario() . '
                                                                                    </select> <i></i> </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="select">
                                                                                    <select id="centro" name="centro">
                                                                                            <option value="0" selected="" disabled="">-- Centro --</option>
                                                                                            ' . comboCentro() . '
                                                                                    </select> <i></i> 
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

function frmCentros() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmCentrosDisponibles" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <div>
                                        <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-12" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                                            <header>
                                                <span class="widget-icon"> <i class="fa fa-arrow-down"></i> </span>
                                                <h2><strong>Centros ligados al Usuario</strong></h2>				
                                                <div class="widget-toolbar">
                                                    <div class="btn-group">
                                                            <button class="btn dropdown-toggle btn-xs btn-success" data-toggle="dropdown">
                                                                <i class="fa fa-fw fa-plus"></i>  Asignar Centro <i class="fa fa-caret-down"></i>
                                                            </button>
                                                            <ul class="dropdown-menu pull-right" id="listaCentrosOpciones">
                                                                
                                                            </ul>
                                                    </div>
                                                </div>
                                        </header>
                                            <div>
                                                <div class="jarviswidget-editbox">
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table table-hover" id="listaCentrosActivos">
                                                        <thead>
                                                                <tr>
                                                                        <th>#</th>
                                                                        <th>First Name</th>
                                                                        <th>Last Name</th>
                                                                        <th>Username</th>
                                                                </tr>
                                                        </thead>
                                                        <tbody>
                                                                <tr>
                                                                        <td>1</td>
                                                                        <td>Mark</td>
                                                                        <td>Otto</td>
                                                                        <td>@mdo</td>
                                                                </tr>
                                                        </tbody>
                                                    </table>
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

function frmCambioClave(){
    $retval='';
    $retval='<div class="modal fade" id="frmCambioClaveModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Formulario de Registro</h2>				
                                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="cambioClave" class="smart-form" action="javascript:GuardarCambioClaveUsuario()" autocomplete="off">
                                                            <header>
                                                                    Cambio de Contraseña
                                                            </header>
                                                            <fieldset>
                                                                <input type="hidden" id="IDuser" name="IDuser">
                                                                <section>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="password" name="password2" placeholder="Password" id="password2">
                                                                                    <b class="tooltip tooltip-bottom-right">Debe ingresar una Contraseña de mínimo 8 y Máximo 20 Caracreres</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="password" id="passwordConfirm2"  name="passwordConfirm2" placeholder="Confirmar Password">
                                                                                    <b class="tooltip tooltip-bottom-right">Debe ser la misma contraseña del campo anterior</b> </label>
                                                                    </section>
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Actualizar
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

function comboTipoUsuario() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_roles` WHERE ROL_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->ROL_COD . '">' . $row->ROL_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}

function comboCentro() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_centro`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->CEN_COD . '">' . $row->CEN_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}
//cambio