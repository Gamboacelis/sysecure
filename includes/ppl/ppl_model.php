<?php

session_start();
include_once '../../includes/generales.php';
$clGeneral = new general();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosPpl':
        enviarDatosPpl();
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
    case 'actualizarDatosPpl':
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
    case 'cambioEstadoPpl':
        cambioEstadoPpl();
        break;
    case 'eliminarPpl':
        eliminarPpl();
        break;
    case 'guardarListaVisRepe':
        guardarListaVisRepe();
        break;
    case 'verificaConyugeVisitante':
        verificaConyugeVisitante();
        break;
    case 'verificaConyugal':
        verificaConyugal();
        break;
}

function enviarDatosPpl() {
    global $dbmysql;
    $codPpl = $_POST['codPpl'];
    $sql = "SELECT * FROM `sys_vw_ppl` WHERE `PPL_COD` =$codPpl";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosPPL'] = array(
        "PPL_COD" => $row->PPL_COD,
        "PAB_COD" => $row->PAB_COD,
        "CEL_COD" => $row->CEL_COD,
        "PPL_NOMBRE" => $row->PPL_NOMBRE,
        "PPL_APELLIDO" => $row->PPL_APELLIDO,
        "PPL_CEDULA" => $row->PPL_CEDULA,
        "PPL_IMG" => $row->PPL_IMG,
        "PPL_ESTADO" => $row->PPL_ESTADO,
        "PPL_NACIONALIDAD" => $row->PPL_NACIONALIDAD
    );

    echo $encode = json_encode($lista);
}

function cambioEstadoPpl() {
    global $dbmysql,$clGeneral;
    $codigo = $_POST['codPpl'];
    $estado = $_POST["estado"];

    $sql = "UPDATE `sys_ppl` SET 
                PPL_ESTADO    = '$estado'
            WHERE PPL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    $clGeneral->auditoria('A', 'sys_ppl', 'estado:'.$estado.'ppl:'.$codigo);
    if ($val) {echo 1;} else {echo 0;}
}

function actualizarDatosPpl() {
    global $dbmysql,$clGeneral;
    $codigo = $_POST['IDppl'];
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $cedula = $_POST["cedula"];
    $imagPpl= $_POST["imagPpl"];
    $nacionalidad= strtoupper($_POST["nacionalidad"]);
    $imagen = explode('/', $imagPpl);
    $img = ($img!='img')?$imagen[3]:'';
    $sql = "UPDATE `sys_ppl` SET 
                PPL_NOMBRE    = '$nombre',
                PPL_APELLIDO  = '$apellido',
                PPL_CEDULA    = '$cedula',
                PPL_IMG       = '$img',
                PPL_NACIONALIDAD = '$nacionalidad'
            WHERE PPL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    $clGeneral->auditoria('A', 'sys_ppl', 'valores:'.$nombre.','.$apellido.','.$cedula.','.$img.','.$nacionalidad.' - ppl:'.$codigo);
    if ($val) {echo 1;} else {echo 0;}
}

function eliminarPpl() {
    global $dbmysql,$clGeneral;
    $codigo = $_POST['codigo'];
    $sql = "UPDATE `sys_ppl` SET 
                PPL_ESTADO    = 'E'
            WHERE PPL_COD=$codigo;";
    $val = $dbmysql->query($sql);
    $clGeneral->auditoria('E', 'sys_ppl', 'estado: E ,ppl:'.$codigo);
    if ($val) {echo 1;} else {echo 0;}
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
    } else {
        $retval.='<option value=""> No Existen Celdas</option>';
    }
    echo $retval;
}

