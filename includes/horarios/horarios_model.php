<?php

session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
include_once '../../includes/generales.php';
$Generales = new general();

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
    case 'asignarHorariosPpl':
        asignarHorariosPpl();
        break;
    case 'guardarAsignacionHorariosPpl':
        guardarAsignacionHorariosPpl();
        break;
    case 'consultarPplHorarios':
        consultarPplHorarios();
        break;
    case 'cambiarHorariosPpl':
        cambiarHorariosPpl();
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
        "CEN_COD" => $row->CEN_COD,
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
    $fecha = $_POST["fechaHorario"];
    $tipoVisitas = $_POST["tipoVisitas"];
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $estado = $_POST["estado"];
    $consulta = "SELECT * FROM sys_horarios WHERE TPV_COD=$tipoVisitas AND HOR_FECHA='$fecha' AND HOR_HORA_ING='$horaIngreso' AND HOR_HORA_SAL='$horaSalida'";
    $val_con = $dbmysql->query($consulta);
    if ($val_con->num_rows == 0) {
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
    } else {
        echo 2;
    }
}

function guardaDatosHorario() {
    global $dbmysql;
    $fecha = $_POST["fechaHorario"];
    $centro=$_SESSION["usu_centro_cod"];
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $pabellon = $_POST["IDpabellonFrm"];
    $tipoVisitas = $_POST["tipoVisitas"];
    $consulta = "SELECT * FROM sys_horarios WHERE CEN_COD=$centro,TPV_COD=$tipoVisitas AND HOR_FECHA='$fecha' AND HOR_HORA_ING='$horaIngreso' AND HOR_HORA_SAL='$horaSalida'";
    $val_con = $dbmysql->query($consulta);
    if ($val_con->num_rows == 0) {
        $sql = "INSERT INTO `sys_horarios`(CEN_COD,PAB_COD,TPV_COD,HOR_DESCRIPCION,HOR_FECHA,HOR_HORA_ING,HOR_HORA_SAL,HOR_ESTADO)VALUES
                ($centro,'$pabellon','$tipoVisitas','$descripcion','$fecha','$horaIngreso','$horaSalida','A');";
        $val = $dbmysql->query($sql);
        if ($val) {
            echo 1;
        } else {
            echo 0;
        }
    } else {
        echo 2;
    }
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

function consultarPplHorarios(){
    global $dbmysql;
    $codigoHorario = $_POST['codigoHorario'];
    $sql = "SELECT hp.*,p.* FROM `sys_horarios_ppl` hp, `sys_ppl` p WHERE p.PPL_COD=hp.PPL_COD AND hp.HOR_COD=$codigoHorario;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $cadenaParametros = $row->PPL_COD . ',\'' . $row->PPL_APELLIDO.' '.$row->PPL_NOMBRE . '\',' . $codigoHorario;
            $retval .='<tr id="tablaPplHorarios">
                           <td>' . $row->PPL_COD . '</td>
                           <td>' . $row->PPL_APELLIDO.' '.$row->PPL_NOMBRE . '</td>
                           <td><select id="cambioHorario" class="cambioHorario' . $row->PPL_COD . '" name="cambioHorario" style="display:none;" onchange="javascript:cambiarPPLHorario(' . $cadenaParametros . ')"><option value="">-- Seleccione --</option>'.comboHorarios().'</select>
                                <a class="btn btn-primary btn-xs btnHorario' . $row->PPL_COD . '" title="Transferencia de Horario" href="javascript:mostrarComboHorario(' . $row->PPL_COD  . ')">
                                    <i class="fa fa-send"></i> Transferir
                                </a>
                           </td>
                   </tr>';
        }
    }else{
        $retval.='<tr id="tablaPplHorarios">
                           <td>No existen PPl asignados</td>
                   </tr>';
    }
    echo $retval;
}

