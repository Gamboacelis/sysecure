<?php
session_start();
include_once '../conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'enviarDatosVisitante':
        enviarDatosVisitante();
        break;
    case 'guardaDatosVisitante':
        guardaDatosVisitante();
        break;   
    case 'actualizarDatosVisitante':
        actualizarDatosVisitante();
        break;       
    case 'eliminarVisitante':
         eliminarVisitante();         
         break;
    case 'enviarDatosParentesco':
         enviarDatosParentesco();         
         break;
    case 'enviarDatosPpl':
         enviarDatosPpl();         
         break;  
    case 'buscarVisitante':
         buscarVisitante();         
         break;
     case 'validarVisitanteCedula':
         validarVisitanteCedula();         
         break;  
}

function enviarDatosVisitante() {
    global $dbmysql;
    $idpro = ($_POST['tipo']=='C')?"VIS_CEDULA={$_POST['cedula']}":"VIS_COD ={$_POST['codigoVis']}";
    
   $sql = "SELECT * FROM `sys_vw_visitante` WHERE $idpro";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $lista['datosVisitante'] = array(
        "VIS_COD" => $row->VIS_COD,
        "PPL_COD" => $row->PPL_COD, 
        "PPL_NOMBRE" => $row->PPL_NOMBRE,
        "PPL_APELLIDO" => $row->PPL_APELLIDO,
        "PAR_COD" => $row->PAR_COD,
        "VIS_NOMBRE" => $row->VIS_NOMBRE,
        "VIS_APELLIDO" => $row->VIS_APELLIDO,
        "VIS_CEDULA" => $row->VIS_CEDULA,
        "VIS_HUELLA" => $row->VIS_HUELLA,
        "VIS_DIRECCION" => $row->VIS_DIRECCION,
        "VIS_TELEFONO" => $row->VIS_TELEFONO,
        "VIS_CORREO" => $row->VIS_CORREO,
        "VIS_ESTADO" => $row->VIS_ESTADO
    );
    echo $encode = json_encode($lista);
}

function guardaDatosVisitante() {
    global $dbmysql;
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $telefono = $_POST["telefono"];
    $cedula = $_POST["cedula"];
    $direccion = strtoupper($_POST["direccion"]);
    $correo = strtolower($_POST["correo"]);
    $parentesco = $_POST["parentesco"];     
    $codeImage = $_POST["codeImage"]; 

    $sql = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_TELEFONO,VIS_CEDULA, VIS_DIRECCION,VIS_CORREO,VIS_ESTADO,PAR_COD)VALUES
            ('$nombre','$apellido','$telefono','$cedula','$direccion','$correo','A',$parentesco);";
    $val = $dbmysql->query($sql);
    $id = $dbmysql->lastid(); 
   if ($val) {
    if($codeImage != "")
    {    
        saveImage($codeImage,$id);
    }    
    echo 1;
    } else {
        echo 0;
    }
}

function actualizarDatosVisitante() {
    global $dbmysql;
    $codigo = $_POST['IDvisitante'];
    $codPpl = $_POST["IDvisPpl"];
    $nombre = strtoupper($_POST["nombre"]);
    $apellido = strtoupper($_POST["apellido"]);
    $telefono = $_POST["telefono"];
    $cedula = $_POST["cedula"];
    $direccion = strtoupper($_POST["direccion"]);
    $correo = strtolower($_POST["correo"]);   
    $parentesco = $_POST["parentesco"];    
    $codeImage = $_POST["codeImage"];
    
    if(obtenerVisitanteValido($codigo)==1){
            $estado=',VIS_ESTADO = "A"';
    }else{
        if($nombre!='' &&$apellido!='' && $cedula!=''){
                $estado=',VIS_ESTADO = "A"';
            }else{
                $estado='';
            }
    }
    $sql = "UPDATE `sys_visitante` SET 
                VIS_NOMBRE    = '$nombre',
                VIS_APELLIDO  = '$apellido',
                VIS_TELEFONO   = '$telefono',
                VIS_CEDULA    = '$cedula',
                VIS_DIRECCION   = '$direccion',
                VIS_CORREO    = '$correo'
                $estado
            WHERE VIS_COD=$codigo;";

    $val = $dbmysql->query($sql);
    
    $sql1 = "UPDATE `sys_visitante_ppl` SET 
                PAR_COD =  $parentesco
            WHERE VIS_COD=$codigo AND PPL_COD=$codPpl;";

    $val1 = $dbmysql->query($sql1);
   if ($val && $val1) {
        if($codeImage != ""){saveImage($codeImage,$codigo);}    
        echo 1;
    } else {echo 0;}
}

