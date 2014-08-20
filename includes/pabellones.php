<?php
include_once("conexiones/db_local.inc.php");
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
    global $dbmysql;
    $sql="SELECT * FROM `sys_pabellones` WHERE CEN_COD={$_SESSION['usu_centro_cod']}";
     $val_s = $dbmysql->query($sql);
        $retval = '<article class="col-sm-12 col-md-12 col-lg-6">
                    <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2" data-widget-editbutton="false">
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
                                                                            <th>Descripción</th>
                                                                            <th>Capacidad</th>
                                                                            <th>Detalles</th>
                                                                            <th>Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>';
                                                    while($row = $val_s->fetch_object()){
                                                         $retval .= '<tr>
                                                                            <td>'.$row->PAB_COD.'</td>
                                                                            <td>'.$row->PAB_DESCRIPCION.'</td>
                                                                            <td>'.$row->PAB_CAPACIDAD.'</td>
                                                                            <td>'.$row->PAB_DETALLES.'</td>
                                                                            <td>
                                                                                <div class="btn btn-sm btn-primary">
                                                                                    <span class="fa fa-pencil"></span>
                                                                                </div>
                                                                                <div class="btn btn-sm btn-danger">
                                                                                    <span class="fa fa-times"></span>
                                                                                </div>
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
    return $retval;
}
