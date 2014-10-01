-- phpMyAdmin SQL Dump
-- version 4.1.13
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-09-2014 a las 05:02:19
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
-- Estructura Stand-in para la vista `sys_vw_control1`
--
CREATE TABLE IF NOT EXISTS `sys_vw_control1` (
`PPL_COD` int(11)
,`PAB_COD` int(11)
,`PAB_DESCRIPCION` varchar(200)
,`CEL_COD` int(11)
,`PPL_NOMBRE` varchar(200)
,`PPL_APELLIDO` varchar(200)
,`PPL_CEDULA` varchar(13)
,`PPL_IMG` varchar(200)
,`PPL_ESTADO` varchar(2)
,`HOR_DIAS` varchar(200)
,`CEN_COD` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_control2`
--
CREATE TABLE IF NOT EXISTS `sys_vw_control2` (
`CON_COD` int(11)
,`CON_ESTADO` varchar(1)
,`VIP_COD` int(11)
,`HOR_COD` int(11)
,`CON_FECHA` date
,`GAR_COD` int(11)
,`VIS_COD` int(11)
,`VIS_NOMBRE` varchar(250)
,`VIS_APELLIDO` varchar(250)
,`PAR_COD` int(11)
,`VIS_CEDULA` varchar(13)
,`VIS_DIRECCION` varchar(500)
,`VIS_TELEFONO` varchar(12)
,`VIS_CORREO` varchar(200)
,`VIS_IMAGEN` varchar(200)
,`VIS_ESTADO` varchar(2)
,`PPL_COD` int(11)
,`CEL_COD` int(11)
,`PPL_NOMBRE` varchar(200)
,`PPL_APELLIDO` varchar(200)
,`PPL_CEDULA` varchar(13)
,`PPL_IMG` varchar(200)
,`PPL_ESTADO` varchar(2)
,`CEN_COD` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_control3`
--
CREATE TABLE IF NOT EXISTS `sys_vw_control3` (
`CON_COD` int(11)
,`CON_ESTADO` varchar(1)
,`VIP_COD` int(11)
,`CON_FECHA` date
,`GAR_COD` int(11)
,`HOR_COD` int(11)
,`VIS_COD` int(11)
,`VIS_NOMBRE` varchar(250)
,`VIS_APELLIDO` varchar(250)
,`PAR_COD` int(11)
,`VIS_CEDULA` varchar(13)
,`VIS_DIRECCION` varchar(500)
,`VIS_TELEFONO` varchar(12)
,`VIS_CORREO` varchar(200)
,`VIS_IMAGEN` varchar(200)
,`VIS_ESTADO` varchar(2)
,`PPL_COD` int(11)
,`CEL_COD` int(11)
,`PPL_NOMBRE` varchar(200)
,`PPL_APELLIDO` varchar(200)
,`PPL_CEDULA` varchar(13)
,`PPL_IMG` varchar(200)
,`PPL_ESTADO` varchar(2)
,`CEN_COD` int(11)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control1`
--
DROP VIEW IF EXISTS `sys_vw_control1`; 

CREATE VIEW `sys_vw_control1` AS select `p`.`PPL_COD` AS `PPL_COD`,`p`.`PAB_COD` AS `PAB_COD`,`pa`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`h`.`HOR_DIAS` AS `HOR_DIAS`,`ce`.`CEN_COD` AS `CEN_COD` from (((`sys_ppl` `p` join `sys_pabellones` `pa` on((`pa`.`PAB_COD` = `p`.`PAB_COD`))) join `sys_horarios` `h`) join `sys_centro` `ce`) where ((`h`.`PAB_COD` = `p`.`PAB_COD`) and (curtime() between `h`.`HOR_HORA_ING` and `h`.`HOR_HORA_SAL`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`) and (`p`.`PPL_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control2`
--
DROP VIEW IF EXISTS `sys_vw_control2`;

CREATE VIEW `sys_vw_control2` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`HOR_COD` AS `HOR_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) join `sys_centro` `ce`) join `sys_pabellones` `pa`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`) and (`c`.`GAR_COD` = 1) and (`c`.`CON_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control3`
--
DROP VIEW IF EXISTS `sys_vw_control3`;

CREATE VIEW `sys_vw_control3` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`c`.`HOR_COD` AS `HOR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) join `sys_pabellones` `pa`) join `sys_centro` `ce`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`ce`.`CEN_COD` = `pa`.`CEN_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 2) and (`c`.`CON_ESTADO` in ('O','A')) and (`vs`.`VIS_ESTADO` = 'A'));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
