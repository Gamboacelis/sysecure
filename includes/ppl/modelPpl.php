<?php

include('../conexiones/db_local.inc.php');
include('../generales.php');
$ppl = new modelPpl();
//echo $ppl->verificaConyugeVisitante(1 ,'ARACELY REGINA', 'FARIAS FERNÁNDEZ', 15);

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'mostrarVisitantesPpl':
        $ppl->listVisitantes($_POST['codPpl']);
        break;
    case 'guardarListaVisitante':
        $ppl->insertarNuevoVisitante();
        break;
    case 'actualizaListaVisitante':
        $ppl->actualizarVisitante();
        break;
    case 'insertaVisitanteRepetido':
        $ppl->insertaVisitanteRepetido();
        break;
    case 'verificaConyugal':
        $ppl->verificaConyugal();
        break;
}

class modelPpl {

    protected $database;
    protected $general;

    public function __construct() {

        $this->database = new database();
        $this->general = new general();
    }

    public function listVisitantes($codigoPpl) {
        $queryVisitantes = "SELECT vp.*,v.*,p.* FROM `sys_visitante_ppl` vp, sys_visitante v,sys_parentesco p WHERE vp.`VIS_COD`=v.`VIS_COD` AND p.PAR_COD=vp.PAR_COD AND v.VIS_ESTADO !='E' AND vp.`PPL_COD`=$codigoPpl ORDER BY v.VIS_COD;";
        $resultVisitantes = $this->database->query($queryVisitantes);
        $visitantes = array();
        while ($row = $resultVisitantes->fetch_object()) {
            $visitante = array(
                'NOMBRE' => $row->VIS_NOMBRE,
                'APELLIDO' => $row->VIS_APELLIDO,
                'NOMBRES' => $row->VIS_NOMBRE . " " . $row->VIS_APELLIDO,
                'CODIGOPARENTESCO' => $row->PAR_COD,
                'PARENTESCODESCRIPCION' => $row->PAR_DESCRIPCION,
                'CODIGOPPL' => $row->PPL_COD,
                'VIS_COD' => $row->VIS_COD,
                'TPV_COD' => $row->TPV_COD,
                'VIS_ESTADO' => $row->VIS_ESTADO,
                'CODIGO_VISITANTE_PPL' => $row->VIP_COD
            );

            array_push($visitantes, $visitante);
        }

        $this->formatearListVisitante($visitantes, $codigoPpl);
    }