function buscarHorariosPabellon() {
    global $dbmysql;
    $generales = new general();
    $codPabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_horarios` h
            INNER JOIN sys_tipovisita tp
            ON h.TPV_COD=tp.TPV_COD WHERE h.HOR_ESTADO='A' AND h.PAB_COD='$codPabellon';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $cadenaParametros = $row->HOR_COD . ',\'' . $row->HOR_DESCRIPCION . '\',' . $codPabellon;
            $estado = ($row->HOR_ESTADO == 'A') ? '<span class="label label-success">Activo</span>' : '<span class="label label-danger">Inactivo</span>';
            $retval .='<tr id="tablaHorarios">
                           <td>' . $generales->remplazarDia($row->HOR_FECHA, 'd-M-Y') . '</td>
                           <td>' . $row->TPV_DESCRIPCION . '</td>
                           <td>' . $row->HOR_HORA_ING . '</td>
                           <td>' . $row->HOR_HORA_SAL . '</td>
                           <td align="center" style="color:red; font-size: 2em;"><a href="javascript:visualizarPplsHorarios(' . $row->HOR_COD . ');">' . $row->HOR_ASIGNADOS . '</a></td>
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

function comboHorarios(){
    global $dbmysql;
    $retval = '';
    $centro=$_SESSION["usu_centro_cod"];
    $sql = "SELECT * FROM `sys_horarios` WHERE CEN_COD=$centro AND HOR_ESTADO='A';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->HOR_COD . '">' . $row->HOR_DESCRIPCION . '</option>';
        }
    }
    return $retval;
}

function asignarHorariosPpl() {
    global $dbmysql, $Generales;
    $idPabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idPabellon";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $ppls = $Generales->obtenerCantidadActualPPL($idPabellon);
    $alas = $Generales->cantidadAlas($idPabellon);
    $pisos = $Generales->cantidadPisos($idPabellon);
    $celdas = $Generales->cantidadCeldas($idPabellon);
    $lista['datosPabellon'] = array(
        "PAB_COD" => $row->PAB_COD,
        "CEN_COD" => $row->CEN_COD,
        "NVL_COD" => $row->NVL_COD,
        "PAB_DESCRIPCION" => $row->PAB_DESCRIPCION,
        "PAB_CAPACIDAD" => $row->PAB_CAPACIDAD,
        "PAB_PPL" => $ppls,
        "PAB_ALAS" => $alas,
        "PAB_PISOS" => $pisos,
        "PAB_CELDAS" => $celdas
    );
    $horarios = $Generales->obtenerHorariosPabellon($idPabellon);
    $numHorarios = $horarios->num_rows;
    $sql = "SELECT * FROM `sys_tipovisita`;";
    $val = $dbmysql->query($sql);
    while ($row = $val->fetch_object()) {
        $tipo = $row->TPV_COD;
        $sql_hor = "SELECT count(*) AS countHorario FROM `sys_horarios` WHERE PAB_COD=$idPabellon AND `TPV_COD` =$row->TPV_COD AND `HOR_ESTADO`='A'";
        $countHorarios = $dbmysql->query($sql_hor);
        $rowHorarios = $countHorarios->fetch_object();
        $cantidadHorarios = $rowHorarios->countHorario;
        $lista['datosHorarios'][$row->TPV_COD] = $cantidadHorarios;
        $sqlDatosHorario = "SELECT * FROM `sys_horarios` WHERE PAB_COD=$idPabellon AND `TPV_COD` =$row->TPV_COD AND `HOR_ESTADO`='A'";
        $DatosHorario = $dbmysql->query($sqlDatosHorario);
        /*         * ********************************
         * DISTRIBUCION DE PPLS EN HORARIOS
         * ******************************** */
        while ($datoHorario = $DatosHorario->fetch_object()) {
            $x = ($cantidadHorarios != 0) ? round($ppls / $cantidadHorarios) : $cantidadHorarios;
            $lista['datosPplHorarios'][] = array(
                "HOR_COD" => $datoHorario->HOR_COD,
                "HOR_DESCRIPCION" => $datoHorario->HOR_DESCRIPCION,
                "HOR_FECHA" => $datoHorario->HOR_FECHA,
                "HOR_HORA_ING" => $datoHorario->HOR_HORA_ING,
                "HOR_HORA_SAL" => $datoHorario->HOR_HORA_SAL,
                "HOR_CANT_PPL" => $x
            );
        }

        $cantidadHorariosxTipo = $lista['datosHorarios'][$row->TPV_COD];

        $totalCantidadHorarios = count($lista['datosHorarios']);
        $totalHorarios = $lista['datosHorarios'][$totalCantidadHorarios];
        $sumaTotalHorarios = $totalHorarios + $lista['datosHorarios'][$totalCantidadHorarios - 1];

        $cantidadVector = ($cantidadVector + $cantidadHorariosxTipo) - 1;
        $cantidadPplxPabellon = $lista['datosPabellon']['PAB_PPL'];
        $residuoTotal = $lista['datosPplHorarios'][$cantidadVector]['HOR_CANT_PPL'] * $cantidadHorariosxTipo;
        if ($residuoTotal < $cantidadPplxPabellon) {
            $residuo = $cantidadPplxPabellon - $residuoTotal;
        } elseif ($residuoTotal > $cantidadPplxPabellon) {
            $residuo = $cantidadPplxPabellon - $residuoTotal;
        } else {
            $residuo = 0;
        }
        $y = ($y != 0) ? $y : 0;
        for ($x = $y; $x < $sumaTotalHorarios; $x++) {
            $lista['datosPplHorarios'][$x]['HOR_CANT_PPL'] = $lista['datosPplHorarios'][$x]['HOR_CANT_PPL'] + $residuo;
            $residuo = 0;
        }
        $y = ($x == $sumaTotalHorarios - 1) ? $sumaTotalHorarios : $x;
    }
    echo $encode = json_encode($lista);
}

function guardarAsignacionHorariosPpl() {
    global $dbmysql;
    $pabellon = $_POST['pabellon'];
    $cantidadPpl = $_POST['cantidadPpl'];
    $horarios = $_POST['horarios'];
    $cantidadxHorarios = $_POST['cantidadxHorario'];
    $horarios = explode('/', $horarios);
    $cantidadxHorarios = explode('/', $cantidadxHorarios);
    $y = 0;
    $v = 0;
    $ppls = array();
    $sql = "SELECT * FROM `sys_ppl` WHERE `PAB_COD` = $pabellon AND `CEL_COD` != 0 ORDER BY `CEL_COD`;";
    $val = $dbmysql->query($sql);
    while ($row = $val->fetch_object()) {
        $ppls[] = $row->PPL_COD;
        $y++;
    }
    for ($x = 0; $x < count($horarios); $x++) {
        $sql2 = "UPDATE `sys_horarios` SET HOR_ASIGNADOS=$cantidadxHorarios[$x] WHERE HOR_COD=$horarios[$x];";
        $val = $dbmysql->query($sql2);
        for ($i = 0; $i < $cantidadxHorarios[$x]; $i++) {
            $z = $v + $i;
            $sql = "INSERT INTO `sys_horarios_ppl`(PPL_COD,HOR_COD) VALUES ($ppls[$z],$horarios[$x]);";
            $val = $dbmysql->query($sql);
            $imp[] = array(
                $horarios[$x] => $ppls[$z]
            );
        }
        $v = $v + $i;
        if ($v == $cantidadPpl) {
            $v = 0;
        }
    }
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function cambiarHorariosPpl(){
    global $dbmysql;
    $newHorario = $_POST['newHorario'];
    $codHorario = $_POST['codHorario'];
    $codPpl = $_POST['codPpl'];
    $sql = "UPDATE `sys_horarios_ppl` SET HOR_COD = $newHorario WHERE PPL_COD=$codPpl AND HOR_COD=$codHorario;";
    $val = $dbmysql->query($sql);
    if ($val) {
        $sql1 = "SELECT HOR_ASIGNADOS FROM `sys_horarios` WHERE HOR_COD=$codHorario;";
        $val1 = $dbmysql->query($sql1);
        $row1 = $val1->fetch_object();
        $newValorResta=$row1->HOR_ASIGNADOS-1;
        $sql2 = "UPDATE `sys_horarios` SET HOR_ASIGNADOS = $newValorResta WHERE HOR_COD=$codHorario;";
        $val2 = $dbmysql->query($sql2);
        $sql3 = "SELECT HOR_ASIGNADOS FROM `sys_horarios` WHERE HOR_COD=$newHorario;";
        $val3 = $dbmysql->query($sql3);
        $row3 = $val3->fetch_object();
        $newValorSuma=$row3->HOR_ASIGNADOS+1;
        $sql4 = "UPDATE `sys_horarios` SET HOR_ASIGNADOS = $newValorSuma WHERE HOR_COD=$newHorario;";
        $val4 = $dbmysql->query($sql4);
        echo 1;
    } else {
        echo 0;
    }
}