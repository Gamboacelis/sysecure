<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function revisarPpl() {
    $retval = '';
    $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-10" id="viewPPL">
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
                                        <th><i class="fa fa-fw fa-lock txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellon Actual</th>
                                        <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
            </div>
        </article>';
    $retval .=frmPpl();
    $retval .=frmVisitantes();
    $retval .=frmAplicarTraspaso();
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
                                                                    <section>
                                                                            <label class="label">Imagen</label>
                                                                            <div id="imgPpl">
                                                                                <input id="imagPpl" name="imagPpl" type="hidden" />
                                                                                <img id="imagenPPL" alt="imagenPPL" src="img/avatars/male.png" class="img-thumbnail" style="width: 200px">
                                                                            </div>
                                                                                <div id="imgCambio">
                                                                                    <div class="cargar_img">
                                                                                        <input id="filePpl" name="filePpl" type="file" />
                                                                                        <div id="cargar_txt">
                                                                                            <span class="cargar_btn">Cambiar Imagen</span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="imgCambio_botones">
                                                                                        <a class="btn btn-default btn-circle" href="javascript:agregarImagenPpl();">
                                                                                            <i class="glyphicon glyphicon-ok"></i>
                                                                                        </a>
                                                                                        <a class="btn btn-default btn-circle" href="javascript:cancelarImagen();">
                                                                                            <i class="glyphicon glyphicon-ban-circle"></i>
                                                                                        </a>
                                                                                    </div>
                                                                                <div>
                                                                    </section>
                                                            </fieldset>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDppl" name="IDppl">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label class="label">Pabellon</label>
                                                                                <label class="select">
                                                                                        <select id="pabellon" name="pabellon" onchange="javascript:mostrarCelda()">
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
                                                                         <section class="col col-6" id=estadoLavel>
                                                                                <label class="label">Estado</label>
                                                                                <label class="select">
                                                                                        <select id="estado" name="estado">
                                                                                                <option value="0" selected="" disabled="">-- Estado --</option>
                                                                                                <option value="A">Privado Livertad</option>
                                                                                                <option value="L">Libre</option>
                                                                                                <option value="T">Traslado</option>
                                                                                                <option value="D">Audiencia</option>
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
function frmVisitantes(){
    $retval = '';
    $retval = '<div class="modal fade" id="frmVisitantesModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                </header>
                                                <div>
                                                    <div class="widget-body">
                                                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div id="wid-id-4" class="jarviswidget jarviswidget-color-darken" data-widget-editbutton="false" style="" role="widget" data-widget-attstyle="jarviswidget-color-teal">
                                                                <header>
                                                                        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                                        <h2>Listado de Visitantes Autorizados <spam id="totalSeleccionados"></spam></h2>
                                                                        <div class="widget-toolbar">
                                                                            <div class="btn-group">
                                                                                    <button class="btn btn-xs btn-success btn-personal" data-toggle="modal" onclick="javascript:nuevoVisitantePpl()">
                                                                                        <i class="fa fa-fw fa-plus"></i>  Agregar Visitante
                                                                                    </button>
                                                                            </div>
                                                                        </div>
                                                                </header>
                                                                <div>
                                                                    <div class="widget-body no-padding">
                                                                        <div class="table-responsive">
                                                                            <table id="litaVisitantesPpl" class="table table-bordered table-striped table-condensed table-hover smart-form has-tickbox" style="text-align:center">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th><i class="fa fa-check"></i><input type="hidden" id="IDpplNew" name="IDpplNew"></th>
                                                                                        <th><i class="fa fa-user"></i> Nombre</th>
                                                                                        <th><i class="fa fa-user"></i> Apellido</th>
                                                                                        <th><i class="fa fa-lock"></i> Parentesco</th>
                                                                                        <th><i class="fa fa-gear"></i> Acciones</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            
                        </div>
                    </div>
                </div>';
    return $retval;
}
function frmAplicarTraspaso(){
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
                                                <hr class="simple">
                                                <ul id="myTab1" class="nav nav-tabs bordered">
                                                        <li class="active"><a href="#s1" data-toggle="tab">Movimiento PPL</a></li>
                                                        <li> <a href="#s2" data-toggle="tab"><i class="fa fa-fw fa-lg fa-gear"></i> Historia de movimientos</a></li>
                                                </ul>
                                                <div id="myTabContent1" class="tab-content padding-10">
                                                        <div class="tab-pane fade in active" id="s1">
                                                               <form id="form-traspasoPabellon" class="smart-form" action="javascript:guardarTraspaso()">
                                                                    <fieldset>
                                                                            <input type="hidden" id="IDppl" name="IDppl">
                                                                    </fieldset> 
                                                                    <fieldset>
                                                                        <div class="row">
                                                                            <section class="col col-10">
                                                                                <div class="alert alert-block alert-success">
                                                                                    <h4 class="alert-heading">
                                                                                        <i class="fa fa-check-square-o"></i>
                                                                                        <label class="input" id="pabellonActual"> </label>
                                                                                        <input type="hidden" id="IDpabellon" name="IDpabellon">
                                                                                    </h4>
                                                                                    <p> Último traspaso: <i id="fechaUltimoTras">08-09-2014</i>, Pabellon anterior: <i id="pabellonUltimoTras">A </i></p>
                                                                                </div>
                                                                            </section>                                                                    
                                                                        </div>
                                                                        <div class="row">
                                                                            <section class="col col-6">
                                                                                    <label class="input" id="tiempo_sancion"><strong>Pabellon a transferir:</strong></label>
                                                                                        <select id="nuevoPabellon"  name="nuevoPabellon" onchange="transferirApabellon()"  class="form-control" required>
                                                                                        </select>                                                                            
                                                                           </section>
                                                                        </div>      
                                                                        <div class="row">
                                                                            <section class="col col-10">
                                                                                <label class="input" >Motivo del traspaso</label>
                                                                                <label class="textarea">
                                                                                    <i class="icon-append fa fa-comment"></i>
                                                                                    <textarea name="comment" rows="4" id="motivo" name="motivo" required></textarea>
                                                                                </label>
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
                                                        <div class="tab-pane fade" id="s2">
                                                                <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2" data-widget-editbutton="false">
                                                                    <header>
                                                                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                                            <h2>HISTORICOS DE MOVIMIENTOS DEL PPL </h2>
                                                                    </header>
                                                                    <div>
                                                                        <div class="widget-body no-padding">
                                                                            <div class="table-responsive">
                                                                                <table id="datosHistoriaPpl" class="table table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Usuario</th>
                                                                                            <th>Pabellon</th>
                                                                                            <th>Fecha Cambio</th>
                                                                                            <th>Motivo</th>
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

