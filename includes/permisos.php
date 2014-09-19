<?php

session_start();
include_once("conexiones/db_local.inc.php");

class Permisos {

    function __construct($codigoUsuario) {
        $this->dbmysql = new database();
        $this->CodigoUsuario = $codigoUsuario;
    }

    function getCodigoPerfil() {
        $sql = "SELECT ROL_COD FROM `sys_usuarios` WHERE USU_COD = $this->CodigoUsuario";
        $val = $this->dbmysql->query($sql);
        $row = $val->fetch_object();
        return $row->ROL_COD;
    }

    function construirMenu() {

        $sqlMenu = "SELECT o.`OPU_COD` , o.`OPU_NOMBRE`, o.`OPU_LINK` , o.`OPU_NIVEL`, o.`OPU_COD_PADRE`,o.OPU_ICONO FROM `sys_opciones_usuario` o,  `sys_opciones_rol` op, `sys_roles` p  WHERE o.`OPU_COD` = op.`OPU_COD` AND  p.`ROL_COD` = op.`ROL_COD` AND op.`ROL_COD` =  " . $this->getCodigoPerfil() . " AND o.OPU_NIVEL = 1";
        $valMenu = $this->dbmysql->query($sqlMenu);
        $retval = "";
        while ($rowMenu = $valMenu->fetch_object()) {
            $retval.='<li '.$activarMenu1.'> <a  href="' . $rowMenu->OPU_LINK . '"><i class="fa fa-lg fa-fw '.$rowMenu->OPU_ICONO.'"></i><span class="menu-item-parent">' . $rowMenu->OPU_NOMBRE . '</span></a>';
            $sqlOpciones = "SELECT o.`OPU_COD` , o.`OPU_NOMBRE`, o.`OPU_LINK` , o.`OPU_NIVEL`, o.`OPU_COD_PADRE` FROM `sys_opciones_usuario` o,  `sys_opciones_rol` op, `sys_roles` p  WHERE o.`OPU_COD` = op.`OPU_COD` AND  p.`ROL_COD` = op.`ROL_COD` AND op.`ROL_COD`= " . $this->getCodigoPerfil() . " AND o.OPU_NIVEL = 2 AND OPU_COD_PADRE = " . $rowMenu->OPU_COD;
            $valOpciones = $this->dbmysql->query($sqlOpciones);
            $retval .= '<ul>';
            while ($rowOpciones = $valOpciones->fetch_object()) {
                $retval.='<li> <a  href="' . $rowOpciones->OPU_LINK . '"><span class="menu-item-parent">' . $rowOpciones->OPU_NOMBRE . '</span></a></li>';
            }
            $retval .= '</ul></li>';
        }
        echo $retval;
    }

}