function mostrarVisitantesPpl() {
    global $dbmysql;
    $codigoPpl = $_POST["codPpl"];
    $retval = '';
    $x = 0;
    $sql = "SELECT vp.*,v.*,p.* FROM `sys_visitante_ppl` vp, sys_visitante v,sys_parentesco p WHERE vp.`VIS_COD`=v.`VIS_COD` AND p.PAR_COD=vp.PAR_COD AND v.VIS_ESTADO !='E' AND vp.`PPL_COD`=$codigoPpl ORDER BY v.VIS_COD;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            $x++;
            
            $cadenaParametros = $codigoPpl.','.$row->VIS_COD . ',\'' . $row->VIS_NOMBRE . ' ' . $row->VIS_APELLIDO . '\'';
            $a = 'A';
            $parametros = $codigoPpl.','.$row->VIS_COD . ',\'' . $a . '\'';
            //REVISAR SANCIONADOS
            $estado=($row->VIS_ESTADO!='S')?'<a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambios" href="javascript:GuardarCambioVisita(' . $parametros . ')">
                                                <i class="fa fa-save"></i>
                                            </a>
                                            <a class="btn btn-success btn-xs visBtnDatos" title="Editar Visitante" href="javascript:editarVisita('.$codigoPpl.',' . $row->VIS_COD . ')">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a class="btn btn-danger btn-xs ' . $row->VIS_COD . ' eliminaVisitante visBtnDatos" title="Anular Visitante" href="javascript:eliminarVisitantePpl(' . $cadenaParametros . ')">
                                                <i class="fa fa-trash-o"></i>
                                            </a>':'<span class="label label-danger" style="color: #fff;display: inline;font-size: 75%;font-weight: 700;line-height: 1;padding: 0.2em 0.6em 0.3em;text-align: center;"> Sancionado </span>';
            /////////////////////
            $retval.='<tr id="vis' . $row->VIS_COD . '">
                        <td>' . $x . '</td>
                        <td><div class="txtVisDatos" id="txtVisNombre">' . $row->VIS_NOMBRE . '</div><input type="text" id="visNombre" name="visNombre" class="visDatos" value="' . $row->VIS_NOMBRE . '"></td>
                        <td><div class="txtVisDatos" id="txtVisApellido">' . $row->VIS_APELLIDO . '</div><input type="text" id="visApellido" name="visApellido" class="visDatos" value="' . $row->VIS_APELLIDO . '"></td>
                        <td><div class="txtVisDatos" id="txtVisParentesco">' . $row->PAR_DESCRIPCION . '</div><select id="visParentesco" name="visParentesco" class="visDatos">' . comboParentesco($row->TPV_COD,$row->PAR_COD) . '</select></td>
                        <td>'.$estado.'</td>    
                      </tr>';
        }
    } else {
        $retval.='<tr><td colspan="5"> No Existen Visitantes Asignados </td></tr>';
    }
    echo $retval;
}

function guardaDatosPpl() {
    global $dbmysql,$clGeneral;
    $pabellon = $_POST["pabellon"];
    $celda = $_POST["celda"];
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $cedula = $_POST["cedula"];
    $imagen = explode('/', $_POST["imagPpl"]);
    $nacionalidad= strtoupper($_POST["nacionalidad"]);
    $img = $imagen[3];
    $existente = verificarPplExistente($nombre, $apellido, $cedula);
    if ($existente == 0) {
        $sql = "INSERT INTO `sys_ppl`(PAB_COD,CEL_COD,PPL_NOMBRE,PPL_APELLIDO,PPL_CEDULA,PPL_NACIONALIDAD,PPL_IMG,PPL_ESTADO)VALUES
                ('$pabellon','$celda','$nombre','$apellido','$cedula','$nacionalidad','$img','A');";
        $val = $dbmysql->query($sql);
        $descripcion=$pabellon.','.$celda.','.$nombre.','.$apellido.','.$cedula.','.$nacionalidad.','.$img.',A';
        $clGeneral->auditoria('I', 'sys_ppl', 'valores:'.$descripcion);
        if ($val) {
            echo 1; // RESULTADO EXITOSO
        } else {
            echo 0; //NO SE EJECUTO EL QUERY
        }
    } else {
        echo 2; //DATOS NOMBRE,APELLIDO,CEDULA YA EXISTEN
    }
}

