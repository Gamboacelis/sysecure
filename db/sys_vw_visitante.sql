-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2014 a las 10:38:55
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bulkenco_sysecure`
--

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_visitante`
--

CREATE VIEW `sys_vw_visitante` AS select `vp`.`VIP_COD` AS `VIP_COD`,`vp`.`PPL_COD` AS `PPL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PAB_COD` AS `PAB_COD`,`pab`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`vp`.`PAR_COD` AS `PAR_COD`,`par`.`PAR_DESCRIPCION` AS `PAR_DESCRIPCION`,`v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO` from ((((`sys_visitante` `v` join `sys_visitante_ppl` `vp` on((`v`.`VIS_COD` = `vp`.`VIS_COD`))) join `sys_ppl` `p` on((`p`.`PPL_COD` = `vp`.`PPL_COD`))) join `sys_parentesco` `par` on((`par`.`PAR_COD` = `vp`.`PAR_COD`))) join `sys_pabellones` `pab` on((`pab`.`PAB_COD` = `p`.`PAB_COD`))) where (`v`.`VIS_ESTADO` <> 'E');

--
-- VIEW  `sys_vw_visitante`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
