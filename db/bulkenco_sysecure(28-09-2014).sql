-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2014 a las 02:42:26
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bulkenco_sysecure`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_accesos`
--

CREATE TABLE IF NOT EXISTS `sys_accesos` (
`ACC_COD` int(11) NOT NULL COMMENT 'Codigo de Acceso',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `CEN_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Centro',
  `ACC_FECHA` datetime NOT NULL COMMENT 'Fecha y Hora del Acceso',
  `ACC_IP` varchar(60) NOT NULL COMMENT 'Direccion Ip de la maquina desde la que Accesde',
  `ACC_EQUIPO` varchar(60) NOT NULL COMMENT 'Nombre del Equipo desde donde se Accede'
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COMMENT='Tabla de control de Accesos al Sistema';

--
-- Volcado de datos para la tabla `sys_accesos`
--

INSERT INTO `sys_accesos` (`ACC_COD`, `USU_COD`, `CEN_COD`, `ACC_FECHA`, `ACC_IP`, `ACC_EQUIPO`) VALUES
(1, 1, 1, '2014-09-23 07:04:43', '::1', 'ESIST09'),
(2, 1, 1, '2014-09-23 10:49:54', '::1', 'ESIST09'),
(3, 1, 1, '2014-09-25 08:52:36', '::1', 'ESIST09'),
(4, 1, 1, '2014-09-29 07:43:26', '::1', 'ESIST09'),
(5, 1, 1, '2014-10-01 07:12:41', '::1', 'ESIST09'),
(6, 1, 1, '2014-10-07 12:52:00', '::1', 'ESIST09'),
(7, 1, 1, '2014-10-07 16:30:26', '::1', 'ESIST09'),
(8, 1, 1, '2014-10-09 07:08:44', '::1', 'ESIST09'),
(9, 1, 1, '2014-10-15 09:42:28', '::1', 'ESIST09'),
(10, 1, 1, '2014-10-16 07:16:08', '::1', 'ESIST09'),
(11, 1, 1, '2014-10-16 11:45:31', '::1', 'ESIST09'),
(12, 1, 1, '2014-10-16 11:50:16', '::1', 'ESIST09'),
(13, 1, 1, '2014-10-16 12:19:26', '::1', 'ESIST09'),
(14, 1, 1, '2014-10-16 16:07:32', '::1', 'ESIST09'),
(15, 1, 1, '2014-10-16 16:11:29', '::1', 'ESIST09'),
(16, 1, 1, '2014-10-16 22:18:09', '::1', 'MacBook-Pro-de-Willian.local'),
(17, 1, 1, '2014-10-18 18:28:48', '::1', 'MacBook-Pro-de-Willian.local'),
(18, 1, 1, '2014-10-18 18:36:15', '::1', 'MacBook-Pro-de-Willian.local'),
(19, 1, 1, '2014-10-18 18:37:57', '::1', 'MacBook-Pro-de-Willian.local'),
(20, 1, 1, '2014-10-18 19:07:43', '::1', 'MacBook-Pro-de-Willian.local'),
(21, 1, 1, '2014-10-18 19:10:31', '::1', 'MacBook-Pro-de-Willian.local'),
(22, 1, 1, '2014-10-18 19:46:17', '::1', 'MacBook-Pro-de-Willian.local'),
(23, 1, 1, '2014-10-18 20:11:21', '::1', 'MacBook-Pro-de-Willian.local'),
(24, 1, 3, '2014-10-18 21:00:22', '::1', 'MacBook-Pro-de-Willian.local'),
(25, 1, 1, '2014-10-21 19:26:02', '::1', 'MacBook-Pro-de-Willian.local'),
(26, 1, 1, '2014-10-21 19:48:22', '::1', 'MacBook-Pro-de-Willian.local'),
(27, 1, 1, '2014-10-21 20:00:17', '::1', 'MacBook-Pro-de-Willian.local'),
(28, 1, 1, '2014-10-21 21:11:42', '::1', 'MacBook-Pro-de-Willian.local'),
(29, 1, 1, '2014-10-21 21:21:16', '::1', 'MacBook-Pro-de-Willian.local'),
(30, 1, 1, '2014-10-21 21:38:35', '::1', 'MacBook-Pro-de-Willian.local'),
(31, 1, 3, '2014-10-21 22:06:50', '::1', 'MacBook-Pro-de-Willian.local'),
(32, 1, 3, '2014-10-21 22:31:17', '::1', 'MacBook-Pro-de-Willian.local'),
(33, 1, 3, '2014-10-21 23:15:51', '::1', 'MacBook-Pro-de-Willian.local'),
(34, 1, 3, '2014-10-21 23:43:55', '::1', 'MacBook-Pro-de-Willian.local'),
(35, 1, 1, '2014-10-22 21:43:59', '::1', 'MacBook-Pro-de-Willian.local'),
(36, 1, 1, '2014-10-22 21:44:09', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(37, 1, 1, '2014-10-22 22:08:29', '::1', 'MacBook-Pro-de-Willian.local'),
(38, 15, 4, '2014-10-22 22:44:21', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(39, 1, 1, '2014-10-22 22:45:20', '::1', 'MacBook-Pro-de-Willian.local'),
(40, 1, 4, '2014-10-22 23:03:59', '::1', 'MacBook-Pro-de-Willian.local'),
(41, 1, 1, '2014-10-22 23:20:30', '::1', 'MacBook-Pro-de-Willian.local'),
(42, 1, 4, '2014-10-22 23:26:33', '::1', 'MacBook-Pro-de-Willian.local'),
(43, 15, 4, '2014-10-22 23:38:48', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(44, 15, 4, '2014-10-22 23:54:54', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(45, 1, 4, '2014-10-23 00:05:30', '::1', 'MacBook-Pro-de-Willian.local'),
(46, 15, 4, '2014-10-23 00:12:15', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(47, 1, 1, '2014-10-23 00:12:41', '::1', 'MacBook-Pro-de-Willian.local'),
(48, 1, 1, '2014-10-23 00:25:45', '::1', 'MacBook-Pro-de-Willian.local'),
(49, 15, 4, '2014-10-23 00:25:56', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(50, 1, 4, '2014-10-23 00:42:37', '::1', 'MacBook-Pro-de-Willian.local'),
(51, 1, 4, '2014-10-23 00:50:30', '::1', 'MacBook-Pro-de-Willian.local'),
(52, 15, 4, '2014-10-23 01:28:43', '192.168.1.6', 'MacBook-Pro-de-Willian.local'),
(53, 1, 4, '2014-10-23 12:05:30', '::1', 'MacBook-Pro-de-Willian.local'),
(54, 1, 4, '2014-10-23 12:25:22', '::1', 'MacBook-Pro-de-Willian.local'),
(55, 1, 4, '2014-10-23 13:27:31', '::1', 'MacBook-Pro-de-Willian.local'),
(56, 1, 4, '2014-10-23 13:34:58', '::1', 'MacBook-Pro-de-Willian.local'),
(57, 1, 4, '2014-10-27 21:16:14', '::1', 'MacBook-Pro-de-Willian.local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_celdas`
--

CREATE TABLE IF NOT EXISTS `sys_celdas` (
`CEL_COD` int(11) NOT NULL COMMENT 'Codigo de la celda',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_DESCRPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la celda'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Celdas que tiene un Pabellon de un centro';

--
-- Volcado de datos para la tabla `sys_celdas`
--

INSERT INTO `sys_celdas` (`CEL_COD`, `PAB_COD`, `CEL_DESCRPCION`) VALUES
(1, 1, 'Celda 1'),
(2, 1, 'Celda 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_centro`
--

CREATE TABLE IF NOT EXISTS `sys_centro` (
`CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `CIU_COD` int(11) NOT NULL COMMENT 'Codigo de la Ciudad',
  `CEN_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Centro',
  `CEN_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Centro',
  `CEN_TELEFONO` varchar(13) NOT NULL COMMENT 'Telefono del Centro',
  `CEN_TIPO` int(11) NOT NULL COMMENT 'Tipo de Centro 1: Pequeño o 2:Grande'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Datos del los centros a nivel Nacional';

--
-- Volcado de datos para la tabla `sys_centro`
--

INSERT INTO `sys_centro` (`CEN_COD`, `CIU_COD`, `CEN_DESCRIPCION`, `CEN_DIRECCION`, `CEN_TELEFONO`, `CEN_TIPO`) VALUES
(1, 1, 'CRS VARONES 4', 'EL CONDADO', '2', 1),
(3, 1, 'PRUEBA NUEVAA', 'PRUEBA', '', 2),
(4, 2, 'PENI', 'FGDFGDFGDF', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ciudad`
--

CREATE TABLE IF NOT EXISTS `sys_ciudad` (
`CIU_COD` int(11) NOT NULL COMMENT 'Codigo de Ciudad',
  `CIU_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion de la Ciudad'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Datos de las Ciudades del Ecuador';

--
-- Volcado de datos para la tabla `sys_ciudad`
--

INSERT INTO `sys_ciudad` (`CIU_COD`, `CIU_DESCRIPCION`) VALUES
(1, 'Quito'),
(2, 'Guayaquil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_control`
--

CREATE TABLE IF NOT EXISTS `sys_control` (
`CON_COD` int(11) NOT NULL COMMENT 'codigo del Control',
  `GAR_COD` int(11) NOT NULL COMMENT 'Codigo de la garita',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `HOR_COD` int(11) NOT NULL COMMENT 'Codigo del Horario',
  `CON_FECHA` date NOT NULL COMMENT 'fecha del Control',
  `CON_ESTADO` varchar(1) NOT NULL COMMENT 'A: Autorizado, N:Negado`, O: Omitido'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_control`
--

INSERT INTO `sys_control` (`CON_COD`, `GAR_COD`, `VIP_COD`, `HOR_COD`, `CON_FECHA`, `CON_ESTADO`) VALUES
(1, 1, 521, 8, '2014-10-23', 'S'),
(2, 2, 521, 8, '2014-10-23', 'S'),
(3, 3, 521, 8, '2014-10-23', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_etapas`
--

CREATE TABLE IF NOT EXISTS `sys_etapas` (
`NVL_COD` int(11) NOT NULL COMMENT 'Codigo de Etapas del Pabellon',
  `NVL_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de las Etapas del Pabellon'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Etapas en las que se encuentra un pabellon';

--
-- Volcado de datos para la tabla `sys_etapas`
--

INSERT INTO `sys_etapas` (`NVL_COD`, `NVL_DESCRIPCION`) VALUES
(1, 'Máxima Seguridad'),
(2, 'Media Seguridad'),
(3, 'Mínima Seguridad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_garita`
--

CREATE TABLE IF NOT EXISTS `sys_garita` (
  `GAR_COD` int(11) NOT NULL COMMENT 'Codigo de la garita',
  `GAR_DESCRIPCION` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Descripcion de la garita',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo de Usuario',
  `GAR_ESTADO` varchar(1) CHARACTER SET utf8 NOT NULL COMMENT 'Estado de la Garita'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_garita`
--

INSERT INTO `sys_garita` (`GAR_COD`, `GAR_DESCRIPCION`, `USU_COD`, `GAR_ESTADO`) VALUES
(1, 'Acceso 1', 1, 'A'),
(2, 'Acceso 2', 2, 'A'),
(3, 'Acceso 3', 1, 'A'),
(4, 'Acceso 4', 2, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_historia_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_historia_ppl` (
`HIS_COD` int(11) NOT NULL COMMENT 'Codigo del Historial de cambios del PPL',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `PPL_COD` int(11) DEFAULT NULL COMMENT 'Codigo del PPL',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `HIS_FECHA` datetime NOT NULL COMMENT 'fecha de Cambios del Historia',
  `HIS_MOTIVO` varchar(500) NOT NULL COMMENT 'MOtivo de los cambios'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla del Historial del PPL';

--
-- Volcado de datos para la tabla `sys_historia_ppl`
--

INSERT INTO `sys_historia_ppl` (`HIS_COD`, `USU_COD`, `PPL_COD`, `PAB_COD`, `CEL_COD`, `HIS_FECHA`, `HIS_MOTIVO`) VALUES
(1, 1, 69, 3, NULL, '2014-10-22 21:48:58', 'GDFGDFGDF'),
(2, 1, 69, 1, NULL, '2014-10-22 21:55:01', 'DRGDF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_horarios`
--

CREATE TABLE IF NOT EXISTS `sys_horarios` (
`HOR_COD` int(11) NOT NULL COMMENT 'Codigo del Horario',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo del Tipo de Visita',
  `HOR_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Horario',
  `HOR_FECHA` date NOT NULL COMMENT 'Fecha disponibles para las visitas',
  `HOR_HORA_ING` time DEFAULT NULL COMMENT 'Hora de Ingreso del Horario',
  `HOR_HORA_SAL` time DEFAULT NULL COMMENT 'Hora de Salida del Horario',
  `HOR_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estadp del Horario'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Datos de horarios que pueden tener los pabellones para las v';

--
-- Volcado de datos para la tabla `sys_horarios`
--

INSERT INTO `sys_horarios` (`HOR_COD`, `PAB_COD`, `TPV_COD`, `HOR_DESCRIPCION`, `HOR_FECHA`, `HOR_HORA_ING`, `HOR_HORA_SAL`, `HOR_ESTADO`) VALUES
(3, 1, 1, '4', '0000-00-00', '08:00:00', '23:58:00', 'E'),
(4, 2, 1, 'PRUEBA', '0000-00-00', '07:00:00', '20:30:00', 'A'),
(5, 2, 2, 'HORARIO EN LA MAñANA', '0000-00-00', '10:30:00', '17:30:00', 'A'),
(6, 6, 1, 'FAMILIAR', '0000-00-00', '01:30:00', '23:00:00', 'A'),
(7, 1, 1, 'PRUEBA', '0000-00-00', '00:00:00', '23:59:00', 'A'),
(8, 7, 1, 'PRUEBAS', '0000-00-00', '06:30:00', '20:29:00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_huellas`
--

CREATE TABLE IF NOT EXISTS `sys_huellas` (
`HUE_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del codigo de la Huella',
  `ACT_COD` int(11) DEFAULT NULL COMMENT 'Codigo secuencial de Actor',
  `HUE_CODPPLVIS` int(11) DEFAULT NULL COMMENT 'Codigo del Actor Visitante o PPL',
  `HUE_MANO` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Mano de la Huella',
  `HUE_DEDO` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Nombre del dedo de la mano',
  `HUE_HUELLA` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Huella Dactilar',
  `HUE_IMAGEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Imagen de la Huella',
  `HUE_ESTADO` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Estado: A:Activo, E:Eliminado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Huellas Dactilares ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_item_tipos`
--

CREATE TABLE IF NOT EXISTS `sys_item_tipos` (
`ITS_COD` int(11) NOT NULL COMMENT 'Codigo del Item-Tipo-Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `ITS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Item-Tipo-Sancion'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Todos los items que pueden tener los tipos de sancion';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_opciones_rol`
--

CREATE TABLE IF NOT EXISTS `sys_opciones_rol` (
`OPR_COD` int(11) NOT NULL COMMENT 'Codigo secuencial de las opciones del Rol',
  `ROL_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Rol',
  `OPU_COD` int(11) DEFAULT NULL COMMENT 'Codigo Opciones usuario'
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la relacion del Rol con las Opciones del ';

--
-- Volcado de datos para la tabla `sys_opciones_rol`
--

INSERT INTO `sys_opciones_rol` (`OPR_COD`, `ROL_COD`, `OPU_COD`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(18, 1, 12),
(19, 1, 13),
(20, 1, 14),
(21, 1, 15),
(22, 1, 16),
(23, 2, 4),
(31, 2, 10),
(30, 2, 8),
(29, 2, 3),
(28, 2, 1),
(32, 2, 2),
(33, 2, 11),
(35, 1, 17),
(36, 1, 18),
(37, 2, 17),
(38, 2, 18),
(39, 1, 19),
(40, 1, 20),
(44, 2, 6),
(43, 2, 5),
(45, 2, 7),
(46, 2, 9),
(47, 2, 12),
(48, 2, 13),
(49, 2, 14),
(50, 2, 15),
(51, 2, 16),
(52, 2, 19),
(53, 2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_opciones_usuario`
--

CREATE TABLE IF NOT EXISTS `sys_opciones_usuario` (
`OPU_COD` int(11) NOT NULL COMMENT 'Codigo secuencial de pciones usuario',
  `OPU_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre Opcion Usuario',
  `OPU_LINK` varchar(200) NOT NULL COMMENT 'Link de Opcion usuario',
  `OPU_NIVEL` int(11) NOT NULL COMMENT 'A que nivel de recusividad se esta desplegando',
  `OPU_COD_PADRE` int(11) NOT NULL COMMENT 'Codigo Padre de opciones Usuario',
  `OPU_ICONO` varchar(60) NOT NULL COMMENT 'Icono del Menu'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Tabla que identifica las opciones que puede tener un Usuario';

--
-- Volcado de datos para la tabla `sys_opciones_usuario`
--

INSERT INTO `sys_opciones_usuario` (`OPU_COD`, `OPU_NOMBRE`, `OPU_LINK`, `OPU_NIVEL`, `OPU_COD_PADRE`, `OPU_ICONO`) VALUES
(1, 'Administrativo', '#', 1, 0, 'fa-bar-chart-o'),
(2, 'Controles', '#', 1, 0, 'fa-cog'),
(3, 'Centros', '?modulo=administrativo&op=centros', 2, 1, ''),
(4, 'Horario de visitas', '?modulo=administrativo&op=horarios', 2, 1, ''),
(5, 'Pabellones', '?modulo=administrativo&op=pabellones', 2, 1, ''),
(6, 'Parametros', '?modulo=administrativo&op=parametros', 2, 1, ''),
(7, 'Sanciones', '?modulo=administrativo&op=sanciones', 2, 1, ''),
(8, 'PPL', '?modulo=administrativo&op=ppl', 2, 1, ''),
(9, 'Usuarios', '?modulo=administrativo&op=usuarios', 2, 1, ''),
(10, 'Visitantes', '?modulo=administrativo&op=visitantes', 2, 1, ''),
(11, 'Ingreso CRS', '?modulo=controles&op=acceso1', 2, 2, ''),
(12, 'Registro CRS', '?modulo=controles&op=acceso2', 2, 2, ''),
(13, 'Cacheo / Entrega Cédula', '?modulo=controles&op=acceso3', 2, 2, ''),
(14, 'Salida CRS', '?modulo=controles&op=acceso4', 2, 2, ''),
(15, 'Sanciones', '?modulo=controles&op=sanciones', 2, 2, ''),
(16, 'Roles', '?modulo=administrativo&op=roles', 2, 1, ''),
(17, 'Reportes', '#', 1, 0, 'fa-table'),
(18, 'Sancionados', '?modulo=reportes&op=sancionados', 2, 17, ''),
(19, 'Visitas', '?modulo=reportes&op=visitas', 2, 17, ''),
(20, 'Horarios', '?modulo=reportes&op=horarios', 2, 17, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_pabellones`
--

CREATE TABLE IF NOT EXISTS `sys_pabellones` (
`PAB_COD` int(11) NOT NULL COMMENT 'Codigo del pabellon',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `NVL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Etapas del Pabellon',
  `PAB_ALA` varchar(60) DEFAULT NULL COMMENT 'Ala o Piso del Pabellon',
  `PAB_DESCRIPCION` varchar(200) NOT NULL COMMENT 'descripcion del Pabellon',
  `PAB_CAPACIDAD` int(11) NOT NULL COMMENT 'Capacidad del pabellon',
  `PAB_DETALLES` varchar(1000) NOT NULL COMMENT 'Detalles del pabellon'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Datos de los Pabellones de un Centro';

--
-- Volcado de datos para la tabla `sys_pabellones`
--

INSERT INTO `sys_pabellones` (`PAB_COD`, `CEN_COD`, `NVL_COD`, `PAB_ALA`, `PAB_DESCRIPCION`, `PAB_CAPACIDAD`, `PAB_DETALLES`) VALUES
(1, 1, 2, 'NORTE', 'A', 500, ''),
(2, 1, 2, 'Sur', 'B', 200, ''),
(3, 1, 2, 'Este', 'C', 100, ''),
(4, 1, 2, 'Oeste', 'D', 200, ''),
(5, 1, 2, 'Norte', 'OBSERVACION', 200, ''),
(6, 3, 1, 'NORTE', 'NORTE-A', 200, 'PABELLON DE MAXIMA SEGURIDAD'),
(7, 4, 2, 'CENTRO', 'NOCHE', 5000, 'CANASANCIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parametros`
--

CREATE TABLE IF NOT EXISTS `sys_parametros` (
`PAR_SEC` int(11) NOT NULL,
  `PAR_COD` int(11) NOT NULL,
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `PAR_MODULO` varchar(60) NOT NULL,
  `PAR_DESCRIPCION` varchar(200) NOT NULL,
  `PAR_VALOR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Tabla de Parametros Generales';

--
-- Volcado de datos para la tabla `sys_parametros`
--

INSERT INTO `sys_parametros` (`PAR_SEC`, `PAR_COD`, `CEN_COD`, `PAR_MODULO`, `PAR_DESCRIPCION`, `PAR_VALOR`) VALUES
(1, 1, 1, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(2, 2, 1, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(3, 3, 1, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(4, 4, 1, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15'),
(5, 1, 3, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(6, 2, 3, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(7, 3, 3, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(8, 4, 3, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15'),
(9, 1, 4, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(10, 2, 4, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(11, 3, 4, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(12, 4, 4, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parentesco`
--

CREATE TABLE IF NOT EXISTS `sys_parentesco` (
`PAR_COD` int(11) NOT NULL COMMENT 'Codigo del Parentesco',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo de tipo de Visita',
  `PAR_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Parentesco'
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Parentescos que pueden tener los visitantes';

--
-- Volcado de datos para la tabla `sys_parentesco`
--

INSERT INTO `sys_parentesco` (`PAR_COD`, `TPV_COD`, `PAR_DESCRIPCION`) VALUES
(1, 1, 'PADRE'),
(2, 1, 'MADRE'),
(3, 1, 'HIJO'),
(4, 1, 'HIJA'),
(5, 1, 'ABUELO'),
(6, 1, 'NIETO'),
(7, 1, 'TÍO'),
(8, 1, 'PRIMO'),
(9, 1, 'PRIMA'),
(10, 1, 'SOBRINO'),
(11, 1, 'SOBRINA'),
(12, 1, 'CUÑADO'),
(13, 1, 'YERNO'),
(14, 1, 'NUERA'),
(15, 2, 'ESPOSA'),
(16, 2, 'ESPOSO'),
(17, 3, 'ABOGADO'),
(18, 1, 'HIJO M.E.'),
(19, 1, 'HERMANO'),
(20, 1, 'HERMANA'),
(21, 1, 'AMIGO'),
(22, 1, 'AMIGA'),
(23, 1, 'TÍA'),
(24, 1, 'ABUELA'),
(25, 1, 'PAREJA'),
(26, 1, 'EX PAREJA'),
(27, 2, 'NOVIA'),
(28, 1, 'CUÑADA'),
(29, 1, 'SUEGRA'),
(30, 1, 'SUEGRO'),
(31, 2, 'U.LIBRE'),
(32, 1, 'HIJA M.E.'),
(33, 1, 'SOBRINO M.E.'),
(34, 1, 'HIJASTRA'),
(35, 1, 'NIETO  '),
(36, 1, 'MADRE-HIJOS'),
(37, 2, 'CONVIVIENTE'),
(38, 2, 'UNIÓN DE HECHO'),
(39, 1, 'HERMANO M.E.'),
(40, 1, 'CUAÑADA'),
(41, 1, 'NIETA'),
(42, 1, 'PADRASTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_ppl` (
`PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `PAB_COD` int(11) NOT NULL COMMENT 'Codigo del Pabellon',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `PPL_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del PPL',
  `PPL_APELLIDO` varchar(200) NOT NULL COMMENT 'Apellidos del PPL',
  `PPL_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula del PPL',
  `PPL_NACIONALIDAD` varchar(60) NOT NULL COMMENT 'Nacionalidad del PPL',
  `PPL_IMG` varchar(200) NOT NULL COMMENT 'Imagen del PPL',
  `PPL_ESTADO` varchar(2) NOT NULL COMMENT 'Estado del PPL'
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='Datos de la persona Provada de Libertad';

--
-- Volcado de datos para la tabla `sys_ppl`
--

INSERT INTO `sys_ppl` (`PPL_COD`, `PAB_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_NACIONALIDAD`, `PPL_IMG`, `PPL_ESTADO`) VALUES
(1, 1, NULL, 'FABIÁN GUSTAVO', 'ARCOS PEPINOS', '1706664024', 'Ecuatoriana', '', 'A'),
(2, 5, NULL, 'BYRON ERNESTO', 'ARIAS CHICAIZA', '1721083663', 'Ecuatoriana', '', 'A'),
(3, 1, NULL, 'HAROLLD SMITH', 'BARREZUETA TORRES', '1716718372', 'Ecuatoriana', '', 'A'),
(4, 2, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', 'Ecuatoriana', '', 'A'),
(5, 1, NULL, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', '604001313', 'Ecuatoriana', '', 'A'),
(6, 1, NULL, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', '1307909752', 'Ecuatoriana', '', 'A'),
(7, 1, NULL, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', '803110071', 'Ecuatoriana', '', 'A'),
(8, 1, NULL, 'MIGUEL', 'CAMACHO MUÑOZ', '80245604', 'Colombiana', '', 'A'),
(9, 2, NULL, 'GALO ALFREDO', 'CARRERA VIZUETA', '1707502355', 'Ecuatoriana', '', 'A'),
(10, 4, NULL, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', '502313612', 'Ecuatoriana', '', 'A'),
(11, 3, NULL, 'JOSÉ KLEVER ', 'CATOTA CAIZA', '1714128079', 'Ecuatoriana', '', 'A'),
(12, 4, NULL, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', '1603603580', 'Ecuatoriana', '', 'A'),
(13, 3, NULL, 'LUIS GONZALO', 'CEVALLOS ROSERO', '400946372', 'Ecuatoriana', '', 'A'),
(14, 1, NULL, 'DARWIN STALIN', 'CONDOY ROSERO', '1711551174', 'Ecuatoriana', '', 'A'),
(15, 5, NULL, 'NELSON', 'CUEVA CALDERÓN', '1103914311', 'Ecuatoriana', '', 'A'),
(16, 1, NULL, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', '1711966935', 'Ecuatoriana', '', 'A'),
(17, 5, NULL, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', '1717757262', 'Ecuatoriana', '', 'A'),
(18, 5, NULL, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', '1714757521', 'Ecuatoriana', '', 'A'),
(19, 5, NULL, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', '1707441737', 'Ecuatoriana', '', 'A'),
(20, 4, NULL, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', '1203601586', 'Ecuatoriana', '', 'A'),
(21, 5, NULL, 'JUAN FRANCISCO', 'GUEVARA PICO', '1713413530', 'Ecuatoriana', '', 'A'),
(22, 3, NULL, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', '502655236', 'Ecuatoriana', '', 'A'),
(23, 3, NULL, 'JORGE ERNESTO', 'GUANOLUISA CURICHO', '502225618', 'Ecuatoriana', '', 'A'),
(24, 3, NULL, 'LUIS ALFREDO', 'GUANOTASIG OÑA', '502251713', 'Ecuatoriana', '', 'A'),
(25, 3, NULL, 'PEDRO', 'GUZMÁN GARCÍA', '', 'R. Dominicana', '', 'A'),
(26, 3, NULL, 'ERWIN ESTUARDO', 'IBARRA ALAVA', '1203366289', 'Ecuatoriana', '', 'A'),
(27, 2, NULL, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', '1710439215', 'Ecuatoriana', '', 'A'),
(28, 1, NULL, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', '802225441', 'Ecuatoriana', '', 'A'),
(29, 3, NULL, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', '1312084617', 'Ecuatoriana', '', 'A'),
(30, 2, NULL, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', '1719506238', 'Ecuatoriana', '', 'A'),
(31, 1, NULL, 'JOFRE DAVID ', 'LASCANO MONTALVO', '1710443688', 'Ecuatoriana', '', 'A'),
(32, 1, NULL, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', '1715450456', 'Ecuatoriana', '', 'A'),
(33, 1, NULL, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', '1721188280', 'Ecuatoriana', '', 'A'),
(34, 2, NULL, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', '1310007289', 'Ecuatoriana', '', 'A'),
(35, 2, NULL, 'DIEGO ARMANDO', 'LOOR VINUEZA', '1309691390', 'Ecuatoriana', '', 'A'),
(36, 3, NULL, 'JAIRO LEONEL', 'MAFLA ANDRADE', 'O401407838', 'Ecuatoriana', '', 'A'),
(37, 3, NULL, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', '1712774254', 'Ecuatoriana', '', 'A'),
(38, 5, NULL, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', '171461538-0', 'Ecuatoriana', '', 'A'),
(39, 5, NULL, 'MANUEL ENRIQUE', 'MALLIQUINGA CATAGÑA', '171765854-4', 'Ecuatoriana', '', 'A'),
(40, 3, NULL, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', '170473959-6', 'Ecuatoriana', '', 'A'),
(41, 1, NULL, 'LUIS LEONARDO', 'MANTILLA CHITO', '060414760-3', 'Ecuatoriana', '', 'A'),
(42, 1, NULL, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', '171757047-5', 'Ecuatoriana', '', 'A'),
(43, 5, NULL, 'EDISON FERNANDO', 'MINANGO CONSTANTE', '170798579-0', 'Ecuatoriana', '', 'A'),
(44, 3, NULL, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', '050166588-9', 'Ecuatoriana', '', 'A'),
(45, 1, NULL, 'EDUARDO ILARIO', 'MULLO UYANA', '171328476-6', 'Ecuatoriana', '', 'A'),
(46, 5, NULL, 'PATRICIO JAVIER', 'NAVAS VENEGAS', '050283379-1', 'Ecuatoriana', '', 'A'),
(47, 1, NULL, 'KLEVER ESTEBAN', 'PAVÓN CHALA', '171623318-2', 'Ecuatoriana', '', 'A'),
(48, 5, NULL, 'CARLOS CESAR', 'PÉREZ TREJO', '080187832-3', 'Ecuatoriana', '', 'A'),
(49, 1, NULL, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', '171844952-1', 'Ecuatoriana', '', 'A'),
(50, 2, NULL, 'LIBER MAURICIO', 'QUINTERO SUAREZ', '080234239-4', 'Ecuatoriana', '', 'A'),
(51, 3, NULL, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', '092692733-6', 'Ecuatoriana', '', 'A'),
(52, 2, NULL, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', '170635656-3', 'Ecuatoriana', '', 'A'),
(53, 5, NULL, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', '171606829-9', 'Ecuatoriana', '', 'A'),
(54, 1, NULL, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', '050182754-7', 'Ecuatoriana', '', 'A'),
(55, 3, NULL, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', '1802278463', 'Ecuatoriana', '', 'A'),
(56, 1, NULL, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 'O101032266', 'Ecuatoriana', '', 'A'),
(57, 3, NULL, 'LUIS ROBERTO', 'SOCASI AGUIRRE', '1709894941', 'Ecuatoriana', '', 'A'),
(58, 1, NULL, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', '1710331271', 'Ecuatoriana', '', 'A'),
(59, 3, NULL, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', '1723174973', 'Ecuatoriana', '', 'A'),
(60, 1, NULL, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', '502940406', 'Ecuatoriana', '', 'A'),
(61, 2, NULL, 'EDISON PATRICIO', 'TRAVEZ GUAITA', '1710447119', 'Ecuatoriana', '', 'A'),
(62, 1, NULL, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', '112923552', 'Ecuatoriana', '', 'A'),
(63, 3, NULL, 'LEONARDO RAFAEL', 'URBINA VIVANCO', '1804315875', 'Ecuatoriana', '', 'A'),
(64, 1, NULL, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', '1101046868', 'Ecuatoriana', '', 'A'),
(65, 5, NULL, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', '917452427', 'Ecuatoriana', '', 'A'),
(66, 5, NULL, 'DENNIS LEE', 'WALLING', '431146631', 'Estadounidense', '', 'A'),
(67, 1, NULL, 'DOUGLAS AUGUSTO', 'YÉPEZ MOGRO', '501827109', 'Ecuatoriana', '', 'A'),
(69, 4, 0, 'WILLIAN', 'ESPINOSA', '1720802394', '', '', 'A'),
(70, 6, 0, 'WILLIAN', 'ESPINOSA', '', '', '', 'A'),
(71, 6, 0, 'CAROLS', 'GUTY', '', '', '', 'A'),
(72, 6, 0, 'QWE', 'ZCXCZXC', '', '', '', 'E'),
(73, 6, 0, 'CARLOS', 'PINAS', '', '', '', 'A'),
(74, 7, 0, 'DDDDDDD', 'EEEEEEE', '', 'ECUATORIANA', '', 'A'),
(75, 7, 0, 'RRRRRFF', 'QQQQQ', '', 'PERUANO', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_roles`
--

CREATE TABLE IF NOT EXISTS `sys_roles` (
`ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol',
  `ROL_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Rol',
  `ROL_ESTADO` varchar(1) NOT NULL COMMENT 'A: Activo, I: Inactivo',
  `ROL_OBSERVACION` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT 'Observacion del Rol'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Roles que puede tener un Usuario';

--
-- Volcado de datos para la tabla `sys_roles`
--

INSERT INTO `sys_roles` (`ROL_COD`, `ROL_DESCRIPCION`, `ROL_ESTADO`, `ROL_OBSERVACION`) VALUES
(1, 'Sysecure', 'A', 'Uso Exclusivo para creadores del Sistema'),
(2, 'Super Administrador', 'A', 'Usuarios Con privilegios superiores al Administrador'),
(3, 'Administrador', 'A', 'Privilegios Administrativos'),
(4, 'PRUEBA', 'E', 'PRUEBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_sanciones`
--

CREATE TABLE IF NOT EXISTS `sys_sanciones` (
`SAN_COD` int(11) NOT NULL COMMENT 'Codigo de la Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `SAN_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la Sancion',
  `SAN_TIEMPO` int(11) DEFAULT NULL COMMENT 'Tiempo en Numeros Sancionado',
  `SAN_TIEMPO_DES` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Tiempo de la Sancion'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Tabla de almacenamiento de Sanciones de las Visitas';

--
-- Volcado de datos para la tabla `sys_sanciones`
--

INSERT INTO `sys_sanciones` (`SAN_COD`, `TPS_COD`, `SAN_DESCRIPCION`, `SAN_TIEMPO`, `SAN_TIEMPO_DES`) VALUES
(1, 1, 'no definido', 0, ''),
(2, 2, '200 g cocaina', 60, 'dias'),
(3, 2, '100 g cocaina', 30, 'dias'),
(4, 3, 'blanca', 20, NULL),
(5, 2, '400 g cocaina', 20, NULL),
(6, 2, '300 g cocaina', 15, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipoactor`
--

CREATE TABLE IF NOT EXISTS `sys_tipoactor` (
`ACT_COD` int(11) NOT NULL COMMENT 'Codigo secuencial de Actor',
  `ACT_DESCRIPCION` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Actor'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla tipo actores de las Huellas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipovisita`
--

CREATE TABLE IF NOT EXISTS `sys_tipovisita` (
`TPV_COD` int(11) NOT NULL COMMENT 'Codigo de Tipo de Visita',
  `TPV_DESCRIPCION` varchar(200) NOT NULL COMMENT 'descripcion del Tipo de Visita'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla con Tipos de visitantes';

--
-- Volcado de datos para la tabla `sys_tipovisita`
--

INSERT INTO `sys_tipovisita` (`TPV_COD`, `TPV_DESCRIPCION`) VALUES
(1, 'Familiares'),
(2, 'Conyugal'),
(3, 'Abogado'),
(4, 'General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipovisitahorario`
--

CREATE TABLE IF NOT EXISTS `sys_tipovisitahorario` (
`TVH_COD` int(11) NOT NULL COMMENT 'Codigo del Tipo de Visita horario',
  `TPV_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Tipo de Visita',
  `HOR_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Horario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relacion entre los tipos de Visitas en los diferentes horari';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipo_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_tipo_sancion` (
`TPS_COD` int(11) NOT NULL COMMENT 'Codigo del tipo-Sancion',
  `TPS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'descripcion del  tipo-Sancion'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Listado de Tipos que puede tener una sancion';

--
-- Volcado de datos para la tabla `sys_tipo_sancion`
--

INSERT INTO `sys_tipo_sancion` (`TPS_COD`, `TPS_DESCRIPCION`) VALUES
(1, 'no definido'),
(2, 'DROGAS'),
(3, 'ARMAS'),
(4, 'PRUEBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuarios`
--

CREATE TABLE IF NOT EXISTS `sys_usuarios` (
`USU_COD` int(11) NOT NULL COMMENT 'Codigo de Usuario',
  `USU_NOMBRE` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre  del Usuario',
  `USU_APELLIDO` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Apellido del Usuario',
  `USU_USUARIO` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Usuario',
  `USU_CLAVE` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Clave del Usuario',
  `USU_CEDULA` varchar(13) CHARACTER SET utf8 NOT NULL COMMENT 'Cedula del Usuario',
  `USU_EMAIL` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT 'Email del Usuario',
  `USU_CELULAR` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'Celular del Usuario',
  `USU_AVATAR` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT 'Imagen del Usuario',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol del Usuario'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='Almacen de usuarios que ingresan al sistema';

--
-- Volcado de datos para la tabla `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`USU_COD`, `USU_NOMBRE`, `USU_APELLIDO`, `USU_USUARIO`, `USU_CLAVE`, `USU_CEDULA`, `USU_EMAIL`, `USU_CELULAR`, `USU_AVATAR`, `ROL_COD`) VALUES
(1, 'Willian', 'Espinosa', 'wespinosa', '3e413f53d9f7c57b7250e9515a8d0d4d', '1720802394', 'wespinosa86@gmail.com', '0992725859', 'WillianEspinosa.jpg', 1),
(2, 'Administrador', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', 2),
(5, 'Danny', 'Uribe', 'duribe', '76d80224611fc919a5d54f0ff9fba446', '', 'duribe@gmail.com', '', '', 1),
(15, 'DIEGO', 'POZO', 'diegohp', 'e10adc3949ba59abbe56e057f20f883e', '1712589645', 'sdfsd@asdhjka.com', '0313110', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuario_centro`
--

CREATE TABLE IF NOT EXISTS `sys_usuario_centro` (
`UCE_COD` int(11) NOT NULL COMMENT 'Codigo de la tabla',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo del usuario',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='Usuarios que pertenece aun centro';

--
-- Volcado de datos para la tabla `sys_usuario_centro`
--

INSERT INTO `sys_usuario_centro` (`UCE_COD`, `USU_COD`, `CEN_COD`, `ROL_COD`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 12, 1, 1),
(6, 1, 2, 1),
(7, 1, 3, 1),
(8, 2, 3, 2),
(10, 2, 2, 2),
(11, 5, 1, 1),
(12, 5, 2, 1),
(13, 15, 4, 2),
(14, 15, 1, 2),
(15, 15, 3, 2),
(16, 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante`
--

CREATE TABLE IF NOT EXISTS `sys_visitante` (
`VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Visitante',
  `VIS_TELEFONO` varchar(12) NOT NULL COMMENT 'Telefono del visitante',
  `VIS_CORREO` varchar(200) NOT NULL COMMENT 'Correo del Visitante',
  `VIS_IMAGEN` varchar(200) NOT NULL COMMENT 'Imagen del visitante',
  `VIS_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado del Visitante',
  `VIS_TIPO` varchar(1) NOT NULL DEFAULT 'F' COMMENT 'Tipo de Visita'
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8 COMMENT='Almacen de Visitantes que pueden Acceder a un Centro';

--
-- Volcado de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `VIS_TIPO`) VALUES
(1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', '1720802394', 'GGGGGG', '2425477', '', '', 'A', 'F'),
(2, 'RAMIRO XAVIER', 'ARCOS GONZÁLEZ', '', '', '2425477', '', '', 'N', 'F'),
(3, 'JESSICA ESTEFANÍA', 'ARCOS GONZÁLEZ', '1720090057', 'sdrrafs', '2425477', '', '', 'S', 'F'),
(4, 'RENÉ ALFREDO', 'ARCOS PEPINOS', '', '', '', '', '', 'N', 'F'),
(5, 'BLASCO EDWIN', 'ARCOS PEPINOS', '', '', '', '', '', 'N', 'F'),
(6, 'MATÍAS ARCOS', 'PANAMÁ ', '', '', '2425477', '', '', 'N', 'F'),
(7, 'SEBASTIÁN ARCOS', 'PANAMÁ ', '', '', '2425477', '', '', 'N', 'F'),
(8, 'CRISTIAN ANÍBAL', 'AROS PEPINOS', '', '', '2425477', '', '', 'N', 'F'),
(9, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N', 'F'),
(10, 'BYRON ROBERTO', 'ARIAS MORALES', '', '', '2778736', '', '', 'N', 'F'),
(11, 'BRENDA GABRIELA', 'ARIAS MORALES', '', '', '2778736', '', '', 'N', 'F'),
(12, 'LUPE EDELINA', 'CHICAIZA VARGAS', '', '', '2777395', '', '', 'N', 'F'),
(13, 'MARIO ERNESTO', 'ARIAS CABRERA', '', '', '2777395', '', '', 'N', 'F'),
(14, 'MARIO ROLANDO', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N', 'F'),
(15, 'BERNARDO ISRAEL', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N', 'F'),
(16, 'NANCY GIOVANNI', 'MORALES ', '', '', '2777928', '', '', 'N', 'F'),
(17, 'ROSA CABRERA', ' ', '', '', '2390902', '', '', 'N', 'F'),
(18, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N', 'F'),
(19, 'GABRIELA MARGARITA', 'MORALES ', '', '', '2778736', '', '', 'N', 'F'),
(20, 'ALBY DEL', 'CARMEN BARRAZUETA', '', '', '2964764', '', '', 'N', 'F'),
(21, 'HENRY PAUL', 'BARRAZUETA ', '', '', '2964764', '', '', 'N', 'F'),
(22, 'ROCÍO DEL', 'CISNE BARRAZUETA', '', '', '', '', '', 'N', 'F'),
(23, 'MARCO FERNANDO', 'GAVILANES ', '', '', '2637640', '', '', 'N', 'F'),
(24, 'CATALINA DEL', 'ROCÍO GAVILANES', '', '', '2964764', '', '', 'N', 'F'),
(25, 'MARCO ALFARO', 'GAVILANES ', '', '', '2964764', '', '', 'N', 'F'),
(26, 'JHON FRANCISCO', 'BARRAZUETA ', '', '', 'O999688876', '', '', 'N', 'F'),
(27, 'MIRIAM ALEXANDRA', 'BARRAZUETA ', '', '', '', '', '', 'N', 'F'),
(28, 'CRISTIAN PAUL', 'CALLE BARRAZUETA', '', '', '', '', '', 'N', 'F'),
(29, 'MAYITA GABRIELA', 'SALAS ', '', '', '', '', '', 'N', 'F'),
(30, 'ARACELY REGINA', 'FARIAS FERNÁNDEZ', '', '', '', '', '', 'N', 'F'),
(31, 'SAMANTA SALOME', 'BERMEO CEVALLOS', '1720090057', '', '0992725859', '', '', 'S', 'F'),
(32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', '1720802394', '', '0992725859', '', '', 'S', 'F'),
(33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', '1720090057', '', '2425477', '', '', 'S', 'F'),
(34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '1720802394', '', '0992725859', '', '', 'S', 'F'),
(35, 'JOSÉ BERMEO', 'ALCIVAR ', '1720802394', '', '0992725859', '', '', 'S', 'F'),
(36, 'MARÍA BERMEO', 'ALCIVAR ', '1720802394', '', '2425477', '', '', 'S', 'F'),
(37, 'PATRICIA FARÍAS', 'FERNÁNDEZ ', '', '', '', '', '', 'N', 'F'),
(38, 'DANIELA FARÍAS', 'FERNÁNDEZ ', '', '', '', '', '', 'N', 'F'),
(39, 'ARACELY REGINA', 'FARÍAS FERNÁNDEZ', '', '', '', '', '', 'N', 'F'),
(40, 'MARÍA ALEJANDRA', 'COBO MEDINA', '', '', '32964310', '', '', 'N', 'F'),
(41, 'CAMILA ALEJANDRA', 'BONIFAZ COBO', '123456', 'DFGDFGDFGDFG', '32964310', '', '', 'S', 'F'),
(42, 'JOSÉ LUIS', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N', 'F'),
(43, 'CRISTÓBAL BONIFAZ', 'BONIFAZ ', '', '', '32928060', '', '', 'N', 'F'),
(44, 'VERÓNICA LIZBETH', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N', 'F'),
(45, 'LUIS CRISTÓBAL', 'BONIFAZ YAMBAY', '', '', '32928060', '', '', 'N', 'F'),
(46, 'LUZ MARÍA', 'YAMBAY ORDEN', '', '', '32928060', '', '', 'N', 'F'),
(47, 'TERESA DE JESÚS', 'YAMBAY BONIFAZ', '', '', '32953632', '', '', 'N', 'F'),
(48, 'MARÍA GABRIELA', 'VERGARA PANCHO', '', '', '', '', '', 'N', 'F'),
(49, 'MARÍA ALEJANDRA', 'COBO MEDINA', '', '', '32964310', '', '', 'N', 'F'),
(50, 'CARLOS ENRIQUE', 'BOLAÑOS LEÓN', '', '', '', '', '', 'N', 'F'),
(51, 'FRED ADRIAN', 'ARTEAGA GÓMEZ', '', '', '', '', '', 'N', 'F'),
(52, 'MIGUEL EMILIO', 'MORALES CASTRO', '', '', '42821853', '', '', 'N', 'F'),
(53, 'MARÍA JOSÉ', 'MAFLA ANDRADE', '', '', 'O987947094', '', '', 'N', 'F'),
(54, 'MARÍA ELISA', 'MAFLA ANDRADE', '', '', '', '', '', 'N', 'F'),
(55, 'SERGIO RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N', 'F'),
(56, 'HÉCTOR RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N', 'F'),
(57, 'VINUEZA ELSA', 'CECILIA ', '', '', 'O994960909', '', '', 'N', 'F'),
(58, 'CAGUA VINUEZA', 'RUTH NOEMI', '', '', 'O991262192', '', '', 'N', 'F'),
(59, 'MUÑOZ BONE', 'MARCO ANTONIO', '', '', 'O62700626', '', '', 'N', 'F'),
(60, 'PARRA VARGAS', 'ROBERTO FERNANDO', '', '', '', '', '', 'N', 'F'),
(61, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '', '', '', '', '', 'N', 'F'),
(62, 'DIANA ADELAIDA', 'MOREIRA BASURTO', '', '', 'O959565315', '', '', 'N', 'F'),
(63, 'REYES NORMA', 'RITA ', '', '', 'O990477166', '', '', 'N', 'F'),
(64, 'ALBORNOZ JOSÉ', 'LUIS ', '', '', 'O984246121', '', '', 'N', 'F'),
(65, 'CASTAÑO VIVIANA', 'MARÍA ', '', '', 'O983893387', '', '', 'N', 'F'),
(66, 'ALBORNOZ CASTAÑO', 'BRYAN ALEXIS', '', '', 'O984205669', '', '', 'N', 'F'),
(67, 'JÁCOME DANIELA', ' ', '', '', 'O984205669', '', '', 'N', 'F'),
(68, 'ALBORNOZ LUISA', 'MARÍA ', '', '', '', '', '', 'N', 'F'),
(69, 'ALBORNOZ DANA', 'GISEL ', '', '', 'O983199712', '', '', 'N', 'F'),
(70, 'BELTRAN ANDRÉS', ' ', '', '', 'O983199712', '', '', 'N', 'F'),
(71, 'DÁVILA REYES', 'MIRIAM EUGENIA', '', '', 'O999187184', '', '', 'N', 'F'),
(72, 'DÁVILA REYES', 'MIRIAM AUGENIA', '', '', 'O999187184', '', '', 'N', 'F'),
(73, 'MARCO RAMIRO', 'VIZUETE SANTACRUZ', '1720090057', '', '3130669', '', '', 'S', 'F'),
(74, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', '', '', '2562025', '', '', 'N', 'F'),
(75, 'ALICIA DEL PILAR', 'CARRERA VIZUETE', '1720802394', '', '3130669', '', '', 'S', 'F'),
(76, 'MÓNICA DEL ROCÍO', 'VIZUETE REVELO', '', '', '', '', '', 'N', 'F'),
(77, 'ANDRÉS FELIPE', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 'F'),
(78, 'LUIS SEBASTIÁN', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 'F'),
(79, 'GALO MATEO', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 'F'),
(80, 'BYRON EDUARDO', 'VITERI ESTEVEZ', '', '', 'O999035799', '', '', 'N', 'F'),
(81, 'ROSA ELENA', 'CARRERA VIZUETE', '', '', '3130669', '', '', 'N', 'F'),
(82, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', '', '', '2562025', '', '', 'N', 'F'),
(83, 'RICARDO ALBERTO', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 'F'),
(84, 'RICARDO DAMIÁN', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 'F'),
(85, 'RICARDO RAFAEL', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 'F'),
(86, 'RICARDO AUGUSTO', 'CARVAJAL ', '', '', 'O995253019', '', '', 'N', 'F'),
(87, 'HILDA MARINA', 'CASTILLO SEMBLANTES', '', '', 'O995270904', '', '', 'N', 'F'),
(88, 'CESAR AUGUSTO', 'CARVAJAL CASTILLO', '', '', 'O999025296', '', '', 'N', 'F'),
(89, 'CRISTIAN FERNANDO', 'CARVAJAL CASTILLO', '', '', 'O987742427', '', '', 'N', 'F'),
(90, 'JESSICA PAULINA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N', 'F'),
(91, 'VERÓNICA LORENA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N', 'F'),
(92, 'EVELYN DAYANA', 'HERNÁNDEZ GAVILANES', '', '', 'O987391139', '', '', 'N', 'F'),
(93, 'CAIZA QUERO', 'ROSA MERCEDES', '', '', '2407067', '', '', 'N', 'F'),
(94, 'CATOTA TIPANLUISA', 'JOSÉ HILARIO', '', '', '2407067', '', '', 'N', 'F'),
(95, 'CAIZA QUERO', 'MARÍA LUISA', '', '', '2811779', '', '', 'N', 'F'),
(96, 'CAIZA QUERO', 'HILDA MARÍA', '', '', '2811779', '', '', 'N', 'F'),
(97, 'CATOTA CAIZA', 'MARIA CECILIA', '', '', '2407067', '', '', 'N', 'F'),
(98, 'CATOTA ACHIG', 'GIOVANNI JAIR', '', '', '3121515', '', '', 'N', 'F'),
(99, 'CATOTA ACHIG', 'GEOMEL ALEXANDER', '', '', '3121515', '', '', 'N', 'F'),
(100, 'CATOTA ACHIG', 'EDIOSN ALDAIR', '', '', '3121515', '', '', 'N', 'F'),
(101, 'CAIZA GUACHAMIN', 'MARIA FERNANDA', '', '', '', '', '', 'N', 'F'),
(102, 'ACHIG ENDARA', 'MARICELA MELBA', '', '', '3121515', '', '', 'N', 'F'),
(103, 'PAAGUAY ATUPAÑA', 'SONIA MARICELA', '', '', '32951568', '', '', 'N', 'F'),
(104, 'CEPEDA PAGUAY', 'LIZBETHESTEFANIA ', '', '', '32951568', '', '', 'N', 'F'),
(105, 'CEPEDA PAGUAY', 'ANDRÉS ALEJANDRO', '', '', '32951568', '', '', 'N', 'F'),
(106, 'CEPEDA PAGUAY', 'DIEGO FERNANDO', '', '', '32951568', '', '', 'N', 'F'),
(107, 'CEPEDA SOLÍS', 'JOSÉ ENRIQUE', '', '', 'O995452589', '', '', 'N', 'F'),
(108, 'ARÉVALO ANDRADE', 'ANA GRACIELA', '', '', 'O995452589', '', '', 'N', 'F'),
(109, 'CEPEDA ARÉVALO', 'JHOANA GABRIELA', '', '', 'O998489826', '', '', 'N', 'F'),
(110, 'CEPEDA AREVALO', 'MARCELO RODRIGO', '', '', 'O987616282', '', '', 'N', 'F'),
(111, 'CEPEDA AREVALO', 'JAVIER ENRIQUE', '', '', 'O995497923', '', '', 'N', 'F'),
(112, 'MANZANO RUÍZ', 'MARY PATRICIA', '', '', 'O993768671', '', '', 'N', 'F'),
(113, 'JAQUELINE BONAFONT', ' ', '', '', '42214269', '', '', 'N', 'F'),
(114, 'JAQUELINE BONAFONT', ' ', '', '', '42214269', '', '', 'N', 'F'),
(115, 'IVÁN CEVALLOS', ' ', '', '', '', '', '', 'N', 'F'),
(116, 'RITA CEVALLOS', ' ', '', '', '', '', '', 'N', 'F'),
(117, 'ROSARIO RUEDA', ' ', '', '', '', '', '', 'N', 'F'),
(118, 'VERÓNICA ROSERO', ' ', '', '', '', '', '', 'N', 'F'),
(119, 'CRISTINA SAAVEDRA', ' ', '', '', '', '', '', 'N', 'F'),
(120, 'JIMENA SAAVEDRA', ' ', '', '', '', '', '', 'N', 'F'),
(121, 'LIYEN CEVALLOS', ' ', '', '', '', '', '', 'N', 'F'),
(122, 'LIZ CEVALLOS', ' ', '', '', '', '', '', 'N', 'F'),
(123, 'LAURA MARLENE', 'MOLINA JIMÉNEZ', '', '', '', '', '', 'N', 'F'),
(124, 'MARÍA GRACIELA', 'VIZCAINO ', '', '', '2748058', '', '', 'N', 'F'),
(125, 'DARWIN JOEL', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N', 'F'),
(126, 'CLARIBEL NIKYTA', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N', 'F'),
(127, 'HOMERO DANIEL', 'CONDOY VIZACAINO', '', '', '2748058', '', '', 'N', 'F'),
(128, 'CARLOS HOMERO', 'CONDOY ROSERO', '', '', '2748058', '', '', 'N', 'F'),
(129, 'ZARA PÉREZ', ' ', '', '', '3050162', '', '', 'N', 'F'),
(130, 'EMILI CUEVA', ' ', '', '', '', '', '', 'N', 'F'),
(131, 'MATÍAS SEBASTIÁN', 'CUEVA ', '', '', '', '', '', 'N', 'F'),
(132, 'JEREMY CUEVA', ' ', '', '', '', '', '', 'N', 'F'),
(133, 'NORMA CUEVA', ' ', '', '', '', '', '', 'N', 'F'),
(134, 'PEDRO SÁNCHEZ', ' ', '', '', '', '', '', 'N', 'F'),
(135, 'PATRICIA PÉREZ', ' ', '', '', '', '', '', 'N', 'F'),
(136, 'MILTON TORRES', ' ', '', '', '', '', '', 'N', 'F'),
(137, 'ROSA PÉREZ', ' ', '', '', '', '', '', 'N', 'F'),
(138, 'ANA CRISTINA', 'VIVANCO DÍAZ', '', '', '', '', '', 'N', 'F'),
(139, 'MARÍA BELÉN', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 'F'),
(140, 'VÍCTOR ALEXIS', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 'F'),
(141, 'ISABEL CAROLINA', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 'F'),
(142, 'VÍCTOR ANTONIO', 'ENRÍQUEZ ', '', '', '2960154', '', '', 'N', 'F'),
(143, 'ROSA ELENA', 'ENRÍQUEZ CABRERA', '', '', '', '', '', 'N', 'F'),
(144, 'JULIO CABRERA', 'LOAIZA ', '', '', '', '', '', 'N', 'F'),
(145, 'MARÍA DEL CARMEN', 'CABRERA LOAIZA', '', '', '', '', '', 'N', 'F'),
(146, 'DEISY AMELIA', 'DÍAZ DÍAZ', '', '', '', '', '', 'N', 'F'),
(147, 'JESICA CAÑIZARES', ' ', '', '', '2732294', '', '', 'N', 'F'),
(148, 'CESAR DOMÍNGUEZ', ' ', '', '', '2620271', '', '', 'N', 'F'),
(149, 'NORIS CEVALLOS', ' ', '', '', '2620271', '', '', 'N', 'F'),
(150, 'NANCY BORJA', ' ', '', '', '2732294', '', '', 'N', 'F'),
(151, 'LUIS CAÑIZARES', ' ', '', '', '2732294', '', '', 'N', 'F'),
(152, 'JOHANA CAÑIZARES', ' ', '', '', '', '', '', 'N', 'F'),
(153, 'NERBO VERDESOTO', ' ', '', '', '', '', '', 'N', 'F'),
(154, 'PILAR REAL', ' ', '', '', '', '', '', 'N', 'F'),
(155, 'MILENA DOMÍNGUEZ', ' ', '', '', '', '', '', 'N', 'F'),
(156, 'KATHY YESSENIA', 'MOROCHO IMBACUAN', '', '', '2661954', '', '', 'N', 'F'),
(157, 'CINTHIA ALEJANDRA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 'F'),
(158, 'MAYERLI MICAELA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 'F'),
(159, 'SARAY NICOLL', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 'F'),
(160, 'JOSÉ ARCESIO', 'FAJARDO ', '', '', 'O997299977', '', '', 'N', 'F'),
(161, 'LUCIA BEATRIZ', 'GAVIDIA ESTRELLA', '', '', 'O997299977', '', '', 'N', 'F'),
(162, 'VÍCTOR HUGO', 'MOROCHO ', '', '', '2661954', '', '', 'N', 'F'),
(163, 'MARÍA IMBACUAN', ' ', '', '', '2661954', '', '', 'N', 'F'),
(164, 'MARIANA GAVIDIA', 'ESTRELLA ', '', '', 'O997299977', '', '', 'N', 'F'),
(165, 'DIANA SORAYA', 'FAJARDO GAVIDIA', '', '', 'O997299977', '', '', 'N', 'F'),
(166, 'MARCIA ROBALINO', ' ', '', '', '', '', '', 'N', 'F'),
(167, 'ZULEMA MANTILLA', ' ', '', '', '', '', '', 'N', 'F'),
(168, 'ADELA FIGUEROA', ' ', '', '', '', '', '', 'N', 'F'),
(169, 'CARLA FIGUEROA', ' ', '', '', '', '', '', 'N', 'F'),
(170, 'NEPALÍ MARTÍNEZ', ' ', '', '', '', '', '', 'N', 'F'),
(171, 'GUILLERMO BARRAGÁN', ' ', '', '', '', '', '', 'N', 'F'),
(172, 'MANUEL ÁLVAREZ', ' ', '', '', '', '', '', 'N', 'F'),
(173, 'MARCET GUAMÁN', ' ', '', '', '', '', '', 'N', 'F'),
(174, 'ROCIO ARCE', ' ', '', '', '', '', '', 'N', 'F'),
(175, 'KATTY LÓPEZ', 'CAICEDO ', '', '', '', '', '', 'N', 'F'),
(176, 'ADOLFO FRUTO', 'VERGARA ', '', '', '', '', '', 'N', 'F'),
(177, 'MARGARITA MÁRQUEZ', 'FERNÁNDEZ ', '', '', '', '', '', 'N', 'F'),
(178, 'DIANA FRUTO', 'MÁRQUEZ ', '', '', '', '', '', 'N', 'F'),
(179, 'ANTONY FRUTO', 'MORA ', '', '', '', '', '', 'N', 'F'),
(180, 'ALEX GÓMEZ', 'PONCE ', '', '', '', '', '', 'N', 'F'),
(181, 'MAGALY DEL', 'ROCÍO PEÑA', '', '', '', '', '', 'N', 'F'),
(182, 'ALEJANDRA CORONEL', 'MONTALVO ', '', '', '', '', '', 'N', 'F'),
(183, 'MARILYN ERAZO', ' ', '', '', '', '', '', 'N', 'F'),
(184, 'FELIX GUEVARA', ' ', '', '', '', '', '', 'N', 'F'),
(185, 'CARLOS GUEVARA', ' ', '', '', '', '', '', 'N', 'F'),
(186, 'JUAN DIEGO', 'GUEVARA ', '', '', '', '', '', 'N', 'F'),
(187, 'SAMUEL ERAZO', ' ', '', '', '', '', '', 'N', 'F'),
(188, 'NOEMI NARVÁEZ', ' ', '', '', '', '', '', 'N', 'F'),
(189, 'ANDRÉS ERAZO', ' ', '', '', '', '', '', 'N', 'F'),
(190, 'DARWIN GUEVARA', ' ', '', '', '', '', '', 'N', 'F'),
(191, 'FREDY GUEVARA', ' ', '', '', '', '', '', 'N', 'F'),
(192, 'MARY RAQUEL', 'HURTADO CHANGO', '', '', '', '', '', 'N', 'F'),
(193, 'MAILY JORDANA', 'GUAMÁN HURTADO', '', '', '', '', '', 'N', 'F'),
(194, 'SEGUNDO AURELIO', 'GUAMÁN ', '', '', '', '', '', 'N', 'F'),
(195, 'MARÍA CONCEPCIÓN', 'SIMALUISA COPARA', '', '', '', '', '', 'N', 'F'),
(196, 'MIRYAN ESTHER', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 'F'),
(197, 'MARÍA ORFELINA', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 'F'),
(198, 'DIEGO JAVIER', 'SIMALUISA SIMALUISA', '', '', '', '', '', 'N', 'F'),
(199, 'EDWIN HIPOLITO', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 'F'),
(200, 'JENNY IZA', ' ', '', '', '', '', '', 'N', 'F'),
(201, 'JOSUE GUAMÁN', 'IZA ', '', '', '', '', '', 'N', 'F'),
(202, 'SONIA JUDITH', 'VERA VINUEZA', '', '', '2321762', '', '', 'N', 'F'),
(203, 'JOSÉ HERIBERTO', 'GUANOLUISA TIPAN', '', '', '', '', '', 'N', 'F'),
(204, 'AMPARITO AZUCENA', 'MARTÍNEZ MORALES', '', '', '2526266', '', '', 'N', 'F'),
(205, 'JESSICA PAOLA', 'TIXILEMA MARTÍNEZ', '', '', '3069334', '', '', 'N', 'F'),
(206, 'MAYRA ELIZABETH', 'GUANOLUISA MARTÍNEZ', '', '', '', '', '', 'N', 'F'),
(207, 'ANDERSON ALEXANDER', 'RAMÍREZ GUANOLUISA', '', '', '', '', '', 'N', 'F'),
(208, 'LADDY ANTONELLA', 'RAMÍREZ GUANOLUISA', '', '', '', '', '', 'N', 'F'),
(209, 'MILTON EDUARDO', 'GUANOTASIG OÑA', '', '', '', '', '', 'N', 'F'),
(210, 'CRISTINA SIMBAÑA', ' ', '', '', '', '', '', 'N', 'F'),
(211, 'ELVIA YOLANDA', 'GUANOTASIG OÑA', '', '', '', '', '', 'N', 'F'),
(212, 'VICENTE AGUSTIN', 'GUANOTASIG PILLIZA', '', '', '', '', '', 'N', 'F'),
(213, 'ZOILA OÑA', 'PILLIZA ', '', '', '', '', '', 'N', 'F'),
(214, 'SANDRA JANETH', 'LUCERO SÁNCHEZ', '', '', '3020554', '', '', 'N', 'F'),
(215, 'ANDREA ESTEFANIA', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N', 'F'),
(216, 'JAIDI ANALIE', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N', 'F'),
(217, 'MARÍA TERESA', 'TUFIÑO ', '', '', '2630445', '', '', 'N', 'F'),
(218, 'HUGO ISMAEL', 'IÑIGUEZ LUZURIAGA', '', '', '2630445', '', '', 'N', 'F'),
(219, 'VÍCTOR EDUARDO', 'LUCERO DÍAZ', '', '', '3020554', '', '', 'N', 'F'),
(220, 'MIRIAM CECILIA', 'SÁNCHEZ ARROYO', '', '', '3020554', '', '', 'N', 'F'),
(221, 'NANCY SAENZ', 'TUFIÑO ', '', '', '', '', '', 'N', 'F'),
(222, 'ATILIO INTRIAGO', 'CARRANZA ', '', '', '', '', '', 'N', 'F'),
(223, 'CARLOS CEVALLOS', 'ESTRADA ', '', '', '', '', '', 'N', 'F'),
(224, 'STEVEN INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 'F'),
(225, 'ARIEL INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 'F'),
(226, 'MATÍAS INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 'F'),
(227, 'NELLY LILIANA', 'ORTIZ CARRASCO', '', '', '', '', '', 'N', 'F'),
(228, 'WASHINGTON PULECIO', 'MELGAR ', '', '', '', '', '', 'N', 'F'),
(229, 'GISELLA CAROLINA', 'VALAREZO CHILA', '', '', '', '', '', 'N', 'F'),
(230, 'NESTOR LENIN', 'MONTAÑO VALENCIA', '', '', '', '', '', 'N', 'F'),
(231, 'LORGIO INTRIAGO', 'PINARGOTE ', '', '', '', '', '', 'N', 'F'),
(232, 'DENNY GARCÍA', 'DELGADO ', '', '', 'O988814990', '', '', 'N', 'F'),
(233, 'JONATHAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N', 'F'),
(234, 'ANYERLI INTRIAGO', 'SÁNCHEZ ', '', '', '', '', '', 'N', 'F'),
(235, 'ADRIAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N', 'F'),
(236, 'RICARDO GARCÍA', 'DELGADO ', '', '', '', '', '', 'N', 'F'),
(237, 'JEFFERSON GARCÍA', 'INTRIAGO ', '', '', '', '', '', 'N', 'F'),
(238, 'MARÍA ETELVINA', 'SIMABAÑA ESPINOZA', '', '', '3262234', '', '', 'N', 'F'),
(239, 'ALFONSO JETACAMA', 'YACELGA ', '', '', '3262234', '', '', 'N', 'F'),
(240, 'LUIS FERNANDO', 'JETACAMA SIMBAÑA', '', '', '3262234', '', '', 'N', 'F'),
(241, 'ÁNGEL SANTIAGO', 'JETACAMA SIMABAÑA', '', '', '', '', '', 'N', 'F'),
(242, 'JONATHAN DAVID', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N', 'F'),
(243, 'PABLO ALFONSO', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N', 'F'),
(244, 'ALISSON NAYETH', 'JETACAMA CHICAIZA', '', '', '', '', '', 'N', 'F'),
(245, 'VIVIANA JAQUELINE', 'CHICAIZA ZARATE', '', '', '2673132', '', '', 'N', 'F'),
(246, 'SANDRA AULESTIA', 'ACURIO ', '', '', 'O998884336', '', '', 'N', 'F'),
(247, 'BEATRIZ MONTALVO', 'SALAZAR ', '', '', '3163351', '', '', 'N', 'F'),
(248, 'LEONIDAS LASCANO', 'MALES ', '', '', 'NO SABE', '', '', 'N', 'F'),
(249, 'ISAAC LASCANO', 'CERÓN ', '', '', '', '', '', 'N', 'F'),
(250, 'ALISSON LASCANO', 'CERÓN ', '', '', '', '', '', 'N', 'F'),
(251, 'MARIANA LASCANO', 'MALES ', '', '', '', '', '', 'N', 'F'),
(252, 'CARLOS CALLE', 'CABEZAS ', '', '', '', '', '', 'N', 'F'),
(253, 'MYRIAN ANABEL', 'APOLO ÁLVAREZ', '', '', '2639858', '', '', 'N', 'F'),
(254, 'MAYTE SUSANA', 'LASO APOLO', '', '', '2639858', '', '', 'N', 'F'),
(255, 'PIEDAD SUSANA', 'LASO ALMEIDA', '', '', '2634763', '', '', 'N', 'F'),
(256, 'CRISTIAN DANIEL', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 'F'),
(257, 'YESENIA XIMENA', 'TOMALO LASO', '', '', '2639858', '', '', 'N', 'F'),
(258, 'LUIS PATRICIO', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 'F'),
(259, 'MARTHA YOLANDA', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 'F'),
(260, 'SEGUNDO EFRAIN', 'ALMEIDA ', '', '', '2639858', '', '', 'N', 'F'),
(261, 'LUZMILA ALMEIDA', ' ', '', '', '2910382', '', '', 'N', 'F'),
(262, 'EDGAR VINICIO', 'GARZÓN ALMEIDA', '', '', '2910382', '', '', 'N', 'F'),
(263, 'KARLA PAOLA', 'BUSTOS YAGUACHI', '', '', '3035841', '', '', 'N', 'F'),
(264, 'EULALIA MENESES', 'PAREDES ', '', '', '3035841', '', '', 'N', 'F'),
(265, 'GABRIEL LLUMIQUINGA', 'PAUCAR ', '', '', '3035841', '', '', 'N', 'F'),
(266, 'JULIANA LUMIQUINGA', 'BUSTOS ', '', '', '3035841', '', '', 'N', 'F'),
(267, 'WILLIAM LUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N', 'F'),
(268, 'KATHERINE LLUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N', 'F'),
(269, 'EVELYN LLUMIQUINGA', 'MENESES ', '', '', '', '', '', 'N', 'F'),
(270, 'BYRON BUSTOS', 'YAGUACHI ', '', '', '3035841', '', '', 'N', 'F'),
(271, 'ARON LLUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N', 'F'),
(272, 'LORENA SIMBA', ' ', '', '', '3035841', '', '', 'N', 'F'),
(273, 'MARÍA CRISTINA', 'LOOR BRIONES', '', '', '', '', '', 'N', 'F'),
(274, 'PEDRO MIGUEL', 'LOOR SABANDO', '', '', '', '', '', 'N', 'F'),
(275, 'SANTA GERARDINA', 'CÓRDOVA CEVALLOS', '', '', '', '', '', 'N', 'F'),
(276, 'MIGUEL ADRIAN', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 'F'),
(277, 'MARÍA CRUZ', 'CRUZ LOOR', '', '', '', '', '', 'N', 'F'),
(278, 'CLEMENTE CEDEÑO', 'CÓRDOVA ', '', '', '', '', '', 'N', 'F'),
(279, 'JUANA ERLINDA', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 'F'),
(280, 'MIGUEL LEONEL', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 'F'),
(281, 'RAMÓN CÓRDOVA', 'MOLINA ', '', '', '', '', '', 'N', 'F'),
(282, 'ANA CRISTINA', 'LOOR LOOR', '', '', '', '', '', 'N', 'F'),
(283, 'MARIA GEMA', 'BAZURTO MENDOZA', '', '', '', '', '', 'N', 'F'),
(284, 'DIEGO JANVIER', 'LOOR BAZURTO', '', '', '', '', '', 'N', 'F'),
(285, 'FANNY VINUEZA', 'ANCHUNDIA ', '', '', '', '', '', 'N', 'F'),
(286, 'JOSÉ NEPTALI', 'LOOR GARCÍA', '', '', '', '', '', 'N', 'F'),
(287, 'JOSÉ FERNANDO', 'LOOR VINUEZA', '', '', '', '', '', 'N', 'F'),
(288, 'GEMA MATILDE', 'LOOR VINUEZA', '', '', '', '', '', 'N', 'F'),
(289, 'OSWALDO BAZURTO', 'MENDOZA ', '', '', '', '', '', 'N', 'F'),
(290, 'JOSÉ OSCAR', 'LOOR GARCÍA', '', '', '', '', '', 'N', 'F'),
(291, 'JOSE MARÍA', 'LOOR GARCÍA', '', '', '', '', '', 'N', 'F'),
(292, 'PONCE PONCE', 'MARÍA PATRICIA', '', '', 'O980251632', '', '', 'N', 'F'),
(293, 'MAFLA VALVERDE', 'OSWALDO GUILLERMO', '', '', 'O994162519', '', '', 'N', 'F'),
(294, 'ANDRADE RUIZ', 'NANCY GUADALUPE', '', '', 'O994162519', '', '', 'N', 'F'),
(295, 'MAFLA ANDRADE', 'GUILLERMO ANDRÉS', '', '', 'O986173065', '', '', 'N', 'F'),
(296, 'CASTILLO MOLINA', 'ELIANA ELIZABETH', '', '', '', '', '', 'N', 'F'),
(297, 'MAFLA CASTILLO', 'NATHALY JULIETE', '', '', '', '', '', 'N', 'F'),
(298, 'URUTIA SOTO', 'ROSANA PATRICIA', '', '', 'O62280675', '', '', 'N', 'F'),
(299, 'DELIA ÁLVAREZ', 'ANAGO ', '', '', '2892564', '', '', 'N', 'F'),
(300, 'MARIANO LLULLUMA', 'RODRÍGUEZ ', '', '', '2892564', '', '', 'N', 'F'),
(301, 'EYMI LLLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 'F'),
(302, 'JOSELYN LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 'F'),
(303, 'DANTE LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 'F'),
(304, 'AURORA PERALTA', 'VILLACIS ', '', '', '', '', '', 'N', 'F'),
(305, 'ANITA LUCIA', 'LLULLUMA ÁLVAREZ', '', '', '', '', '', 'N', 'F'),
(306, 'MARCO LLULLUMA', 'ÁLVAREZ ', '', '', '', '', '', 'N', 'F'),
(307, 'LIBIA BERNAL', 'VERA ', '', '', '', '', '', 'N', 'F'),
(308, 'LAURA MARCELA', 'LARA MONAR', '', '', '2681000', '', '', 'N', 'F'),
(309, 'LUIS MATEO', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N', 'F'),
(310, 'ALAN ANDRÉS', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N', 'F'),
(311, 'JOSÉ ALBERTO', 'MALLIQUINGA AGUAYO', '', '', '2681000', '', '', 'N', 'F'),
(312, 'MARÍA ANDAGOYA', 'COYAGO ', '', '', '2681000', '', '', 'N', 'F'),
(313, 'CARMEN GUADALUPE', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 'F'),
(314, 'MARÍA ELIZABETH', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 'F'),
(315, 'VÍCTOR DANIEL', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 'F'),
(316, 'EVELIN ESTEFANIA', 'CEVALLOS ANDAGOYA', '', '', '2681000', '', '', 'N', 'F'),
(317, 'EVELYN ROXANA', 'LLUMIQUINGA PACHACAMA', '', '', 'O980992267', '', '', 'N', 'F'),
(318, 'JOSTIN ARIEL', 'MALLIQUINGA LLUMIQUINGA', '', '', 'O980992267', '', '', 'N', 'F'),
(319, 'MARÍA ZOILA', 'CATAGÑA USHIÑA', '', '', '2787532', '', '', 'N', 'F'),
(320, 'MARIANA DE JESÚS', 'CUEVA CEVALLOS', '', '', '2530151', '', '', 'N', 'F'),
(321, 'ANGELO RAMIRO', 'MANOSALVAS CUEVA', '', '', '2530151', '', '', 'N', 'F'),
(322, 'ALEXANDER MANOSALVAS', 'CUEVA ', '', '', '2530151', '', '', 'N', 'F'),
(323, 'SOFÍA ISABEL', 'MANOSALVAS CUEVA', '', '', '2530151', '', '', 'N', 'F'),
(324, 'GLORIA INÉS', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N', 'F'),
(325, 'VÍCTOR EMILIO', 'LUDEÑA CUEVA', '', '', '2530151', '', '', 'N', 'F'),
(326, 'GERMÁN RODRIGO', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N', 'F'),
(327, 'JOSEFINA CUEVA', 'CEVALLOS ', '', '', '2530151', '', '', 'N', 'F'),
(328, 'MARCO ANICETO', 'CHANGO ', '', '', '2530151', '', '', 'N', 'F'),
(329, 'MIKAELA ROSIBEL', 'GUZMÁN MOROCHO', '', '', 'O967378926', '', '', 'N', 'F'),
(330, 'PAULINA ELIZABETH', 'MANTILLA CHITO', '', '', 'O993803415', '', '', 'N', 'F'),
(331, 'PAMELA DE LOS ÁNGELES', 'MANTILLA CHITO', '', '', '', '', '', 'N', 'F'),
(332, 'DANIEL CARRILLO', ' ', '', '', '', '', '', 'N', 'F'),
(333, 'ROCÍO ERAZO', ' ', '', '', '', '', '', 'N', 'F'),
(334, 'GUADALUPE ERAZO', ' ', '', '', '', '', '', 'N', 'F'),
(335, 'MARTHA CHITO', 'TACURI ', '', '', '', '', '', 'N', 'F'),
(336, 'BLANCA MANTILLA', ' ', '', '', '', '', '', 'N', 'F'),
(337, 'MARCELA LÓPEZ', ' ', '', '', '', '', '', 'N', 'F'),
(338, 'ROSA MARÍA', 'NOEMÍ VÁSQUEZ', '', '', 'O993126270', '', '', 'N', 'F'),
(339, 'SANDRA MARITZA', 'MENESES VÁSQUEZ', '', '', 'O983404353', '', '', 'N', 'F'),
(340, 'MARÍA CHELA', 'MÉNDEZ GUDIÑO', '', '', '2498945', '', '', 'N', 'F'),
(341, 'RAMIRO PADILLA', ' ', '', '', '2498945', '', '', 'N', 'F'),
(342, 'LUIS ENRIQUE', 'MENESES GONZAGA', '', '', 'O995676170', '', '', 'N', 'F'),
(343, 'LIGIA ELENA', 'CHALA MÉNDEZ', '', '', '2498945', '', '', 'N', 'F'),
(344, 'DALILA TADEO', ' ', '', '', '2498945', '', '', 'N', 'F'),
(345, 'HERNÁN PRECIADO', 'MENESES ', '', '', 'O983404353', '', '', 'N', 'F'),
(346, 'AIDE ELIZABETH', 'PALACIOS VÁSQUEZ', '', '', 'O985150322', '', '', 'N', 'F'),
(347, 'BELLA NARDA', 'MARQUEZ LUDEÑA', '', '', 'O992507269', '', '', 'N', 'F'),
(348, 'EDISON FERNANDO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 'F'),
(349, 'JHON JAIRO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 'F'),
(350, 'KATERIN MISHEL', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 'F'),
(351, 'PAOLO JOSUE', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 'F'),
(352, 'OLGA ENIT', 'LUDEÑA ARELLANO', '', '', '3016458', '', '', 'N', 'F'),
(353, 'ANDREA CORTEZ', ' ', '', '', '3016458', '', '', 'N', 'F'),
(354, 'GEOVANA TIRADO', ' ', '', '', '3016458', '', '', 'N', 'F'),
(355, 'CRISTIAN RAMÍREZ', ' ', '', '', '3016458', '', '', 'N', 'F'),
(356, 'FANNY FAJARDO', 'FAJARDO ', '', '', '32804316', '', '', 'N', 'F'),
(357, 'CRISTIAN ANTONIO', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N', 'F'),
(358, 'VÍCTOR ANDRÉS', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N', 'F'),
(359, 'NELLY MAGDALENA', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N', 'F'),
(360, 'ESMERALDA DE JESÚS', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N', 'F'),
(361, 'PAULINA SALOME', 'QUINTANA MOSCOSO', '', '', '32803710', '', '', 'N', 'F'),
(362, 'JULIO EDWIN', 'QUINTANA JÁCOME', '', '', '32803710', '', '', 'N', 'F'),
(363, 'CARLOS ANTONIO', 'RODRÍGUEZ CORAL', '', '', '32803710', '', '', 'N', 'F'),
(364, 'MISHEL ESTEFANIA', 'QUINTANA MOSCOSO', '', '', '32804316', '', '', 'N', 'F'),
(365, 'SILVIA ESPERANZA', 'PIN CABEZAS', '', '', 'O984909822', '', '', 'N', 'F'),
(366, 'NICOLE KATERINE', 'MULLO PIN', '', '', '', '', '', 'N', 'F'),
(367, 'MARÍA TERESA', 'UYANA VELOZ', '', '', '', '', '', 'N', 'F'),
(368, 'JOSÉ OCTAVIO', 'MULLO TUTILLO', '', '', '', '', '', 'N', 'F'),
(369, 'MARTHA CABEZAS', 'GUALOTO ', '', '', '', '', '', 'N', 'F'),
(370, 'JORGE WASHINGTON', 'PIN ', '', '', '', '', '', 'N', 'F'),
(371, 'GUADALUPE ERMIÑA', 'VELOZ ', '', '', '', '', '', 'N', 'F'),
(372, 'MARIANA MULLO', 'TUTILLO ', '', '', '', '', '', 'N', 'F'),
(373, 'RAÚL PINTO', ' ', '', '', '', '', '', 'N', 'F'),
(374, 'ALBA TERESA', 'BORJA ENRÍQUEZ', '', '', '', '', '', 'N', 'F'),
(375, 'GUIOCONDA NOEMÍ', 'VENEGAS MARTÍNEZ', '', '', 'O983555064', '', '', 'N', 'F'),
(376, 'CRISTOPHER DANIEL', 'NAVAS BORJA', '', '', '', '', '', 'N', 'F'),
(377, 'NATALY YADIRA', 'LÓPEZ VENEGAS', '', '', '', '', '', 'N', 'F'),
(378, 'MARIUXI AMPARITO', 'LAZ SALTOS', '', '', '', '', '', 'N', 'F'),
(379, 'JUANA NATIVIDAD', 'PAVÓN CHALA', '', '', 'O997692772', '', '', 'N', 'F'),
(380, 'ARNULFO SIGIFREDO', 'CAMPOS GONZALES', '', '', '', '', '', 'N', 'F'),
(381, 'OMAR DAVID', 'CAMPOS PAVÓN', '', '', '', '', '', 'N', 'F'),
(382, 'ARIANA VALENTINA', 'PAVÓN MÉNDEZ', '', '', '', '', '', 'N', 'F'),
(383, 'CLEMENTINA CHALA', 'DE LA CRUZ ', '', '', '', '', '', 'N', 'F'),
(384, 'OLIVA PAVÓN', 'CHALA ', '', '', 'O994797217', '', '', 'N', 'F'),
(385, 'ANA ALEXANDRA', 'MÉNDEZ GONZALO', '', '', '', '', '', 'N', 'F'),
(386, 'MARIANA DE LOURDES', 'PAVÓN CHALA', '', '', '', '', '', 'N', 'F'),
(387, 'MARÍA REBECA', 'MÉNDEZ VEGA', '', '', 'O990794870', '', '', 'N', 'F'),
(388, 'MARÍA INÉS', 'TREJO CHARCOPA', '', '', '62705285', '', '', 'N', 'F'),
(389, 'ELENA ELIZABETH', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 'F'),
(390, 'NELLY MIREYA', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 'F'),
(391, 'FRANKLIN EDUARDO', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 'F'),
(392, 'FRANKLIN AGUSTIN', 'PÉREZ FARIAS', '', '', '62705285', '', '', 'N', 'F'),
(393, 'GLORIA JOSEFINA', 'ROJANO QUINTUÑA', '', '', 'O983293865', '', '', 'N', 'F'),
(394, 'LUIS PATRICIO', 'PILAQUINGA LLUGCHA', '', '', 'O995776677', '', '', 'N', 'F'),
(395, 'MARÍA TERESA', 'SIGCHA CHUSIN', '', '', 'O983120320', '', '', 'N', 'F'),
(396, 'ESTEBAN PATRICIO', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 'F'),
(397, 'KERLY NICOLE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 'F'),
(398, 'MAYERLI JAQUELINE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 'F'),
(399, 'JENNY PAOLA', 'PILAQUINGA SIGCHA', '', '', 'O969504170', '', '', 'N', 'F'),
(400, 'GLORIA FERNANDA', 'PILAQUINGA SIGCHA', '', '', 'O983078024', '', '', 'N', 'F'),
(401, 'JULIO ALFREDO', 'CALLE MORA', '', '', 'O987778257', '', '', 'N', 'F'),
(402, 'LIBER QUINTERO', 'MEDINA ', '', '', '', '', '', 'N', 'F'),
(403, 'SAMARI ARROYO', 'SUAREZ ', '', '', '', '', '', 'N', 'F'),
(404, 'LEANDRO ARROYO', 'SUAREZ ', '', '', '', '', '', 'N', 'F'),
(405, 'JEAN PIERE', 'ARROYO SUAREZ', '', '', '', '', '', 'N', 'F'),
(406, 'CONY QUINTERO', 'NARANJO ', '', '', '', '', '', 'N', 'F'),
(407, 'CHENOOA QUINTERO', 'NARANJO ', '', '', '', '', '', 'N', 'F'),
(408, 'JOHANA NARANJO', 'TELLO ', '', '', '', '', '', 'N', 'F'),
(409, 'PAOLA AYOVI', 'NAZARENO ', '', '', '', '', '', 'N', 'F'),
(410, 'AURIA BATALLA', 'CAÑOLA ', '', '', '', '', '', 'N', 'F'),
(411, 'CINTHIA CATHERINE', 'LOOR HERMIDA', '', '', 'O986663600', '', '', 'N', 'F'),
(412, 'ALISSON DAYLIN', 'RAMÓN LOOR', '', '', 'O986663600', '', '', 'N', 'F'),
(413, 'MARIANA DE JESÚS', 'CHÁVEZ VARELA', '', '', 'O990541599', '', '', 'N', 'F'),
(414, 'LISTON ROSALINO', 'RAMÓN GUANGA', '', '', 'O993846058', '', '', 'N', 'F'),
(415, 'KEVIN LISTON', 'RAMÓN CHÁVEZ', '', '', 'O969428054', '', '', 'N', 'F'),
(416, 'JORDAN STEVEN', 'RAMON CHÁVEZ', '', '', 'O990541599', '', '', 'N', 'F'),
(417, 'TERESA EPIFANIA', 'HERMIDA LUCAS', '', '', 'O985871465', '', '', 'N', 'F'),
(418, 'CHARVEL RONALD', 'SUAREZ ROMERO', '', '', 'O992587965', '', '', 'N', 'F'),
(419, 'JOSELIN MONSERRATHE', 'HERMIDA CORDOVA', '', '', 'O988577259', '', '', 'N', 'F'),
(420, 'TERESA JAQUELINE', 'LUZARDO MARCILLO', '', '', '2294950', '', '', 'N', 'F'),
(421, 'JEAN PIERE', 'RUIZ LUZARDO', '', '', '2294950', '', '', 'N', 'F'),
(422, 'HILDA ROSARIO', 'LLERENA ZAPATA', '', '', '2294950', '', '', 'N', 'F'),
(423, 'EUGENIA DEL ROSARIO', 'RUIZ LLERENA', '', '', '', '', '', 'N', 'F'),
(424, 'MARÍA TERESA', 'RUIZ LLERENA', '', '', '2800505', '', '', 'N', 'F'),
(425, 'LUIS ARNULFO', 'RUIZ LLERENA', '', '', '2493232', '', '', 'N', 'F'),
(426, 'CARMEN ELIZABETH', 'RUIZ LLERENA', '', '', '2294950', '', '', 'N', 'F'),
(427, 'TANIA ALEXANDRA', 'FIALLOS ACUÑA', '', '', '3301806', '', '', 'N', 'F'),
(428, 'OSWALDO MARCELO', 'LONDOÑO MOLINA', '', '', '2432291', '', '', 'N', 'F'),
(429, 'ELIAS RAMÓN', 'SALAZAR ', '', '', '', '', '', 'N', 'F'),
(430, 'MARÍA ROSA', 'GUAIGUA ', '', '', '', '', '', 'N', 'F'),
(431, 'LIDIA MARISOL', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N', 'F'),
(432, 'NORMA LUCIA', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N', 'F'),
(433, 'MAYRA LILIANA', 'SALAZAR GUIGUA', '', '', '', '', '', 'N', 'F'),
(434, 'VÍCTOR HUGO', 'QUILLUPANGUII ', '', '', '', '', '', 'N', 'F'),
(435, 'EDISON RAMIRO', 'CHAFLA ', '', '', '', '', '', 'N', 'F'),
(436, 'VICENTE DARWIN', 'NAVARRO ', '', '', '', '', '', 'N', 'F'),
(437, 'XAVIER ALEJANDRO', 'SALAZAR CÁRDENAS', '', '', '', '', '', 'N', 'F'),
(438, 'TAMAYO PINTO', 'PAOLA TATIANA', '', '', '3132536', '', '', 'N', 'F'),
(439, 'GALO HERNÁN', 'SALAZAR ', '', '', '2299964', '', '', 'N', 'F'),
(440, 'MARTHA AUDELIA', 'NARVÁEZ TAMAYO', '', '', '2299964', '', '', 'N', 'F'),
(441, 'PAOLA TATIANA', 'TAMAYO PINTO', '', '', '3132536', '', '', 'N', 'F'),
(442, 'KEVYN HERNÁN', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N', 'F'),
(443, 'KERLY PAOLA', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N', 'F'),
(444, 'PAUL SANTIAGO', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N', 'F'),
(445, 'JESSICA GALEANO', 'CADENA ', '', '', '', '', '', 'N', 'F'),
(446, 'CARMEN PINTO', 'URBINA ', '', '', '3132536', '', '', 'N', 'F'),
(447, 'KATHY ALEXANDRA', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N', 'F'),
(448, 'BLANCA BRENDA', 'ALVARADO JIMÉNEZ', '', '', 'O987034838', '', '', 'N', 'F'),
(449, 'CARLOS ANÍBAL', 'SÁNCHEZ MASAQUIZA', '', '', '', '', '', 'N', 'F'),
(450, 'HILDA LUCRECIA', 'CHILIQUINGA SUAREZ', '', '', '', '', '', 'N', 'F'),
(451, 'TAMARA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 'F'),
(452, 'DANIELA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 'F'),
(453, 'NAOMI SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 'F'),
(454, 'CARLOS ANIBAL', 'SANCHEZ CHILIQUINGA', '', '', '', '', '', 'N', 'F'),
(455, 'JAVIER BASTIDAS', ' ', '', '', '', '', '', 'N', 'F'),
(456, 'GUADALUPE LEMA', 'CHILIQUINGA ', '', '', '', '', '', 'N', 'F'),
(457, 'JANNETTE MONTALVO', 'FLORES ', '', '', '', '', '', 'N', 'F'),
(458, 'CAMILA SÁNCHEZ', 'RIOFRIO ', '', '', '', '', '', 'N', 'F'),
(459, 'MARCOS ARELLEYRA', ' ', '', '', '', '', '', 'N', 'F'),
(460, 'LUZ PONCE', 'ARTEAGA ', '', '', '', '', '', 'N', 'F'),
(461, 'RODRIGO LASSO', 'DONOSO ', '', '', '', '', '', 'N', 'F'),
(462, 'PATRICIO VILLACRES', ' ', '', '', '', '', '', 'N', 'F'),
(463, 'MARÍA LUZ', 'RIOFRIO ', '', '', '', '', '', 'N', 'F'),
(464, 'JENNY GUERRERO', ' ', '', '', '', '', '', 'N', 'F'),
(465, 'FABRICIO MONCAYO', ' ', '', '', '', '', '', 'N', 'F'),
(466, 'MONICA PAZMIÑO', 'AUCANCELA ', '', '', 'O987025081', '', '', 'N', 'F'),
(467, 'DANIELA BRIGITTE', 'SOCASI AUCANCELA', '', '', 'O967997047', '', '', 'N', 'F'),
(468, 'ANAHI KAREN', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N', 'F'),
(469, 'NAOMI VALENTINA', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N', 'F'),
(470, 'MANUEL LUIS', 'MORANTE SOCASI', '', '', '2964203', '', '', 'N', 'F'),
(471, 'MARIA LUISA', 'CUACES AGUIRRE', '', '', 'O998435259', '', '', 'N', 'F'),
(472, 'MIRIAM DEL SOCORRO', 'CAUCES AGUIRRE', '', '', 'O981599236', '', '', 'N', 'F'),
(473, 'JULIAN ESPINOZA', 'SOTO ', '', '', 'O983960987', '', '', 'N', 'F'),
(474, 'PAOLA RAQUEL', 'CARRILLO HINCHALA', '', '', 'O983960987', '', '', 'N', 'F'),
(475, 'JENNIFER GABRIELA', 'LÓPEZ MORALES', '', '', 'O983354585', '', '', 'N', 'F'),
(476, 'SARA MARÍA', 'FLORES CASTELLANOS', '', '', '2823648', '', '', 'N', 'F'),
(477, 'JOSÉ ALEJANDRO', 'SUAREZ GONZALES', '', '', 'O988068962', '', '', 'N', 'F'),
(478, 'LIDIA GRISELDA', 'SUAREZ FLORES', '', '', 'O984550117', '', '', 'N', 'F'),
(479, 'EDWIN FERNANDO', 'SUAREZ FLORES', '', '', 'O995617836', '', '', 'N', 'F'),
(480, 'MIRIAN GEOVANA', 'SUAREZ FLORES', '', '', '2821480', '', '', 'N', 'F'),
(481, 'ERNESTO RAMIRO', 'TRUJILLO CARVAJAL', '', '', 'O998183263', '', '', 'N', 'F'),
(482, 'EDWIN NULBERTO', 'SUAREZ MOLINA', '', '', '22821480', '', '', 'N', 'F'),
(483, 'ZULMA JEANETH', 'BENAVIDES PULLAS', '', '', 'O999143196', '', '', 'N', 'F'),
(484, 'KARINA PAOLA', 'YUGCHA CAJAS', '', '', 'O988299525', '', '', 'N', 'F'),
(485, 'CESAR ROGELIO', 'TAPIA VILLAGOMEZ', '', '', '23680193', '', '', 'N', 'F'),
(486, 'ROSARIO AMAGUAÑA', 'QUILLUPANGUI ', '', '', '23680193', '', '', 'N', 'F'),
(487, 'KARINA PAOLA', 'YUGCHA CAJAS', '', '', 'O988299525', '', '', 'N', 'F'),
(488, 'SANDRA SONIA', 'JACOME AMGUAÑA', '', '', '23680193', '', '', 'N', 'F'),
(489, 'WILSON PATRICIO', 'TAPIA AMGUAÑA', '', '', 'O985109896', '', '', 'N', 'F'),
(490, 'RUTH FONSECA', ' ', '', '', 'O985109896', '', '', 'N', 'F'),
(491, 'GABRIELA TAPIA', ' ', '', '', 'O985109896', '', '', 'N', 'F'),
(492, 'ALEJANDRA TAPIA', ' ', '', '', 'O985109896', '', '', 'N', 'F'),
(493, 'CRISTOPHER ALEJANDRO', 'TAPIA YUGCHA', '', '', 'O988299525', '', '', 'N', 'F'),
(494, 'LUIS ENRIQUE', 'TIPANTUÑA SARABIO', '', '', '2974544', '', '', 'N', 'F'),
(495, 'ANA YOLANDA', 'CHASIQUIZA A.', '', '', '2974544', '', '', 'N', 'F'),
(496, 'BERTHA MAGDALENA', 'PÉREZ GUALA', '', '', 'O986314920', '', '', 'N', 'F'),
(497, 'ROSALIA GUAITA', ' ', '', '', '2639284', '', '', 'N', 'F'),
(498, 'DAVID TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 'F'),
(499, 'AMANDA TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 'F'),
(500, 'ADRIANA TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 'F'),
(501, 'JEFERSON RUANO', ' ', '', '', '2639284', '', '', 'N', 'F'),
(502, 'JORDY RUANO', ' ', '', '', '2639284', '', '', 'N', 'F'),
(503, 'JASON TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 'F'),
(504, 'ROGELIA TAMAYO', ' ', '', '', '2639284', '', '', 'N', 'F'),
(505, 'JULIA FLORES', ' ', '', '', 'O983116403', '', '', 'N', 'F'),
(506, 'ELOISA MORALES', ' ', '', '', 'O979603241', '', '', 'N', 'F'),
(507, 'MARIUXI PAOLA', 'QUIJIJE M.', '', '', 'O982536099', '', '', 'N', 'F'),
(508, 'FRANKLIN JHORELL', 'ULLOA QUIJIJE', '', '', '', '', '', 'N', 'F'),
(509, 'STEPHANY DAYANE', 'ULLOA QUIJIJE', '', '', '', '', '', 'N', 'F'),
(510, 'MERCY ASTRID', 'SALAZAR ', '', '', 'O993167592', '', '', 'N', 'F'),
(511, 'FREDDY ENRIQUE', 'SALAZAR ', '', '', 'O997336152', '', '', 'N', 'F'),
(512, 'NELSON EUGENIO', 'SALAZAR ', '', '', 'O989353242', '', '', 'N', 'F'),
(513, 'EDWIN RANIO', 'SALAZAR ', '', '', 'O982559036', '', '', 'N', 'F'),
(514, 'JOHANA SOLÍS', ' ', '', '', '', '', '', 'N', 'F'),
(515, 'JEANETH ALVARADO', 'GUERRERO ', '', '', '', '', '', 'N', 'F'),
(516, 'LUIS ENRIQUE', 'URBINA QUINTANA', '', '', '3400736', '', '', 'N', 'F'),
(517, 'ADRIANA LUCIA', 'VIVANCO CÁRDENAS', '', '', '3400736', '', '', 'N', 'F'),
(518, 'ADRIANA MARGARITA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N', 'F'),
(519, 'ANFRE LUCIA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N', 'F'),
(520, 'DALILA VERONICA', 'SANTILLAN MELENDEZ', '', '', 'O969387493', '', '', 'N', 'F'),
(521, 'JORGE ALFREDO', 'ARIAS URBINA', '', '', 'O987472541', '', '', 'N', 'F'),
(522, 'DEYSI PIEDAD', 'VALAREZO ', '', '', 'O984430168', '', '', 'N', 'F'),
(523, 'MARTHA YANETH', 'VALAREZO ', '', '', 'O992869809', '', '', 'N', 'F'),
(524, 'YOFRE DURVAL', 'VALAREZO ', '', '', 'O984371588', '', '', 'N', 'F'),
(525, 'FAUSTO GILBERTO', 'VALAREZO ', '', '', 'O983152847', '', '', 'N', 'F'),
(526, 'LUGARDA MAGDALENA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 'F'),
(527, 'MARITZA LUCIA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 'F'),
(528, 'KEYLA ABIGAIL', 'ROJAS ', '', '', 'O992869809', '', '', 'N', 'F'),
(529, 'KATERINE GALVAN', ' ', '', '', 'O984430168', '', '', 'N', 'F'),
(530, 'LUCIA GRIMANEZA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 'F'),
(531, 'LAURA MARÍA', 'VINAIXA ', '', '', '', '', '', 'N', 'F'),
(532, 'JUSTIN VÁSQUEZ', 'CUEVA ', '', '', '', '', '', 'N', 'F'),
(533, 'ROCIO DE', 'LOURDES CUEVA', '', '', '', '', '', 'N', 'F'),
(534, 'HERNÁN ULLOA', ' ', '', '', '', '', '', 'N', 'F'),
(535, 'FANY ANBALUDI', ' ', '', '', '', '', '', 'N', 'F'),
(536, 'CECIBEL GUDIÑO', ' ', '', '', '', '', '', 'N', 'F'),
(537, 'JOSE LUIS', 'MIRANDA ', '', '', '', '', '', 'N', 'F'),
(538, 'RONALD JAIRO', 'VÁSQUEZ ', '', '', '', '', '', 'N', 'F'),
(539, 'BARBARA BIRMANIA', ' ', '', '', '', '', '', 'N', 'F'),
(540, 'JAQUELINE QUICENO', 'CANO ', '', '', '', '', '', 'N', 'F'),
(541, 'MÓNICA VALERIA', 'PULIDO BRAVO', '', '', 'O998245518', '', '', 'N', 'F'),
(542, 'MARCO ANTONIO', 'VILLACRES PULIDO', '', '', '', '', '', 'N', 'F'),
(543, 'JESSIE VILLACRES', 'PULIDO ', '', '', '', '', '', 'N', 'F'),
(544, 'MARIO MORALES', 'ZAMBRANO ', '', '', '', '', '', 'N', 'F'),
(545, 'MARCO VILLACRES', 'OROZCO ', '', '', '', '', '', 'N', 'F'),
(546, 'MATILDE ASCENCIO', 'LUCAS ', '', '', '', '', '', 'N', 'F'),
(547, 'JONATHAN VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N', 'F'),
(548, 'ALEXANDRA VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N', 'F'),
(549, 'ANTONIO PULIDO', 'FALCONI ', '', '', '', '', '', 'N', 'F'),
(550, 'PEPE', 'JUAREZ', '1720802394', '', '0992725859', '', '', 'S', 'F'),
(552, 'PEPE ANTONIO', 'RUIZ PEREZ 2', '1720090057', 'dfdf', '0992725859', '', '', 'A', 'F'),
(553, 'MARCO', 'RUIZ', '1712384716', '', '', '', '', 'E', 'F'),
(554, 'ADF', 'PPPPP', '', '', '', '', '', 'N', 'F'),
(555, 'TTTT', 'UUUU', '789664', 'ASDASDASASD', '059874', 'ooo@fofo.com', '', 'S', 'F'),
(556, 'YYYY', 'KKKK', '1720090057', '', '', '', '', 'S', 'F'),
(557, 'UUU', 'RRR', '55555555', '', '', '', '', 'A', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_ppl` (
`VIP_COD` int(11) NOT NULL COMMENT 'Codigo del Visitanten-PPL',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIP_FECHA` date NOT NULL COMMENT 'Fecha del Visitanten-PPL'
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL';

--
-- Volcado de datos para la tabla `sys_visitante_ppl`
--

INSERT INTO `sys_visitante_ppl` (`VIP_COD`, `PPL_COD`, `VIS_COD`, `PAR_COD`, `VIP_FECHA`) VALUES
(1, 1, 1, 3, '0000-00-00'),
(2, 1, 2, 3, '0000-00-00'),
(3, 1, 3, 4, '0000-00-00'),
(4, 1, 4, 19, '0000-00-00'),
(5, 1, 5, 19, '0000-00-00'),
(6, 1, 6, 6, '0000-00-00'),
(7, 1, 7, 6, '0000-00-00'),
(8, 1, 8, 10, '0000-00-00'),
(9, 1, 9, 21, '0000-00-00'),
(10, 2, 10, 3, '0000-00-00'),
(11, 2, 11, 4, '0000-00-00'),
(12, 2, 12, 2, '0000-00-00'),
(13, 2, 13, 1, '0000-00-00'),
(14, 2, 14, 19, '0000-00-00'),
(15, 2, 15, 19, '0000-00-00'),
(16, 2, 16, 23, '0000-00-00'),
(17, 2, 17, 24, '0000-00-00'),
(18, 2, 9, 21, '0000-00-00'),
(19, 3, 20, 23, '0000-00-00'),
(20, 3, 21, 8, '0000-00-00'),
(21, 3, 22, 23, '0000-00-00'),
(22, 3, 23, 8, '0000-00-00'),
(23, 3, 24, 9, '0000-00-00'),
(24, 3, 25, 7, '0000-00-00'),
(25, 3, 26, 7, '0000-00-00'),
(26, 3, 27, 23, '0000-00-00'),
(27, 3, 28, 9, '0000-00-00'),
(28, 3, 29, 25, '0000-00-00'),
(29, 4, 30, 15, '0000-00-00'),
(30, 4, 31, 20, '0000-00-00'),
(31, 4, 32, 11, '0000-00-00'),
(32, 4, 33, 12, '0000-00-00'),
(33, 4, 34, 4, '0000-00-00'),
(34, 4, 35, 3, '0000-00-00'),
(35, 4, 36, 3, '0000-00-00'),
(36, 4, 37, 11, '0000-00-00'),
(37, 4, 38, 11, '0000-00-00'),
(38, 5, 40, 15, '0000-00-00'),
(39, 5, 41, 4, '0000-00-00'),
(40, 5, 42, 19, '0000-00-00'),
(41, 5, 43, 19, '0000-00-00'),
(42, 5, 44, 20, '0000-00-00'),
(43, 5, 45, 1, '0000-00-00'),
(44, 5, 46, 24, '0000-00-00'),
(45, 5, 47, 23, '0000-00-00'),
(46, 5, 48, 26, '0000-00-00'),
(47, 6, 50, 7, '0000-00-00'),
(48, 6, 51, 21, '0000-00-00'),
(49, 6, 52, 21, '0000-00-00'),
(50, 6, 53, 22, '0000-00-00'),
(51, 6, 54, 22, '0000-00-00'),
(52, 6, 55, 19, '0000-00-00'),
(53, 6, 56, 19, '0000-00-00'),
(54, 7, 57, 2, '0000-00-00'),
(55, 7, 58, 20, '0000-00-00'),
(56, 7, 59, 12, '0000-00-00'),
(57, 7, 60, 21, '0000-00-00'),
(58, 7, 34, 4, '0000-00-00'),
(59, 8, 63, 22, '0000-00-00'),
(60, 8, 64, 21, '0000-00-00'),
(61, 8, 65, 22, '0000-00-00'),
(62, 8, 66, 21, '0000-00-00'),
(63, 8, 67, 22, '0000-00-00'),
(64, 8, 68, 22, '0000-00-00'),
(65, 8, 69, 22, '0000-00-00'),
(66, 8, 70, 21, '0000-00-00'),
(67, 8, 71, 25, '0000-00-00'),
(68, 9, 73, 2, '0000-00-00'),
(69, 9, 74, 15, '0000-00-00'),
(70, 9, 75, 20, '0000-00-00'),
(71, 9, 76, 20, '0000-00-00'),
(72, 9, 77, 3, '0000-00-00'),
(73, 9, 78, 3, '0000-00-00'),
(74, 9, 79, 3, '0000-00-00'),
(75, 9, 80, 21, '0000-00-00'),
(76, 9, 81, 20, '0000-00-00'),
(77, 10, 83, 3, '0000-00-00'),
(78, 10, 84, 3, '0000-00-00'),
(79, 10, 85, 3, '0000-00-00'),
(80, 10, 86, 1, '0000-00-00'),
(81, 10, 87, 2, '0000-00-00'),
(82, 10, 88, 19, '0000-00-00'),
(83, 10, 89, 19, '0000-00-00'),
(84, 10, 90, 20, '0000-00-00'),
(85, 10, 91, 20, '0000-00-00'),
(86, 11, 93, 2, '0000-00-00'),
(87, 11, 94, 1, '0000-00-00'),
(88, 11, 95, 23, '0000-00-00'),
(89, 11, 96, 23, '0000-00-00'),
(90, 11, 97, 20, '0000-00-00'),
(91, 11, 98, 3, '0000-00-00'),
(92, 11, 99, 3, '0000-00-00'),
(93, 11, 100, 3, '0000-00-00'),
(94, 11, 101, 9, '0000-00-00'),
(95, 12, 104, 4, '0000-00-00'),
(96, 12, 105, 3, '0000-00-00'),
(97, 12, 106, 3, '0000-00-00'),
(98, 12, 107, 1, '0000-00-00'),
(99, 12, 108, 2, '0000-00-00'),
(100, 12, 109, 20, '0000-00-00'),
(101, 12, 110, 19, '0000-00-00'),
(102, 12, 111, 19, '0000-00-00'),
(103, 12, 112, 22, '0000-00-00'),
(104, 13, 113, 15, '0000-00-00'),
(105, 13, 115, 19, '0000-00-00'),
(106, 13, 116, 20, '0000-00-00'),
(107, 13, 117, 20, '0000-00-00'),
(108, 13, 118, 20, '0000-00-00'),
(109, 13, 119, 11, '0000-00-00'),
(110, 13, 120, 11, '0000-00-00'),
(111, 13, 121, 4, '0000-00-00'),
(112, 13, 122, 4, '0000-00-00'),
(113, 14, 124, 2, '0000-00-00'),
(114, 14, 125, 18, '0000-00-00'),
(115, 14, 126, 18, '0000-00-00'),
(116, 14, 127, 19, '0000-00-00'),
(117, 14, 128, 19, '0000-00-00'),
(118, 15, 129, 15, '0000-00-00'),
(119, 15, 130, 4, '0000-00-00'),
(120, 15, 131, 3, '0000-00-00'),
(121, 15, 132, 3, '0000-00-00'),
(122, 15, 133, 20, '0000-00-00'),
(123, 15, 134, 12, '0000-00-00'),
(124, 15, 135, 28, '0000-00-00'),
(125, 15, 136, 8, '0000-00-00'),
(126, 15, 137, 28, '0000-00-00'),
(127, 16, 138, 22, '0000-00-00'),
(128, 16, 139, 4, '0000-00-00'),
(129, 16, 140, 3, '0000-00-00'),
(130, 16, 141, 4, '0000-00-00'),
(131, 16, 142, 1, '0000-00-00'),
(132, 16, 143, 20, '0000-00-00'),
(133, 16, 144, 8, '0000-00-00'),
(134, 16, 145, 9, '0000-00-00'),
(135, 16, 146, 15, '0000-00-00'),
(136, 17, 147, 15, '0000-00-00'),
(137, 17, 148, 1, '0000-00-00'),
(138, 17, 149, 2, '0000-00-00'),
(139, 17, 150, 29, '0000-00-00'),
(140, 17, 151, 30, '0000-00-00'),
(141, 17, 152, 28, '0000-00-00'),
(142, 17, 153, 7, '0000-00-00'),
(143, 17, 154, 23, '0000-00-00'),
(144, 17, 155, 4, '0000-00-00'),
(145, 18, 157, 4, '0000-00-00'),
(146, 18, 158, 4, '0000-00-00'),
(147, 18, 159, 4, '0000-00-00'),
(148, 18, 160, 1, '0000-00-00'),
(149, 18, 161, 2, '0000-00-00'),
(150, 18, 162, 30, '0000-00-00'),
(151, 18, 163, 29, '0000-00-00'),
(152, 18, 164, 23, '0000-00-00'),
(153, 18, 165, 20, '0000-00-00'),
(154, 19, 166, 15, '0000-00-00'),
(155, 19, 167, 20, '0000-00-00'),
(156, 19, 168, 2, '0000-00-00'),
(157, 19, 169, 4, '0000-00-00'),
(158, 19, 170, 21, '0000-00-00'),
(159, 19, 171, 21, '0000-00-00'),
(160, 19, 172, 21, '0000-00-00'),
(161, 19, 173, 22, '0000-00-00'),
(162, 19, 174, 22, '0000-00-00'),
(163, 20, 176, 1, '0000-00-00'),
(164, 20, 177, 2, '0000-00-00'),
(165, 20, 178, 20, '0000-00-00'),
(166, 20, 179, 18, '0000-00-00'),
(167, 20, 180, 21, '0000-00-00'),
(168, 20, 181, 22, '0000-00-00'),
(169, 20, 182, 22, '0000-00-00'),
(170, 21, 183, 15, '0000-00-00'),
(171, 21, 184, 1, '0000-00-00'),
(172, 21, 185, 19, '0000-00-00'),
(173, 21, 186, 3, '0000-00-00'),
(174, 21, 187, 30, '0000-00-00'),
(175, 21, 188, 29, '0000-00-00'),
(176, 21, 189, 12, '0000-00-00'),
(177, 21, 190, 9, '0000-00-00'),
(178, 21, 191, 21, '0000-00-00'),
(179, 22, 193, 32, '0000-00-00'),
(180, 22, 194, 1, '0000-00-00'),
(181, 22, 195, 2, '0000-00-00'),
(182, 22, 196, 20, '0000-00-00'),
(183, 22, 197, 20, '0000-00-00'),
(184, 22, 198, 33, '0000-00-00'),
(185, 22, 199, 19, '0000-00-00'),
(186, 22, 200, 28, '0000-00-00'),
(187, 22, 201, 33, '0000-00-00'),
(188, 23, 203, 1, '0000-00-00'),
(189, 24, 205, 34, '0000-00-00'),
(190, 24, 206, 34, '0000-00-00'),
(191, 24, 207, 35, '0000-00-00'),
(192, 24, 208, 35, '0000-00-00'),
(193, 24, 209, 19, '0000-00-00'),
(194, 24, 210, 28, '0000-00-00'),
(195, 24, 211, 20, '0000-00-00'),
(196, 24, 212, 1, '0000-00-00'),
(197, 24, 213, 2, '0000-00-00'),
(198, 27, 214, 15, '0000-00-00'),
(199, 27, 215, 4, '0000-00-00'),
(200, 27, 216, 4, '0000-00-00'),
(201, 27, 217, 2, '0000-00-00'),
(202, 27, 218, 1, '0000-00-00'),
(203, 27, 219, 30, '0000-00-00'),
(204, 27, 220, 29, '0000-00-00'),
(205, 27, 221, 20, '0000-00-00'),
(206, 28, 222, 19, '0000-00-00'),
(207, 28, 223, 21, '0000-00-00'),
(208, 28, 224, 3, '0000-00-00'),
(209, 28, 225, 3, '0000-00-00'),
(210, 28, 226, 3, '0000-00-00'),
(211, 28, 227, 36, '0000-00-00'),
(212, 28, 228, 21, '0000-00-00'),
(213, 28, 229, 37, '0000-00-00'),
(214, 28, 230, 21, '0000-00-00'),
(215, 29, 231, 1, '0000-00-00'),
(216, 29, 232, 2, '0000-00-00'),
(217, 29, 233, 19, '0000-00-00'),
(218, 29, 234, 4, '0000-00-00'),
(219, 29, 235, 19, '0000-00-00'),
(220, 29, 236, 7, '0000-00-00'),
(221, 29, 237, 8, '0000-00-00'),
(222, 30, 238, 2, '0000-00-00'),
(223, 30, 239, 1, '0000-00-00'),
(224, 30, 240, 19, '0000-00-00'),
(225, 30, 241, 19, '0000-00-00'),
(226, 30, 242, 19, '0000-00-00'),
(227, 30, 243, 19, '0000-00-00'),
(228, 30, 244, 32, '0000-00-00'),
(229, 30, 245, 36, '0000-00-00'),
(230, 31, 246, 27, '0000-00-00'),
(231, 31, 247, 2, '0000-00-00'),
(232, 31, 248, 1, '0000-00-00'),
(233, 31, 249, 3, '0000-00-00'),
(234, 31, 250, 4, '0000-00-00'),
(235, 31, 251, 23, '0000-00-00'),
(236, 31, 252, 7, '0000-00-00'),
(237, 32, 254, 4, '0000-00-00'),
(238, 32, 255, 2, '0000-00-00'),
(239, 32, 256, 19, '0000-00-00'),
(240, 32, 257, 20, '0000-00-00'),
(241, 32, 258, 19, '0000-00-00'),
(242, 32, 259, 20, '0000-00-00'),
(243, 32, 260, 19, '0000-00-00'),
(244, 32, 261, 20, '0000-00-00'),
(245, 32, 262, 8, '0000-00-00'),
(246, 33, 264, 2, '0000-00-00'),
(247, 33, 265, 1, '0000-00-00'),
(248, 33, 266, 32, '0000-00-00'),
(249, 33, 267, 19, '0000-00-00'),
(250, 33, 268, 20, '0000-00-00'),
(251, 33, 269, 20, '0000-00-00'),
(252, 33, 270, 12, '0000-00-00'),
(253, 33, 271, 39, '0000-00-00'),
(254, 33, 272, 40, '0000-00-00'),
(255, 34, 274, 1, '0000-00-00'),
(256, 34, 275, 2, '0000-00-00'),
(257, 34, 276, 19, '0000-00-00'),
(258, 34, 277, 11, '0000-00-00'),
(259, 34, 278, 8, '0000-00-00'),
(260, 34, 279, 20, '0000-00-00'),
(261, 34, 280, 19, '0000-00-00'),
(262, 34, 281, 8, '0000-00-00'),
(263, 34, 282, 32, '0000-00-00'),
(264, 12, 283, 15, '0000-00-00'),
(265, 12, 284, 3, '0000-00-00'),
(266, 12, 285, 2, '0000-00-00'),
(267, 12, 286, 1, '0000-00-00'),
(268, 12, 287, 19, '0000-00-00'),
(269, 12, 288, 20, '0000-00-00'),
(270, 12, 289, 12, '0000-00-00'),
(271, 12, 290, 7, '0000-00-00'),
(272, 12, 291, 7, '0000-00-00'),
(273, 36, 292, 37, '0000-00-00'),
(274, 36, 293, 1, '0000-00-00'),
(275, 36, 294, 2, '0000-00-00'),
(276, 36, 295, 19, '0000-00-00'),
(277, 36, 296, 22, '0000-00-00'),
(278, 36, 297, 4, '0000-00-00'),
(279, 36, 298, 28, '0000-00-00'),
(280, 37, 299, 36, '0000-00-00'),
(281, 37, 300, 1, '0000-00-00'),
(282, 37, 301, 4, '0000-00-00'),
(283, 37, 302, 4, '0000-00-00'),
(284, 37, 303, 3, '0000-00-00'),
(285, 37, 304, 36, '0000-00-00'),
(286, 37, 305, 20, '0000-00-00'),
(287, 37, 306, 19, '0000-00-00'),
(288, 37, 307, 22, '0000-00-00'),
(289, 38, 308, 37, '0000-00-00'),
(290, 38, 309, 3, '0000-00-00'),
(291, 38, 310, 3, '0000-00-00'),
(292, 38, 311, 1, '0000-00-00'),
(293, 38, 312, 2, '0000-00-00'),
(294, 38, 313, 20, '0000-00-00'),
(295, 38, 314, 20, '0000-00-00'),
(296, 38, 315, 19, '0000-00-00'),
(297, 38, 316, 11, '0000-00-00'),
(298, 39, 317, 37, '0000-00-00'),
(299, 39, 318, 3, '0000-00-00'),
(300, 39, 319, 2, '0000-00-00'),
(301, 40, 320, 15, '0000-00-00'),
(302, 40, 321, 3, '0000-00-00'),
(303, 40, 322, 3, '0000-00-00'),
(304, 40, 323, 41, '0000-00-00'),
(305, 40, 324, 20, '0000-00-00'),
(306, 40, 325, 10, '0000-00-00'),
(307, 40, 326, 19, '0000-00-00'),
(308, 40, 327, 28, '0000-00-00'),
(309, 40, 328, 12, '0000-00-00'),
(310, 41, 329, 37, '0000-00-00'),
(311, 41, 330, 20, '0000-00-00'),
(312, 41, 331, 20, '0000-00-00'),
(313, 41, 332, 12, '0000-00-00'),
(314, 41, 333, 22, '0000-00-00'),
(315, 41, 334, 22, '0000-00-00'),
(316, 41, 335, 23, '0000-00-00'),
(317, 41, 336, 9, '0000-00-00'),
(318, 41, 337, 22, '0000-00-00'),
(319, 42, 338, 2, '0000-00-00'),
(320, 42, 339, 20, '0000-00-00'),
(321, 42, 340, 29, '0000-00-00'),
(322, 42, 341, 30, '0000-00-00'),
(323, 42, 342, 1, '0000-00-00'),
(324, 42, 343, 28, '0000-00-00'),
(325, 42, 344, 11, '0000-00-00'),
(326, 42, 345, 10, '0000-00-00'),
(327, 42, 346, 20, '0000-00-00'),
(328, 43, 347, 15, '0000-00-00'),
(329, 43, 348, 3, '0000-00-00'),
(330, 43, 349, 3, '0000-00-00'),
(331, 43, 350, 4, '0000-00-00'),
(332, 43, 351, 3, '0000-00-00'),
(333, 43, 352, 29, '0000-00-00'),
(334, 43, 353, 14, '0000-00-00'),
(335, 43, 354, 14, '0000-00-00'),
(336, 43, 355, 21, '0000-00-00'),
(337, 44, 356, 15, '0000-00-00'),
(338, 44, 357, 3, '0000-00-00'),
(339, 44, 358, 3, '0000-00-00'),
(340, 44, 359, 20, '0000-00-00'),
(341, 44, 360, 20, '0000-00-00'),
(342, 44, 361, 11, '0000-00-00'),
(343, 44, 362, 12, '0000-00-00'),
(344, 44, 363, 12, '0000-00-00'),
(345, 44, 364, 11, '0000-00-00'),
(346, 45, 365, 37, '0000-00-00'),
(347, 45, 366, 4, '0000-00-00'),
(348, 45, 367, 2, '0000-00-00'),
(349, 45, 368, 1, '0000-00-00'),
(350, 45, 369, 29, '0000-00-00'),
(351, 45, 370, 30, '0000-00-00'),
(352, 45, 371, 23, '0000-00-00'),
(353, 45, 372, 23, '0000-00-00'),
(354, 45, 373, 7, '0000-00-00'),
(355, 46, 374, 37, '0000-00-00'),
(356, 46, 375, 2, '0000-00-00'),
(357, 46, 376, 3, '0000-00-00'),
(358, 46, 377, 20, '0000-00-00'),
(359, 46, 378, 22, '0000-00-00'),
(360, 47, 379, 2, '0000-00-00'),
(361, 47, 380, 42, '0000-00-00'),
(362, 47, 381, 19, '0000-00-00'),
(363, 47, 382, 4, '0000-00-00'),
(364, 47, 383, 24, '0000-00-00'),
(365, 47, 384, 23, '0000-00-00'),
(366, 47, 385, 26, '0000-00-00'),
(367, 47, 386, 23, '0000-00-00'),
(368, 48, 387, 37, '0000-00-00'),
(369, 48, 388, 2, '0000-00-00'),
(370, 48, 389, 20, '0000-00-00'),
(371, 48, 390, 20, '0000-00-00'),
(372, 48, 391, 19, '0000-00-00'),
(373, 48, 392, 1, '0000-00-00'),
(374, 49, 393, 37, '0000-00-00'),
(375, 49, 394, 1, '0000-00-00'),
(376, 49, 395, 2, '0000-00-00'),
(377, 49, 396, 3, '0000-00-00'),
(378, 49, 397, 4, '0000-00-00'),
(379, 49, 398, 4, '0000-00-00'),
(380, 49, 399, 20, '0000-00-00'),
(381, 49, 400, 20, '0000-00-00'),
(382, 49, 401, 12, '0000-00-00'),
(383, 50, 402, 1, '0000-00-00'),
(384, 50, 403, 20, '0000-00-00'),
(385, 50, 404, 19, '0000-00-00'),
(386, 50, 405, 19, '0000-00-00'),
(387, 50, 406, 4, '0000-00-00'),
(388, 50, 407, 4, '0000-00-00'),
(389, 50, 408, 26, '0000-00-00'),
(390, 50, 409, 22, '0000-00-00'),
(391, 50, 410, 22, '0000-00-00'),
(392, 51, 411, 37, '0000-00-00'),
(393, 51, 412, 4, '0000-00-00'),
(394, 51, 413, 2, '0000-00-00'),
(395, 51, 414, 1, '0000-00-00'),
(396, 51, 415, 19, '0000-00-00'),
(397, 51, 416, 19, '0000-00-00'),
(398, 51, 417, 29, '0000-00-00'),
(399, 51, 418, 30, '0000-00-00'),
(400, 51, 419, 28, '0000-00-00'),
(401, 52, 420, 15, '0000-00-00'),
(402, 52, 421, 3, '0000-00-00'),
(403, 52, 422, 2, '0000-00-00'),
(404, 52, 423, 20, '0000-00-00'),
(405, 52, 424, 20, '0000-00-00'),
(406, 52, 425, 19, '0000-00-00'),
(407, 52, 426, 20, '0000-00-00'),
(408, 52, 427, 9, '0000-00-00'),
(409, 52, 428, 8, '0000-00-00'),
(410, 53, 429, 1, '0000-00-00'),
(411, 53, 430, 2, '0000-00-00'),
(412, 53, 431, 20, '0000-00-00'),
(413, 53, 432, 20, '0000-00-00'),
(414, 53, 433, 20, '0000-00-00'),
(415, 53, 434, 12, '0000-00-00'),
(416, 53, 435, 12, '0000-00-00'),
(417, 53, 436, 12, '0000-00-00'),
(418, 53, 437, 3, '0000-00-00'),
(419, 54, 439, 1, '0000-00-00'),
(420, 54, 440, 2, '0000-00-00'),
(421, 54, 441, 15, '0000-00-00'),
(422, 54, 442, 3, '0000-00-00'),
(423, 54, 443, 4, '0000-00-00'),
(424, 54, 444, 19, '0000-00-00'),
(425, 54, 445, 28, '0000-00-00'),
(426, 54, 446, 29, '0000-00-00'),
(427, 54, 447, 20, '0000-00-00'),
(428, 55, 448, 15, '0000-00-00'),
(429, 55, 449, 1, '0000-00-00'),
(430, 55, 450, 2, '0000-00-00'),
(431, 55, 451, 4, '0000-00-00'),
(432, 55, 452, 4, '0000-00-00'),
(433, 55, 453, 4, '0000-00-00'),
(434, 55, 454, 19, '0000-00-00'),
(435, 55, 455, 8, '0000-00-00'),
(436, 55, 456, 9, '0000-00-00'),
(437, 56, 457, 37, '0000-00-00'),
(438, 56, 458, 4, '0000-00-00'),
(439, 56, 459, 13, '0000-00-00'),
(440, 56, 460, 22, '0000-00-00'),
(441, 56, 461, 21, '0000-00-00'),
(442, 56, 462, 21, '0000-00-00'),
(443, 56, 463, 22, '0000-00-00'),
(444, 56, 464, 22, '0000-00-00'),
(445, 56, 465, 21, '0000-00-00'),
(446, 57, 466, 15, '0000-00-00'),
(447, 57, 467, 4, '0000-00-00'),
(448, 57, 468, 4, '0000-00-00'),
(449, 57, 469, 4, '0000-00-00'),
(450, 57, 470, 1, '0000-00-00'),
(451, 57, 471, 2, '0000-00-00'),
(452, 57, 472, 20, '0000-00-00'),
(453, 57, 473, 21, '0000-00-00'),
(454, 57, 474, 22, '0000-00-00'),
(455, 58, 475, 37, '0000-00-00'),
(456, 58, 476, 2, '0000-00-00'),
(457, 58, 477, 1, '0000-00-00'),
(458, 58, 478, 20, '0000-00-00'),
(459, 58, 479, 19, '0000-00-00'),
(460, 58, 480, 20, '0000-00-00'),
(461, 58, 481, 12, '0000-00-00'),
(462, 58, 482, 12, '0000-00-00'),
(463, 58, 483, 28, '0000-00-00'),
(464, 59, 485, 1, '0000-00-00'),
(465, 59, 486, 2, '0000-00-00'),
(466, 59, 484, 15, '0000-00-00'),
(467, 59, 488, 20, '0000-00-00'),
(468, 59, 489, 19, '0000-00-00'),
(469, 59, 490, 28, '0000-00-00'),
(470, 59, 491, 11, '0000-00-00'),
(471, 59, 492, 11, '0000-00-00'),
(472, 59, 493, 3, '0000-00-00'),
(473, 60, 494, 1, '0000-00-00'),
(474, 60, 495, 2, '0000-00-00'),
(475, 60, 496, 15, '0000-00-00'),
(476, 61, 497, 2, '0000-00-00'),
(477, 61, 498, 3, '0000-00-00'),
(478, 61, 499, 19, '0000-00-00'),
(479, 61, 500, 20, '0000-00-00'),
(480, 61, 501, 12, '0000-00-00'),
(481, 61, 502, 10, '0000-00-00'),
(482, 61, 503, 10, '0000-00-00'),
(483, 61, 504, 24, '0000-00-00'),
(484, 61, 505, 23, '0000-00-00'),
(485, 61, 506, 23, '0000-00-00'),
(486, 62, 507, 15, '0000-00-00'),
(487, 62, 508, 3, '0000-00-00'),
(488, 62, 509, 4, '0000-00-00'),
(489, 62, 510, 20, '0000-00-00'),
(490, 62, 511, 19, '0000-00-00'),
(491, 62, 512, 19, '0000-00-00'),
(492, 62, 513, 19, '0000-00-00'),
(493, 62, 514, 22, '0000-00-00'),
(494, 62, 515, 22, '0000-00-00'),
(495, 63, 516, 1, '0000-00-00'),
(496, 63, 517, 2, '0000-00-00'),
(497, 63, 518, 20, '0000-00-00'),
(498, 63, 519, 20, '0000-00-00'),
(499, 63, 520, 27, '0000-00-00'),
(500, 63, 521, 8, '0000-00-00'),
(501, 64, 522, 4, '0000-00-00'),
(502, 64, 523, 4, '0000-00-00'),
(503, 64, 524, 3, '0000-00-00'),
(504, 64, 525, 3, '0000-00-00'),
(505, 64, 526, 4, '0000-00-00'),
(506, 64, 527, 4, '0000-00-00'),
(507, 64, 528, 41, '0000-00-00'),
(508, 64, 529, 41, '0000-00-00'),
(509, 64, 530, 15, '0000-00-00'),
(510, 65, 541, 15, '0000-00-00'),
(511, 65, 542, 3, '0000-00-00'),
(512, 65, 543, 4, '0000-00-00'),
(513, 65, 544, 17, '0000-00-00'),
(514, 65, 545, 1, '0000-00-00'),
(515, 65, 546, 2, '0000-00-00'),
(516, 65, 547, 19, '0000-00-00'),
(517, 65, 548, 20, '0000-00-00'),
(518, 65, 549, 30, '0000-00-00'),
(519, 74, 555, 1, '0000-00-00'),
(520, 74, 556, 2, '0000-00-00'),
(521, 74, 557, 9, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_sancion` (
`VSA_COD` int(11) NOT NULL COMMENT 'Codigo del Visitante-Sancion',
  `SAN_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la Sancion',
  `VIS_COD` int(11) DEFAULT NULL COMMENT 'Codigo secuencial del Visitante',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `VSA_NOTA` varchar(5000) DEFAULT NULL COMMENT 'Nota del Visitante-Sancion',
  `VSA_FECHA_INI` datetime DEFAULT NULL COMMENT 'Fecha del Visitante-Sancion',
  `VSA_FECHA_FIN` date DEFAULT NULL COMMENT 'Fecha del Fin de Sancion'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='Las sanciones que obtiene un visitante';

--
-- Volcado de datos para la tabla `sys_visitante_sancion`
--

INSERT INTO `sys_visitante_sancion` (`VSA_COD`, `SAN_COD`, `VIS_COD`, `USU_COD`, `VSA_NOTA`, `VSA_FECHA_INI`, `VSA_FECHA_FIN`) VALUES
(1, 4, 3, 1, 'DROGAS', '2014-09-24 00:00:00', '2014-10-14'),
(2, 2, 31, 1, 'Demora en salir de la visita: 0 minutos de Exceso...', '2014-10-01 00:00:00', '2014-11-30'),
(3, 2, 32, 1, 'ASD', '2014-09-18 00:00:00', '2014-11-17'),
(4, 2, 33, 1, 'ASDF', '2014-10-02 00:00:00', '2014-12-01'),
(5, 3, 34, 1, 'ASDF', '2014-10-03 00:00:00', '2014-11-02'),
(6, 4, 73, 1, 'CUALQUIER COSA', '2014-10-16 00:00:00', '2014-11-05'),
(7, 2, 35, 1, 'Demora en salir de la visita: 0 minutos de Exceso...', '2014-10-16 00:00:00', '2014-12-15'),
(8, 3, 1, 1, 'DROGA', '2014-10-22 00:00:00', '2014-11-21'),
(9, 3, 36, 1, 'Demora en salir de la visita: 97 minutos de Exceso...', '2014-10-22 00:00:00', '2014-11-21'),
(10, 4, 75, 1, 'Demora en salir de la visita: 98 minutos de Exceso...', '2014-10-22 00:00:00', '2014-11-11'),
(11, 4, 41, 1, 'Demora en salir de la visita: 0 minutos de Exceso...', '2014-10-22 00:00:00', '2014-11-11'),
(12, 4, 555, 15, 'DINERO', '2014-10-23 00:00:00', '2014-11-12'),
(13, 1, 556, 1, 'HOLAS', '2014-10-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitas`
--

CREATE TABLE IF NOT EXISTS `sys_visitas` (
`VISG_COD` int(11) NOT NULL COMMENT 'Codigo de la Visita',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `HOR_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Horario',
  `VISG_FECHA` date NOT NULL COMMENT 'Fecha de la Visita',
  `VISG_HORA_INGRESO` time NOT NULL COMMENT 'Hora de Ingreso a la Visita',
  `VISG_HORA_SALIDA` time NOT NULL COMMENT 'Hora de Salida de la Visita',
  `VISG_TRANSCURRIDO` time NOT NULL COMMENT 'Tiempo Transcurido',
  `VISG_POSCHAR` varchar(2) NOT NULL COMMENT 'Literal de la posicion de la cedula',
  `VISG_POSNUM` int(11) NOT NULL COMMENT 'Secuencial Numerico de la Cedula',
  `VISG_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado de la Visita'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Registro de Visitas realizadas';

--
-- Volcado de datos para la tabla `sys_visitas`
--

INSERT INTO `sys_visitas` (`VISG_COD`, `PPL_COD`, `VIP_COD`, `HOR_COD`, `VISG_FECHA`, `VISG_HORA_INGRESO`, `VISG_HORA_SALIDA`, `VISG_TRANSCURRIDO`, `VISG_POSCHAR`, `VISG_POSNUM`, `VISG_ESTADO`) VALUES
(1, 1, 1, 3, '2014-09-22', '14:26:00', '23:59:00', '00:00:00', 'A', 1, 'T'),
(2, 1, 1, 3, '2014-09-23', '12:30:00', '14:30:00', '00:00:02', 'A', 30, 'T'),
(3, 4, 30, 4, '2014-09-29', '08:12:00', '19:30:00', '00:10:00', 'A', 1, 'T'),
(4, 4, 31, 4, '2014-10-01', '08:27:00', '19:30:00', '00:00:00', 'A', 1, 'A'),
(5, 4, 34, 4, '2014-10-16', '09:49:00', '20:30:00', '00:27:00', 'A', 1, 'T'),
(6, 4, 35, 4, '2014-10-16', '10:03:00', '20:30:00', '12:07:00', 'A', 2, 'T'),
(7, 9, 70, 4, '2014-10-16', '10:04:00', '20:30:00', '12:07:00', 'A', 3, 'T'),
(8, 5, 39, 7, '2014-10-22', '22:04:00', '23:59:00', '00:07:00', 'A', 1, 'T'),
(9, 74, 521, 8, '2014-10-23', '13:17:00', '20:29:00', '00:00:00', 'A', 1, 'A'),
(10, 74, 521, 8, '2014-10-23', '13:28:00', '20:29:00', '00:00:00', 'A', 2, 'A'),
(11, 74, 521, 8, '2014-10-23', '13:36:00', '20:29:00', '00:00:00', 'A', 3, 'A');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_control1`
--
CREATE TABLE IF NOT EXISTS `sys_vw_control1` (
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
-- Estructura Stand-in para la vista `sys_vw_control4`
--
CREATE TABLE IF NOT EXISTS `sys_vw_control4` (
`VISG_COD` int(11)
,`PPL_COD` int(11)
,`VIP_COD` int(11)
,`HOR_COD` int(11)
,`VISG_FECHA` date
,`VISG_HORA_INGRESO` time
,`VISG_HORA_SALIDA` time
,`VISG_TRANSCURRIDO` time
,`VISG_POSCHAR` varchar(2)
,`VISG_POSNUM` int(11)
,`VISG_ESTADO` varchar(2)
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
,`CEN_COD` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_ppl`
--
CREATE TABLE IF NOT EXISTS `sys_vw_ppl` (
`PPL_COD` int(11)
,`PAB_COD` int(11)
,`CEL_COD` int(11)
,`PPL_NOMBRE` varchar(200)
,`PPL_APELLIDO` varchar(200)
,`PPL_CEDULA` varchar(13)
,`PPL_NACIONALIDAD` varchar(60)
,`PPL_IMG` varchar(200)
,`PPL_ESTADO` varchar(2)
,`CEN_COD` int(11)
,`NVL_COD` int(11)
,`PAB_DESCRIPCION` varchar(200)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_sanciones`
--
CREATE TABLE IF NOT EXISTS `sys_vw_sanciones` (
`VIS_COD` int(11)
,`VIS_NOMBRE` varchar(250)
,`VIS_APELLIDO` varchar(250)
,`PAR_COD` int(11)
,`VIS_CEDULA` varchar(13)
,`VIS_DIRECCION` varchar(500)
,`VIS_TELEFONO` varchar(12)
,`VIS_CORREO` varchar(200)
,`VIS_IMAGEN` varchar(200)
,`VIS_ESTADO` varchar(2)
,`VSA_COD` int(11)
,`SAN_COD` int(11)
,`USU_COD` int(11)
,`VSA_NOTA` varchar(5000)
,`VSA_FECHA_INI` datetime
,`VSA_FECHA_FIN` date
,`TPS_COD` int(11)
,`SAN_DESCRIPCION` varchar(200)
,`SAN_TIEMPO` int(11)
,`SAN_TIEMPO_DES` varchar(60)
,`TPS_DESCRIPCION` varchar(200)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `sys_vw_visitante`
--
CREATE TABLE IF NOT EXISTS `sys_vw_visitante` (
`VIP_COD` int(11)
,`PPL_COD` int(11)
,`PPL_NOMBRE` varchar(200)
,`PPL_APELLIDO` varchar(200)
,`PAB_COD` int(11)
,`PAB_DESCRIPCION` varchar(200)
,`PPL_NACIONALIDAD` varchar(60)
,`PPL_IMG` varchar(200)
,`PAR_COD` int(11)
,`PAR_DESCRIPCION` varchar(200)
,`VIS_COD` int(11)
,`VIS_NOMBRE` varchar(250)
,`VIS_APELLIDO` varchar(250)
,`VIS_CEDULA` varchar(13)
,`VIS_DIRECCION` varchar(500)
,`VIS_TELEFONO` varchar(12)
,`VIS_CORREO` varchar(200)
,`VIS_IMAGEN` varchar(200)
,`VIS_ESTADO` varchar(2)
,`CEN_COD` int(11)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control1`
--
DROP TABLE IF EXISTS `sys_vw_control1`;
-- en uso(#1356 - View 'bulkenco_sysecure.sys_vw_control1' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control2`
--
DROP TABLE IF EXISTS `sys_vw_control2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control2` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`HOR_COD` AS `HOR_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) join `sys_centro` `ce`) join `sys_pabellones` `pa`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`) and (`c`.`GAR_COD` = 1) and (`c`.`CON_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control3`
--
DROP TABLE IF EXISTS `sys_vw_control3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control3` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`c`.`HOR_COD` AS `HOR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) join `sys_pabellones` `pa`) join `sys_centro` `ce`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`ce`.`CEN_COD` = `pa`.`CEN_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 2) and (`c`.`CON_ESTADO` in ('O','A')) and (`vs`.`VIS_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control4`
--
DROP TABLE IF EXISTS `sys_vw_control4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control4` AS select `v`.`VISG_COD` AS `VISG_COD`,`v`.`PPL_COD` AS `PPL_COD`,`v`.`VIP_COD` AS `VIP_COD`,`v`.`HOR_COD` AS `HOR_COD`,`v`.`VISG_FECHA` AS `VISG_FECHA`,`v`.`VISG_HORA_INGRESO` AS `VISG_HORA_INGRESO`,`v`.`VISG_HORA_SALIDA` AS `VISG_HORA_SALIDA`,`v`.`VISG_TRANSCURRIDO` AS `VISG_TRANSCURRIDO`,`v`.`VISG_POSCHAR` AS `VISG_POSCHAR`,`v`.`VISG_POSNUM` AS `VISG_POSNUM`,`v`.`VISG_ESTADO` AS `VISG_ESTADO`,`vt`.`VIS_COD` AS `VIS_COD`,`vt`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vt`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vt`.`VIS_CEDULA` AS `VIS_CEDULA`,`vt`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vt`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vt`.`VIS_CORREO` AS `VIS_CORREO`,`vt`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vt`.`VIS_ESTADO` AS `VIS_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`sys_visitas` `v` join `sys_visitante_ppl` `vp` on((`vp`.`VIP_COD` = `v`.`VIP_COD`))) join `sys_visitante` `vt` on((`vt`.`VIS_COD` = `vp`.`VIS_COD`))) join `sys_pabellones` `pa`) join `sys_centro` `ce`) join `sys_ppl` `ppl`) where ((`vt`.`VIS_ESTADO` = 'A') and (`v`.`VISG_ESTADO` = 'A') and (`vp`.`PPL_COD` = `ppl`.`PPL_COD`) and (`ppl`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_ppl`
--
DROP TABLE IF EXISTS `sys_vw_ppl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_ppl` AS select `p`.`PPL_COD` AS `PPL_COD`,`p`.`PAB_COD` AS `PAB_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`pa`.`CEN_COD` AS `CEN_COD`,`pa`.`NVL_COD` AS `NVL_COD`,`pa`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION` from (`sys_ppl` `p` join `sys_pabellones` `pa`) where (`p`.`PAB_COD` = `pa`.`PAB_COD`);

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_sanciones`
--
DROP TABLE IF EXISTS `sys_vw_sanciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_sanciones` AS select `v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`vs`.`VSA_COD` AS `VSA_COD`,`vs`.`SAN_COD` AS `SAN_COD`,`vs`.`USU_COD` AS `USU_COD`,`vs`.`VSA_NOTA` AS `VSA_NOTA`,`vs`.`VSA_FECHA_INI` AS `VSA_FECHA_INI`,`vs`.`VSA_FECHA_FIN` AS `VSA_FECHA_FIN`,`s`.`TPS_COD` AS `TPS_COD`,`s`.`SAN_DESCRIPCION` AS `SAN_DESCRIPCION`,`s`.`SAN_TIEMPO` AS `SAN_TIEMPO`,`s`.`SAN_TIEMPO_DES` AS `SAN_TIEMPO_DES`,`ts`.`TPS_DESCRIPCION` AS `TPS_DESCRIPCION` from ((((`sys_visitante_sancion` `vs` join `sys_visitante` `v`) join `sys_visitante_ppl` `vp`) join `sys_tipo_sancion` `ts`) join `sys_sanciones` `s`) where ((`v`.`VIS_COD` = `vs`.`VIS_COD`) and (`v`.`VIS_COD` = `vp`.`VIS_COD`) and (`ts`.`TPS_COD` = `s`.`TPS_COD`) and (`vs`.`SAN_COD` = `s`.`SAN_COD`) and (`v`.`VIS_ESTADO` = 'S') and (`vs`.`SAN_COD` = 1));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_visitante`
--
DROP TABLE IF EXISTS `sys_vw_visitante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_visitante` AS select `vp`.`VIP_COD` AS `VIP_COD`,`vp`.`PPL_COD` AS `PPL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PAB_COD` AS `PAB_COD`,`pab`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`vp`.`PAR_COD` AS `PAR_COD`,`par`.`PAR_DESCRIPCION` AS `PAR_DESCRIPCION`,`v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`pab`.`CEN_COD` AS `CEN_COD` from ((((`sys_visitante` `v` join `sys_visitante_ppl` `vp` on((`v`.`VIS_COD` = `vp`.`VIS_COD`))) join `sys_ppl` `p` on((`p`.`PPL_COD` = `vp`.`PPL_COD`))) join `sys_parentesco` `par` on((`par`.`PAR_COD` = `vp`.`PAR_COD`))) join `sys_pabellones` `pab` on((`pab`.`PAB_COD` = `p`.`PAB_COD`))) where (`v`.`VIS_ESTADO` <> 'E');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sys_accesos`
--
ALTER TABLE `sys_accesos`
 ADD PRIMARY KEY (`ACC_COD`);

--
-- Indices de la tabla `sys_celdas`
--
ALTER TABLE `sys_celdas`
 ADD PRIMARY KEY (`CEL_COD`);

--
-- Indices de la tabla `sys_centro`
--
ALTER TABLE `sys_centro`
 ADD PRIMARY KEY (`CEN_COD`);

--
-- Indices de la tabla `sys_ciudad`
--
ALTER TABLE `sys_ciudad`
 ADD PRIMARY KEY (`CIU_COD`);

--
-- Indices de la tabla `sys_control`
--
ALTER TABLE `sys_control`
 ADD PRIMARY KEY (`CON_COD`);

--
-- Indices de la tabla `sys_etapas`
--
ALTER TABLE `sys_etapas`
 ADD PRIMARY KEY (`NVL_COD`);

--
-- Indices de la tabla `sys_garita`
--
ALTER TABLE `sys_garita`
 ADD PRIMARY KEY (`GAR_COD`);

--
-- Indices de la tabla `sys_historia_ppl`
--
ALTER TABLE `sys_historia_ppl`
 ADD PRIMARY KEY (`HIS_COD`);

--
-- Indices de la tabla `sys_horarios`
--
ALTER TABLE `sys_horarios`
 ADD PRIMARY KEY (`HOR_COD`);

--
-- Indices de la tabla `sys_huellas`
--
ALTER TABLE `sys_huellas`
 ADD PRIMARY KEY (`HUE_COD`);

--
-- Indices de la tabla `sys_item_tipos`
--
ALTER TABLE `sys_item_tipos`
 ADD PRIMARY KEY (`ITS_COD`);

--
-- Indices de la tabla `sys_opciones_rol`
--
ALTER TABLE `sys_opciones_rol`
 ADD PRIMARY KEY (`OPR_COD`), ADD KEY `FK_REFERENCE_41` (`OPU_COD`), ADD KEY `FK_REFERENCE_42` (`ROL_COD`);

--
-- Indices de la tabla `sys_opciones_usuario`
--
ALTER TABLE `sys_opciones_usuario`
 ADD PRIMARY KEY (`OPU_COD`), ADD UNIQUE KEY `OPU_COD` (`OPU_COD`);

--
-- Indices de la tabla `sys_pabellones`
--
ALTER TABLE `sys_pabellones`
 ADD PRIMARY KEY (`PAB_COD`);

--
-- Indices de la tabla `sys_parametros`
--
ALTER TABLE `sys_parametros`
 ADD PRIMARY KEY (`PAR_SEC`);

--
-- Indices de la tabla `sys_parentesco`
--
ALTER TABLE `sys_parentesco`
 ADD PRIMARY KEY (`PAR_COD`);

--
-- Indices de la tabla `sys_ppl`
--
ALTER TABLE `sys_ppl`
 ADD PRIMARY KEY (`PPL_COD`);

--
-- Indices de la tabla `sys_roles`
--
ALTER TABLE `sys_roles`
 ADD PRIMARY KEY (`ROL_COD`);

--
-- Indices de la tabla `sys_sanciones`
--
ALTER TABLE `sys_sanciones`
 ADD PRIMARY KEY (`SAN_COD`);

--
-- Indices de la tabla `sys_tipoactor`
--
ALTER TABLE `sys_tipoactor`
 ADD PRIMARY KEY (`ACT_COD`);

--
-- Indices de la tabla `sys_tipovisita`
--
ALTER TABLE `sys_tipovisita`
 ADD PRIMARY KEY (`TPV_COD`);

--
-- Indices de la tabla `sys_tipovisitahorario`
--
ALTER TABLE `sys_tipovisitahorario`
 ADD PRIMARY KEY (`TVH_COD`);

--
-- Indices de la tabla `sys_tipo_sancion`
--
ALTER TABLE `sys_tipo_sancion`
 ADD PRIMARY KEY (`TPS_COD`);

--
-- Indices de la tabla `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
 ADD PRIMARY KEY (`USU_COD`);

--
-- Indices de la tabla `sys_usuario_centro`
--
ALTER TABLE `sys_usuario_centro`
 ADD PRIMARY KEY (`UCE_COD`);

--
-- Indices de la tabla `sys_visitante`
--
ALTER TABLE `sys_visitante`
 ADD PRIMARY KEY (`VIS_COD`);

--
-- Indices de la tabla `sys_visitante_ppl`
--
ALTER TABLE `sys_visitante_ppl`
 ADD PRIMARY KEY (`VIP_COD`);

--
-- Indices de la tabla `sys_visitante_sancion`
--
ALTER TABLE `sys_visitante_sancion`
 ADD PRIMARY KEY (`VSA_COD`);

--
-- Indices de la tabla `sys_visitas`
--
ALTER TABLE `sys_visitas`
 ADD PRIMARY KEY (`VISG_COD`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sys_accesos`
--
ALTER TABLE `sys_accesos`
MODIFY `ACC_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Acceso',AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT de la tabla `sys_celdas`
--
ALTER TABLE `sys_celdas`
MODIFY `CEL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la celda',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_centro`
--
ALTER TABLE `sys_centro`
MODIFY `CEN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Centro',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_ciudad`
--
ALTER TABLE `sys_ciudad`
MODIFY `CIU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Ciudad',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_control`
--
ALTER TABLE `sys_control`
MODIFY `CON_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del Control',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sys_etapas`
--
ALTER TABLE `sys_etapas`
MODIFY `NVL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Etapas del Pabellon',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sys_historia_ppl`
--
ALTER TABLE `sys_historia_ppl`
MODIFY `HIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Historial de cambios del PPL',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_horarios`
--
ALTER TABLE `sys_horarios`
MODIFY `HOR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Horario',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `sys_huellas`
--
ALTER TABLE `sys_huellas`
MODIFY `HUE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del codigo de la Huella';
--
-- AUTO_INCREMENT de la tabla `sys_item_tipos`
--
ALTER TABLE `sys_item_tipos`
MODIFY `ITS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Item-Tipo-Sancion';
--
-- AUTO_INCREMENT de la tabla `sys_opciones_rol`
--
ALTER TABLE `sys_opciones_rol`
MODIFY `OPR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de las opciones del Rol',AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `sys_opciones_usuario`
--
ALTER TABLE `sys_opciones_usuario`
MODIFY `OPU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de pciones usuario',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `sys_pabellones`
--
ALTER TABLE `sys_pabellones`
MODIFY `PAB_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del pabellon',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `sys_parametros`
--
ALTER TABLE `sys_parametros`
MODIFY `PAR_SEC` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `sys_parentesco`
--
ALTER TABLE `sys_parentesco`
MODIFY `PAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Parentesco',AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `sys_ppl`
--
ALTER TABLE `sys_ppl`
MODIFY `PPL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del PPL',AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT de la tabla `sys_roles`
--
ALTER TABLE `sys_roles`
MODIFY `ROL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Rol',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_sanciones`
--
ALTER TABLE `sys_sanciones`
MODIFY `SAN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Sancion',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `sys_tipoactor`
--
ALTER TABLE `sys_tipoactor`
MODIFY `ACT_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de Actor';
--
-- AUTO_INCREMENT de la tabla `sys_tipovisita`
--
ALTER TABLE `sys_tipovisita`
MODIFY `TPV_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Tipo de Visita',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_tipovisitahorario`
--
ALTER TABLE `sys_tipovisitahorario`
MODIFY `TVH_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Tipo de Visita horario';
--
-- AUTO_INCREMENT de la tabla `sys_tipo_sancion`
--
ALTER TABLE `sys_tipo_sancion`
MODIFY `TPS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del tipo-Sancion',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
MODIFY `USU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Usuario',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `sys_usuario_centro`
--
ALTER TABLE `sys_usuario_centro`
MODIFY `UCE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la tabla',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `sys_visitante`
--
ALTER TABLE `sys_visitante`
MODIFY `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del Visitante',AUTO_INCREMENT=558;
--
-- AUTO_INCREMENT de la tabla `sys_visitante_ppl`
--
ALTER TABLE `sys_visitante_ppl`
MODIFY `VIP_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitanten-PPL',AUTO_INCREMENT=522;
--
-- AUTO_INCREMENT de la tabla `sys_visitante_sancion`
--
ALTER TABLE `sys_visitante_sancion`
MODIFY `VSA_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitante-Sancion',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `sys_visitas`
--
ALTER TABLE `sys_visitas`
MODIFY `VISG_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Visita',AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
