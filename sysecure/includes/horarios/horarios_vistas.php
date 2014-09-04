<?php

session_start();
include_once PATH_PROD . SISTEM_NAME . '/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['funcion']) ? $_GET['funcion'] : 'ninguno';
switch ($funcion) {
    case 'buscarProductoArchivo':
        buscarProductoArchivo();
        break;
    case 'buscarArchivosProducto':
        buscarArchivosProducto();
        break;
    case 'listarProductos':
        listarProductos();
        break;
    case 'agregarProductos':
        agregarProductos();
        break;
    case 'validaDatosArchivo':
        validaDatosArchivo();
        break;
    case 'eliminarArchivo':
        eliminarArchivo();
        break;
}

function frm_asignacionPabellones() {
    global $dbmysql;
    $retval = '';
    $sql = "SELECT e.*,p.* FROM `sys_pabellones` p, sys_etapas e WHERE e.`NVL_COD`=p.`NVL_COD` AND p.CEN_COD={$_SESSION['usu_centro_cod']}";
    $val_s = $dbmysql->query($sql);
    $retval = '<article class="col-sm-12 col-md-12 col-lg-6">
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
    $retval .='<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
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

function frmHorarios(){
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
                                                                                <label>Días:</label>
                                                                                <label class="select">
                                                                                        <select id="dias" name="dias">
                                                                                                <option value="0" selected="" disabled="">-- Dias --</option>
                                                                                                <option value="Lunes">Lunes</option>
                                                                                                <option value="Martes">Martes</option>
                                                                                                <option value="Miércoles">Miércoles</option>
                                                                                                <option value="Jueves">Jueves</option>
                                                                                                <option value="Viernes">Viernes</option>
                                                                                                <option value="Sábado">Sábado</option>
                                                                                                <option value="Domingo">Domingo</option>
                                                                                        </select> <i></i> </label>
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
                                                                                        <input type="text" id="horaIngreso" name="horaIngreso" placeholder="00:00">
                                                                                        <b class="tooltip tooltip-bottom-right">Necesario para Validar la Cuenta</b> </label>
                                                                        </section>
                                                                        <section class="col col-6">
                                                                                <label>Hora de Salida:</label>
                                                                                <label class="input"> <i class="icon-append fa fa-clock-o "></i>
                                                                                        <input type="text" id="horaSalida" name="horaSalida" placeholder="00:00">
                                                                                        <b class="tooltip tooltip-bottom-right">Necesario para Validar la Cuenta</b> </label>
                                                                        </section>
                                                                        
                                                                    </div>
                                                                    <section>
                                                                                <label>Tipo de Visitas</label>
                                                                                <label class="select">
                                                                                        <select id="tipoVisitas" placeholder="Seleccione Tipo de Visita" name="tipoVisitas">
                                                                                                <option value="0" selected="" disabled="">-- Tipo de Visita --</option>
                                                                                                '.comboTipoVisitas().'
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

function buscarProductoArchivo() {
    global $dbmysql;
    $nombreArchivo = $_POST['nombre'];
    $sql = "SELECT ad.*, p.* FROM `con_adjuntos` ad, con_producto p WHERE p.PRO_ID=ad.PRO_ID AND ADJ_DESCRIPCION LIKE '$nombreArchivo';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval .='<tr id="tablaProductosArchivos">
                           <td>' . $row->PRO_ID . '</td>
                           <td>' . $row->PRO_CODIGO_GENERAL . '</td>
                           <td>' . $row->PRO_NOMBRE . '</td>
                           <td class="nomDescripArchivo">' . $row->ADJ_DESCRIPCION . '</td>
                           <td><input type="hidden" class="nomDescripcionArchivo" id="nomDescripcionArchivo" name="nomDescripcionArchivo" value="' . $nombreArchivo . '"><a class="btn btn-success btn-xs" title="Visualizar Archivos del Producto" href="javascript:mostrarArchivosProducto(' . $row->PRO_ID . ')">
                                    <i class="fa fa-folder-open-o"></i>
                                </a>
                                <a class="btn btn-danger btn-xs ' . $row->PRO_ID . ' eliminaParticipante" title="Eliminar Producto" href="javascript:eliminarProductoArchivo(' . $row->PRO_ID . ')">
                                    <i class="fa fa-trash-o"></i>
                                </a></td>
                   </tr>';
        }
    } else {
        $retval .='<tr>
                           <td colspan="5"><div class="txtProductoArchivo">Ningun Producto ligado a este Archivo</div><input type="hidden" class="nomDescripcionArchivo" id="nomDescripcionArchivo" name="nomDescripcionArchivo" value="' . $nombreArchivo . '"></td>
                   </tr>';
    }
    $retval .=buscarArchivosProducto();
    echo $retval;
}