function actualizaListaVisitante() {
    global $dbmysql,$clGeneral;
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $visCod = $_POST["visCod"];
    $parCod = $_POST["parentesco"];
    $codPpl = $_POST["codPlp"];
    
    $sql = "UPDATE `sys_visitante` SET VIS_NOMBRE='$nombre',VIS_APELLIDO='$apellido' WHERE VIS_COD=$visCod;";
    $val = $dbmysql->query($sql);
    $clGeneral->auditoria('A', 'sys_visitante', 'valores:'.$nombre.','.$apellido.' visitante:'.$visCod);
    $sql1 = "UPDATE `sys_visitante_ppl` SET PAR_COD='$parCod' WHERE VIS_COD=$visCod AND PPL_COD=$codPpl;";
    $val1 = $dbmysql->query($sql1);
    $clGeneral->auditoria('A', 'sys_visitante_ppl', 'parentesco:'.$parCod.', visitante:'.$visCod.' ppl:'.$codPpl);
    if ($val && $val1) {
        $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$parCod';";
        $val2 = $dbmysql->query($sql2);
        $row = $val2->fetch_object();
        $datos['datosActualizados'] = array("tipo"=>"nuevo","codigoVis" => $visCod, "nombre" => $nombre, "apellido" => $apellido, "parentesco" => $row->PAR_DESCRIPCION);
        echo json_encode($datos); // RESULTADO EXITOSO
    } else {
        echo 0; //NO SE EJECUTO EL QUERY
    }
}
function guardarListaVisRepe(){
    global $dbmysql,$clGeneral;
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $parCod = $_POST["parentesco"];
    $codPpl = $_POST["codPlp"];
    $IdVisita=$_POST["codVis"];
    $sql = "INSERT INTO `sys_visitante_ppl` (PPL_COD,VIS_COD,PAR_COD)
                VALUES($codPpl,$IdVisita,$parCod);";
    $val = $dbmysql->query($sql);
    $clGeneral->auditoria('I', 'sys_visitante_ppl', 'valores:'.$codPpl.','.$IdVisita.','.$parCod);    
    $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$parCod';";
    $val2 = $dbmysql->query($sql2);
    $row = $val2->fetch_object();
    $datos['datosActualizados'] = array("tipo"=>"nuevo","codigoPPL" => $codPpl, "codigoVis" => $IdVisita, "nombre" => $nombre, "apellido" => $apellido, "parentesco" => $row->PAR_DESCRIPCION);
    json_encode($datos); // RESULTADO EXITOSO
    echo 1;
}
function guardarListaVisitante() {
    global $dbmysql,$clGeneral;
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $parCod = $_POST["parentesco"];
    $codPpl = $_POST["codPlp"];
    $tipoVisita=obtenerTipoVisitaParentesco($parCod);
    $sql_con = "SELECT * FROM `sys_visitante` WHERE VIS_NOMBRE ='$nombre' AND VIS_APELLIDO = '$apellido' AND VIS_ESTADO !='E';";
    $val_con = $dbmysql->query($sql_con);
    if($val_con->num_rows==0){
        $sql = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_ESTADO)
                VALUES('$nombre','$apellido','N');";
        $val = $dbmysql->query($sql);
        $idVisitante = $dbmysql->lastid();
        $clGeneral->auditoria('I', 'sys_visitante', 'valores:'.$nombre.','.$apellido.',N');    
        if ($val) {
            //$IdVisita = $dbmysql->maxid('VIS_COD', 'sys_visitante');
            $sql = "INSERT INTO `sys_visitante_ppl` (PPL_COD,VIS_COD,PAR_COD)
                        VALUES($codPpl,$idVisitante,$parCod);";

            echo $sql;            
            $val = $dbmysql->query($sql);
            $clGeneral->auditoria('I', 'sys_visitante_ppl', 'valores:'.$codPpl.','.$idVisitante.','.$parCod);    
            $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$parCod';";
            $val2 = $dbmysql->query($sql2);
            $row = $val2->fetch_object();
            $datos['datosActualizados'] = array("tipo"=>"nuevo","codigoPPL" => $codPpl, "codigoVis" => $IdVisita, "nombre" => $nombre, "apellido" => $apellido, "parentesco" => $row->PAR_DESCRIPCION);
            echo json_encode($datos); // RESULTADO EXITOSO
        } else {
            echo 0; //NO SE EJECUTO EL QUERY
        }
    }else{
        $row_con = $val_con->fetch_object();
        $codigoVisitante=$row_con->VIS_COD;
        $sql="SELECT * FROM `sys_vw_visitante` WHERE VIS_COD= $codigoVisitante;";
        $val = $dbmysql->query($sql);
        $row = $val->fetch_object();
        //////DATOS///
        $datos['datosActualizados'] = array("tipo"=>"repetido","codigoPPL" => $row->PPL_COD,"nombrePPL" => $row->PPL_NOMBRE,"apellidoPPL" => $row->PPL_APELLIDO, "codigoVis" => $row->VIS_COD, "nombreVisita" => $row->VIS_NOMBRE, "apellidoVisita" => $row->VIS_APELLIDO, "parentescoVisita" => $row->PAR_DESCRIPCION);
        echo json_encode($datos); // RESULTADO EXITOSO
    }
}

