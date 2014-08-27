<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function revisarPpl() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                <div class="botonesSuperiores">
                    <fieldset>
                        <button id="agregarEvento" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoPpl();">
                            <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                            Agregar PPL
                        </button>
                    </fieldset>
                </div>
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Listado de PPL </h2>

                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="listaPpl" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><i class="fa fa-fw fa-male txt-color-blue hidden-md hidden-sm hidden-xs"></i> Nombre</th>
                                        <th><i class="fa fa-fw fa-user txt-color-blue hidden-md hidden-sm hidden-xs"></i> Imagen</th>
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Cédula</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .=frmPpl();
//    $retval .=frmCentros();
    return $retval;
}
function frmPpl(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmPPLModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="smart-form-ppl" class="smart-form" action="javascript:guardarPpl()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDppl" name="IDppl">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label class="label">Pabellon</label>
                                                                                <label class="select">
                                                                                        <select id="pabellon" name="pabellon">
                                                                                                <option value="0" selected="" disabled="">-- Pabellones --</option>
                                                                                                '.comboPabellon().'
                                                                                        </select> <i></i> 
                                                                                </label>
                                                                        </section>
                                                                        <section class="col col-6">
                                                                                <label class="label">Celda</label>
                                                                                <label class="select">
                                                                                        <select id="celda" name="celda">
                                                                                                <option value="0" selected="" disabled="">-- Celdas --</option>
                                                                                                '.comboCeldas().'
                                                                                        </select> <i></i> 
                                                                                </label>
                                                                        </section>
                                                                    </div>
                                                                    <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="label">Nombres</label>
                                                                            <label class="input"> <i class="icon-append fa fa-envelope-o"></i>
                                                                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre del PPL">
                                                                                    <b class="tooltip tooltip-bottom-right">Escriba el Nombre del PPL</b> </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="label">Apellidos</label>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="text" name="apellido" placeholder="Aopellido del PPL" id="apellido">
                                                                                    <b class="tooltip tooltip-bottom-right">Escriba el Apellido del PPL</b> </label>
                                                                    </section>
                                                                    </div>
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label class="label">Cédula</label>
                                                                                <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                        <input type="text" id="cedula"  name="cedula" placeholder="Cédula del PPL">
                                                                        </section>
                                                                    </div>
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="label">Imagen</label>
                                                                            <div id="imgPpl">
                                                                                <img src="img/avatars/male.png" class="img-thumbnail" style="width: 200px">
                                                                            </div>
                                                                            <div id="imgCambio">
                                                                                <div class="cargar_img">
                                                                                    <input id="fileImagen" name="fileImagen" type="file" />
                                                                                    <div id="cargar_txt">
                                                                                        <span class="cargar_btn">Cambiar Imagen</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="imgCambio_botones">
                                                                                    <a class="btn btn-default btn-circle" href="javascript:agregarImagen();">
                                                                                        <i class="glyphicon glyphicon-ok"></i>
                                                                                    </a>
                                                                                    <a class="btn btn-default btn-circle" href="javascript:cancelarImagen();">
                                                                                        <i class="glyphicon glyphicon-ban-circle"></i>
                                                                                    </a>
                                                                                </div>
                                                                            <div>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="label">Huella Dactilar</label>
                                                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="text" name="huella" placeholder="Huella Dactilar" id="huella" >
                                                                                    <b class="tooltip tooltip-bottom-right">Escanee la Huella Dactilar del PPL</b> </label>
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
function comboPabellon() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_pabellones`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAB_COD . '">' . $row->PAB_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}

function comboCeldas() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_celdas` WHERE ROL_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->ROL_COD . '">' . $row->ROL_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}