-- phpMyAdmin SQL Dump
-- version 4.1.13
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-09-2014 a las 13:00:29
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sysecure`
--

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control4`
--

ALTER VIEW `sys_vw_control4` AS select `v`.`VISG_COD` AS `VISG_COD`,`v`.`PPL_COD` AS `PPL_COD`,`v`.`VIP_COD` AS `VIP_COD`,`v`.`HOR_COD` AS `HOR_COD`,`v`.`VISG_FECHA` AS `VISG_FECHA`,`v`.`VISG_HORA_INGRESO` AS `VISG_HORA_INGRESO`,`v`.`VISG_HORA_SALIDA` AS `VISG_HORA_SALIDA`,`v`.`VISG_TRANSCURRIDO` AS `VISG_TRANSCURRIDO`,`v`.`VISG_POSCHAR` AS `VISG_POSCHAR`,`v`.`VISG_POSNUM` AS `VISG_POSNUM`,`v`.`VISG_ESTADO` AS `VISG_ESTADO`,`vt`.`VIS_COD` AS `VIS_COD`,`vt`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vt`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vt`.`VIS_CEDULA` AS `VIS_CEDULA`,`vt`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vt`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vt`.`VIS_CORREO` AS `VIS_CORREO`,`vt`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vt`.`VIS_ESTADO` AS `VIS_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitas` `v` join `sys_visitante_ppl` `vp` on((`vp`.`VIP_COD` = `v`.`VIP_COD`))) join `sys_visitante` `vt` on((`vt`.`VIS_COD` = `vp`.`VIS_COD`))) join `sys_pabellones` `pa`) join `sys_centro` `ce`) join `sys_ppl` `ppl`) where ((`vt`.`VIS_ESTADO` = 'A') and (`v`.`VISG_ESTADO` = 'A') and (`vp`.`PPL_COD` = `ppl`.`PPL_COD`) and (`ppl`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`));

--
-- VIEW  `sys_vw_control4`
-- Datos: Ninguna
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
