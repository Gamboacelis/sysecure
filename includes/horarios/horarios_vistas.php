<?php

session_start();
include_once PATH_PROD . SISTEM_NAME . '/includes/generales.php';
$Generales = new general();
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function frm_asignacionPabellones() {
    global $dbmysql,$Generales;
    $retval = '';
    $sql = "SELECT e.*,p.* FROM `sys_pabellones` p, sys_etapas e WHERE e.`NVL_COD`=p.`NVL_COD` AND p.CEN_COD={$_SESSION['usu_centro_cod']}";
    $val_s = $dbmysql->query($sql);
    $retval = '<article class="col-sm-12 col-md-12 col-lg-5">
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Pabellones ' . $_SESSION["usu_centro_descrip"] . ' </h2>
                            </header>
                            <div>
                                <div class="jarviswidget-editbox">
                                </div>
                                <div class="widget-body no-padding">
                                    <div class="table-responsive">
                                            <table id="listaPabellones" class="table table-bordered table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                            <th>#</th>
                                                            <th>Nivel</th>
                                                            <th>Pabellon</th>
                                                            <th>Cantidad</th>
                                                    </tr>
                                                </thead>
                                                <tbody>';
    while ($row = $val_s->fetch_object()) {
        $retval .= '<tr class="tablaPabellonesDetalle" id="' . $row->PAB_COD . '" onclick="javascript:mostrarHoraiosPabellon(\'' . $row->PAB_COD . '\',\''.$Generales->obtenerCantidadActualPPL($row->PAB_COD).'\')">
                                                        <td>' . $row->PAB_COD . '</td>
                                                        <td>' . $row->NVL_DESCRIPCION . '</td>
                                                        <td>' . $row->PAB_DESCRIPCION . '</td>
                                                        <td>' . $Generales->obtenerCantidadActualPPL($row->PAB_COD) . '</td>
                                                    </tr>';
    }
    $retval .= '</tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                    </div>
            </article>';
    $retval .='<article class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Listado de Horarios asignados al Pabellon</h2>
                                    <div class="widget-toolbar">
                                        <div class="btn-group">
                                                <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:asignarPPLHorario()" style="margin:5px;">
                                                    <i class="fa fa-lg fa-arrow-circle-o-up"></i>  Asignar PPL  <span id="cantidadPpl" class="badge bg-color-darken"></span>
                                                </button>
                                                <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevoHorario()" style="margin:5px;">
                                                    <i class="fa fa-fw fa-plus"></i>  Agregar Horario
                                                </button>
                                        </div>
                                    </div>
                            </header>
                            <div>
                                <div class="widget-body no-padding">
                                <input type="hidden" id="IDpabellon" name="IDpabellon">
                                    <table id="tbPabellonesHorarios" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr id="tablaHorarios">
                                                    <th>Fecha</th>
                                                    <th>Tipo Visita</th>
                                                    <th>Hora Ingreso</th>
                                                    <th>Hora Salida</th>
                                                    <th>PPL Asignados</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
    $retval .='</tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div></article>';
    $retval .=frmHorarios();
    $retval .=calendarioVisitas();
    $retval .=frmAsignar();
    $retval .=listaPPLHorario();
    return $retval;
}

function frmHorarios() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmHorariosModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="smart-form-horarios" class="smart-form" action="javascript:guardarHorario()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDhorario" name="IDhorario">
                                                                    <input type="hidden" id="IDpabellonFrm" name="IDpabellonFrm">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label>Fecha:</label>
                                                                                <label class="input">
                                                                                    <i class="icon-append fa fa-calendar"></i>
                                                                                    <input id="fechaHorario" class="form-control" type="text" placeholder="Fecha Inicio" name="fechaHorario">
                                                                                    
                                                                                </label>
                                                                        </section>
                                                                        <section class="col col-6">
                                                                                <label>Descripción:</label>
                                                                                <label class="input"> <i class="icon-append fa fa-comment-o"></i>
                                                                                        <input type="text" id="descripcion" name="descripcion" placeholder="Descripción">
                                                                                        <b class="tooltip tooltip-bottom-right">Necesario para Validar la Cuenta</b> </label>
                                                                        </section>
                                                                    </div>
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label>Hora de Inicio:</label>
                                                                                <label class="input"> <i class="icon-append fa fa-clock-o "></i>
                                                                                        <input type="text" class="form-control" id="horaIngreso" name="horaIngreso" placeholder="00:00" data-autoclose="true" readonly>
                                                                        </section>
                                                                        <section class="col col-6">
                                                                                <label>Hora de Salida:</label>
                                                                                <label class="input"> <i class="icon-append fa fa-clock-o "></i>
                                                                                        <input type="text" class="form-control" id="horaSalida" name="horaSalida" placeholder="00:00" data-autoclose="true" readonly>
                                                                        </section>
                                                                        
                                                                        
                                                                    </div>
                                                                    <section>
                                                                                <label>Tipo de Visitas</label>
                                                                                <label class="select">
                                                                                        <select id="tipoVisitas" placeholder="Seleccione Tipo de Visita" name="tipoVisitas">
                                                                                                <option value="0" selected="" disabled="">-- Tipo de Visita --</option>
                                                                                                ' . comboTipoVisitas() . '
                                                                                        </select> <i></i> </label>
                                                                        </section>
                                                                    <section>
                                                                        <label class="checkbox">
                                                                            <input id="estado" type="checkbox" name="estado" value="A">
                                                                            <i></i>Activo
                                                                        </label>
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