    public function insertarNuevoVisitante() {
        $codigoPpl = $_POST['codPlp'];
        $codigoVisitante = $_POST['codVis'];
        $codigoParentesco = $_POST['parentesco'];
        $nombreVisitante = strtoupper($_POST['nombre']);
        $apellidoVisitante = strtoupper($_POST['apellido']);


        $verificacion = $this->verificaConyugeVisitante($codigoPpl, $nombreVisitante, $apellidoVisitante, $codigoParentesco);
        switch ($verificacion) {
            case 0:
                $queryInsertarVisitante = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_ESTADO)
                VALUES('$nombreVisitante','$apellidoVisitante','N');";
                $this->database->query($queryInsertarVisitante);
                $codigoVisitante = $this->database->lastid();
                $this->insertarVisitantePpl($codigoPpl, $codigoVisitante, $codigoParentesco, $nombreVisitante, $apellidoVisitante);

                break;
            case 1:
                echo 1;
                break;
            case 2:
                $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$codigoParentesco';";
                $val2 = $this->database->query($sql2);
                $row = $val2->fetch_object();
                $datos['datosActualizados'] = array("tipo" => "repetido", "codigoPPL" => $codigoPpl, "codigoVis" => $codigoVisitante, "nombre" => $nombreVisitante, "apellido" => $apellidoVisitante, "parentesco" => $row->PAR_DESCRIPCION);
                echo json_encode($datos);
                break;
        }
    }

    public function insertaVisitanteRepetido() {
        $codigoPpl = $_POST['codPlp'];
        $codigoVisitante = $_POST['codVis'];
        $codigoParentesco = $_POST['parentesco'];
        $nombreVisitante = strtoupper($_POST['nombre']);
        $apellidoVisitante = strtoupper($_POST['apellido']);
        $this->insertarVisitantePpl($codigoPpl, $codigoVisitante, $codigoParentesco, $nombreVisitante, $apellidoVisitante);
    }

    public function insertarVisitantePpl($codigoPpl, $codigoVisitante, $codigoParentesco, $nombreVisitante, $apellidoVisitante) {
        $nombreVisitante=strtoupper($nombreVisitante);
        $apellidoVisitante=strtoupper($apellidoVisitante);
        $queryInsertarVisitantePpl = "INSERT INTO `sys_visitante_ppl` (PPL_COD,VIS_COD,PAR_COD)
                        VALUES($codigoPpl,$codigoVisitante,$codigoParentesco);";
        $result = $this->database->query($queryInsertarVisitantePpl);
        $this->general->auditoria('I', 'sys_visitante_ppl', 'valores:' . $codigoPpl . ',' . $codigoVisitante . ',' . $codigoParentesco);
        if ($result) {
            $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$codigoParentesco';";
            $val2 = $this->database->query($sql2);
            $row = $val2->fetch_object();
            $datos['datosActualizados'] = array("tipo" => "nuevo", "codigoPPL" => $codigoPpl, "codigoVis" => $codigoVisitante, "nombre" => $nombreVisitante, "apellido" => $apellidoVisitante, "parentesco" => $row->PAR_DESCRIPCION);
            echo json_encode($datos);
        } else {
            echo 3;
        }
    }

    public function verificaConyugal() {
        $codParen = $_POST['codParen'];
        $sql_tipo = "SELECT * FROM sys_parentesco WHERE `PAR_COD`=$codParen;";
        $val_tipo = $this->database->query($sql_tipo);
        if ($val_tipo->num_rows > 0) {
            $row = $val_tipo->fetch_object();
            if ($row->TPV_COD == 2) {
                echo 1;
            } else {
                echo 0;
            }
        } else {
            echo 0;
        }
    }

    public function actualizarVisitantePpl($codigoParentesco, $codigoVisitantePpl,$codigoPpl,$codigoVisitante,$nombreVisitante,$apellidoVisitante) {
        $nombreVisitante=strtoupper($nombreVisitante);
        $apellidoVisitante=strtoupper($apellidoVisitante);
        $queryActualizarVisitantePpl = "UPDATE `sys_visitante_ppl` SET PAR_COD='$codigoParentesco' WHERE VIP_COD = $codigoVisitantePpl;";
        $result=$this->database->query($queryActualizarVisitantePpl);
        $this->general->auditoria('A', 'sys_visitante_ppl', 'valores:' . $codigoVisitantePpl . ',' . $codigoParentesco);
        if ($result) {
            $sql2 = "SELECT * FROM `sys_parentesco` WHERE PAR_COD='$codigoParentesco';";
            $val2 = $this->database->query($sql2);
            $row = $val2->fetch_object();
            $datos['datosActualizados'] = array("tipo" => "nuevo", "codigoPPL" => $codigoPpl, "codigoVis" => $codigoVisitante, "nombre" => $nombreVisitante, "apellido" => $apellidoVisitante, "parentesco" => $row->PAR_DESCRIPCION);
            echo json_encode($datos);
        } else {
            echo 3;
        }
    }

    public function actualizarVisitante() {

        $codigoParentesco = $_POST['parentesco'];
        $nombreVisitante = strtoupper($_POST['nombre']);
        $apellidoVisitante = strtoupper($_POST['apellido']);
        $codigoVisitantePpl = $_POST['codigoVisitantePpl'];
        $codigoVisitante = $_POST['visCod'];
        $codigoPpl=$_POST['codPlp'];

        
                $queryActualizarVisitante = "UPDATE `sys_visitante` SET VIS_NOMBRE='$nombreVisitante',VIS_APELLIDO='$apellidoVisitante' WHERE VIS_COD=$codigoVisitante;";
                $this->database->query($queryActualizarVisitante);
              
        $this->actualizarVisitantePpl($codigoParentesco, $codigoVisitantePpl,$codigoPpl,$codigoVisitante,$nombreVisitante,$apellidoVisitante);
    }

    public function formatearListVisitante($lista, $codigoPpl) {
        $x = 1;
        $retval = "";
        foreach ($lista as $key => $value) {


            $cadenaParametros = $codigoPpl . ',' . $value['VIS_COD'] . ',\'' . $value['NOMBRE'] . ' ' . $value['APELLIDO'] . '\'';
            $tipoAccion = 'A';
            $parametros = $codigoPpl . ',' . $value['VIS_COD'] . ',\'' . $tipoAccion . '\',' . $value['CODIGO_VISITANTE_PPL'];
            //REVISAR SANCIONADOS
            $estado = ($value['VIS_ESTADO'] != 'S') ? '<a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambios" href="javascript:GuardarCambioVisita(' . $parametros . ')">
                                                <i class="fa fa-save"></i>
                                            </a>
                                            <a class="btn btn-success btn-xs visBtnDatos" title="Editar Visitante" href="javascript:editarVisita(' . $codigoPpl . ',' . $value['VIS_COD'] . ')">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a class="btn btn-danger btn-xs ' . $value['VIS_COD'] . ' eliminaVisitante visBtnDatos" title="Anular Visitante" href="javascript:eliminarVisitantePpl(' . $cadenaParametros . ')">
                                                <i class="fa fa-trash-o"></i>
                                            </a>' : '<span class="label label-danger" style="color: #fff;display: inline;font-size: 75%;font-weight: 700;line-height: 1;padding: 0.2em 0.6em 0.3em;text-align: center;"> Sancionado </span>';


            $retval.='<tr id="vis' . $value['VIS_COD'] . '">
                        <td>' . $x . '</td>
                        <td><div class="txtVisDatos" id="txtVisNombre">' . $value['NOMBRE'] . '</div><input type="text" id="visNombre" name="visNombre" class="visDatos" value="' . $value['NOMBRE'] . '"></td>
                        <td><div class="txtVisDatos" id="txtVisApellido">' . $value['APELLIDO'] . '</div><input type="text" id="visApellido" name="visApellido" class="visDatos" value="' . $value['APELLIDO'] . '"></td>
                        <td><div class="txtVisDatos" id="txtVisParentesco">' . $value['PARENTESCODESCRIPCION'] . '</div><select id="visParentesco" name="visParentesco" class="visDatos">' . $this->comboParentesco($value['TPV_COD'], $value['CODIGOPARENTESCO']) . '</select></td>
                        <td>' . $estado . '</td>
                      </tr>';
            $x++;
        }
        echo $retval;
    }

    public function comboParentesco($tipo = 0, $parentesco = 0) {
        global $dbmysql;
//    echo $parentesco;
        $ban = $_POST['alerta'];
        $codPpl = $_POST['codPpl'];
        //CONSULTAR LOS PARENTESCOS QUE TIENE EL PPL PARA QUE NO SE REPITAN
        if ($tipo != 2) {
            $sql_tipo = "SELECT vp.*,p.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v, sys_parentesco p WHERE v.`VIS_COD`=vp.`VIS_COD`AND p.`PAR_COD`=vp.`PAR_COD` AND vp.`PPL_COD`=$codPpl AND p.TPV_COD=2;";
            $val_tipo = $dbmysql->query($sql_tipo);
            if ($val_tipo->num_rows > 0)
                $ex = 2;
            else
                $ex = 0;
        }else {
            $ex = 0;
        }
        $retval = '';
        $sql = "SELECT * FROM `sys_parentesco` order by `PAR_DESCRIPCION`;";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            while ($row = $val->fetch_object()) {
                if ($row->TPV_COD != $ex) {
                    if ($parentesco == $row->PAR_COD) {
                        $select = 'selected="selected"';
                    } else {
                        $select = '';
                    }
                    $retval.='<option value="' . $row->PAR_COD . '" ' . $select . '>' . $row->PAR_DESCRIPCION . '</option>';
                }
            }
        }
        if ($ban != '')
            echo $retval;
        else
            return $retval;
    }

    public function verificaConyugeVisitante($codigoPpl, $nombreConyuge, $apellidoConyuge, $parentesco) {
        $queryNombresVisitantePpl = "SELECT vp.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v
                WHERE v.`VIS_COD`=vp.`VIS_COD`
                AND v.VIS_NOMBRE='$nombreConyuge'
                AND v.VIS_APELLIDO='$apellidoConyuge'
                AND vp.PPL_COD =$codigoPpl;";
        $result = $this->database->query($queryNombresVisitantePpl);

        if ($result->num_rows > 0) {
            return 2; // si existe el visitante en el Ppl
        } else {

            //VERIFICO EL TIPO DE PARENTESCO INGRESADO
            $queryVerificarSiEsConyuge = "SELECT * FROM `sys_parentesco` WHERE PAR_COD ='$parentesco';";
            $result = $this->database->query($queryVerificarSiEsConyuge);
            $rowVerificarSiEsConyuge = $result->fetch_object();

            /////////////////////////////////////////
            if ($rowVerificarSiEsConyuge->TPV_COD == 2) {

                $queryVerificarConyugeOtrosPpl = "SELECT vp.*,p.*,v.* FROM `sys_visitante_ppl` vp, sys_visitante v, sys_parentesco p
                    WHERE v.`VIS_COD`=vp.`VIS_COD`
                    AND p.`PAR_COD`=vp.`PAR_COD`
                    AND v.VIS_NOMBRE='$nombreConyuge'
                    AND v.VIS_APELLIDO='$apellidoConyuge'
                    AND p.TPV_COD=2;";

                $result = $this->database->query($queryVerificarConyugeOtrosPpl);
                if ($result->num_rows > 0) {

                    return 1; // ese conyuge existe en otro Ppl
                } else {

                    return 0; //NO SE EJECUTO EL QUERY
                }
            } else {

                return 0;
            }
        }
    }

}
