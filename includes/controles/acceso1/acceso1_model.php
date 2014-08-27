<?php

session_start();
include_once '../../generales.php';
$clGeneral = new general();
include_once '../../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'obtenerVisitantesAsignados':
        obtenerVisitantesAsignados();
        break;
    case 'permitirAccesoVisitante':
        permitirAccesoVisitante();
        break;
}

function obtenerVisitantesAsignados() {
    global $dbmysql, $clGeneral;
    $retval = '';
    $fecha = date('Y-m-d');
    $hora = date('H:i:s');
    $codPpl = $_POST['codPpl'];
    $sql = "SELECT vp.*,v.*, p.* FROM sys_visitante_ppl vp,`sys_visitante` v, sys_parentesco p WHERE p.PAR_COD=v.PAR_COD AND vp.`VIS_COD`=v.`VIS_COD` AND v.`VIS_ESTADO` ='A' AND  vp.PPL_COD= $codPpl;";
    $val = $dbmysql->query($sql);
    $retval .='<table id="visitantesPermitidos" class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Parentezco</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>';
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) { 
            
            $cadenaParametros = $row->VIP_COD . ',\'' . $row->VIS_NOMBRE . ' ' . $row->VIS_APELLIDO . '\'';
            $visAutorizado = consultaVisitanteAutorizado($row->VIP_COD);
            $visCantidad = consultaCantidadAutorizados($row->VIP_COD);
            if ($visAutorizado == '1') {
                $autorizado = '<span class="label label-primary">Ingreso Autorizado: ' . $fecha . '</span>';
            }elseif ($visCantidad < 2) {
                $autorizado = '<a class="btn btn-success" title="Permitir Acceso" href="javascript:permitirAccesoVisitante(' . $cadenaParametros . ')"><i class="fa fa-child"></i> Permitir Acceso</a>';
            }else{
                $autorizado = '<span class="label label-warning">Límite Máximo Autorizado</span>';
            }
            
            $retval.='<tr>
                                <td>' . $row->VIP_COD . '</td>
                                <td>' . $row->VIS_NOMBRE . '</td>
                                <td>' . $row->VIS_APELLIDO . '</td>
                                <td>' . $row->PAR_DESCRIPCION . '</td>
                                <td>' . $autorizado . '</td>
                            </tr>';
        }
    }
    $retval .='</tbody>
         </table>';
    echo $retval;
}

function consultaVisitanteAutorizado($codVisita) {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $sql = "SELECT * FROM `sys_control` WHERE `GAR_COD`=1 AND `VIP_COD` = '$codVisita' AND `CON_FECHA` ='$fecha' AND CON_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        return 1;
    } else {
        return 0;
    }
}

function consultaCantidadAutorizados($codVisita) {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $sql = "SELECT count(*) AS Cantidad FROM `sys_control` WHERE `GAR_COD`=1 AND `CON_FECHA` ='$fecha' AND CON_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        $row = $val->fetch_object();
        return $row->Cantidad;
    } else {
        return 0;
    }
}

function permitirAccesoVisitante() {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codVisita'];
    $sql = "SELECT * FROM `sys_control` WHERE `GAR_COD`=1 AND `VIP_COD` = '$codVisita' AND `CON_FECHA` ='$fecha' AND CON_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows == 0) {
        $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`CON_FECHA` ,`CON_ESTADO`)VALUES ('1', '$codVisita','$fecha','A');";
        $val2 = $dbmysql->query($sql2);
        if ($val2) {
            echo 1;
        } else {
            echo 0;
        }
    } else {
        echo 2;
    }
}
