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

function reporte_parentesco() {
    global $dbmysql,$clGeneral;
    $centro=$_SESSION["usu_centro_cod"];
    $sql="SELECT e.*,p.*,c.* FROM `sys_parentesco` p, sys_tipovisita e, sys_centro c WHERE c.CEN_COD=p.CEN_COD AND e.`TPV_COD`=p.`TPV_COD` AND p.CEN_COD=$centro;";
     $val_s = $dbmysql->query($sql);
        $retval = '<article class="col-sm-12 col-md-12 col-lg-8">
                    <div class="botonesSuperiores">
                    <fieldset>
                            <button id="agregarPabellon" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoParentesco()">
                                <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                                Agregar Parentesco
                            </button>
                        </fieldset>
                    </div>
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Parentescos</h2>
                            </header>
                            <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                    <table id="listaParentesco" class="table table-bordered table-striped table-hover">
                                                            <thead>
                                                                    <tr>
                                                                            <th>Código</th>
                                                                            <th>Centro</th>
                                                                            <th>Tipo Parentesco</th>
                                                                            <th>Descripción</th>
                                                                            <th>Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>';
                                                    while($row = $val_s->fetch_object()){
                                                        $cadenaParametros=utf8_encode($row->PAR_COD.','."'$row->PAR_DESCRIPCION'");
                                                         $retval .= '<tr>
                                                                            <td>'.$row->PAR_COD.'</td>
                                                                            <td>'.$row->CEN_DESCRIPCION.'</td>
                                                                            <td>'.$row->TPV_DESCRIPCION.'</td>
                                                                            <td>'.$row->PAR_DESCRIPCION.'</td>
                                                                            <td>
                                                                                <a class="btn btn-success btn-xs" title="Editar Parentesco" href="javascript:editarParentesco('.$row->PAR_COD.')">
                                                                                    <i class="fa fa-pencil"></i>
                                                                                </a>
                                                                                <a class="btn btn-danger btn-xs '.$row->PAR_COD.'" title="Eliminar Parentesco" href="javascript:eliminarParentesco('.$cadenaParametros.')">
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
      $retval .= frmParentesco();         
    return $retval;
}
function frmParentesco() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmParentescoModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="formParentesco" class="smart-form" action="javascript:guardarParentesco()">
                                                            <header>
                                                                    Formulario de Registro
                                                            </header>
                                                            <fieldset>
                                                                <input type="hidden" id="IDparentesco" name="IDparentesco">
                                                                <input type="hidden" id="codCentro" name="codCentro">
                                                                <div class="row">
                                                                    <section class="col col-6">
                                                                            <label class="label">Tipo Parentesco:</label>
                                                                            <label class="select">
                                                                                    <select id="tpparentesco" name="tpparentesco">
                                                                                        <option value="0" selected="" disabled="">-- Seleccione --</option>
                                                                                        ' . comboTipoParentesco() . '
                                                                                    </select> <i></i> 
                                                                            </label>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="label">Descripción:</label>
                                                                            <label class="input"> <i class="icon-append fa fa-user"></i>
                                                                                <input type="text" id="descripcion" name="descripcion" placeholder="Descripción del Parentesco">
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
function comboTipoParentesco() {
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