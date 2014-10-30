<?php

session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosHorario':
        enviarDatosHorario();
        break;
    case 'guardaDatosHorario':
        guardaDatosHorario();
        break;
    case 'actualizarDatosHorario':
        actualizarDatosHorario();
        break;
    case 'eliminarHorario':
        eliminarHorario();
        break;
    case 'buscarHorariosPabellon':
        buscarHorariosPabellon();
        break;
}

function enviarDatosHorario() {
    global $dbmysql;
    $idHorario = $_POST['horario'];
    $sql = "SELECT * FROM `sys_horarios` WHERE HOR_COD =$idHorario";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosHorario'] = array(
        "HOR_COD" => $row->HOR_COD,
        "TPV_COD" => $row->TPV_COD,
        "HOR_DESCRIPCION" => $row->HOR_DESCRIPCION,
        "HOR_FECHA" => $row->HOR_FECHA,
        "HOR_HORA_ING" => $row->HOR_HORA_ING,
        "HOR_HORA_SAL" => $row->HOR_HORA_SAL,
        "HOR_ESTADO" => $row->HOR_ESTADO
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosHorario() {
    global $dbmysql;
    $codigo = $_POST['IDhorario'];
    $fecha= $_POST["fechaHorario"];
    $tipoVisitas=$_POST["tipoVisitas"]; 
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $estado = $_POST["estado"];

    $sql = "UPDATE `sys_horarios` SET 
                TPV_COD             = '$tipoVisitas',
                HOR_DESCRIPCION     = '$descripcion',
                HOR_FECHA           = '$fecha',
                HOR_HORA_ING        = '$horaIngreso',
                HOR_HORA_SAL        = '$horaSalida',
                HOR_ESTADO          ='$estado'
            WHERE HOR_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosHorario() {
    global $dbmysql;
    $fecha= $_POST["fechaHorario"];
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $pabellon = $_POST["IDpabellonFrm"];
    $tipoVisitas=$_POST["tipoVisitas"]; 
    $sql = "INSERT INTO `sys_horarios`(PAB_COD,TPV_COD,HOR_DESCRIPCION,HOR_FECHA,HOR_HORA_ING,HOR_HORA_SAL,HOR_ESTADO)VALUES
            ('$pabellon','$tipoVisitas','$descripcion','$fecha','$horaIngreso','$horaSalida','A');";
    $val = $dbmysql->query($sql);
    if ($val) {echo 1;} else {echo 0;}
}

function eliminarHorario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "UPDATE `sys_horarios` SET HOR_ESTADO = 'E' WHERE HOR_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function buscarHorariosPabellon() {
    global $dbmysql;
    $codPabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_horarios` h
            INNER JOIN sys_tipovisita tp
            ON h.TPV_COD=tp.TPV_COD WHERE h.HOR_ESTADO='A' AND h.PAB_COD='$codPabellon';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $cadenaParametros=$row->HOR_COD.',\''.$row->HOR_DESCRIPCION.'\','.$codPabellon;
            $estado=($row->HOR_ESTADO=='A')?'<span class="label label-success">Activo</span>':'<span class="label label-danger">Inactivo</span>';
            $retval .='<tr id="tablaHorarios">
                           <td>' . $row->HOR_FECHA . '</td>
                           <td>' . $row->TPV_DESCRIPCION . '</td>
                           <td>' . $row->HOR_DESCRIPCION . '</td>
                           <td>' . $row->HOR_HORA_ING . '</td>
                           <td>' . $row->HOR_HORA_SAL . '</td>
                           <td>' . $estado . '</td>
                           <td><a class="btn btn-success btn-xs" title="Editar Horario" href="javascript:editarHorario(' . $row->HOR_COD . ')">
                                    <i class="fa fa-pencil"></i>
                                </a>
                                <a class="btn btn-danger btn-xs" title="Eliminar Horario" href="javascript:eliminarHorario(' . $cadenaParametros . ')">
                                    <i class="fa fa-trash-o"></i>
                                </a></td>
                   </tr>';
        }
    } else {
        $retval .='<tr>
                           <td colspan="6" align="center"><div class="txtPabellonHorario">Ningun Horario Asignado</div><input type="hidden" class="nomDescripcionArchivo" id="nomDescripcionArchivo" name="nomDescripcionArchivo" value="' . $row->PRO_ID . '"></td>
                   </tr>';
    }
//    $retval .=buscarArchivosProducto();
    echo $retval;
}