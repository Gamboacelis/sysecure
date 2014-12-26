<?php
session_start();
include_once PATH_PROD.SISTEM_NAME.'/includes/generales.php';
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

function reporte_etapa() {
    global $dbmysql,$clGeneral;
    $sql="SELECT * FROM sys_etapas WHERE CEN_COD={$_SESSION['usu_centro_cod']}";
     $val_s = $dbmysql->query($sql);
        $retval = '<article class="col-sm-12 col-md-12 col-lg-8">
                    <div class="botonesSuperiores">
                    <fieldset>
                            <button id="agregarPabellon" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevaEtapa()">
                                <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                                Agregar Etapa
                            </button>
                        </fieldset>
                    </div>
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Etapas del Centro '.$_SESSION["usu_centro_descrip"].' </h2>
                            </header>
                            <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                    <table id="tablaEtapas" class="table table-bordered table-striped table-hover">
                                                            <thead>
                                                                    <tr>
                                                                            <th>#</th>
                                                                            <th>Descripción</th>
                                                                            <th>Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>';
                                                    while($row = $val_s->fetch_object()){
                                                        $cadenaParametros=utf8_encode($row->NVL_COD.','."'$row->NVL_DESCRIPCION'");
                                                         $retval .= '<tr>
                                                                            <td>'.$row->NVL_COD.'</td>
                                                                            <td>'.$row->NVL_DESCRIPCION.'</td>
                                                                            <td>
                                                                                <a class="btn btn-success btn-xs" title="Editar Etapa" href="javascript:editarEtapas('.$row->NVL_COD.')">
                                                                                    <i class="fa fa-pencil"></i>
                                                                                </a>
                                                                                <a class="btn btn-danger btn-xs '.$row->NVL_COD.'" title="Eliminar Etapa" href="javascript:eliminarEtapas('.$cadenaParametros.')">
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
      $retval .= frmEtapas();         
    return $retval;
}
function frmEtapas() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmEtapasModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="formEtapas" class="smart-form" action="javascript:guardarEtapas()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                <input type="hidden" id="IDetapa" name="IDetapa">
                                                                <section>
                                                                        <label class="label">Descripción de la Etapa</label>
                                                                        <label class="input"> <i class="icon-append fa fa-user"></i>
                                                                            <input type="text" id="descripcion" name="descripcion" placeholder="Descripción de la Etapa">
                                                                            <b class="tooltip tooltip-bottom-right">Ingrese la descripción de la Etapa</b> 
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