function eliminarVisitante(){
    global $dbmysql;
    $codVisitante = $_POST['codigo'];
    $codPpl= $_POST['ppl'];
    $sql1 = "SELECT * FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante;";
    $val1 = $dbmysql->query($sql1);
    if($val1->num_rows>1){
        $sql2 = "DELETE FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante AND PPL_COD=$codPpl;";
        $val2 = $dbmysql->query($sql2);
    }elseif($val1->num_rows==1){
        $sql3 ="UPDATE `sys_visitante` SET 
                    VIS_ESTADO   = 'E'
                WHERE VIS_COD=$codVisitante AND PPL_COD=$codPpl;";
        $val3 = $dbmysql->query($sql3);
        $sql2 = "DELETE FROM `sys_visitante_ppl` WHERE VIS_COD=$codVisitante AND PPL_COD=$codPpl;";
        $val2 = $dbmysql->query($sql2);
    }
   if ($val2) {
        echo 1;
    } else {
        echo 0;
    }
}

function saveImage($base64img,$id){
    define('UPLOAD_DIR', '../../uploads/imagenes/visitante/');
    $base64img = str_replace('data:image/jpeg;base64,', '', $base64img);
    $data = base64_decode($base64img);
    $file = UPLOAD_DIR . $id .'.jpg';
    file_put_contents($file, $data);
}

function enviarDatosParentesco() {
    global $dbmysql;
    $visitante = $_POST['visitante'];
    $codPpl = $_POST['ppl'];
    $sql = "SELECT * FROM `sys_parentesco`";
    $val = $dbmysql->query($sql);
    $retval = '';
    echo $sqlPariente = "SELECT  PAR_COD FROM `sys_visitante_ppl` WHERE VIS_COD = $visitante AND PPL_COD=$codPpl";
    $valPariente = $dbmysql->query($sqlPariente);
    $rowPariente = $valPariente->fetch_object();
    if ($visitante == 0 ){$codigoPariente = "";
    }else{$codigoPariente = $rowPariente->PAR_COD;}
    $retval.='<option value="">-- Seleccione --</option>';
    while ($row = $val->fetch_object()) {
            if($row->PAR_COD == $codigoPariente ){
                $selected = 'selected="selected"';
            }else{
                $selected = '';
            }
            $retval.='<option value="' . $row->PAR_COD . '"  '.$selected.'>' . $row->PAR_DESCRIPCION . '</option>';
    }
    echo $retval;
}
function enviarDatosPpl() {
    global $dbmysql;
    $codPpl = $_POST['ppl'];
    $sql = "SELECT * FROM `sys_ppl`";
    $val = $dbmysql->query($sql);
    $retval = '';
    $retval.='<option value="">-- Seleccione --</option>';
    while ($row = $val->fetch_object()) {
            if($row->PPL_COD == $codPpl ){
                $selected = 'selected="selected"';
            }else{
                $selected = '';
            }
            $retval.='<option value="' . $row->PPL_COD . '"  '.$selected.'>' . $row->PPL_NOMBRE . ' '. $row->PPL_APELLIDO .'</option>';
    }
    echo $retval;
}
function obtenerVisitanteValido($codigo){
    global $dbmysql;
    $sql = "SELECT * FROM sys_visitante WHERE VIS_COD=$codigo;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $nombre = $row->VIS_NOMBRE;
    $apellido = $row->VIS_APELLIDO;
    $cedula = $row->VIS_CEDULA;
    $telefono = $row->VIS_TELEFONO;
    if($nombre!='' && $apellido!='' && $cedula!=''){
        return 1;
    }else{
        return 0;
    }
}
function validarVisitanteCedula(){
    global $dbmysql;
    $cedula=$_POST['cedula'];
    $sql="SELECT * FROM sys_visitante WHERE VIS_CEDULA='$cedula';";
    $val = $dbmysql->query($sql);
    if($val->num_rows>0){
        echo 1;
    }else{
        echo 0;
    }
}
function buscarVisitante(){
    global $dbmysql;
    $cedula=$_POST['cedula'];
    $sql = "SELECT * FROM sys_visitante WHERE VIS_CEDULA='$cedula';";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    
    $nombre = $row->VIS_NOMBRE;
    $apellido = $row->VIS_APELLIDO;
    $cedula = $row->VIS_CEDULA;
    $telefono = $row->VIS_TELEFONO;
    if($nombre!='' && $apellido!='' && $cedula!='' && $telefono!=''){
        return 1;
    }else{
        return 0;
    }
}