<?php
session_start();
include_once PATH_PROD.SISTEM_NAME.'/includes/generales.php';
$clGeneral = new general();
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

function reporteCentros() {
    global $dbmysql;
    $sql = "SELECT ce.`CEN_COD`,ce.`CIU_COD`,c.`CIU_DESCRIPCION`,ce.`CEN_DESCRIPCION`,ce.`CEN_DIRECCION`,ce.`CEN_TELEFONO` FROM `sys_centro` ce, sys_ciudad c WHERE c.`CIU_COD`= ce.`CIU_COD`;";
    $val_s = $dbmysql->query($sql);
    $retval = '<article class="col-sm-12 col-md-12 col-lg-6">
                    <div class="botonesSuperiores">
                    <fieldset>
                            <button id="agregarPabellon" class="btn btn-labeled btn-primary btn-personal"  data-toggle="modal" onclick="javascript:nuevoCentro()">
                                <span class="btn-label"><i class="glyphicon glyphicon-plus"></i></span>
                                Agregar Centros
                            </button>
                        </fieldset>
                    </div>
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false">
                            <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Centros Penitenciarios</h2>
                            </header>
                            <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                    <table id="vistaCentros" class="table table-bordered table-striped table-hover">
                                                            <thead>
                                                                    <tr>
                                                                            <th>#</th>
                                                                            <th>Ciudad</th>
                                                                            <th>Descripción</th>
                                                                            <th>Teléfono</th>
                                                                            <th>Dirección</th>
                                                                            <th>Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>';
                                                        while ($row = $val_s->fetch_object()) {
                                                            $cadenaParametros=utf8_encode($row->CEN_COD.','."'$row->CEN_DESCRIPCION'");
                                                            $retval .= '<tr id="vis' . $row->CEN_COD . '">
                                                                            <td>' . $row->CEN_COD . '</td>
                                                                            <td>' . $row->CIU_DESCRIPCION . '</td>
                                                                            <td>' . $row->CEN_DESCRIPCION . '</div></td>
                                                                            <td>' . $row->CEN_TELEFONO . '</div></td>
                                                                            <td>' . $row->CEN_DIRECCION . '</div></td>
                                                                            <td><a class="btn btn-success btn-xs" title="Editar Centro" href="javascript:editarCentro(' . $row->CEN_COD . ')">
                                                                                    <i class="fa fa-pencil"></i>
                                                                                </a>
                                                                                <a class="btn btn-danger btn-xs '.$row->CEN_COD.'" title="Eliminar Centro" href="javascript:eliminarCentro('.$cadenaParametros.')">
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
      $retval .= frm_Centros();         
    return $retval;
}

function frm_Centros() {
    $retval = '';
    $retval = '<div class="modal fade" id="frmCentrosModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
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
                                                        <form id="smart-form-centro" class="smart-form" action="javascript:guardarCentro()">
                                                            <header>
                                                                    Formulario de Registro Centros
                                                            </header>
                                                            <fieldset>
                                                                    <input type="hidden" id="IDcentro" name="IDcentro">
                                                                    <div class="row">
                                                                        <section class="col col-6">
                                                                                <label class="label">Ciudad</label>
                                                                                <label class="select">
                                                                                        <select id="ciudad" name="ciudad">
                                                                                                <option value="0" selected="" disabled="">-- Ciudad --</option>
                                                                                                '.  comboCiudad().'
                                                                                        </select> <i></i> 
                                                                                </label>
                                                                        </section>
                                                                    </div>
                                                                    <section>
                                                                            <label class="label">Descripción</label>
                                                                            <label class="input"> <i class="icon-append fa fa-envelope-o"></i>
                                                                                    <input type="text" id="descripcion" name="descripcion" placeholder="Descripción del Centro" style="text-transform:uppercase;">
                                                                                    <b class="tooltip tooltip-bottom-right">Necesario para identificar el Centro</b> </label>
                                                                    </section>
                                                                    <section>
                                                                            <label class="label">Dirección</label>
                                                                            <label class="textarea"> <i class="icon-append fa fa-comment"></i>
                                                                                    <textarea id="direccion"  name="direccion" placeholder="Ingrese la Dirección o referencia del Centro"></textarea>
                                                                    </section>
                                                                    <section class="col col-6">
                                                                            <label class="label">Teléfono</label>
                                                                            <label class="input"> <i class="icon-append fa fa-phone"></i>
                                                                                    <input type="number" name="telefono" id="telefono" placeholder="Teléfono del Centro">
                                                                                    <b class="tooltip tooltip-bottom-right">Ingrese un Número Telefónico</b> </label>
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

function comboCiudad() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT * FROM `sys_ciudad`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->CIU_COD . '">' . $row->CIU_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}