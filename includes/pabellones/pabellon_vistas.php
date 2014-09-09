<?php
include_once '../generales.php';
$clGeneral = new general();
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$funcion = isset($_GET['funcion']) ? $_GET['funcion'] : 'ninguno';
switch ($funcion) {
    case 'consultadatosVisitante':
        consultadatosVisitante();
        break;
}

function reporte_pabellones() {
    global $dbmysql,$clGeneral;
    $sql="SELECT e.*,p.* FROM `sys_pabellones` p, sys_etapas e WHERE e.`NVL_COD`=p.`NVL_COD` AND p.CEN_COD={$_SESSION['usu_centro_cod']}";
     $val_s = $dbmysql->query($sql);
        $retval = '<article class="col-sm-12 col-md-12 col-lg-6">
                    <div class="botonesSuperiores">
                    <fieldset>
                            <button id="agregarPabellon" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoPabellon()">
                                <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                                Agregar Pabellon
                            </button>
                        </fieldset>
                    </div>
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Pabellones '.$_SESSION["usu_centro_descrip"].' </h2>
                            </header>
                            <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                    <table class="table table-bordered table-striped table-hover">
                                                            <thead>
                                                                    <tr>
                                                                            <th>#</th>
                                                                            <th>Nivel</th>
                                                                            <th>Descripción</th>
                                                                            <th>Capacidad</th>
                                                                            <th>Cantidad Actual</th>
                                                                            <th>Ala</th>
                                                                            <th>Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>';
                                                    while($row = $val_s->fetch_object()){
                                                        $cantidadActual=$clGeneral->obtenerCantidadActualPPL($row->PAB_COD);
                                                        $cadenaParametros=utf8_encode($row->PAB_COD.','."'$row->PAB_DESCRIPCION'");
                                                         $retval .= '<tr>
                                                                            <td>'.$row->PAB_COD.'</td>
                                                                            <td>'.$row->NVL_DESCRIPCION.'</td>
                                                                            <td>'.$row->PAB_DESCRIPCION.'</td>
                                                                            <td align="center">'.$row->PAB_CAPACIDAD.'</td>
                                                                            <td align="center">'.$cantidadActual.'</td>
                                                                            <td align="center">'.$row->PAB_ALA.'</td>
                                                                            <td>
                                                                                <a class="btn btn-success btn-xs" title="Editar Pabellon" href="javascript:editarPabellon('.$row->PAB_COD.')">
                                                                                    <i class="fa fa-pencil"></i>
                                                                                </a>
                                                                                <a class="btn btn-danger btn-xs '.$row->PAB_COD.'" title="Eliminar Pabellon" href="javascript:eliminarPabellon('.$cadenaParametros.')">
                                                                                    <i class="fa fa-trash-o"></i>
                                                                                </a>
                                                                            </td>    
                                                                    </tr>';
                                                    }              
                                            $retval .= '</tbody>
                                                    </table>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </article>';
      $retval .= frmPabellon();         
    return $retval;
}
function frmPabellon() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmPabellonModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="smart-form-pabellon" class="smart-form" action="javascript:guardarPabellon()">
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
function comboNiveles() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_etapas`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->NVL_COD . '">' . $row->NVL_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}