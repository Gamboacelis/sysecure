<?php

session_start();
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function frm_asignacionPabellones() {
    global $dbmysql;
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
                                                            <th>Ala</th>
                                                    </tr>
                                                </thead>
                                                <tbody>';
    while ($row = $val_s->fetch_object()) {
        $retval .= '<tr class="tablaPabellonesDetalle" id="' . $row->PAB_COD . '" onclick="javascript:mostrarHoraiosPabellon(\'' . $row->PAB_COD . '\')">
                                                        <td>' . $row->PAB_COD . '</td>
                                                        <td>' . $row->NVL_DESCRIPCION . '</td>
                                                        <td>' . $row->PAB_DESCRIPCION . '</td>
                                                        <td>' . $row->PAB_ALA . '</td>
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
                                                <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevoHorario()">
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
                                                    <th>Dia</th>
                                                    <th>Tipo Visita</th>
                                                    <th>Descripción</th>
                                                    <th>Hora Ingreso</th>
                                                    <th>Hora Salida</th>
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
