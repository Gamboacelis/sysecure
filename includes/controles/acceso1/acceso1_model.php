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
    $obtenerDia = $clGeneral->obtenerDia(); // Obtener el dia de la Semana en Español
    $datosPPL = $clGeneral->obtenerInformacionPPL($codPpl); // Extrae los datos del PPL
    $datoPPL = $datosPPL->fetch_object();
    $pabellon = $datoPPL->PAB_COD; // Selecciona el codigo del Pabellon
    $nombresPpl = $datoPPL->PPL_NOMBRE . ' ' . $datoPPL->PPL_APELLIDO;
    $horarios = $clGeneral->obtenerHorario($pabellon, $obtenerDia, $hora); //Consulta los horarios del Pabellon en este dia y a esta Hora
    if ($horarios != '0') {
        $horario = $horarios->fetch_object();

        $tipoVisita = $horario->TPV_COD;
        $horaInicio = $horario->HOR_HORA_ING;
        $horaFin = $horario->HOR_HORA_SAL;

        $sql = "SELECT vp.*,v.*, p.* FROM sys_visitante_ppl vp,`sys_visitante` v, sys_parentesco p WHERE v.VIS_ESTADO != 'E' AND p.PAR_COD=v.PAR_COD AND vp.`VIS_COD`=v.`VIS_COD` AND p.TPV_COD=$tipoVisita AND  vp.PPL_COD= $codPpl;";
        $val = $dbmysql->query($sql);
        $retval .='<div class="alert alert-info no-margin fade in">
                            <button class="close" data-dismiss="alert"> × </button><i class="fa-fw fa fa-info"></i>
                            PPL: <strong>' . $nombresPpl . '</strong>,<br> Pabellon: ' . $datoPPL->PAB_DESCRIPCION . ', <br> Horario: ' . $obtenerDia . ', Desde: ' . $horaInicio . ' Hasta: ' . $horaFin . ' <br>
                             <p style="color:red;"><strong>Tipo de Visita: </strong>' . $horario->TPV_DESCRIPCION . '</p>
                    </div>
                    <table id="visitantesPermitidos" class="table table-hover table-bordered">
                      <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Parentesco</th>
                            <th>Tipo Visita</th>';
        $retval.=($clGeneral->getTipoCentro() == 1) ? '<th>Estado</th>' : '';
        $retval.='<th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>';
        if ($val->num_rows > 0) {
            while ($row = $val->fetch_object()) {
                $cadenaParametros = $row->VIP_COD . ',\'' . $row->VIS_NOMBRE . ' ' . $row->VIS_APELLIDO . '\'' . ',' . $horario->HOR_COD;
                $visAutorizado = consultaVisitanteAutorizado($row->VIP_COD);
                $visCantidad = consultaCantidadAutorizados($codPpl);
                $estadoFinal = ($row->VIS_ESTADO == 'A') ? '<span class="label label-success"><i class="fa fa fa-check"></i>  Validado</span>' : '<span class="label label-warning"><i class="fa fa-question-circle"></i>  No Validado</span>';
                $canParametro = $clGeneral->obtenerValorParametro(2); // Consulta cantidad de Visitas simultaneas de la tabla Parametros (VISITANTES)
                if ($visAutorizado == '1') {
                    $autorizado = '<span class="label label-primary">Ingreso Autorizado: ' . $fecha . '</span>';
                } elseif ($visCantidad < $canParametro) {
                    $autorizado = '<a class="btn btn-success" title="Permitir Acceso" href="javascript:permitirAccesoVisitante(' . $cadenaParametros . ')"><i class="fa fa-child"></i> Permitir Acceso</a>';
                } else {
                    $autorizado = '<span class="label label-warning">Límite Máximo Autorizado</span>';
                }
                switch ($row->VIS_ESTADO) {
                    case 'A':
                        $estado = $autorizado;
                        break;
                    case 'S':
                        $estado = '<span class="label label-danger">Visitante Sancionado</span>';
                        break;
                    case 'N':
                        $estado = ($clGeneral->getTipoCentro() == 1)?"<a style='margin-top: 10px;' class='btn btn-success' title='Editar visitante' href='javascript:editarVisitante(".$row->VIS_COD.")'><i class='fa fa-pencil-square-o'></i> Editar Visitante</a>":$autorizado;
                }
                $retval.='<tr>
                                <td>' . $row->VIS_NOMBRE . '</td>
                                <td>' . $row->VIS_APELLIDO . '</td>
                                <td>' . $row->PAR_DESCRIPCION . '</td>
                                <td>' . $horario->TPV_DESCRIPCION . '</td>';
                $retval.=($clGeneral->getTipoCentro() == 1) ? '<td>' . $estadoFinal . '</td>' : '';
                $retval.='<td >' . $estado . '</td>
                            </tr>';
            }
        } else {
            $retval .='<tr><td colspan="5" style="text-align: center; color: sienna;">El PPL no tiene Visitantes del Tipo <strong>' . $horario->TPV_DESCRIPCION . '</strong></td></tr>';
        }
        $retval .='</tbody>
         </table>';
    } else {
        $retval .='<div style="text-align: center; color: red;"><p>El PPL: ' . $row->VIS_NOMBRE . ' ' . $row->VIS_APELLIDO . ' pertenece al Pabellon ' . $datoPPL->PAB_DESCRIPCION . ', el cual no tiene Horarios para este momento...!</p></div>';
    }
    echo $retval;
}

