<?php

include('../conexiones/db_local.inc.php');
include('../generales.php');
$ppl = new modelPpl();

$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'mostrarVisitantesPpl':
        $ppl->listVisitantes($_POST['codPpl']);
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
                'VIS_ESTADO' => $row->VIS_ESTADO
            );

            array_push($visitantes, $visitante);
        }

        $this->formatearListVisitante($visitantes,$codigoPpl);
    }

    public function insertarNuevoVisitante($codigoPpl, $nombreVisitante, $apellidoVisitante, $codigoParentesco) {
        $queryInsertarVisitante = "INSERT INTO `sys_visitante`(VIS_NOMBRE,VIS_APELLIDO,VIS_ESTADO)
                VALUES('$nombreVisitante','$apellidoVisitante','N');";
        $this->database->query($queryInsertarVisitante);
        $codigoVisitante = $this->database->lastid();
        $this->insertarVisitantePpl($codigoPpl, $codigoVisitante, $codigoParentesco);
    }

    public function insertarVisitantePpl($codigoPpl, $codigoVisitante, $codigoParentesco) {
        $queryInsertarVisitantePpl = "INSERT INTO `sys_visitante_ppl` (PPL_COD,VIS_COD,PAR_COD)
                        VALUES($codigoPpl,$codigoVisitante,$codigoParentesco);";
        $this->database->query($queryInsertarVisitantePpl);
        $this->general->auditoria('I', 'sys_visitante_ppl', 'valores:' . $codigoPpl . ',' . $codigoVisitante . ',' . $codigoParentesco);
    }

    public function actualizarVisitantePpl($codigoParentesco, $codigoVisitante, $codigoPpl) {
        $queryActualizarVisitantePpl = "UPDATE `sys_visitante_ppl` SET PAR_COD='$codigoParentesco' WHERE VIS_COD=$codigoVisitante AND PPL_COD=$codigoPpl;";
        $this->database->query($queryActualizarVisitantePpl);
    }

    public function actualizarVisitante($nombreVisitante, $apellidoVisitante, $codigoVisitante) {
        $queryActualizarVisitante = "UPDATE `sys_visitante` SET VIS_NOMBRE='$nombreVisitante',VIS_APELLIDO='$apellidoVisitante' WHERE VIS_COD=$codigoVisitante;";
        $this->database->query($queryActualizarVisitante);
    }

    public function formatearListVisitante($lista,$codigoPpl) {
        $x = 1;
        $retval = "";
        foreach ($lista as $key => $value) {

                   
            $cadenaParametros = $codigoPpl.','.$value['VIS_COD'] . ',\'' . $value['NOMBRE'] . ' ' . $value['APELLIDO'] . '\'';
            $tipoAccion = 'A';
            $parametros = $codigoPpl.','.$value['VIS_COD'] . ',\'' . $tipoAccion . '\'';
            //REVISAR SANCIONADOS
            $estado = ($value['VIS_ESTADO'] != 'S') ? '<a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambios" href="javascript:GuardarCambioVisita(' . $parametros . ')">
                                                <i class="fa fa-save"></i>
                                            </a>
                                            <a class="btn btn-success btn-xs visBtnDatos" title="Editar Visitante" href="javascript:editarVisita('.$codigoPpl.',' . $row['VIS_COD'] . ')">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a class="btn btn-danger btn-xs ' . $row['VIS_COD'] . ' eliminaVisitante visBtnDatos" title="Anular Visitante" href="javascript:eliminarVisitantePpl(' . $cadenaParametros . ')">
                                                <i class="fa fa-trash-o"></i>
                                            </a>':'<span class="label label-danger" style="color: #fff;display: inline;font-size: 75%;font-weight: 700;line-height: 1;padding: 0.2em 0.6em 0.3em;text-align: center;"> Sancionado </span>';
     
            
            $retval.='<tr id="vis' . $value['VIS_COD'] . '">
                        <td>' . $x . '</td>
                        <td><div class="txtVisDatos" id="txtVisNombre">' . utf8_decode($value['NOMBRE']) . '</div><input type="text" id="visNombre" name="visNombre" class="visDatos" value="' . $value['NOMBRE'] . '"></td>
                        <td><div class="txtVisDatos" id="txtVisApellido">' . utf8_decode($value['APELLIDO']) . '</div><input type="text" id="visApellido" name="visApellido" class="visDatos" value="' . $value['APELLIDO'] . '"></td>
                        <td><div class="txtVisDatos" id="txtVisParentesco">' . $value['PARENTESCODESCRIPCION'] . '</div><select id="visParentesco" name="visParentesco" class="visDatos">' . $this->comboParentesco($value['TPV_COD'], $value['CODIGOPARENTESCO']) . '</select></td>
                        <td>'.$estado.'</td>
                      </tr>';
            $x++;
        }
        echo $retval;
    }

    function comboParentesco($tipo = 0, $parentesco = 0) {
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

}