function buscarArchivosProducto() {
    global $dbmysql;
    $codProd = $_POST['codigo'];
    $sql = "SELECT ad.*, p.* FROM `con_adjuntos` ad, con_producto p WHERE p.PRO_ID=ad.PRO_ID AND p.PRO_ID = '$codProd';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div id="wid-id-4" class="jarviswidget jarviswidget-sortable jarviswidget-color-teal" data-widget-editbutton="false" style="" role="widget" data-widget-attstyle="jarviswidget-color-teal">
                                            <header>
                                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                    <h2>Archivos del Producto <spam id="totalSeleccionados"></spam></h2>

                                            </header>
                                            <div>
                                                <div class="widget-body no-padding">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-striped table-condensed table-hover smart-form has-tickbox" style="text-align:center">
                                                            <thead>
                                                                <tr>
                                                                    <th><i class="fa fa-flag"></i></th>
                                                                    <th><i class="fa fa-group"></i>Codigo</th>
                                                                    <th><i class="fa fa-group"></i>Vista</th>
                                                                    <th><i class="fa fa-briefcase"></i> Tipo </th>
                                                                    <th><i class="fa fa-dashboard"></i> Archivo</th>
                                                                    <th><i class="fa fa-times "></i> Eliminar</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>';
        while ($row = $val->fetch_object()) {
            $estado = ($row->ADJ_ESTADO != 'A') ? '<i title="Archivo Inactivo" class="txt-color-red glyphicon glyphicon-remove"></i>' : '<i title="Archivo Activo" class="txt-color-green glyphicon glyphicon-ok"></i>';
            $estado_boton = ($row->ADJ_ESTADO != 'A') ? 'disabled' : '';
            $img = ($row->ADJ_EXTENSION != 'application/pdf') ? $row->ADJ_PATH : 'img/archivos/pdf.png';
            $class = ($row->ADJ_EXTENSION != 'application/pdf') ? 'class="img-thumbnail"' : 'class="logoPdf"';
            $retval .='<tr class="itemArchivos">
                                                                        <td>' . $estado . '</td>
                                                                        <td>' . $row->ADJ_ID . '</td>
                                                                        <td><img ' . $class . ' src="' . $img . '" width="50"></td>
                                                                        <td>' . $row->ADJ_NOMBRE . '</td>
                                                                        <td class="nombreArchivos">' . $row->ADJ_DESCRIPCION . '</td>
                                                                        <td><a class="txt-color-white btn btn-danger btn-xs ' . $estado_boton . '" title="Eliminar Archivo" href="javascript:eliminarArchivo(' . $row->ADJ_ID . ')"><i class="glyphicon glyphicon-remove"></i></a>
                                                                        </td>
                                                                </tr>';
        }
        $retval .='</tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </article>';
    }
    echo $retval;
}

function listarProductos() {
    global $dbmysql;
    $nombreArchivo = $_POST['nombre'];

    $sql = "SELECT p.* FROM con_general_producto p WHERE p.PRO_ESTADO != 'D' ORDER BY PRO_ID ASC;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        $retval = '<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div id="wid-id-4" class="jarviswidget jarviswidget-color-darken" data-widget-editbutton="false" style="" role="widget" data-widget-attstyle="jarviswidget-color-teal">
                                            <header>
                                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                    <h2>Productos <spam id="totalSeleccionados"></spam></h2>
                                            </header>
                                            <div>
                                                <div class="widget-body no-padding">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <div id="datatable_tabletools_filter" class="dataTables_filter">
                                                        </div>
                                                    </div>
                                                    <form id="archivosProductos-form" class="smart-form" action="javascript:agregarProductosArchivo(\'' . $nombreArchivo . '\')">
                                                        <table id="reporteProductos" class="table table-bordered table-hover" style="text-align:center">
                                                            <thead>
                                                                <tr id="tablaArchivos">
                                                                    <th><label class="checkbox"><input type="checkbox" name="checkbox-inline2" id="checkGeneral"><i></i></label></th>
                                                                    <th>Codigo</th>
                                                                    <th>Referencia</th>
                                                                    <th>Nombre</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>';
        while ($row = $val->fetch_object()) {
            $sql_exclu = "SELECT * FROM `con_adjuntos` WHERE PRO_ID = '$row->PRO_ID' AND ADJ_DESCRIPCION='$nombreArchivo';";
            $val_exclu = $dbmysql->query($sql_exclu);
            if ($val_exclu->num_rows == 0) {
                $img = ($row->GEN_IMG_PATH != '') ? $row->GEN_IMG_PATH : 'img/sinimagen.jpg';
                $retval .='<tr class="itemProducto">
                                <td><label class="checkbox"><input type="checkbox" name="checkbox-inline" value="' . $row->PRO_ID . '"><i></i></label></td>
                                <td>' . $row->PRO_ID . '</td>
                                <td class="referenciaProducto">' . $row->PRO_CODIGO_GENERAL . '</td>
                                <td>' . $row->PRO_NOMBRE . '</td>
                            </tr>';
            }
        }
        $retval .='</tbody>
                    </table>
                    <footer>
                        <button class="btn btn-primary" type="submit"> Agregar </button>
                    </footer>
                 </form>
            </div>
        </div>
    </div>
</article>';
    }
    echo $retval;
}