function obtenerTipoVisitaParentesco($parCod){
    global $dbmysql;
    $sql="SELECT p.*,tv.* FROM `sys_parentesco` p, sys_tipovisita tv WHERE tv.`TPV_COD`=p.`TPV_COD` AND p.PAR_COD= $parCod;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    switch ($row->TPV_COD) {
        case 1:
            return 'F';
        break;
        case 2:
            return 'C';
        break;
        case 3:
            return 'A';
        break;
    }
}

function verificarPplExistente($nombre, $apellido, $cedula) {
    global $dbmysql;
    $sql = "SELECT * FROM `sys_ppl` WHERE PPL_NOMBRE ='$nombre' AND PPL_APELLIDO='$apellido' AND PPL_CEDULA ='$cedula';";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        return 1; // RESULTADO EXITOSO
    } else {
        return 0; //NO SE EJECUTO EL QUERY
    }
}

function verificaConyugeVisitante(){
    global $dbmysql;
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $parentesco=$_POST['parentesco'];
    $codppl=$_POST['codppl'];
    $sql = "SELECT vp.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v
                WHERE v.`VIS_COD`=vp.`VIS_COD`
                AND v.VIS_NOMBRE='$nombre'
                AND v.VIS_APELLIDO='$apellido'
                AND vp.PPL_COD =$codppl;";
        $val = $dbmysql->query($sql);
    if($val->num_rows>0){
        echo 2;
    }else{    
        //VERIFICO EL TIPO DE PARENTESCO INGRESADO
        $sql_par = "SELECT * FROM `sys_parentesco` WHERE PAR_COD ='$parentesco';";
        $val_par = $dbmysql->query($sql_par);
        $row_par = $val_par->fetch_object();

        /////////////////////////////////////////
        if($row_par->TPV_COD==2){

            $sql = "SELECT vp.*,p.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v, sys_parentesco p
                    WHERE v.`VIS_COD`=vp.`VIS_COD`
                    AND p.`PAR_COD`=vp.`PAR_COD`
                    AND v.VIS_NOMBRE='$nombre'
                    AND v.VIS_APELLIDO='$apellido'
                    AND p.TPV_COD=2;";
            $val = $dbmysql->query($sql);
            if ($val->num_rows > 0) {
                echo 1; // RESULTADO EXITOSO
            } else {
                echo 0; //NO SE EJECUTO EL QUERY
            }
        }else{
            echo 0;
        }
    }
}

function verificaConyugal(){
    global $dbmysql;
    $codParen = $_POST['codParen'];
    $sql_tipo = "SELECT * FROM sys_parentesco WHERE `PAR_COD`=$codParen;";
    $val_tipo = $dbmysql->query($sql_tipo);
    if($val_tipo->num_rows>0){
        $row = $val_tipo->fetch_object();
        if($row->TPV_COD==2){
            echo 1;
        }else{
            echo 0;
        }
    }else{
        echo 0;
    }
}

