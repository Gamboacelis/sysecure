<?php 

//clase_visitante

include_once("../conexiones/db_local.inc.php");

date_default_timezone_set('America/Bogota');

/**
* 
*/
class clase_visitante
{
	
	function __construct()
	{
		$this->dbmysql = new database();
	}

	public function get_visitante($cedula)
	{

		$query = "SELECT * FROM sys_visitante WHERE VIS_CEDULA = '".$cedula."'";
		$datos = $this->dbmysql->query($query);
		return $datos;

	}

	public function set_visitante($datos)
	{
		//Creacion de visitante referenciando a un PPL
	}



}


$visitante = new  clase_visitante();
var_dump($visitante->get_visitante("1720985066"));
?>