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
    case 'mostrarCelda':
        mostrarCelda();
        break;    
    case 'mostrarVisitantesPpl':
        mostrarVisitantesPpl();
        break;    
    case 'guardaDatosPpl':
        guardaDatosPpl();
        break;
    case 'actualizaListaVisitante':
        actualizaListaVisitante();
        break;
    case 'actualizarDatosPabellon':
        actualizarDatosPpl();
        break;
    case 'guardarListaVisitante':
        guardarListaVisitante();
        break;
    case 'eliminarVisitantePpl':
        eliminarVisitantePpl();
        break;
    case 'comboParentesco':
        comboParentesco();
        break;
    case 'validarCantidadVisitante':
        validarCantidadVisitante();
        break;
}

function mostrarCelda() {
    global $dbmysql;
    $pabellon = $_POST["pabellon"];
    $retval = '';
    $sql = "SELECT * FROM `sys_celdas` WHERE PAB_COD=$pabellon;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->CEL_COD . '">' . $row->CEL_DESCRPCION . '</option>';
        }
    }else{
        $retval.='<option value=""> No Existen Celdas</option>';
    }
    echo $retval;
}

function mostrarVisitantesPpl() {
    global $dbmysql;
    $codigoPpl = $_POST["codPpl"];
    $retval = '';
    $x=0;
    $sql = "SELECT vp.*,v.*,p.* FROM `sys_visitante_ppl` vp, sys_visitante v,sys_parentesco p WHERE vp.`VIS_COD`=v.`VIS_COD` AND p.PAR_COD=v.PAR_COD AND v.VIS_ESTADO='A' AND vp.`PPL_COD`=$codigoPpl ORDER BY v.VIS_COD;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $x++;
            $img=($row->VIS_IMAGEN=='')?'img/avatars/male.png':SISTEM_NAME.PATH_VISITAS.$row->VIS_IMAGEN;
            $cadenaParametros=$row->VIS_COD.',\''.$row->VIS_NOMBRE.' '.$row->VIS_APELLIDO.'\'';
            $a='A';
            $parametros=$row->VIS_COD.',\''.$a.'\'';
            $retval.='<tr id="vis'.$row->VIS_COD.'">
                        <td>'.$x.'</td>
                        <td><img src="' . $img . '" class="img-thumbnail" style="width: 60px"/></td>
                        <td><div class="txtVisDatos" id="txtVisNombre">' . $row->VIS_NOMBRE . '</div><input type="text" id="visNombre" name="visNombre" class="visDatos" value="'. $row->VIS_NOMBRE .'"></td>
                        <td><div class="txtVisDatos" id="txtVisApellido">' . $row->VIS_APELLIDO . '</div><input type="text" id="visApellido" name="visApellido" class="visDatos" value="'. $row->VIS_APELLIDO .'"></td>
                        <td><div class="txtVisDatos" id="txtVisParentesco">' . $row->PAR_DESCRIPCION . '</div><select id="visParentesco" name="visParentesco" class="visDatos">'. comboParentesco().'</select></td>
                        <td><a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambio" href="javascript:GuardarCambioVisita('.$parametros.')">
                                <i class="fa fa-save"></i>
                            </a>
                            <a class="btn btn-success btn-xs visBtnDatos" title="Editar Visitante" href="javascript:editarVisita('.$row->VIS_COD.')">
                                <i class="fa fa-pencil"></i>
                            </a>
                            <a class="btn btn-danger btn-xs '.$row->VIS_COD.' eliminaVisitante visBtnDatos" title="Anular Visitante" href="javascript:eliminarVisitantePpl('.$cadenaParametros.')">
                                <i class="fa fa-trash-o"></i>
                            </a></td>    
                      </tr>';
            
        }
    }else{
        $retval.='<tr><td collspan="5"> No Existen Visitantes Asignados </td></tr>';
    }
    echo $retval;
}

