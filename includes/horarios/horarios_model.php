<?php

session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
include_once '../../includes/generales.php';
$Generales=new general();

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
    $consulta="SELECT * FROM sys_horarios WHERE TPV_COD=$tipoVisitas AND HOR_FECHA='$fecha' AND HOR_HORA_ING='$horaIngreso' AND HOR_HORA_SAL='$horaSalida'";
    $val_con = $dbmysql->query($consulta);
    if ($val_con->num_rows==0){
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
    }else{
        echo 2;
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
    $consulta="SELECT * FROM sys_horarios WHERE TPV_COD=$tipoVisitas AND HOR_FECHA='$fecha' AND HOR_HORA_ING='$horaIngreso' AND HOR_HORA_SAL='$horaSalida'";
    $val_con = $dbmysql->query($consulta);
    if ($val_con->num_rows==0){
        $sql = "INSERT INTO `sys_horarios`(PAB_COD,TPV_COD,HOR_DESCRIPCION,HOR_FECHA,HOR_HORA_ING,HOR_HORA_SAL,HOR_ESTADO)VALUES
                ('$pabellon','$tipoVisitas','$descripcion','$fecha','$horaIngreso','$horaSalida','A');";
        $val = $dbmysql->query($sql);
        if ($val) {echo 1;} else {echo 0;}
    }else{
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
            $cadenaParametros=$row->HOR_COD.',\''.$row->HOR_DESCRIPCION.'\','.$codPabellon;
            $estado=($row->HOR_ESTADO=='A')?'<span class="label label-success">Activo</span>':'<span class="label label-danger">Inactivo</span>';
            $retval .='<tr id="tablaHorarios">
                           <td>' . $generales->remplazarDia($row->HOR_FECHA,'d-M-Y') . '</td>
                           <td>' . $row->TPV_DESCRIPCION . '</td>
                           <td>' . $row->HOR_HORA_ING . '</td>
                           <td>' . $row->HOR_HORA_SAL . '</td>
                           <td align="center" style="color:red; font-size: 2em;">' . $row->HOR_ASIGNADOS . '</td>
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

function asignarHorariosPpl(){
    global $dbmysql,$Generales;
    $idPabellon = $_POST['pabellon'];
    $sql = "SELECT * FROM `sys_pabellones` WHERE PAB_COD =$idPabellon";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $ppls=$Generales->obtenerCantidadActualPPL($idPabellon);
    $alas=$Generales->cantidadAlas($idPabellon);
    $pisos=$Generales->cantidadPisos($idPabellon);
    $celdas=$Generales->cantidadCeldas($idPabellon);
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
    $horarios=$Generales->obtenerHorariosPabellon($idPabellon);
    $numHorarios=$horarios->num_rows;
    $sql = "SELECT * FROM `sys_tipovisita`;";
    $val = $dbmysql->query($sql);
    while($row = $val->fetch_object()){
        $tipo=$row->TPV_COD;
        $sql_hor="SELECT count(*) AS countHorario FROM `sys_horarios` WHERE PAB_COD=$idPabellon AND `TPV_COD` =$row->TPV_COD AND `HOR_ESTADO`='A'";
        $countHorarios = $dbmysql->query($sql_hor);
        $rowHorarios = $countHorarios->fetch_object();
        $cantidadHorarios=$rowHorarios->countHorario;
        $lista['datosHorarios'][$row->TPV_COD]=$cantidadHorarios;
        $sqlDatosHorario="SELECT * FROM `sys_horarios` WHERE PAB_COD=$idPabellon AND `TPV_COD` =$row->TPV_COD AND `HOR_ESTADO`='A'";
        $DatosHorario = $dbmysql->query($sqlDatosHorario);
           /**********************************
            * DISTRIBUCION DE PPLS EN HORARIOS
            **********************************/
        while($datoHorario = $DatosHorario->fetch_object()){
            $x=($cantidadHorarios!=0)?round($ppls/$cantidadHorarios):$cantidadHorarios;
            $lista['datosPplHorarios'][]=array(
                                "HOR_COD"=>$datoHorario->HOR_COD,
                                "HOR_DESCRIPCION"=>$datoHorario->HOR_DESCRIPCION,
                                "HOR_FECHA"=>$datoHorario->HOR_FECHA,
                                "HOR_HORA_ING"=>$datoHorario->HOR_HORA_ING,
                                "HOR_HORA_SAL"=>$datoHorario->HOR_HORA_SAL,
                                "HOR_CANT_PPL"=>$x
                );
        }
        
        $cantidadHorariosxTipo=$lista['datosHorarios'][$row->TPV_COD];
        $cantidadVector=($cantidadVector+$cantidadHorariosxTipo)-1;
        $cantidadPplxPabellon=$lista['datosPabellon']['PAB_PPL'];
        echo '/'.$residuo=$lista['datosPplHorarios'][$cantidadVector]['HOR_CANT_PPL']*$cantidadHorariosxTipo;
        $residuo=($residuo<$cantidadPplxPabellon)?$cantidadPplxPabellon-$residuo:0;
        for($x=0;$x<$cantidadHorariosxTipo;$x++){
            $lista['datosPplHorarios'][$x]['HOR_CANT_PPL']=$lista['datosPplHorarios'][$x]['HOR_CANT_PPL']+$residuo;
            $residuo=0;
        }
    }
    print_r($lista);
//    echo $encode = json_encode($lista);
}