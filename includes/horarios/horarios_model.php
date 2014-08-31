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
        "HOR_DESCRIPCION" => $row->HOR_DESCRIPCION,
        "HOR_DIAS" => $row->HOR_DIAS,
        "HOR_HORA_ING" => $row->HOR_HORA_ING,
        "HOR_HORA_SAL" => $row->HOR_HORA_SAL,
        "HOR_ESTADO" => $row->HOR_ESTADO
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosHorario() {
    global $dbmysql;
    $codigo = $_POST['IDhorario'];
    $dias= $_POST["dias"];
    $descripcion = $_POST["descripcion"];
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $estado = $_POST["estado"];

    $sql = "UPDATE `sys_horarios` SET 
                HOR_DESCRIPCION     = '$descripcion',
                HOR_DIAS            = '$dias',
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
    $dias= $_POST["dias"];
    $descripcion = $_POST["descripcion"];
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $pabellon = $_POST["IDpabellonFrm"];
    $tipoVisitas=$_POST["tipoVisitas"]; 
    $sql = "INSERT INTO `sys_horarios`(PAB_COD,HOR_DESCRIPCION,HOR_DIAS,HOR_HORA_ING,HOR_HORA_SAL,HOR_ESTADO)VALUES
            ('$pabellon','$descripcion','$dias','$horaIngreso','$horaSalida','A');";
    $val = $dbmysql->query($sql);
    if ($val) {
        $maxHorario = $dbmysql->maxid('HOR_COD','sys_horarios');
        for ($i=0;$i<count($tipoVisitas);$i++){     
            echo $sql2 = "INSERT INTO  `sys_tipovisitahorario`(TPV_COD,HOR_COD)VALUES
            ('$tipoVisitas[$i]','$maxHorario');";
            $val2 = $dbmysql->query($sql2);
        } 
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarHorario() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "UPDATE `sys_horarios` SET HOR_ESTADO = 'I' WHERE HOR_COD=$codigo;";
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
    $sql = "SELECT * FROM `sys_horarios` WHERE PAB_COD='$codPabellon';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $cadenaParametros=$row->HOR_COD.',\''.$row->HOR_DESCRIPCION.'\','.$codPabellon;
            $estado=($row->HOR_ESTADO=='A')?'<span class="label label-success">Activo</span>':'<span class="label label-danger">Inactivo</span>';
            $retval .='<tr id="tablaHorarios">
                           <td>' . $row->HOR_DIAS . '</td>
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