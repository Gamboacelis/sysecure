-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2014 a las 17:34:16
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
-- Estructura para la vista `sys_vw_sanciones`
--

CREATE VIEW `sys_vw_sanciones` AS select `v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`vs`.`VSA_COD` AS `VSA_COD`,`vs`.`SAN_COD` AS `SAN_COD`,`vs`.`USU_COD` AS `USU_COD`,`vs`.`VSA_NOTA` AS `VSA_NOTA`,`vs`.`VSA_FECHA_INI` AS `VSA_FECHA_INI`,`vs`.`VSA_FECHA_FIN` AS `VSA_FECHA_FIN`,`s`.`TPS_COD` AS `TPS_COD`,`s`.`SAN_DESCRIPCION` AS `SAN_DESCRIPCION`,`s`.`SAN_TIEMPO` AS `SAN_TIEMPO`,`s`.`SAN_TIEMPO_DES` AS `SAN_TIEMPO_DES`,`ts`.`TPS_DESCRIPCION` AS `TPS_DESCRIPCION` from ((((`sys_visitante_sancion` `vs` join `sys_visitante` `v`) join `sys_visitante_ppl` `vp`) join `sys_tipo_sancion` `ts`) join `sys_sanciones` `s`) where ((`v`.`VIS_COD` = `vs`.`VIS_COD`) and (`v`.`VIS_COD` = `vp`.`VIS_COD`) and (`ts`.`TPS_COD` = `s`.`TPS_COD`) and (`vs`.`SAN_COD` = `s`.`SAN_COD`) and (`v`.`VIS_ESTADO` = 'S') and (`vs`.`SAN_COD` = 1));

--
-- VIEW  `sys_vw_sanciones`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
