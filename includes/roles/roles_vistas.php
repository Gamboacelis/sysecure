<?php

session_start();
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function frm_asignacionPermisos() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT ROL_COD,ROL_DESCRIPCION,ROL_ESTADO,ROL_OBSERVACION FROM `sys_roles` WHERE ROL_ESTADO='A';";
    $val_s = $dbmysql->query($sql);
    $retval = '<article class="col-sm-12 col-md-12 col-lg-6">
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Roles o Perfiles de usuario</h2>
                                    <div class="widget-toolbar">
                                        <div class="btn-group">
                                                <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevoHorario()">
                                                    <i class="fa fa-fw fa-plus"></i>  Agregar Rol
                                                </button>
                                        </div>
                                    </div>
                            </header>
                            <div>
                                <div class="jarviswidget-editbox">
                                </div>
                                <div class="widget-body no-padding">
                                    <div class="table-responsive">
                                            <table id="listaRoles" class="table table-bordered table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                            <th>#</th>
                                                            <th>Descripción</th>
                                                            <th>Observación</th>
                                                            <th>Acción</th>
                                                    </tr>
                                                </thead>
                                                <tbody>';
                                        while ($row = $val_s->fetch_object()) {
                                            $cadenaParametros=utf8_encode($row->ROL_COD.','."'$row->ROL_DESCRIPCION'");
                                            $retval .= '<tr class="tablaPabellonesDetalle" id="' . $row->ROL_COD . '" onclick="javascript:mostrarPermisosUsuario(\'' . $row->ROL_COD . '\')">
                                                            <td>' . $row-> ROL_COD. '</td>
                                                            <td>' . $row-> ROL_DESCRIPCION. '</td>
                                                            <td>' . $row->ROL_OBSERVACION  . '</td>
                                                            <td><a class="btn btn-success btn-xs" title="Editar Pabellon" href="javascript:editarPabellon('.$row->ROL_COD.')">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>
                                                                <a class="btn btn-danger btn-xs '.$row->ROL_COD.'" title="Eliminar Pabellon" href="javascript:eliminarPabellon('.$cadenaParametros.')">
                                                                    <i class="fa fa-trash-o"></i>
                                                                </a></td>
                                                        </tr>';
    }
    $retval .= '</tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                    </div>
            </article>';
    $retval .='<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Listado de permisos por Rol</h2>
                                    <div class="widget-toolbar">
                                        <div class="btn-group">
                                                <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevoPermiso()">
                                                    <i class="fa fa-fw fa-plus"></i>  Agregar Permiso
                                                </button>
                                        </div>
                                    </div>
                            </header>
                            <div>
                                <div class="widget-body no-padding">
                                <input type="hidden" id="IDRol" name="IDRol">
                                    <table id="tbPermisosUsuarios" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr id="tablaHorarios">
                                                    <th width="45px">Asignado</th>
                                                    <th>Código</th>
                                                    <th>Nombre</th>
                                                    <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
    $retval .='</tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div></article>';
    $retval .=frmAgregarPermisos();
    $retval .=frmAgregarRoles();
    return $retval;
}

function frmAgregarPermisos() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmPermisosModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Lista de Permisos</h2>				
                                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-permisos" class="smart-form" action="javascript:guardarAsignaPermisos()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <table id="tbPermisosDisponibles" class="table table-striped table-bordered table-hover">
                                                                        <thead>
                                                                            <tr id="tablaPermisos">
                                                                                    <th width="45px">
                                                                                        Asignar
                                                                                    </th>
                                                                                    <th>Código</th>
                                                                                    <th>Nombre</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        </tbody>
                                                                    </table>
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            Asignar
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
function frmAgregarRoles() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmPermisosModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Lista de Permisos</h2>				
                                                </header>
                                                <div>
                                                    <div class="widget-body no-padding">
                                                        <form id="smart-form-permisos" class="smart-form" action="javascript:guardarAsignaPermisos()">
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
                                                                                                ' . comboNiveles() . '
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
                                                                            Asignar
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