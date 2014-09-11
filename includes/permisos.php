
<?php

session_start();
include_once("conexiones/db_local.inc.php");



/*

Clase para los permisos de usuarios

*/
class Permisos
{
	
	function __construct($codigoUsuario)
	{
		$this->dbmysql = new database();
		$this->CodigoUsuario = $codigoUsuario;
	}

	function getCodigoPerfil()
	{

        $sql = "SELECT ID_PERFIL FROM `sys_usuarios` WHERE USU_COD = $this->CodigoUsuario";
        $val = $this->dbmysql->query($sql);
        $row = $val->fetch_object();
        return $row->ID_PERFIL;
	}


	function construirMenu()
	{

	    $sqlMenu = "SELECT o.`ID_OPCION` , o.`NOMBRE_OPCION`, o.`LINK_OPCION` , o.`NIVEL`, o.`COD_PADRE` FROM `sys_opciones_usuario` o,  `sys_opciones_perfil` op, `sys_perfil_usuario` p  WHERE o.`ID_OPCION` = op.`COD_OPCION` AND  p.`ID_PERFIL` = op.`COD_PERFIL` AND op.`COD_PERFIL` =  ".$this->getCodigoPerfil()." AND o.NIVEL = 1";

	    $valMenu = $this->dbmysql->query($sqlMenu);

	    $retval = "";

	    while ($rowMenu = $valMenu->fetch_object()) {

	        $retval.='<li> <a  href="'.$rowMenu->LINK_OPCION.'"><span class="menu-item-parent">'. $rowMenu->NOMBRE_OPCION . '</span></a>';
	        

	        $sqlOpciones = "SELECT o.`ID_OPCION` , o.`NOMBRE_OPCION`, o.`LINK_OPCION` , o.`NIVEL`, o.`COD_PADRE` FROM `sys_opciones_usuario` o,  `sys_opciones_perfil` op, `sys_perfil_usuario` p  WHERE o.`ID_OPCION` = op.`COD_OPCION` AND  p.`ID_PERFIL` = op.`COD_PERFIL` AND op.`COD_PERFIL` =  ".$this->getCodigoPerfil()." AND o.NIVEL = 2 AND COD_PADRE = ".$rowMenu->ID_OPCION;
	        $valOpciones = $this->dbmysql->query($sqlOpciones);

	        $retval .= '<ul>';

	        while ($rowOpciones = $valOpciones->fetch_object()) {

	        	$retval.='<li> <a  href="'.$rowOpciones->LINK_OPCION.'"><span class="menu-item-parent">'. $rowOpciones->NOMBRE_OPCION . '</span></a></li>';

	        }

	        $retval .= '</ul></li>';

	    }



	    

	    echo $retval;
	}

}


$permisos = new Permisos(5);
echo $permisos->construirMenu();