function comboParentesco($tipo=0,$parentesco=0) {
    global $dbmysql;
//    echo $parentesco;
    $ban = $_POST['alerta'];
    $codPpl = $_POST['codPpl'];
    //CONSULTAR LOS PARENTESCOS QUE TIENE EL PPL PARA QUE NO SE REPITAN
    if($tipo!=2){
    $sql_tipo = "SELECT vp.*,p.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v, sys_parentesco p WHERE v.`VIS_COD`=vp.`VIS_COD`AND p.`PAR_COD`=vp.`PAR_COD` AND vp.`PPL_COD`=$codPpl AND p.TPV_COD=2;";
    $val_tipo = $dbmysql->query($sql_tipo);
    if($val_tipo->num_rows>0)
        $ex=2;
    else
        $ex=0;
    }else{$ex=0;}
    $retval = '';
    $sql = "SELECT * FROM `sys_parentesco` order by `PAR_DESCRIPCION`;";
    $val = $dbmysql->query($sql);
    if ($val->num_rows > 0) {
        while ($row = $val->fetch_object()) {
            if($row->TPV_COD!=$ex){
                if($parentesco==$row->PAR_COD){$select='selected="selected"';}else{$select='';}
                $retval.='<option value="' . $row->PAR_COD . '" '.$select.'>' . $row->PAR_DESCRIPCION . '</option>';
            }
        }
    }
    if ($ban != '')
        echo $retval;
    else
        return $retval;
}

function eliminarVisitantePpl() {
    global $dbmysql,$clGeneral;
    $codVisitante = $_POST['codigo'];
    $codPpl= $_POST['codPpl'];
    $sql1 = "SELECT * FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante;";
    $val1 = $dbmysql->query($sql1);
    $sql2 = "SELECT * FROM `sys_visitante` WHERE VIS_COD=$codVisitante;";
    $val2 = $dbmysql->query($sql2);
    $row2 = $val2->fetch_object();
    
    if(trim($row2->VIS_ESTADO) != 'S' )
    {    
        if($val1->num_rows>1){
            $sql2 = "DELETE FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante AND PPL_COD=$codPpl;";
            $val2 = $dbmysql->query($sql2);
            $clGeneral->auditoria('E', 'sys_visitante_ppl', 'visitante:'.$codVisitante.'ppl:'.$codPpl);
        }elseif($val1->num_rows==1){
            $sql3 ="DELETE FROM `sys_visitante` WHERE VIS_COD=$codVisitante;";
            $dbmysql->query($sql3);
            $clGeneral->auditoria('E', 'sys_visitante', 'visitante:'.$codVisitante);
            $sql2 = "DELETE FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante AND PPL_COD=$codPpl;";
            $val2 = $dbmysql->query($sql2);
            $clGeneral->auditoria('E', 'sys_visitante_ppl', 'visitante:'.$codVisitante.'ppl:'.$codPpl);
        }
       if ($val2) {
            echo 1;
        } else {
            echo 0;
        }
    }    
    else{
        echo 2; 
    }    
}

function validarCantidadVisitante() {
    global $dbmysql;
    $codigo = $_POST['codigo'];
    $sql = "SELECT * FROM `sys_parametros` WHERE PAR_COD=1";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $cantidadVisitas = $row->PAR_VALOR;
    $sql2 = "SELECT vp.*,v.*  FROM `sys_visitante_ppl` vp,  sys_visitante v WHERE vp.VIS_COD=v.VIS_COD AND v.VIS_ESTADO !='E' AND PPL_COD=$codigo;";
    $val2 = $dbmysql->query($sql2);
    $cantidadActual = $val2->num_rows;
    if ($cantidadActual<$cantidadVisitas)
        echo 1;
    else
        echo 0;
}
