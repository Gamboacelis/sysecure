<?php

session_start();
include_once("conexiones/db_local.inc.php");
$dbmysql = new database();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class general {

    function inicializaMenu() {
        $activarMenu1 = '';
        $activarMenu2 = '';
        $activarMenu3 = '';
        $activarMenu31 = '';
        $activarMenu32 = '';
        $activarMenu33 = '';
        $activarMenu34 = '';
        $activarMenu35 = '';
        $activarMenu35_1 = '';
        $activarMenu35_2 = '';
        $activarMenu36 = '';
        $activarMenu37 = '';
        $activarMenu4 = '';
        $activarMenu41 = '';
        $activarMenu42 = '';
        $activarMenu43 = '';
        $activarMenu44 = '';
    }

    function registrar_acceso() {
        global $dbmysql;
        $usuario = $_SESSION["user_id"];
        $centro = $_SESSION["usu_centro_cod"];
        $fechaHora = date('Y-m-d H:i:s');
        $ip = general::obtenerIp();
        $nombreEquipo = general::obtenerNombreEquipo();
        $sql = "INSERT INTO `sys_accesos` (`USU_COD`, `CEN_COD`, `ACC_FECHA`, `ACC_IP`, `ACC_EQUIPO`)
            VALUES ('$usuario', '$centro', '$fechaHora', '$ip', '$nombreEquipo');";
        $dbmysql->query($sql);
    }

    function obtenerIp() {
        $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"] ? $_SERVER["HTTP_CF_CONNECTING_IP"] : $_SERVER["REMOTE_ADDR"];
        return $_SERVER['REMOTE_ADDR'];
    }

    function obtenerNombreEquipo() {
        return gethostname();
    }

    function obtenerPabellonPPL($codigoPpl) {
        global $dbmysql;
        $sql = "SELECT pp.*,c.*,p.*
          FROM `sys_ppl` pp, `sys_celdas` c, `sys_pabellones` p 
          WHERE pp.`CEL_COD`=c.`CEL_COD` 
          AND p.PAB_COD=c.PAB_COD 
          AND pp.`PPL_COD`=$codigoPpl";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            $row = $val->fetch_object();
            $pabellon = $row->PAB_COD;
        }
        return $pabellon;
    }

    function obtenerHorariosPabellon($codigoPabellon) {
        global $dbmysql;
        $sql = "SELECT * FROM `sys_horarios` WHERE PAB_COD=$codigoPabellon";
        $val = $dbmysql->query($sql);
        return $val;
    }

    function obtenerDia() {
        setlocale(LC_ALL, "es_ES");
        $dias = array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
        return $dias[date("w")];
    }

    function obtenerHorario($pabellon, $obtenerDia, $hora) {
        global $dbmysql;
        $horaActual = $hora;
        $sql = "SELECT tpv.*,h.* FROM `sys_horarios` h,`sys_tipovisita` tpv WHERE tpv.`TPV_COD`=h.`TPV_COD` AND `PAB_COD` = $pabellon AND `HOR_DIAS` = '$obtenerDia' AND `HOR_HORA_ING`<='$horaActual' AND `HOR_HORA_SAL`>='$horaActual' AND `HOR_ESTADO` ='A'";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            return $val;
        } else {
            return 0;
        }
    }

    function obtenerHorarioxCod($codigo) {
        global $dbmysql;
        $sql = "SELECT * FROM `sys_horarios` WHERE HOR_COD=$codigo;";
        $val = $dbmysql->query($sql);
        return $val;
    }

    function obtenerInformacionPPL($codPpl) {
        global $dbmysql;
        $sql = "SELECT p.*,pab.* FROM `sys_ppl` p, sys_pabellones pab WHERE p.PAB_COD=pab.PAB_COD AND PPL_COD=$codPpl";
        $val = $dbmysql->query($sql);
        return $val;
    }

    function obtenerValorParametro($codParametro) {
        global $dbmysql;
        $centro = $_SESSION['usu_centro_cod'];
        $sql = "SELECT PAR_COD,PAR_MODULO,PAR_DESCRIPCION,PAR_VALOR FROM `sys_parametros`WHERE `CEN_COD` = $centro AND PAR_COD=$codParametro";
        $val = $dbmysql->query($sql);
        $row = $val->fetch_object();
        $val = $row->PAR_VALOR;
        return $val;
    }

    function obtenerCantidadActualPPL($pabellon) {
        global $dbmysql;
        $sql = "SELECT count(*) AS CantPPL FROM `sys_ppl` WHERE `PAB_COD`=$pabellon AND PPL_ESTADO='A';";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            $row = $val->fetch_object();
            $val = $row->CantPPL;
            return $val;
        }
    }

    function revisarDatosVisitante($codVisitante) {
        global $dbmysql;
        $sql = "SELECT VIS_COD,VIS_NOMBRE,VIS_APELLIDO,PAR_COD,VIS_CEDULA,VIS_DIRECCION,VIS_TELEFONO,VIS_CORREO,VIS_IMAGEN,VIS_ESTADO
                FROM `sys_visitante` where `VIS_COD`=$codVisitante WHERE VIS_ESTADO='E';";
        $val = $dbmysql->query($sql);
        if ($val->num_rows > 0) {
            $row = $val->fetch_object();
            $val = $row->CantPPL;
            return $val;
        }
    }

    function getTipoCentro() {
        global $dbmysql;
        $sql = "SELECT CEN_TIPO FROM `sys_centro` WHERE CEN_COD = " . $_SESSION["usu_centro_cod"];
        $val = $dbmysql->query($sql);
        $row = $val->fetch_object();
        return $row->CEN_TIPO;
    }

}