function guardaDatosPpl() {
    global $dbmysql;
    $pabellon = $_POST["pabellon"];
    $celda = $_POST["celda"];
    $nombre = $_POST["nombre"];
    $apellido= $_POST["apellido"];
    $cedula = $_POST["cedula"];
    $huella = $_POST["huella"];
    $imagen = $_POST["fileImagen"];
    $existente=verificarPplExistente($nombre,$apellido,$cedula,$huella);
    if($existente==0){
        $sql = "INSERT INTO `sys_ppl`(CEL_COD,PPL_NOMBRE,PPL_APELLIDO,PPL_CEDULA,PPL_IMG,PPL_HUELLA,PPL_ESTADO)VALUES
                ('$celda','$nombre','$apellido','$cedula','$imagen','$huella','A');";
        $val = $dbmysql->query($sql);
        if ($val) {
            echo 1;// RESULTADO EXITOSO
        } else {
            echo 0;//NO SE EJECUTO EL QUERY
        }
    }elseif($existente==2){
        echo 2;//HUELLA DACTILAR EXISTENTE
    }else{
        echo 3;//DATOS NOMBRE,APELLIDO,CEDULA Y HUELLA YA EXISTEN
    }
}
function actualizaListaVisitante(){
    global $dbmysql;
    $nombre = $_POST["nombre"];
    $apellido= $_POST["apellido"];
    $visCod = $_POST["visCod"];
    $parCod = $_POST["parentesco"];
    $sql = "UPDATE `sys_visitante` SET VIS_NOMBRE='$nombre',VIS_APELLIDO='$apellido',PAR_COD='$parCod' WHERE VIS_COD=$visCod;";
        $val = $dbmysql->query($sql);
        if ($val) {
            $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$parCod';";
            $val2 = $dbmysql->query($sql2);
            $row = $val2->fetch_object();
            $datos['datosActualizados']=array("codigoVis"=>$visCod,"nombre"=>$nombre,"apellido"=>$apellido,"parentesco"=>$row->PAR_DESCRIPCION);
            echo json_encode($datos);// RESULTADO EXITOSO
        } else {
            echo 0;//NO SE EJECUTO EL QUERY
        }
}
function guardarListaVisitante(){
    global $dbmysql;
    $nombre = $_POST["nombre"];
    $apellido= $_POST["apellido"];
    $parCod = $_POST["parentesco"];
    $codPpl=$_POST["visCod"];
    $sql = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,PAR_COD,VIS_ESTADO)
            VALUES('$nombre','$apellido','$parCod','A');";
    $val = $dbmysql->query($sql);
        if ($val) {
            $IdVisita=$dbmysql->maxid('VIS_COD', 'sys_visitante');
            $sql = "INSERT INTO `sys_visitante_ppl` (PPL_COD,VIS_COD)
                    VALUES($codPpl,$IdVisita);";
            $val = $dbmysql->query($sql);
            $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$parCod';";
            $val2 = $dbmysql->query($sql2);
            $row = $val2->fetch_object();
            $datos['datosActualizados']=array("codigoPPL"=>$codPpl,"codigoVis"=>$IdVisita,"nombre"=>$nombre,"apellido"=>$apellido,"parentesco"=>$row->PAR_DESCRIPCION);
            echo json_encode($datos);// RESULTADO EXITOSO
        } else {
            echo 0;//NO SE EJECUTO EL QUERY
        }
}
function verificarPplExistente($nombre,$apellido,$cedula,$huella){
    global $dbmysql;
    $sqlHuella = "SELECT * FROM `sys_ppl` WHERE PPL_HUELLA = '$huella';";
    $valHuella = $dbmysql->query($sqlHuella);
    if ($valHuella->num_rows==0) {
        $sql = "SELECT * FROM `sys_ppl` WHERE PPL_NOMBRE ='$nombre' AND PPL_APELLIDO='$apellido' AND PPL_CEDULA ='$cedula' AND PPL_HUELLA = '$huella';";
        $val = $dbmysql->query($sql);
        if ($val->num_rows>0) {
            echo 1;// RESULTADO EXITOSO
        } else {
            echo 0;//NO SE EJECUTO EL QUERY
        }
    }  else {
        echo 2;//HUELLA DACTILAR EXISTENTE
    }
}

function comboParentesco() {
    global $dbmysql;
    $ban=$_POST['alerta'];
    $retval = '';
    $sql = "SELECT * FROM `sys_parentesco`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $retval.='<option value="' . $row->PAR_COD . '">' . $row->PAR_DESCRIPCION . '</option>';
        }
    }
    if($ban!='')
        echo $retval;
    else
        return $retval;
}

function eliminarVisitantePpl() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "UPDATE `sys_visitante` SET VIS_ESTADO='E' WHERE VIS_COD=$codigo;";
    $val = $dbmysql->query($sql);
    if ($val) {
        echo 1;
    } else {
        echo 0;
    }
}

function validarCantidadVisitante(){
    global $dbmysql;
    $codigo=$_POST['codigo'];
    $sql = "SELECT * FROM `sys_parametros` WHERE PAR_COD=1";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $cantidadVisitas=$row->PAR_VALOR;
    $sql2 = "SELECT vp.*,v.*  FROM `sys_visitante_ppl` vp,  sys_visitante v WHERE vp.VIS_COD=v.VIS_COD AND v.VIS_ESTADO='A' AND PPL_COD=$codigo;";
    $val2 = $dbmysql->query($sql2);
    $cantidadActual=($val2->num_rows);
    if($cantidadVisitas>=$cantidadActual)
        echo 1;
    else
        echo 0;
}