function consultaVisitanteAutorizado($codVisita) {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $sql = "SELECT * FROM `sys_control` WHERE `GAR_COD`=1 AND `VIP_COD` = '$codVisita' AND `CON_FECHA` ='$fecha';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        return 1;
    } else {
        return 0;
    }
}

function consultaCantidadAutorizados($codPpl) {
    global $dbmysql;
    $fecha = date('Y-m-d');
    $sql = "SELECT count(*) AS Cantidad FROM `sys_control` c,sys_visitante_ppl vp WHERE vp.`VIP_COD`=c.`VIP_COD` AND `GAR_COD`=1 AND `CON_FECHA` ='$fecha' AND PPL_COD='$codPpl';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        $row = $val->fetch_object();
        return $row->Cantidad;
    } else {
        return 0;
    }
}

function permitirAccesoVisitante() {
    global $dbmysql, $clGeneral;
    $fecha = date('Y-m-d');
    $codVisita = $_POST['codVisita'];
    $horario = $_POST['horario'];
    $sql = "SELECT * FROM `sys_control` WHERE `GAR_COD`=1 AND `VIP_COD` = '$codVisita' AND `CON_FECHA` ='$fecha' AND CON_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows == 0) {

        if ($clGeneral->getTipoCentro() == 2) {
            $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`HOR_COD`,`CON_FECHA` ,`CON_ESTADO`)VALUES ('1', '$codVisita','$horario','$fecha','A');";
            $val2 = $dbmysql->query($sql2);
            if ($val2) {
                echo 1;
            } else {
                echo 0;
            }
        } elseif ($clGeneral->getTipoCentro() == 1) {

            $sql1 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`HOR_COD`,`CON_FECHA` ,`CON_ESTADO`)VALUES ('1', '$codVisita','$horario','$fecha','A');";
            $val1 = $dbmysql->query($sql1);

            $sql2 = "INSERT INTO `sys_control` (`GAR_COD` ,`VIP_COD` ,`HOR_COD`,`CON_FECHA` ,`CON_ESTADO`)VALUES ('2', '$codVisita','$horario','$fecha','O');";
            $val2 = $dbmysql->query($sql2);
            if ($val2 && $val1) {
                echo 1;
            } else {
                echo 0;
            }
        }
    } else {
        echo $clGeneral->getTipoCentro();
    }
}
