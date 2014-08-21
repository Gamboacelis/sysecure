<?php

session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosPabellon':
        enviarDatosPabellon();
        break;
    case 'guardaDatosPabellon':
        guardaDatosPabellon();
        break;
    case 'actualizarDatosPabellon':
        actualizarDatosPabellon();
        break;
    case 'eliminarPabellon':
        eliminarPabellon();
        break;
    case 'buscarHorariosPabellon':
        buscarHorariosPabellon();
        break;
}

function enviarDatosPabellon() {
    global $dbmysql;
    $idpabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idpabellon";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosPabellon'] = array(
        "PAB_COD" => $row->PAB_COD,
        "NVL_COD" => $row->NVL_COD,
        "PAB_ALA" => $row->PAB_ALA,
        "PAB_DESCRIPCION" => $row->PAB_DESCRIPCION,
        "PAB_CAPACIDAD" => $row->PAB_CAPACIDAD,
        "PAB_DETALLES" => $row->PAB_DETALLES
    );

    echo $encode = json_encode($lista);
}

function actualizarDatosPabellon() {
    global $dbmysql;
    $codigo = $_POST['IDpabellon'];
    $ala = $_POST["ala"];
    $descripcion = $_POST["descripcion"];
    $capacidad = $_POST["capacidad"];
    $detalles = $_POST["detalles"];
    $nivel = $_POST["nivel"];

    $sql = "UPDATE `sys_pabellones` SET 
                NVL_COD    = '$nivel',
                PAB_ALA  = '$ala',
                PAB_DESCRIPCION   = '$descripcion',
                PAB_CAPACIDAD     = '$capacidad',
                PAB_DETALLES   = '$detalles'
            WHERE PAB_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function guardaDatosPabellon() {
    global $dbmysql;
    $ala = $_POST["ala"];
    $descripcion = $_POST["descripcion"];
    $capacidad = $_POST["capacidad"];
    $detalles = $_POST["detalles"];
    $nivel = $_POST["nivel"];
    $centro = $_SESSION["usu_centro_cod"];
    $sql = "INSERT INTO `sys_pabellones`(CEN_COD,NVL_COD,PAB_ALA,PAB_DESCRIPCION,PAB_CAPACIDAD,PAB_DETALLES)VALUES
            ('$centro','$nivel','$ala','$descripcion','$capacidad','$detalles');";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function eliminarPabellon() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "DELETE  FROM `sys_pabellones` WHERE PAB_COD=$codigo;";
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
            $retval .='<tr id="tablaHorarios">
                           <td>' . $row->HOR_DIAS . '</td>
                           <td>' . $row->HOR_DESCRIPCION . '</td>
                           <td>' . $row->HOR_HORA_ING . '</td>
                           <td>' . $row->HOR_HORA_SAL . '</td>
                           <td><a class="btn btn-success btn-xs" title="Editar Horario" href="javascript:mostrarArchivosProducto(' . $row->PRO_ID . ')">
                                    <i class="fa fa-folder-open-o"></i>
                                </a>
                                <a class="btn btn-danger btn-xs ' . $row->PRO_ID . ' eliminaParticipante" title="Eliminar Horario" href="javascript:eliminarProductoArchivo(' . $row->PRO_ID . ')">
                                    <i class="fa fa-trash-o"></i>
                                </a></td>
                   </tr>';
        }
    } else {
        $retval .='<tr>
                           <td colspan="5" align="center"><div class="txtPabellonHorario">Ningun Horario Asignado</div><input type="hidden" class="nomDescripcionArchivo" id="nomDescripcionArchivo" name="nomDescripcionArchivo" value="' . $row->PRO_ID . '"></td>
                   </tr>';
    }
//    $retval .=buscarArchivosProducto();
    echo $retval;
}