function frmAsignar() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmAsignarModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="formAsignar" class="smart-form" action="javascript:guardarAsignacionHorarios();">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDpabellonAsigna" name="IDpabellonAsigna">
                                                                    <input id="cantidadPpl" type="hidden" name="cantidadPpl">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label style="margin: 10px;"><strong>Datos del Pabellón</strong></label>
                                                                                <address>
                                                                                    <p>Pabellón <i id="txtAsignaPabellon"></i></p>
                                                                                    <p>Cantidad Total de Ppl: <i id="txtAsignaCantidad"></i></p>
                                                                                    <p>Número de Alas: <i id="txtAsignaAlas"></i></p>
                                                                                    <p>Número de Pisos: <i id="txtAsignaPisos"></i></p>
                                                                                    <p>Número de Celdas: <i id="txtAsignaCeldas"></i></p>
                                                                                </address>
                                                                        </section>
                                                                        <section class="col col-6" style="text-align: center;">
                                                                                <label style="margin: 10px;"><strong>Distribución de PPLS en horarios</strong></label>
                                                                                <div>
                                                                                    <table id="muestraHorarios" border="0" style="text-align:center;">
                                                                                        <thead>
                                                                                            <tr style="border-bottom: 1px dashed #000;font-size:0.8em;">
                                                                                                <th >Horario</th>
                                                                                                <th>Fecha</th>
                                                                                                <th>Cantidad PPL</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                        </section>
                                                                    </div>
                                                            </fieldset>
                                                            <fieldset>
                                                                <span style="color: red; font-size: 1.1em">Por favor revisar la distribución que se realizara en cada horario para los ppls, esto está en base a la cantidad de ppls que están asignados a cada celda. </span>
                                                            </fieldset>
                                                            <footer>
                                                                    <button type="submit" class="btn btn-primary">
                                                                        <i class="fa fa-save"></i>
                                                                            Aceptar
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

function listaPPLHorario() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmListaHorariosModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                    <h2>Lista de PPls Asignados a este Horario</h2>				
                                            </header>
                                            <div>
                                                <div class="widget-body no-padding">
                                                    <table id="listaPplHorario" class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Código</th>
                                                                <th>Nombres y Apellidos</th>
                                                                <th>Acción</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            
                        </div>
                    </div>
                </div>';
    return $retval;
}

function comboTipoVisitas() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_tipovisita`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->TPV_COD . '">' . $row->TPV_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}

function calendarioVisitas(){
    $retval ='';
    $retval .='<div class="modal fade" id="frmCalendarioModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <h2>Calendario de Visitas</h2>				
                                                </header>
                                                <div>';
    $retval .='<div class="col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget jarviswidget-color-blueDark">
                    <header>
                        <span class="widget-icon"> <i class="fa fa-calendar"></i> </span>
                        <h2> My Events </h2>
                        <div class="widget-toolbar">
                            <div class="btn-group">
                                <button class="btn dropdown-toggle btn-xs btn-default" data-toggle="dropdown">
                                        Showing <i class="fa fa-caret-down"></i>
                                </button>
                                <ul class="dropdown-menu js-status-update pull-right">
                                    <li>
                                            <a href="javascript:void(0);" id="mt">Month</a>
                                    </li>
                                    <li>
                                            <a href="javascript:void(0);" id="ag">Agenda</a>
                                    </li>
                                    <li>
                                            <a href="javascript:void(0);" id="td">Today</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <div class="widget-body-toolbar">
                                <div id="calendar-buttons">
                                    <div class="btn-group">
                                        <a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-prev"><i class="fa fa-chevron-left"></i></a>
                                        <a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-next"><i class="fa fa-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
        </div>';
                $retval .='</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>';
    return $retval;
}