function extaerDatosArchivo($archivo) {
    global $dbmysql;
    $sql_adj = "SELECT * FROM `con_adjuntos` WHERE ADJ_DESCRIPCION='$archivo'";
    $rows = $dbmysql->query($sql_adj);
    if ($rows->num_rows > 0) {
        return $rows;
    } else {
        return 0;
    }
}

function validaDatosArchivo() {
    global $dbmysql;
    $productos = explode(';', $_POST['productos']);
    $archivo = $_POST['archivo'];
    $prodNombres = '';
    $sql_adj = "SELECT * FROM `con_adjuntos` WHERE ADJ_DESCRIPCION='$archivo'";
    $rows = $dbmysql->query($sql_adj);
    if ($rows->num_rows > 0) {
        $row = $rows->fetch_object();
        $tipo = $row->ADJ_NOMBRE;
        for ($i = 1; $i < count($productos); $i++) {
            $sql_prod = "SELECT a.*,p.* FROM `con_adjuntos` a,con_producto p WHERE a.PRO_ID=p.PRO_ID AND a.PRO_ID='$productos[$i]' AND a.ADJ_NOMBRE='$tipo'";
            $rows_prod = $dbmysql->query($sql_prod);
            if ($rows_prod->num_rows > 0) {
                $row_prod = $rows_prod->fetch_object();
                $codigoAdjunto = $row_prod->ADJ_ID;
                $resp = 'Se reemplazo el Archivo: ' . $row_prod->ADJ_DESCRIPCION . ' de Tipo: ' . $row_prod->ADJ_NOMBRE . ' Por el Archivo: ' . $row->ADJ_DESCRIPCION . ' de: ' . $row->ADJ_NOMBRE;
                $tipo = 'A';
                $sql = "UPDATE  `con_adjuntos` SET 
                                    ADJ_TITULO='$row->ADJ_TITULO',
                                    ADJ_NOMBRE='$row->ADJ_NOMBRE',
                                    ADJ_EXTENSION='$row->ADJ_EXTENSION',
                                    ADJ_DESCRIPCION='$row->ADJ_DESCRIPCION',
                                    ADJ_PUBLICAR='$row->ADJ_PUBLICAR',
                                    ADJ_PATH='$row->ADJ_PATH',
                                    ADJ_PESO='$row->ADJ_PESO',
                                    ADJ_ESTADO='A'
                                WHERE ADJ_ID=$codigoAdjunto;";
                $dbmysql->query($sql);
            } else {
                $sql = "INSERT INTO  `con_adjuntos` (PRO_ID,ADJ_TITULO,ADJ_NOMBRE,ADJ_EXTENSION,ADJ_DESCRIPCION,ADJ_PUBLICAR,ADJ_PATH,ADJ_PESO,ADJ_ESTADO) VALUES
                                ($productos[$i],'$row->ADJ_TITULO', '$row->ADJ_NOMBRE', '$row->ADJ_EXTENSION','$row->ADJ_DESCRIPCION','$row->ADJ_PUBLICAR','$row->ADJ_PATH','$row->ADJ_PESO','A');";
                $dbmysql->query($sql);
                $tipo = 'I';
                $resp = 'Se agrego el Archivo: ' . $row->ADJ_DESCRIPCION . ' de Tipo: ' . $row->ADJ_NOMBRE;
            }
            auditoria('Archivos', $row_prod->PRO_CODIGO_GENERAL, $resp, $tipo);
        }
    }
    echo $resp;
}

function eliminarArchivo() {
    global $dbmysql;
    $archivo = $_POST['archivo'];
    $nombreArchivo = $_POST['nomArchivo'];
    $sql = "SELECT ad.*, p.* FROM `con_adjuntos` ad, con_producto p WHERE p.PRO_ID=ad.PRO_ID AND ADJ_DESCRIPCION LIKE '$nombreArchivo';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows == 0) {
        if (unlink($archivo)) {
            echo 'Archivo Eliminado';
        } else {
            echo 'Archivo No Eliminado';
        }
    } else {
        echo '';
    }
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