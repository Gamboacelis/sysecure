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
    case 'eliminarPermisoAcceso':
        eliminarPermisoAcceso();
        break;
    case 'buscarPermisosUsuario':
        buscarPermisosUsuario();
        break;
    case 'mostrarPermisosDisponibles':
        mostrarPermisosDisponibles();
        break;
    case 'guardarAsignaPermisos':
        guardarAsignaPermisos();
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
    $dias= strtoupper($_POST["dias"]);
    $tipoVisitas=$_POST["tipoVisitas"]; 
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $estado = $_POST["estado"];

    $sql = "UPDATE `sys_horarios` SET 
                TPV_COD             = '$tipoVisitas',
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
    $dias= strtoupper($_POST["dias"]);
    $descripcion = strtoupper($_POST["descripcion"]);
    $horaIngreso = $_POST["horaIngreso"];
    $horaSalida = $_POST["horaSalida"];
    $pabellon = $_POST["IDpabellonFrm"];
    $tipoVisitas=$_POST["tipoVisitas"]; 
    $sql = "INSERT INTO `sys_horarios`(PAB_COD,TPV_COD,HOR_DESCRIPCION,HOR_DIAS,HOR_HORA_ING,HOR_HORA_SAL,HOR_ESTADO)VALUES
            ('$pabellon','$tipoVisitas','$descripcion','$dias','$horaIngreso','$horaSalida','A');";
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
function eliminarPermisoAcceso(){
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $codRol = $_POST['codRol'];
    $sql = "DELETE FROM `sys_opciones_rol` WHERE OPU_COD =$codigo AND ROL_COD=$codRol;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}
function buscarPermisosUsuario() {
    global $dbmysql;
    $codRol = $_POST['rol'];
    $sql = "SELECT opr.*,ou.* FROM `sys_opciones_rol` opr, `sys_opciones_usuario` ou WHERE opr.`OPU_COD`=ou.`OPU_COD` AND opr.`ROL_COD`=$codRol;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $cadenaParametros=$row->OPU_COD.',\''.$row->OPU_NOMBRE.'\','.$codRol;
            $estado=($row->HOR_ESTADO=='A')?'<span class="label label-success">Activo</span>':'<span class="label label-danger">Inactivo</span>';
            $retval .='<tr id="tablaHorarios">
                           <td align="center"><span class="glyphicon glyphicon-ok" style="color:green;"></span></td>
                           <td>' . $row->OPU_COD . '</td>
                           <td>' . $row->OPU_NOMBRE . '</td>
                           <td><a class="btn btn-danger btn-xs '.$row->OPU_COD.'" title="Eliminar Opción Usuario" href="javascript:eliminarPermiso('.$cadenaParametros.')">
                                    <i class="fa fa-trash-o"></i>
                                </a>
                           </td>
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
function mostrarPermisosDisponibles() {
    global $dbmysql;
    $codRol = $_POST['codRol'];
    $sql = "SELECT * FROM `sys_opciones_usuario`  WHERE OPU_NIVEL>1;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $sql_mas="SELECT * FROM `sys_opciones_rol` WHERE ROL_COD=$codRol AND OPU_COD=$row->OPU_COD;";
            $sub = $dbmysql->query($sql_mas);
            if($sub->num_rows==0){
                $cadenaParametros=$row->OPU_COD.',\''.$row->OPU_NOMBRE.'\','.$codRol;
                $estado=($row->HOR_ESTADO=='A')?'<span class="label label-success">Activo</span>':'<span class="label label-danger">Inactivo</span>';
                $retval .='<tr id="tablaHorarios">
                               <td align="center">
                                     <input id="codRol" type="hidden" name="codRol" value="'.$codRol.'">
                                    <label class="checkbox">
                                        <input id="asignar" type="checkbox" name="asignar" value="'.$row->OPU_COD.'">
                                        <i></i>
                                    </label>
                                </td>
                               <td>' . $row->OPU_COD . '</td>
                               <td>' . $row->OPU_NOMBRE . '</td>
                       </tr>';
            }
        }
    } else {
        $retval .='<tr>
                           <td colspan="6" align="center"><div class="txtPabellonHorario">Ningun Horario Asignado</div><input type="hidden" class="nomDescripcionArchivo" id="nomDescripcionArchivo" name="nomDescripcionArchivo" value="' . $row->PRO_ID . '"></td>
                   </tr>';
    }
//    $retval .=buscarArchivosProducto();
    echo $retval;
}

function guardarAsignaPermisos(){
    global $dbmysql;
    $x=0;
    $permisos=explode(';', $_POST['permisos']);
    $codRol = $_POST["codRol"];
    $totalIns=count($permisos)-1;
    for($i=1;$i<count($permisos);$i++){
        //Consulta si tiene Padre
        $sql1="SELECT *  FROM `sys_opciones_usuario` WHERE OPU_COD=$permisos[$i];";
        $val1=$dbmysql->query($sql1);
        $row1 = $val1->fetch_object();
        $padre=$row1->OPU_COD_PADRE;
        if($padre > 0){
            $sql2="SELECT *  FROM `sys_opciones_rol` WHERE ROL_COD=$codRol AND OPU_COD=$padre;";
            $val2=$dbmysql->query($sql2);
            if($val2->num_rows==0){
                $sql="INSERT INTO  `sys_opciones_rol` (ROL_COD,OPU_COD) VALUES
                  ($codRol, $padre);";
                $val=$dbmysql->query($sql);
            }
        }
        $sql="INSERT INTO  `sys_opciones_rol` (ROL_COD,OPU_COD) VALUES
              ($codRol, $permisos[$i]);";
        $val=$dbmysql->query($sql);
        if ($val) {
            $x++;
        }
    }
    if ($x==$totalIns) {
        echo 1;
    } else {
        echo 0;
    }
        
}     