-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-11-2014 a las 07:53:00
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
-- Estructura de tabla para la tabla `sys_accesos`
--

CREATE TABLE IF NOT EXISTS `sys_accesos` (
  `ACC_COD` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Acceso',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `CEN_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Centro',
  `ACC_FECHA` datetime NOT NULL COMMENT 'Fecha y Hora del Acceso',
  `ACC_IP` varchar(60) NOT NULL COMMENT 'Direccion Ip de la maquina desde la que Accesde',
  `ACC_EQUIPO` varchar(60) NOT NULL COMMENT 'Nombre del Equipo desde donde se Accede',
  PRIMARY KEY (`ACC_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de control de Accesos al Sistema' AUTO_INCREMENT=76 ;

--
-- Volcar la base de datos para la tabla `sys_accesos`
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
(16, 1, 1, '2014-10-17 10:09:44', '::1', 'ESIST09'),
(17, 1, 1, '2014-10-17 10:24:33', '::1', 'ESIST09'),
(18, 1, 1, '2014-10-17 10:32:28', '::1', 'ESIST09'),
(19, 1, 1, '2014-10-17 10:42:20', '::1', 'ESIST09'),
(20, 1, 1, '2014-10-17 11:53:35', '::1', 'ESIST09'),
(21, 1, 1, '2014-10-21 09:01:11', '::1', 'ESIST09'),
(22, 1, 3, '2014-10-21 09:11:04', '::1', 'ESIST09'),
(23, 1, 1, '2014-10-21 09:11:22', '::1', 'ESIST09'),
(24, 1, 1, '2014-10-21 09:17:33', '::1', 'ESIST09'),
(25, 1, 1, '2014-10-21 09:38:39', '::1', 'ESIST09'),
(26, 2, 1, '2014-10-21 09:39:00', '::1', 'ESIST09'),
(27, 1, 1, '2014-10-21 09:39:46', '::1', 'ESIST09'),
(28, 2, 1, '2014-10-21 09:40:24', '::1', 'ESIST09'),
(29, 2, 1, '2014-10-21 09:46:39', '::1', 'ESIST09'),
(30, 1, 1, '2014-10-21 10:23:43', '::1', 'ESIST09'),
(31, 2, 1, '2014-10-21 10:31:15', '::1', 'ESIST09'),
(32, 1, 1, '2014-10-21 10:37:14', '::1', 'ESIST09'),
(33, 1, 1, '2014-10-21 10:51:38', '::1', 'ESIST09'),
(34, 1, 1, '2014-10-22 12:02:40', '127.0.0.1', 'ESIST09'),
(35, 1, 1, '2014-10-22 12:30:49', '127.0.0.1', 'ESIST09'),
(36, 1, 1, '2014-10-22 13:14:45', '127.0.0.1', 'ESIST09'),
(37, 1, 1, '2014-10-22 14:19:44', '127.0.0.1', 'ESIST09'),
(38, 1, 1, '2014-10-22 14:48:47', '127.0.0.1', 'ESIST09'),
(39, 1, 1, '2014-10-22 15:07:05', '127.0.0.1', 'ESIST09'),
(40, 1, 1, '2014-10-22 15:33:16', '127.0.0.1', 'ESIST09'),
(41, 1, 1, '2014-10-24 07:23:51', '::1', 'ESIST09'),
(42, 1, 1, '2014-10-24 08:07:15', '::1', 'ESIST09'),
(43, 1, 1, '2014-10-24 08:22:54', '::1', 'ESIST09'),
(44, 1, 1, '2014-10-24 08:41:43', '::1', 'ESIST09'),
(45, 1, 1, '2014-10-24 08:53:23', '::1', 'ESIST09'),
(46, 1, 1, '2014-10-24 09:20:46', '127.0.0.1', 'ESIST09'),
(47, 1, 1, '2014-10-24 10:16:04', '127.0.0.1', 'ESIST09'),
(48, 1, 1, '2014-10-24 10:35:13', '127.0.0.1', 'ESIST09'),
(49, 1, 1, '2014-10-24 10:46:10', '127.0.0.1', 'ESIST09'),
(50, 1, 1, '2014-10-24 11:27:41', '127.0.0.1', 'ESIST09'),
(51, 1, 1, '2014-10-29 11:50:27', '127.0.0.1', 'ESIST09'),
(52, 1, 1, '2014-10-29 12:03:09', '127.0.0.1', 'ESIST09'),
(53, 1, 1, '2014-10-29 12:20:24', '127.0.0.1', 'ESIST09'),
(54, 1, 1, '2014-10-29 12:31:05', '127.0.0.1', 'ESIST09'),
(55, 1, 1, '2014-10-29 13:18:21', '127.0.0.1', 'ESIST09'),
(56, 1, 1, '2014-10-29 13:31:18', '127.0.0.1', 'ESIST09'),
(57, 1, 1, '2014-10-29 14:47:46', '127.0.0.1', 'ESIST09'),
(58, 1, 1, '2014-10-29 14:55:40', '127.0.0.1', 'ESIST09'),
(59, 1, 1, '2014-10-29 14:56:37', '127.0.0.1', 'ESIST09'),
(60, 1, 1, '2014-10-29 14:58:42', '127.0.0.1', 'ESIST09'),
(61, 1, 1, '2014-10-29 15:34:09', '127.0.0.1', 'ESIST09'),
(62, 1, 1, '2014-10-29 15:45:33', '127.0.0.1', 'ESIST09'),
(63, 1, 1, '2014-10-29 17:13:02', '127.0.0.1', 'ESIST09'),
(64, 1, 1, '2014-10-29 17:33:25', '127.0.0.1', 'ESIST09'),
(65, 1, 1, '2014-10-30 07:11:04', '127.0.0.1', 'ESIST09'),
(66, 1, 1, '2014-10-30 07:38:01', '127.0.0.1', 'ESIST09'),
(67, 1, 1, '2014-10-30 08:04:27', '127.0.0.1', 'ESIST09'),
(68, 1, 3, '2014-10-30 08:08:30', '127.0.0.1', 'ESIST09'),
(69, 1, 3, '2014-10-30 08:33:00', '127.0.0.1', 'ESIST09'),
(70, 1, 3, '2014-10-30 08:45:32', '127.0.0.1', 'ESIST09'),
(71, 1, 3, '2014-10-30 09:36:44', '127.0.0.1', 'ESIST09'),
(72, 1, 3, '2014-10-30 11:23:38', '127.0.0.1', 'ESIST09'),
(73, 1, 3, '2014-10-30 12:31:57', '127.0.0.1', 'ESIST09'),
(74, 1, 3, '2014-10-30 13:35:35', '127.0.0.1', 'ESIST09'),
(75, 1, 3, '2014-10-30 15:09:08', '127.0.0.1', 'ESIST09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_auditoria`
--

CREATE TABLE IF NOT EXISTS `sys_auditoria` (
  `AUD_COD` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Secuencial de la Auditoria',
  `AUD_TIPO` varchar(1) NOT NULL COMMENT 'Tipo de Evento, Insertar, Actualizar o Eliminar',
  `AUD_TABLA` varchar(60) NOT NULL COMMENT 'Tabla en la que se realizo el Evento',
  `AUD_DESCRIPCION` varchar(5000) NOT NULL COMMENT 'Datos que se realizaron en el Evento',
  `AUD_IP` varchar(100) NOT NULL COMMENT 'Direccion ip del servidor desde el que se conectan',
  `AUD_DOMINIO` varchar(100) NOT NULL COMMENT 'Nombre del dominio de la Red',
  `AUD_USUARIO` varchar(60) NOT NULL COMMENT 'Nombre del Usuario',
  `AUD_FECHAHORA` datetime NOT NULL COMMENT 'Fecha y Hora en la que se realiza el Evento',
  PRIMARY KEY (`AUD_COD`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena una auditoria General de los eventos regi' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `sys_auditoria`
--

INSERT INTO `sys_auditoria` (`AUD_COD`, `AUD_TIPO`, `AUD_TABLA`, `AUD_DESCRIPCION`, `AUD_IP`, `AUD_DOMINIO`, `AUD_USUARIO`, `AUD_FECHAHORA`) VALUES
(1, 'A', 'sys_ppl', 'valores:BLASCO EDWIN,ARCOS PEPINOS,1720090057,,ECUATORIANAS - ppl:72', '127.0.0.1', 'ESIST09', 'wespinosa', '2014-10-30 13:43:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_celdas`
--

CREATE TABLE IF NOT EXISTS `sys_celdas` (
  `CEL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la celda',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_DESCRPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la celda',
  PRIMARY KEY (`CEL_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Celdas que tiene un Pabellon de un centro' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `sys_celdas`
--

INSERT INTO `sys_celdas` (`CEL_COD`, `PAB_COD`, `CEL_DESCRPCION`) VALUES
(1, 1, 'Celda 1'),
(2, 1, 'Celda 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_centro`
--

CREATE TABLE IF NOT EXISTS `sys_centro` (
  `CEN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Centro',
  `CIU_COD` int(11) NOT NULL COMMENT 'Codigo de la Ciudad',
  `CEN_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Centro',
  `CEN_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Centro',
  `CEN_TELEFONO` varchar(13) NOT NULL COMMENT 'Telefono del Centro',
  `CEN_TIPO` int(11) NOT NULL COMMENT 'Tipo de Centro 1: Pequeño o 2:Grande',
  PRIMARY KEY (`CEN_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos del los centros a nivel Nacional' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `sys_centro`
--

INSERT INTO `sys_centro` (`CEN_COD`, `CIU_COD`, `CEN_DESCRIPCION`, `CEN_DIRECCION`, `CEN_TELEFONO`, `CEN_TIPO`) VALUES
(1, 1, 'CRS VARONES 4', 'El Condado', '', 1),
(3, 1, 'PRUEBA', 'prueba', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ciudad`
--

CREATE TABLE IF NOT EXISTS `sys_ciudad` (
  `CIU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Ciudad',
  `CIU_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion de la Ciudad',
  PRIMARY KEY (`CIU_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de las Ciudades del Ecuador' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `sys_ciudad`
--

INSERT INTO `sys_ciudad` (`CIU_COD`, `CIU_DESCRIPCION`) VALUES
(1, 'Quito'),
(2, 'Guayaquil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_config_base`
--

CREATE TABLE IF NOT EXISTS `sys_config_base` (
  `CONF_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Secuencial de la tabla de configuracion',
  `CONF_SERVER` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre del Servidor o direccion ip, ejemplo: localhost',
  `CONF_USUARIO` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre del usuario de conexion a la base de datos',
  `CONF_CLAVE` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Clave de conexion a la base de datos',
  `CONF_NOMBASE` varchar(60) NOT NULL COMMENT 'Nombre de la Base por defecto sysecure',
  PRIMARY KEY (`CONF_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_config_base`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_control`
--

CREATE TABLE IF NOT EXISTS `sys_control` (
  `CON_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del Control',
  `GAR_COD` int(11) NOT NULL COMMENT 'Codigo de la garita',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `HOR_COD` int(11) NOT NULL COMMENT 'Codigo del Horario',
  `CON_FECHA` date NOT NULL COMMENT 'fecha del Control',
  `CON_ESTADO` varchar(1) NOT NULL COMMENT 'A: Autorizado, N:Negado`, O: Omitido',
  PRIMARY KEY (`CON_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcar la base de datos para la tabla `sys_control`
--

INSERT INTO `sys_control` (`CON_COD`, `GAR_COD`, `VIP_COD`, `HOR_COD`, `CON_FECHA`, `CON_ESTADO`) VALUES
(1, 1, 1, 3, '2014-09-24', 'A'),
(2, 2, 1, 3, '2014-09-24', 'O'),
(3, 1, 3, 3, '2014-09-24', 'A'),
(4, 2, 3, 3, '2014-09-24', 'O'),
(5, 3, 3, 0, '2014-09-24', 'S'),
(6, 1, 30, 4, '2014-09-29', 'A'),
(7, 2, 30, 4, '2014-09-29', 'S'),
(8, 3, 30, 4, '2014-09-29', 'A'),
(9, 1, 31, 4, '2014-10-01', 'A'),
(10, 2, 31, 4, '2014-10-01', 'S'),
(11, 3, 31, 4, '2014-10-01', 'A'),
(12, 1, 31, 4, '2014-10-07', 'A'),
(13, 2, 31, 4, '2014-10-07', 'O'),
(14, 1, 32, 4, '2014-10-07', 'A'),
(15, 2, 32, 4, '2014-10-07', 'O'),
(16, 1, 33, 4, '2014-10-07', 'A'),
(17, 2, 33, 4, '2014-10-07', 'O'),
(18, 3, 31, 0, '2014-10-07', 'S'),
(19, 3, 32, 0, '2014-10-07', 'S'),
(20, 3, 33, 0, '2014-10-07', 'S'),
(21, 1, 34, 4, '2014-10-16', 'S'),
(22, 2, 34, 4, '2014-10-16', 'S'),
(23, 3, 34, 4, '2014-10-16', 'S'),
(24, 1, 35, 4, '2014-10-16', 'S'),
(25, 2, 35, 4, '2014-10-16', 'S'),
(26, 3, 35, 4, '2014-10-16', 'S'),
(27, 1, 68, 4, '2014-10-16', 'S'),
(28, 2, 68, 4, '2014-10-16', 'S'),
(29, 1, 70, 4, '2014-10-16', 'S'),
(30, 2, 70, 4, '2014-10-16', 'S'),
(31, 3, 68, 0, '2014-10-16', 'S'),
(32, 3, 70, 4, '2014-10-16', 'S'),
(33, 1, 519, 6, '2014-10-24', 'A'),
(34, 2, 519, 6, '2014-10-24', 'O'),
(35, 3, 519, 0, '2014-10-24', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_etapas`
--

CREATE TABLE IF NOT EXISTS `sys_etapas` (
  `NVL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Etapas del Pabellon',
  `NVL_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de las Etapas del Pabellon',
  PRIMARY KEY (`NVL_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Etapas en las que se encuentra un pabellon' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `sys_etapas`
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
  `GAR_ESTADO` varchar(1) CHARACTER SET utf8 NOT NULL COMMENT 'Estado de la Garita',
  PRIMARY KEY (`GAR_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `sys_garita`
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
  `HIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Historial de cambios del PPL',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `PPL_COD` int(11) DEFAULT NULL COMMENT 'Codigo del PPL',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `HIS_FECHA` datetime NOT NULL COMMENT 'fecha de Cambios del Historia',
  `HIS_MOTIVO` varchar(500) NOT NULL COMMENT 'MOtivo de los cambios',
  PRIMARY KEY (`HIS_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla del Historial del PPL' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_historia_ppl`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_horarios`
--

CREATE TABLE IF NOT EXISTS `sys_horarios` (
  `HOR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Horario',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo del Tipo de Visita',
  `HOR_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Horario',
  `HOR_FECHA` date DEFAULT NULL COMMENT 'Fecha disponibles para las visitas',
  `HOR_HORA_ING` time DEFAULT NULL COMMENT 'Hora de Ingreso del Horario',
  `HOR_HORA_SAL` time DEFAULT NULL COMMENT 'Hora de Salida del Horario',
  `HOR_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estadp del Horario',
  PRIMARY KEY (`HOR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Datos de horarios que pueden tener los pabellones para las v' AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `sys_horarios`
--

INSERT INTO `sys_horarios` (`HOR_COD`, `PAB_COD`, `TPV_COD`, `HOR_DESCRIPCION`, `HOR_FECHA`, `HOR_HORA_ING`, `HOR_HORA_SAL`, `HOR_ESTADO`) VALUES
(3, 1, 1, '4', '0000-00-00', '08:00:00', '23:58:00', 'E'),
(4, 2, 1, 'PRUEBA', '0000-00-00', '07:00:00', '20:30:00', 'A'),
(5, 2, 2, 'HORARIO EN LA MAñANA', '0000-00-00', '10:30:00', '17:30:00', 'A'),
(6, 5, 1, 'PRUEBAS', '0000-00-00', '06:00:00', '22:00:00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_huellas`
--

CREATE TABLE IF NOT EXISTS `sys_huellas` (
  `HUE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del codigo de la Huella',
  `ACT_COD` int(11) DEFAULT NULL COMMENT 'Codigo secuencial de Actor',
  `HUE_CODPPLVIS` int(11) DEFAULT NULL COMMENT 'Codigo del Actor Visitante o PPL',
  `HUE_MANO` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Mano de la Huella',
  `HUE_DEDO` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Nombre del dedo de la mano',
  `HUE_HUELLA` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Huella Dactilar',
  `HUE_IMAGEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Imagen de la Huella',
  `HUE_ESTADO` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Estado: A:Activo, E:Eliminado',
  PRIMARY KEY (`HUE_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Huellas Dactilares ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_huellas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_item_tipos`
--

CREATE TABLE IF NOT EXISTS `sys_item_tipos` (
  `ITS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Item-Tipo-Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `ITS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Item-Tipo-Sancion',
  PRIMARY KEY (`ITS_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Todos los items que pueden tener los tipos de sancion' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_item_tipos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_opciones_rol`
--

CREATE TABLE IF NOT EXISTS `sys_opciones_rol` (
  `OPR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de las opciones del Rol',
  `ROL_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Rol',
  `OPU_COD` int(11) DEFAULT NULL COMMENT 'Codigo Opciones usuario',
  PRIMARY KEY (`OPR_COD`),
  KEY `FK_REFERENCE_41` (`OPU_COD`),
  KEY `FK_REFERENCE_42` (`ROL_COD`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la relacion del Rol con las Opciones del ' AUTO_INCREMENT=55 ;

--
-- Volcar la base de datos para la tabla `sys_opciones_rol`
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
(41, 2, 5),
(42, 2, 6),
(43, 2, 7),
(44, 2, 9),
(45, 2, 12),
(46, 2, 13),
(47, 2, 14),
(48, 2, 15),
(49, 2, 16),
(50, 2, 19),
(51, 2, 20),
(52, 1, 21),
(53, 4, 1),
(54, 4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_opciones_usuario`
--

CREATE TABLE IF NOT EXISTS `sys_opciones_usuario` (
  `OPU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de pciones usuario',
  `OPU_NOMBRE` varchar(60) NOT NULL COMMENT 'Nombre Opcion Usuario',
  `OPU_LINK` varchar(200) NOT NULL COMMENT 'Link de Opcion usuario',
  `OPU_NIVEL` int(11) NOT NULL COMMENT 'A que nivel de recusividad se esta desplegando',
  `OPU_COD_PADRE` int(11) NOT NULL COMMENT 'Codigo Padre de opciones Usuario',
  `OPU_ICONO` varchar(60) NOT NULL COMMENT 'Icono del Menu',
  PRIMARY KEY (`OPU_COD`),
  UNIQUE KEY `OPU_COD` (`OPU_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tabla que identifica las opciones que puede tener un Usuario' AUTO_INCREMENT=22 ;

--
-- Volcar la base de datos para la tabla `sys_opciones_usuario`
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
(20, 'Horarios', '?modulo=reportes&op=horarios', 2, 17, ''),
(21, 'Parentescos', '?modulo=administrativo&op=parentesco', 2, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_pabellones`
--

CREATE TABLE IF NOT EXISTS `sys_pabellones` (
  `PAB_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del pabellon',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `NVL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Etapas del Pabellon',
  `PAB_ALA` varchar(60) DEFAULT NULL COMMENT 'Ala o Piso del Pabellon',
  `PAB_DESCRIPCION` varchar(200) NOT NULL COMMENT 'descripcion del Pabellon',
  `PAB_CAPACIDAD` int(11) NOT NULL COMMENT 'Capacidad del pabellon',
  `PAB_DETALLES` varchar(1000) NOT NULL COMMENT 'Detalles del pabellon',
  PRIMARY KEY (`PAB_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de los Pabellones de un Centro' AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `sys_pabellones`
--

INSERT INTO `sys_pabellones` (`PAB_COD`, `CEN_COD`, `NVL_COD`, `PAB_ALA`, `PAB_DESCRIPCION`, `PAB_CAPACIDAD`, `PAB_DETALLES`) VALUES
(1, 1, 2, 'Norte', 'A', 500, ''),
(2, 1, 2, 'Sur', 'B', 200, ''),
(3, 1, 2, 'Este', 'C', 100, ''),
(4, 1, 2, 'Oeste', 'D', 200, ''),
(5, 1, 2, 'Norte', 'OBSERVACION', 200, ''),
(6, 3, 2, 'NORTE', 'NORTE-A', 100, 'PRUEBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parametros`
--

CREATE TABLE IF NOT EXISTS `sys_parametros` (
  `PAR_SEC` int(11) NOT NULL AUTO_INCREMENT,
  `PAR_COD` int(11) NOT NULL,
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `PAR_MODULO` varchar(60) NOT NULL,
  `PAR_DESCRIPCION` varchar(200) NOT NULL,
  `PAR_VALOR` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PAR_SEC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de Parametros Generales' AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `sys_parametros`
--

INSERT INTO `sys_parametros` (`PAR_SEC`, `PAR_COD`, `CEN_COD`, `PAR_MODULO`, `PAR_DESCRIPCION`, `PAR_VALOR`) VALUES
(1, 1, 1, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(2, 2, 1, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(3, 3, 1, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(4, 4, 1, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15'),
(5, 1, 3, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(6, 2, 3, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(7, 3, 3, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(8, 4, 3, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parentesco`
--

CREATE TABLE IF NOT EXISTS `sys_parentesco` (
  `PAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Parentesco',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo de tipo de Visita',
  `PAR_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Parentesco',
  PRIMARY KEY (`PAR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Parentescos que pueden tener los visitantes' AUTO_INCREMENT=29 ;

--
-- Volcar la base de datos para la tabla `sys_parentesco`
--

INSERT INTO `sys_parentesco` (`PAR_COD`, `TPV_COD`, `PAR_DESCRIPCION`) VALUES
(1, 1, 'PADRE'),
(2, 1, 'MADRE'),
(3, 1, 'HIJA/O'),
(4, 1, 'ABUELA/O'),
(5, 1, 'NIETA/O'),
(6, 1, 'TÍA/O'),
(7, 1, 'PRIMA/O'),
(8, 1, 'SOBRINA/O'),
(9, 1, 'CUÑADA/O'),
(10, 1, 'YERNO'),
(11, 1, 'NUERA'),
(12, 2, 'ESPOSA/O'),
(13, 3, 'ABOGADO'),
(14, 1, 'HIJA/O M.E'),
(15, 1, 'HERMANA/O'),
(16, 1, 'AMIGA/O'),
(17, 2, 'PAREJA'),
(18, 1, 'EX PAREJA'),
(19, 2, 'NOVIA/O'),
(20, 1, 'SUEGRA/O'),
(21, 2, 'U.LIBRE'),
(22, 1, 'SOBRINA/O M.E.'),
(23, 1, 'HIJASTRA/O'),
(24, 2, 'CONVIVIENTE'),
(25, 2, 'UNIÓN DE HECHO'),
(26, 1, 'PADRASTRO'),
(27, 1, 'MADRASTRA'),
(28, 1, 'HERMANA/O M.E.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_ppl` (
  `PPL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del PPL',
  `PAB_COD` int(11) NOT NULL COMMENT 'Codigo del Pabellon',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `PPL_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del PPL',
  `PPL_APELLIDO` varchar(200) NOT NULL COMMENT 'Apellidos del PPL',
  `PPL_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula del PPL',
  `PPL_NACIONALIDAD` varchar(60) NOT NULL COMMENT 'Nacionalidad del PPL',
  `PPL_IMG` varchar(200) NOT NULL COMMENT 'Imagen del PPL',
  `PPL_ESTADO` varchar(2) NOT NULL COMMENT 'Estado del PPL',
  PRIMARY KEY (`PPL_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de la persona Provada de Libertad' AUTO_INCREMENT=74 ;

--
-- Volcar la base de datos para la tabla `sys_ppl`
--

INSERT INTO `sys_ppl` (`PPL_COD`, `PAB_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_NACIONALIDAD`, `PPL_IMG`, `PPL_ESTADO`) VALUES
(1, 1, NULL, 'ZZZZ', 'XXXXX', '', 'ECUATORIANA', '', 'E'),
(2, 5, NULL, 'BYRON ERNESTO', 'ARIAS CHICAIZA', '1721083663', 'ECUATORIANA', '', 'A'),
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
(68, 2, 0, '213', '123', '', '', '', 'E'),
(69, 0, 0, '1234', '', '', '', '', 'A'),
(70, 1, 1, 'QQQQQQQ', 'WWWWWWWWWW', '', '', '', 'E'),
(71, 1, 1, 'BBBBBB', 'NNNNNN', '', '', '', 'E'),
(72, 6, 0, 'BLASCO EDWIN', 'ARCOS PEPINOS', '1720090057', 'ECUATORIANAS', '', 'A'),
(73, 6, 0, 'SCARLET NAHOMI', 'ARCOS GONZÁLEZ', '', '', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_roles`
--

CREATE TABLE IF NOT EXISTS `sys_roles` (
  `ROL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Rol',
  `ROL_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Rol',
  `ROL_ESTADO` varchar(1) NOT NULL COMMENT 'A: Activo, I: Inactivo',
  `ROL_OBSERVACION` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT 'Observacion del Rol',
  PRIMARY KEY (`ROL_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Roles que puede tener un Usuario' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `sys_roles`
--

INSERT INTO `sys_roles` (`ROL_COD`, `ROL_DESCRIPCION`, `ROL_ESTADO`, `ROL_OBSERVACION`) VALUES
(1, 'Sysecure', 'A', 'Uso Exclusivo para creadores del Sistema'),
(2, 'Super Administrador', 'A', 'Usuarios Con privilegios superiores al Administrador'),
(3, 'Administrador', 'A', 'Privilegios Administrativos'),
(4, 'INGRESOS', 'A', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_sanciones`
--

CREATE TABLE IF NOT EXISTS `sys_sanciones` (
  `SAN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `SAN_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la Sancion',
  `SAN_TIEMPO` int(11) DEFAULT NULL COMMENT 'Tiempo en Numeros Sancionado',
  `SAN_TIEMPO_DES` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Tiempo de la Sancion',
  PRIMARY KEY (`SAN_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de almacenamiento de Sanciones de las Visitas' AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `sys_sanciones`
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
  `ACT_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de Actor',
  `ACT_DESCRIPCION` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Actor',
  PRIMARY KEY (`ACT_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla tipo actores de las Huellas' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_tipoactor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipovisita`
--

CREATE TABLE IF NOT EXISTS `sys_tipovisita` (
  `TPV_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Tipo de Visita',
  `TPV_DESCRIPCION` varchar(200) NOT NULL COMMENT 'descripcion del Tipo de Visita',
  PRIMARY KEY (`TPV_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla con Tipos de visitantes' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `sys_tipovisita`
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
  `TVH_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Tipo de Visita horario',
  `TPV_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Tipo de Visita',
  `HOR_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Horario',
  PRIMARY KEY (`TVH_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relacion entre los tipos de Visitas en los diferentes horari' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_tipovisitahorario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipo_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_tipo_sancion` (
  `TPS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del tipo-Sancion',
  `TPS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'descripcion del  tipo-Sancion',
  PRIMARY KEY (`TPS_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Listado de Tipos que puede tener una sancion' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `sys_tipo_sancion`
--

INSERT INTO `sys_tipo_sancion` (`TPS_COD`, `TPS_DESCRIPCION`) VALUES
(1, 'no definido'),
(2, 'drogas'),
(3, 'armas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuarios`
--

CREATE TABLE IF NOT EXISTS `sys_usuarios` (
  `USU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Usuario',
  `USU_NOMBRE` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre  del Usuario',
  `USU_APELLIDO` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Apellido del Usuario',
  `USU_USUARIO` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Usuario',
  `USU_CLAVE` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Clave del Usuario',
  `USU_CEDULA` varchar(13) CHARACTER SET utf8 NOT NULL COMMENT 'Cedula del Usuario',
  `USU_EMAIL` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT 'Email del Usuario',
  `USU_CELULAR` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'Celular del Usuario',
  `USU_AVATAR` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT 'Imagen del Usuario',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol del Usuario',
  PRIMARY KEY (`USU_COD`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Almacen de usuarios que ingresan al sistema' AUTO_INCREMENT=15 ;

--
-- Volcar la base de datos para la tabla `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`USU_COD`, `USU_NOMBRE`, `USU_APELLIDO`, `USU_USUARIO`, `USU_CLAVE`, `USU_CEDULA`, `USU_EMAIL`, `USU_CELULAR`, `USU_AVATAR`, `ROL_COD`) VALUES
(1, 'WILLIAN', 'ESPINOSA', 'wespinosa', '3e413f53d9f7c57b7250e9515a8d0d4d', '1720802394', 'wespinosa86@gmail.com', '0992725859', 'WillianEspinosa.jpg', 1),
(2, 'Administrador', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', 2),
(5, 'Danny', 'Uribe', 'duribe', '76d80224611fc919a5d54f0ff9fba446', '', 'duribe@gmail.com', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuario_centro`
--

CREATE TABLE IF NOT EXISTS `sys_usuario_centro` (
  `UCE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la tabla',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo del usuario',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol',
  PRIMARY KEY (`UCE_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuarios que pertenece aun centro' AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `sys_usuario_centro`
--

INSERT INTO `sys_usuario_centro` (`UCE_COD`, `USU_COD`, `CEN_COD`, `ROL_COD`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 12, 1, 1),
(6, 1, 2, 1),
(7, 1, 3, 1),
(8, 2, 3, 2),
(10, 2, 2, 2),
(11, 5, 1, 1),
(12, 5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante`
--

CREATE TABLE IF NOT EXISTS `sys_visitante` (
  `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del Visitante',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Visitante',
  `VIS_TELEFONO` varchar(12) NOT NULL COMMENT 'Telefono del visitante',
  `VIS_CORREO` varchar(200) NOT NULL COMMENT 'Correo del Visitante',
  `VIS_IMAGEN` varchar(200) NOT NULL COMMENT 'Imagen del visitante',
  `VIS_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado del Visitante',
  PRIMARY KEY (`VIS_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Almacen de Visitantes que pueden Acceder a un Centro' AUTO_INCREMENT=565 ;

--
-- Volcar la base de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`) VALUES
(1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', '1720802394', '', '2425477', '', '', 'A'),
(2, 'RAMIRO XAVIER', 'ARCOS GONZÁLEZ', '1720802396', '', '2425477', '', '', 'A'),
(3, 'JESSICA ESTEFANÍA', 'ARCOS GONZÁLEZ', '1720090057', 'sdrrafs', '2425477', '', '', 'S'),
(4, 'RENÉ ALFREDO', 'ARCOS PEPINOS', '1720802395', '', '', '', '', 'N'),
(5, 'BLASCO EDWIN', 'ARCOS PEPINOS', '1720090057', '', '', '', '', 'A'),
(6, 'MATÍAS ARCOS', 'PANAMÁ ', '1720802394', '', '2425477', '', '', 'A'),
(7, 'SEBASTIÁN ARCOS', 'PANAMÁ ', '', '', '2425477', '', '', 'N'),
(8, 'CRISTIAN ANÍBAL', 'AROS PEPINOS', '', '', '2425477', '', '', 'N'),
(9, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N'),
(10, 'BYRON ROBERTO', 'ARIAS MORALES', '', '', '2778736', '', '', 'N'),
(11, 'BRENDA GABRIELA', 'ARIAS MORALES', '', '', '2778736', '', '', 'N'),
(12, 'LUPE EDELINA', 'CHICAIZA VARGAS', '', '', '2777395', '', '', 'N'),
(13, 'MARIO ERNESTO', 'ARIAS CABRERA', '', '', '2777395', '', '', 'N'),
(14, 'MARIO ROLANDO', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N'),
(15, 'BERNARDO ISRAEL', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N'),
(16, 'NANCY GIOVANNI', 'MORALES ', '', '', '2777928', '', '', 'N'),
(17, 'ROSA CABRERA', ' ', '', '', '2390902', '', '', 'E'),
(18, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N'),
(19, 'GABRIELA MARGARITA', 'MORALES ', '', '', '2778736', '', '', 'N'),
(20, 'ALBY DEL', 'CARMEN BARRAZUETA', '', '', '2964764', '', '', 'N'),
(21, 'HENRY PAUL', 'BARRAZUETA ', '', '', '2964764', '', '', 'N'),
(22, 'ROCÍO DEL', 'CISNE BARRAZUETA', '', '', '', '', '', 'N'),
(23, 'MARCO FERNANDO', 'GAVILANES ', '', '', '2637640', '', '', 'N'),
(24, 'CATALINA DEL', 'ROCÍO GAVILANES', '', '', '2964764', '', '', 'N'),
(25, 'MARCO ALFARO', 'GAVILANES ', '', '', '2964764', '', '', 'N'),
(26, 'JHON FRANCISCO', 'BARRAZUETA ', '', '', 'O999688876', '', '', 'N'),
(27, 'MIRIAM ALEXANDRA', 'BARRAZUETA ', '', '', '', '', '', 'N'),
(28, 'CRISTIAN PAUL', 'CALLE BARRAZUETA', '', '', '', '', '', 'N'),
(29, 'MAYITA GABRIELA', 'SALAS ', '', '', '', '', '', 'N'),
(30, 'ARACELY REGINA', 'FARIAS FERNÁNDEZ', '', '', '', '', '', 'N'),
(31, 'SAMANTA SALOME', 'BERMEO CEVALLOS', '1720090057', '', '0992725859', '', '', 'S'),
(32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', '1720802394', '', '0992725859', '', '', 'S'),
(33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', '1720090057', '', '2425477', '', '', 'S'),
(34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '1720802394', '', '0992725859', '', '', 'S'),
(35, 'JOSÉ BERMEO', 'ALCIVAR ', '1720802394', '', '0992725859', '', '', 'S'),
(36, 'MARÍA BERMEO', 'ALCIVAR ', '1720802394', '', '2425477', '', '', 'A'),
(37, 'PATRICIA FARÍAS', 'FERNÁNDEZ ', '1720802394', '', '', '', '', 'N'),
(38, 'DANIELA FARÍAS', 'FERNÁNDEZ ', '', '', '', '', '', 'N'),
(39, 'ARACELY REGINA', 'FARÍAS FERNÁNDEZ', '', '', '', '', '', 'N'),
(40, 'MARÍA ALEJANDRA', 'COBO MEDINA', '', '', '32964310', '', '', 'N'),
(41, 'CAMILA ALEJANDRA', 'BONIFAZ COBO', '', '', '32964310', '', '', 'N'),
(42, 'JOSÉ LUIS', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N'),
(43, 'CRISTÓBAL BONIFAZ', 'BONIFAZ ', '', '', '32928060', '', '', 'N'),
(44, 'VERÓNICA LIZBETH', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N'),
(45, 'LUIS CRISTÓBAL', 'BONIFAZ YAMBAY', '', '', '32928060', '', '', 'N'),
(46, 'LUZ MARÍA', 'YAMBAY ORDEN', '', '', '32928060', '', '', 'N'),
(47, 'TERESA DE JESÚS', 'YAMBAY BONIFAZ', '', '', '32953632', '', '', 'N'),
(48, 'MARÍA GABRIELA', 'VERGARA PANCHO', '', '', '', '', '', 'N'),
(49, 'MARÍA ALEJANDRA', 'COBO MEDINA', '', '', '32964310', '', '', 'N'),
(50, 'CARLOS ENRIQUE', 'BOLAÑOS LEÓN', '', '', '', '', '', 'N'),
(51, 'FRED ADRIAN', 'ARTEAGA GÓMEZ', '', '', '', '', '', 'N'),
(52, 'MIGUEL EMILIO', 'MORALES CASTRO', '', '', '42821853', '', '', 'N'),
(53, 'MARÍA JOSÉ', 'MAFLA ANDRADE', '', '', 'O987947094', '', '', 'N'),
(54, 'MARÍA ELISA', 'MAFLA ANDRADE', '', '', '', '', '', 'N'),
(55, 'SERGIO RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N'),
(56, 'HÉCTOR RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N'),
(57, 'VINUEZA ELSA', 'CECILIA ', '', '', 'O994960909', '', '', 'N'),
(58, 'CAGUA VINUEZA', 'RUTH NOEMI', '', '', 'O991262192', '', '', 'N'),
(59, 'MUÑOZ BONE', 'MARCO ANTONIO', '', '', 'O62700626', '', '', 'N'),
(60, 'PARRA VARGAS', 'ROBERTO FERNANDO', '', '', '', '', '', 'N'),
(61, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '', '', '', '', '', 'N'),
(62, 'DIANA ADELAIDA', 'MOREIRA BASURTO', '', '', 'O959565315', '', '', 'N'),
(63, 'REYES NORMA', 'RITA ', '', '', 'O990477166', '', '', 'N'),
(64, 'ALBORNOZ JOSÉ', 'LUIS ', '', '', 'O984246121', '', '', 'N'),
(65, 'CASTAÑO VIVIANA', 'MARÍA ', '', '', 'O983893387', '', '', 'N'),
(66, 'ALBORNOZ CASTAÑO', 'BRYAN ALEXIS', '', '', 'O984205669', '', '', 'N'),
(67, 'JÁCOME DANIELA', ' ', '', '', 'O984205669', '', '', 'N'),
(68, 'ALBORNOZ LUISA', 'MARÍA ', '', '', '', '', '', 'N'),
(69, 'ALBORNOZ DANA', 'GISEL ', '', '', 'O983199712', '', '', 'N'),
(70, 'BELTRAN ANDRÉS', ' ', '', '', 'O983199712', '', '', 'N'),
(71, 'DÁVILA REYES', 'MIRIAM EUGENIA', '', '', 'O999187184', '', '', 'N'),
(72, 'DÁVILA REYES', 'MIRIAM AUGENIA', '', '', 'O999187184', '', '', 'N'),
(73, 'MARCO RAMIRO', 'VIZUETE SANTACRUZ', '1720090057', '', '3130669', '', '', 'S'),
(74, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', '', '', '2562025', '', '', 'N'),
(75, 'ALICIA DEL PILAR', 'CARRERA VIZUETE', '1720802394', '', '3130669', '', '', 'A'),
(76, 'MÓNICA DEL ROCÍO', 'VIZUETE REVELO', '', '', '', '', '', 'N'),
(77, 'ANDRÉS FELIPE', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N'),
(78, 'LUIS SEBASTIÁN', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N'),
(79, 'GALO MATEO', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N'),
(80, 'BYRON EDUARDO', 'VITERI ESTEVEZ', '', '', 'O999035799', '', '', 'N'),
(81, 'ROSA ELENA', 'CARRERA VIZUETE', '', '', '3130669', '', '', 'N'),
(82, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', '', '', '2562025', '', '', 'N'),
(83, 'RICARDO ALBERTO', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N'),
(84, 'RICARDO DAMIÁN', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N'),
(85, 'RICARDO RAFAEL', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N'),
(86, 'RICARDO AUGUSTO', 'CARVAJAL ', '', '', 'O995253019', '', '', 'N'),
(87, 'HILDA MARINA', 'CASTILLO SEMBLANTES', '', '', 'O995270904', '', '', 'N'),
(88, 'CESAR AUGUSTO', 'CARVAJAL CASTILLO', '', '', 'O999025296', '', '', 'N'),
(89, 'CRISTIAN FERNANDO', 'CARVAJAL CASTILLO', '', '', 'O987742427', '', '', 'N'),
(90, 'JESSICA PAULINA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N'),
(91, 'VERÓNICA LORENA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N'),
(92, 'EVELYN DAYANA', 'HERNÁNDEZ GAVILANES', '', '', 'O987391139', '', '', 'N'),
(93, 'CAIZA QUERO', 'ROSA MERCEDES', '', '', '2407067', '', '', 'N'),
(94, 'CATOTA TIPANLUISA', 'JOSÉ HILARIO', '', '', '2407067', '', '', 'N'),
(95, 'CAIZA QUERO', 'MARÍA LUISA', '', '', '2811779', '', '', 'N'),
(96, 'CAIZA QUERO', 'HILDA MARÍA', '', '', '2811779', '', '', 'N'),
(97, 'CATOTA CAIZA', 'MARIA CECILIA', '', '', '2407067', '', '', 'N'),
(98, 'CATOTA ACHIG', 'GIOVANNI JAIR', '', '', '3121515', '', '', 'N'),
(99, 'CATOTA ACHIG', 'GEOMEL ALEXANDER', '', '', '3121515', '', '', 'N'),
(100, 'CATOTA ACHIG', 'EDIOSN ALDAIR', '', '', '3121515', '', '', 'N'),
(101, 'CAIZA GUACHAMIN', 'MARIA FERNANDA', '', '', '', '', '', 'N'),
(102, 'ACHIG ENDARA', 'MARICELA MELBA', '', '', '3121515', '', '', 'N'),
(103, 'PAAGUAY ATUPAÑA', 'SONIA MARICELA', '', '', '32951568', '', '', 'N'),
(104, 'CEPEDA PAGUAY', 'LIZBETHESTEFANIA ', '', '', '32951568', '', '', 'N'),
(105, 'CEPEDA PAGUAY', 'ANDRÉS ALEJANDRO', '', '', '32951568', '', '', 'N'),
(106, 'CEPEDA PAGUAY', 'DIEGO FERNANDO', '', '', '32951568', '', '', 'N'),
(107, 'CEPEDA SOLÍS', 'JOSÉ ENRIQUE', '', '', 'O995452589', '', '', 'N'),
(108, 'ARÉVALO ANDRADE', 'ANA GRACIELA', '', '', 'O995452589', '', '', 'N'),
(109, 'CEPEDA ARÉVALO', 'JHOANA GABRIELA', '', '', 'O998489826', '', '', 'N'),
(110, 'CEPEDA AREVALO', 'MARCELO RODRIGO', '', '', 'O987616282', '', '', 'N'),
(111, 'CEPEDA AREVALO', 'JAVIER ENRIQUE', '', '', 'O995497923', '', '', 'N'),
(112, 'MANZANO RUÍZ', 'MARY PATRICIA', '', '', 'O993768671', '', '', 'N'),
(113, 'JAQUELINE BONAFONT', ' ', '', '', '42214269', '', '', 'N'),
(114, 'JAQUELINE BONAFONT', ' ', '', '', '42214269', '', '', 'N'),
(115, 'IVÁN CEVALLOS', ' ', '', '', '', '', '', 'N'),
(116, 'RITA CEVALLOS', ' ', '', '', '', '', '', 'N'),
(117, 'ROSARIO RUEDA', ' ', '', '', '', '', '', 'N'),
(118, 'VERÓNICA ROSERO', ' ', '', '', '', '', '', 'N'),
(119, 'CRISTINA SAAVEDRA', ' ', '', '', '', '', '', 'N'),
(120, 'JIMENA SAAVEDRA', ' ', '', '', '', '', '', 'N'),
(121, 'LIYEN CEVALLOS', ' ', '', '', '', '', '', 'N'),
(122, 'LIZ CEVALLOS', ' ', '', '', '', '', '', 'N'),
(123, 'LAURA MARLENE', 'MOLINA JIMÉNEZ', '', '', '', '', '', 'N'),
(124, 'MARÍA GRACIELA', 'VIZCAINO ', '', '', '2748058', '', '', 'N'),
(125, 'DARWIN JOEL', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N'),
(126, 'CLARIBEL NIKYTA', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N'),
(127, 'HOMERO DANIEL', 'CONDOY VIZACAINO', '', '', '2748058', '', '', 'N'),
(128, 'CARLOS HOMERO', 'CONDOY ROSERO', '', '', '2748058', '', '', 'N'),
(129, 'ZARA PÉREZ', ' ', '', '', '3050162', '', '', 'N'),
(130, 'EMILI CUEVA', ' ', '', '', '', '', '', 'N'),
(131, 'MATÍAS SEBASTIÁN', 'CUEVA ', '', '', '', '', '', 'N'),
(132, 'JEREMY CUEVA', ' ', '', '', '', '', '', 'N'),
(133, 'NORMA CUEVA', ' ', '', '', '', '', '', 'N'),
(134, 'PEDRO SÁNCHEZ', ' ', '', '', '', '', '', 'N'),
(135, 'PATRICIA PÉREZ', ' ', '', '', '', '', '', 'N'),
(136, 'MILTON TORRES', ' ', '', '', '', '', '', 'N'),
(137, 'ROSA PÉREZ', ' ', '', '', '', '', '', 'N'),
(138, 'ANA CRISTINA', 'VIVANCO DÍAZ', '', '', '', '', '', 'N'),
(139, 'MARÍA BELÉN', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N'),
(140, 'VÍCTOR ALEXIS', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N'),
(141, 'ISABEL CAROLINA', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N'),
(142, 'VÍCTOR ANTONIO', 'ENRÍQUEZ ', '', '', '2960154', '', '', 'N'),
(143, 'ROSA ELENA', 'ENRÍQUEZ CABRERA', '', '', '', '', '', 'N'),
(144, 'JULIO CABRERA', 'LOAIZA ', '', '', '', '', '', 'N'),
(145, 'MARÍA DEL CARMEN', 'CABRERA LOAIZA', '', '', '', '', '', 'N'),
(146, 'DEISY AMELIA', 'DÍAZ DÍAZ', '', '', '', '', '', 'N'),
(147, 'JESICA CAÑIZARES', ' ', '', '', '2732294', '', '', 'N'),
(148, 'CESAR DOMÍNGUEZ', ' ', '', '', '2620271', '', '', 'N'),
(149, 'NORIS CEVALLOS', ' ', '', '', '2620271', '', '', 'N'),
(150, 'NANCY BORJA', ' ', '', '', '2732294', '', '', 'N'),
(151, 'LUIS CAÑIZARES', ' ', '', '', '2732294', '', '', 'N'),
(152, 'JOHANA CAÑIZARES', ' ', '', '', '', '', '', 'N'),
(153, 'NERBO VERDESOTO', ' ', '', '', '', '', '', 'N'),
(154, 'PILAR REAL', ' ', '', '', '', '', '', 'N'),
(155, 'MILENA DOMÍNGUEZ', ' ', '', '', '', '', '', 'N'),
(156, 'KATHY YESSENIA', 'MOROCHO IMBACUAN', '', '', '2661954', '', '', 'N'),
(157, 'CINTHIA ALEJANDRA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N'),
(158, 'MAYERLI MICAELA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N'),
(159, 'SARAY NICOLL', 'FAJARDO MOROCHO', '', '', '', '', '', 'N'),
(160, 'JOSÉ ARCESIO', 'FAJARDO ', '', '', 'O997299977', '', '', 'N'),
(161, 'LUCIA BEATRIZ', 'GAVIDIA ESTRELLA', '', '', 'O997299977', '', '', 'N'),
(162, 'VÍCTOR HUGO', 'MOROCHO ', '', '', '2661954', '', '', 'N'),
(163, 'MARÍA IMBACUAN', ' ', '', '', '2661954', '', '', 'N'),
(164, 'MARIANA GAVIDIA', 'ESTRELLA ', '', '', 'O997299977', '', '', 'N'),
(165, 'DIANA SORAYA', 'FAJARDO GAVIDIA', '', '', 'O997299977', '', '', 'N'),
(166, 'MARCIA ROBALINO', ' ', '', '', '', '', '', 'N'),
(167, 'ZULEMA MANTILLA', ' ', '', '', '', '', '', 'N'),
(168, 'ADELA FIGUEROA', ' ', '', '', '', '', '', 'N'),
(169, 'CARLA FIGUEROA', ' ', '', '', '', '', '', 'N'),
(170, 'NEPALÍ MARTÍNEZ', ' ', '', '', '', '', '', 'N'),
(171, 'GUILLERMO BARRAGÁN', ' ', '', '', '', '', '', 'N'),
(172, 'MANUEL ÁLVAREZ', ' ', '', '', '', '', '', 'N'),
(173, 'MARCET GUAMÁN', ' ', '', '', '', '', '', 'N'),
(174, 'ROCIO ARCE', ' ', '', '', '', '', '', 'N'),
(175, 'KATTY LÓPEZ', 'CAICEDO ', '', '', '', '', '', 'N'),
(176, 'ADOLFO FRUTO', 'VERGARA ', '', '', '', '', '', 'N'),
(177, 'MARGARITA MÁRQUEZ', 'FERNÁNDEZ ', '', '', '', '', '', 'N'),
(178, 'DIANA FRUTO', 'MÁRQUEZ ', '', '', '', '', '', 'N'),
(179, 'ANTONY FRUTO', 'MORA ', '', '', '', '', '', 'N'),
(180, 'ALEX GÓMEZ', 'PONCE ', '', '', '', '', '', 'N'),
(181, 'MAGALY DEL', 'ROCÍO PEÑA', '', '', '', '', '', 'N'),
(182, 'ALEJANDRA CORONEL', 'MONTALVO ', '', '', '', '', '', 'N'),
(183, 'MARILYN ERAZO', ' ', '', '', '', '', '', 'N'),
(184, 'FELIX GUEVARA', ' ', '', '', '', '', '', 'N'),
(185, 'CARLOS GUEVARA', ' ', '', '', '', '', '', 'N'),
(186, 'JUAN DIEGO', 'GUEVARA ', '', '', '', '', '', 'N'),
(187, 'SAMUEL ERAZO', ' ', '', '', '', '', '', 'N'),
(188, 'NOEMI NARVÁEZ', ' ', '', '', '', '', '', 'N'),
(189, 'ANDRÉS ERAZO', ' ', '', '', '', '', '', 'N'),
(190, 'DARWIN GUEVARA', ' ', '', '', '', '', '', 'N'),
(191, 'FREDY GUEVARA', ' ', '', '', '', '', '', 'N'),
(192, 'MARY RAQUEL', 'HURTADO CHANGO', '', '', '', '', '', 'N'),
(193, 'MAILY JORDANA', 'GUAMÁN HURTADO', '', '', '', '', '', 'N'),
(194, 'SEGUNDO AURELIO', 'GUAMÁN ', '', '', '', '', '', 'N'),
(195, 'MARÍA CONCEPCIÓN', 'SIMALUISA COPARA', '', '', '', '', '', 'N'),
(196, 'MIRYAN ESTHER', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N'),
(197, 'MARÍA ORFELINA', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N'),
(198, 'DIEGO JAVIER', 'SIMALUISA SIMALUISA', '', '', '', '', '', 'N'),
(199, 'EDWIN HIPOLITO', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N'),
(200, 'JENNY IZA', ' ', '', '', '', '', '', 'N'),
(201, 'JOSUE GUAMÁN', 'IZA ', '', '', '', '', '', 'N'),
(202, 'SONIA JUDITH', 'VERA VINUEZA', '', '', '2321762', '', '', 'N'),
(203, 'JOSÉ HERIBERTO', 'GUANOLUISA TIPAN', '', '', '', '', '', 'N'),
(204, 'AMPARITO AZUCENA', 'MARTÍNEZ MORALES', '', '', '2526266', '', '', 'N'),
(205, 'JESSICA PAOLA', 'TIXILEMA MARTÍNEZ', '', '', '3069334', '', '', 'N'),
(206, 'MAYRA ELIZABETH', 'GUANOLUISA MARTÍNEZ', '', '', '', '', '', 'N'),
(207, 'ANDERSON ALEXANDER', 'RAMÍREZ GUANOLUISA', '', '', '', '', '', 'N'),
(208, 'LADDY ANTONELLA', 'RAMÍREZ GUANOLUISA', '', '', '', '', '', 'N'),
(209, 'MILTON EDUARDO', 'GUANOTASIG OÑA', '', '', '', '', '', 'N'),
(210, 'CRISTINA SIMBAÑA', ' ', '', '', '', '', '', 'N'),
(211, 'ELVIA YOLANDA', 'GUANOTASIG OÑA', '', '', '', '', '', 'N'),
(212, 'VICENTE AGUSTIN', 'GUANOTASIG PILLIZA', '', '', '', '', '', 'N'),
(213, 'ZOILA OÑA', 'PILLIZA ', '', '', '', '', '', 'N'),
(214, 'SANDRA JANETH', 'LUCERO SÁNCHEZ', '', '', '3020554', '', '', 'N'),
(215, 'ANDREA ESTEFANIA', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N'),
(216, 'JAIDI ANALIE', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N'),
(217, 'MARÍA TERESA', 'TUFIÑO ', '', '', '2630445', '', '', 'N'),
(218, 'HUGO ISMAEL', 'IÑIGUEZ LUZURIAGA', '', '', '2630445', '', '', 'N'),
(219, 'VÍCTOR EDUARDO', 'LUCERO DÍAZ', '', '', '3020554', '', '', 'N'),
(220, 'MIRIAM CECILIA', 'SÁNCHEZ ARROYO', '', '', '3020554', '', '', 'N'),
(221, 'NANCY SAENZ', 'TUFIÑO ', '', '', '', '', '', 'N'),
(222, 'ATILIO INTRIAGO', 'CARRANZA ', '', '', '', '', '', 'N'),
(223, 'CARLOS CEVALLOS', 'ESTRADA ', '', '', '', '', '', 'N'),
(224, 'STEVEN INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N'),
(225, 'ARIEL INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N'),
(226, 'MATÍAS INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N'),
(227, 'NELLY LILIANA', 'ORTIZ CARRASCO', '', '', '', '', '', 'N'),
(228, 'WASHINGTON PULECIO', 'MELGAR ', '', '', '', '', '', 'N'),
(229, 'GISELLA CAROLINA', 'VALAREZO CHILA', '', '', '', '', '', 'N'),
(230, 'NESTOR LENIN', 'MONTAÑO VALENCIA', '', '', '', '', '', 'N'),
(231, 'LORGIO INTRIAGO', 'PINARGOTE ', '', '', '', '', '', 'N'),
(232, 'DENNY GARCÍA', 'DELGADO ', '', '', 'O988814990', '', '', 'N'),
(233, 'JONATHAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N'),
(234, 'ANYERLI INTRIAGO', 'SÁNCHEZ ', '', '', '', '', '', 'N'),
(235, 'ADRIAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N'),
(236, 'RICARDO GARCÍA', 'DELGADO ', '', '', '', '', '', 'N'),
(237, 'JEFFERSON GARCÍA', 'INTRIAGO ', '', '', '', '', '', 'N'),
(238, 'MARÍA ETELVINA', 'SIMABAÑA ESPINOZA', '', '', '3262234', '', '', 'N'),
(239, 'ALFONSO JETACAMA', 'YACELGA ', '', '', '3262234', '', '', 'N'),
(240, 'LUIS FERNANDO', 'JETACAMA SIMBAÑA', '', '', '3262234', '', '', 'N'),
(241, 'ÁNGEL SANTIAGO', 'JETACAMA SIMABAÑA', '', '', '', '', '', 'N'),
(242, 'JONATHAN DAVID', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N'),
(243, 'PABLO ALFONSO', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N'),
(244, 'ALISSON NAYETH', 'JETACAMA CHICAIZA', '', '', '', '', '', 'N'),
(245, 'VIVIANA JAQUELINE', 'CHICAIZA ZARATE', '', '', '2673132', '', '', 'N'),
(246, 'SANDRA AULESTIA', 'ACURIO ', '', '', 'O998884336', '', '', 'N'),
(247, 'BEATRIZ MONTALVO', 'SALAZAR ', '', '', '3163351', '', '', 'N'),
(248, 'LEONIDAS LASCANO', 'MALES ', '', '', 'NO SABE', '', '', 'N'),
(249, 'ISAAC LASCANO', 'CERÓN ', '', '', '', '', '', 'N'),
(250, 'ALISSON LASCANO', 'CERÓN ', '', '', '', '', '', 'N'),
(251, 'MARIANA LASCANO', 'MALES ', '', '', '', '', '', 'N'),
(252, 'CARLOS CALLE', 'CABEZAS ', '', '', '', '', '', 'N'),
(253, 'MYRIAN ANABEL', 'APOLO ÁLVAREZ', '', '', '2639858', '', '', 'N'),
(254, 'MAYTE SUSANA', 'LASO APOLO', '', '', '2639858', '', '', 'N'),
(255, 'PIEDAD SUSANA', 'LASO ALMEIDA', '', '', '2634763', '', '', 'N'),
(256, 'CRISTIAN DANIEL', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N'),
(257, 'YESENIA XIMENA', 'TOMALO LASO', '', '', '2639858', '', '', 'N'),
(258, 'LUIS PATRICIO', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N'),
(259, 'MARTHA YOLANDA', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N'),
(260, 'SEGUNDO EFRAIN', 'ALMEIDA ', '', '', '2639858', '', '', 'N'),
(261, 'LUZMILA ALMEIDA', ' ', '', '', '2910382', '', '', 'N'),
(262, 'EDGAR VINICIO', 'GARZÓN ALMEIDA', '', '', '2910382', '', '', 'N'),
(263, 'KARLA PAOLA', 'BUSTOS YAGUACHI', '', '', '3035841', '', '', 'N'),
(264, 'EULALIA MENESES', 'PAREDES ', '', '', '3035841', '', '', 'N'),
(265, 'GABRIEL LLUMIQUINGA', 'PAUCAR ', '', '', '3035841', '', '', 'N'),
(266, 'JULIANA LUMIQUINGA', 'BUSTOS ', '', '', '3035841', '', '', 'N'),
(267, 'WILLIAM LUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N'),
(268, 'KATHERINE LLUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N'),
(269, 'EVELYN LLUMIQUINGA', 'MENESES ', '', '', '', '', '', 'N'),
(270, 'BYRON BUSTOS', 'YAGUACHI ', '', '', '3035841', '', '', 'N'),
(271, 'ARON LLUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N'),
(272, 'LORENA SIMBA', ' ', '', '', '3035841', '', '', 'N'),
(273, 'MARÍA CRISTINA', 'LOOR BRIONES', '', '', '', '', '', 'N'),
(274, 'PEDRO MIGUEL', 'LOOR SABANDO', '', '', '', '', '', 'N'),
(275, 'SANTA GERARDINA', 'CÓRDOVA CEVALLOS', '', '', '', '', '', 'N'),
(276, 'MIGUEL ADRIAN', 'LOOR CÓRDOVA', '', '', '', '', '', 'N'),
(277, 'MARÍA CRUZ', 'CRUZ LOOR', '', '', '', '', '', 'N'),
(278, 'CLEMENTE CEDEÑO', 'CÓRDOVA ', '', '', '', '', '', 'N'),
(279, 'JUANA ERLINDA', 'LOOR CÓRDOVA', '', '', '', '', '', 'N'),
(280, 'MIGUEL LEONEL', 'LOOR CÓRDOVA', '', '', '', '', '', 'N'),
(281, 'RAMÓN CÓRDOVA', 'MOLINA ', '', '', '', '', '', 'N'),
(282, 'ANA CRISTINA', 'LOOR LOOR', '', '', '', '', '', 'N'),
(283, 'MARIA GEMA', 'BAZURTO MENDOZA', '', '', '', '', '', 'N'),
(284, 'DIEGO JANVIER', 'LOOR BAZURTO', '', '', '', '', '', 'N'),
(285, 'FANNY VINUEZA', 'ANCHUNDIA ', '', '', '', '', '', 'N'),
(286, 'JOSÉ NEPTALI', 'LOOR GARCÍA', '', '', '', '', '', 'N'),
(287, 'JOSÉ FERNANDO', 'LOOR VINUEZA', '', '', '', '', '', 'N'),
(288, 'GEMA MATILDE', 'LOOR VINUEZA', '', '', '', '', '', 'N'),
(289, 'OSWALDO BAZURTO', 'MENDOZA ', '', '', '', '', '', 'N'),
(290, 'JOSÉ OSCAR', 'LOOR GARCÍA', '', '', '', '', '', 'N'),
(291, 'JOSE MARÍA', 'LOOR GARCÍA', '', '', '', '', '', 'N'),
(292, 'PONCE PONCE', 'MARÍA PATRICIA', '', '', 'O980251632', '', '', 'N'),
(293, 'MAFLA VALVERDE', 'OSWALDO GUILLERMO', '', '', 'O994162519', '', '', 'N'),
(294, 'ANDRADE RUIZ', 'NANCY GUADALUPE', '', '', 'O994162519', '', '', 'N'),
(295, 'MAFLA ANDRADE', 'GUILLERMO ANDRÉS', '', '', 'O986173065', '', '', 'N'),
(296, 'CASTILLO MOLINA', 'ELIANA ELIZABETH', '', '', '', '', '', 'N'),
(297, 'MAFLA CASTILLO', 'NATHALY JULIETE', '', '', '', '', '', 'N'),
(298, 'URUTIA SOTO', 'ROSANA PATRICIA', '', '', 'O62280675', '', '', 'N'),
(299, 'DELIA ÁLVAREZ', 'ANAGO ', '', '', '2892564', '', '', 'N'),
(300, 'MARIANO LLULLUMA', 'RODRÍGUEZ ', '', '', '2892564', '', '', 'N'),
(301, 'EYMI LLLULLUMA', 'PERALTA ', '', '', '', '', '', 'N'),
(302, 'JOSELYN LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N'),
(303, 'DANTE LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N'),
(304, 'AURORA PERALTA', 'VILLACIS ', '', '', '', '', '', 'N'),
(305, 'ANITA LUCIA', 'LLULLUMA ÁLVAREZ', '', '', '', '', '', 'N'),
(306, 'MARCO LLULLUMA', 'ÁLVAREZ ', '', '', '', '', '', 'N'),
(307, 'LIBIA BERNAL', 'VERA ', '', '', '', '', '', 'N'),
(308, 'LAURA MARCELA', 'LARA MONAR', '', '', '2681000', '', '', 'N'),
(309, 'LUIS MATEO', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N'),
(310, 'ALAN ANDRÉS', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N'),
(311, 'JOSÉ ALBERTO', 'MALLIQUINGA AGUAYO', '', '', '2681000', '', '', 'N'),
(312, 'MARÍA ANDAGOYA', 'COYAGO ', '', '', '2681000', '', '', 'N'),
(313, 'CARMEN GUADALUPE', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N'),
(314, 'MARÍA ELIZABETH', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N'),
(315, 'VÍCTOR DANIEL', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N'),
(316, 'EVELIN ESTEFANIA', 'CEVALLOS ANDAGOYA', '', '', '2681000', '', '', 'N'),
(317, 'EVELYN ROXANA', 'LLUMIQUINGA PACHACAMA', '', '', 'O980992267', '', '', 'N'),
(318, 'JOSTIN ARIEL', 'MALLIQUINGA LLUMIQUINGA', '', '', 'O980992267', '', '', 'N'),
(319, 'MARÍA ZOILA', 'CATAGÑA USHIÑA', '', '', '2787532', '', '', 'N'),
(320, 'MARIANA DE JESÚS', 'CUEVA CEVALLOS', '', '', '2530151', '', '', 'N'),
(321, 'ANGELO RAMIRO', 'MANOSALVAS CUEVA', '', '', '2530151', '', '', 'N'),
(322, 'ALEXANDER MANOSALVAS', 'CUEVA ', '', '', '2530151', '', '', 'N'),
(323, 'SOFÍA ISABEL', 'MANOSALVAS CUEVA', '', '', '2530151', '', '', 'N'),
(324, 'GLORIA INÉS', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N'),
(325, 'VÍCTOR EMILIO', 'LUDEÑA CUEVA', '', '', '2530151', '', '', 'N'),
(326, 'GERMÁN RODRIGO', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N'),
(327, 'JOSEFINA CUEVA', 'CEVALLOS ', '', '', '2530151', '', '', 'N'),
(328, 'MARCO ANICETO', 'CHANGO ', '', '', '2530151', '', '', 'N'),
(329, 'MIKAELA ROSIBEL', 'GUZMÁN MOROCHO', '', '', 'O967378926', '', '', 'N'),
(330, 'PAULINA ELIZABETH', 'MANTILLA CHITO', '', '', 'O993803415', '', '', 'N'),
(331, 'PAMELA DE LOS ÁNGELES', 'MANTILLA CHITO', '', '', '', '', '', 'N'),
(332, 'DANIEL CARRILLO', ' ', '', '', '', '', '', 'N'),
(333, 'ROCÍO ERAZO', ' ', '', '', '', '', '', 'N'),
(334, 'GUADALUPE ERAZO', ' ', '', '', '', '', '', 'N'),
(335, 'MARTHA CHITO', 'TACURI ', '', '', '', '', '', 'N'),
(336, 'BLANCA MANTILLA', ' ', '', '', '', '', '', 'N'),
(337, 'MARCELA LÓPEZ', ' ', '', '', '', '', '', 'N'),
(338, 'ROSA MARÍA', 'NOEMÍ VÁSQUEZ', '', '', 'O993126270', '', '', 'N'),
(339, 'SANDRA MARITZA', 'MENESES VÁSQUEZ', '', '', 'O983404353', '', '', 'N'),
(340, 'MARÍA CHELA', 'MÉNDEZ GUDIÑO', '', '', '2498945', '', '', 'N'),
(341, 'RAMIRO PADILLA', ' ', '', '', '2498945', '', '', 'N'),
(342, 'LUIS ENRIQUE', 'MENESES GONZAGA', '', '', 'O995676170', '', '', 'N'),
(343, 'LIGIA ELENA', 'CHALA MÉNDEZ', '', '', '2498945', '', '', 'N'),
(344, 'DALILA TADEO', ' ', '', '', '2498945', '', '', 'N'),
(345, 'HERNÁN PRECIADO', 'MENESES ', '', '', 'O983404353', '', '', 'N'),
(346, 'AIDE ELIZABETH', 'PALACIOS VÁSQUEZ', '', '', 'O985150322', '', '', 'N'),
(347, 'BELLA NARDA', 'MARQUEZ LUDEÑA', '', '', 'O992507269', '', '', 'N'),
(348, 'EDISON FERNANDO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N'),
(349, 'JHON JAIRO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N'),
(350, 'KATERIN MISHEL', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N'),
(351, 'PAOLO JOSUE', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N'),
(352, 'OLGA ENIT', 'LUDEÑA ARELLANO', '', '', '3016458', '', '', 'N'),
(353, 'ANDREA CORTEZ', ' ', '', '', '3016458', '', '', 'N'),
(354, 'GEOVANA TIRADO', ' ', '', '', '3016458', '', '', 'N'),
(355, 'CRISTIAN RAMÍREZ', ' ', '', '', '3016458', '', '', 'N'),
(356, 'FANNY FAJARDO', 'FAJARDO ', '', '', '32804316', '', '', 'N'),
(357, 'CRISTIAN ANTONIO', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N'),
(358, 'VÍCTOR ANDRÉS', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N'),
(359, 'NELLY MAGDALENA', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N'),
(360, 'ESMERALDA DE JESÚS', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N'),
(361, 'PAULINA SALOME', 'QUINTANA MOSCOSO', '', '', '32803710', '', '', 'N'),
(362, 'JULIO EDWIN', 'QUINTANA JÁCOME', '', '', '32803710', '', '', 'N'),
(363, 'CARLOS ANTONIO', 'RODRÍGUEZ CORAL', '', '', '32803710', '', '', 'N'),
(364, 'MISHEL ESTEFANIA', 'QUINTANA MOSCOSO', '', '', '32804316', '', '', 'N'),
(365, 'SILVIA ESPERANZA', 'PIN CABEZAS', '', '', 'O984909822', '', '', 'N'),
(366, 'NICOLE KATERINE', 'MULLO PIN', '', '', '', '', '', 'N'),
(367, 'MARÍA TERESA', 'UYANA VELOZ', '', '', '', '', '', 'N'),
(368, 'JOSÉ OCTAVIO', 'MULLO TUTILLO', '', '', '', '', '', 'N'),
(369, 'MARTHA CABEZAS', 'GUALOTO ', '', '', '', '', '', 'N'),
(370, 'JORGE WASHINGTON', 'PIN ', '', '', '', '', '', 'N'),
(371, 'GUADALUPE ERMIÑA', 'VELOZ ', '', '', '', '', '', 'N'),
(372, 'MARIANA MULLO', 'TUTILLO ', '', '', '', '', '', 'N'),
(373, 'RAÚL PINTO', ' ', '', '', '', '', '', 'N'),
(374, 'ALBA TERESA', 'BORJA ENRÍQUEZ', '', '', '', '', '', 'N'),
(375, 'GUIOCONDA NOEMÍ', 'VENEGAS MARTÍNEZ', '', '', 'O983555064', '', '', 'N'),
(376, 'CRISTOPHER DANIEL', 'NAVAS BORJA', '', '', '', '', '', 'N'),
(377, 'NATALY YADIRA', 'LÓPEZ VENEGAS', '', '', '', '', '', 'N'),
(378, 'MARIUXI AMPARITO', 'LAZ SALTOS', '', '', '', '', '', 'N'),
(379, 'JUANA NATIVIDAD', 'PAVÓN CHALA', '', '', 'O997692772', '', '', 'N'),
(380, 'ARNULFO SIGIFREDO', 'CAMPOS GONZALES', '', '', '', '', '', 'N'),
(381, 'OMAR DAVID', 'CAMPOS PAVÓN', '', '', '', '', '', 'N'),
(382, 'ARIANA VALENTINA', 'PAVÓN MÉNDEZ', '', '', '', '', '', 'N'),
(383, 'CLEMENTINA CHALA', 'DE LA CRUZ ', '', '', '', '', '', 'N'),
(384, 'OLIVA PAVÓN', 'CHALA ', '', '', 'O994797217', '', '', 'N'),
(385, 'ANA ALEXANDRA', 'MÉNDEZ GONZALO', '', '', '', '', '', 'N'),
(386, 'MARIANA DE LOURDES', 'PAVÓN CHALA', '', '', '', '', '', 'N'),
(387, 'MARÍA REBECA', 'MÉNDEZ VEGA', '', '', 'O990794870', '', '', 'N'),
(388, 'MARÍA INÉS', 'TREJO CHARCOPA', '', '', '62705285', '', '', 'N'),
(389, 'ELENA ELIZABETH', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N'),
(390, 'NELLY MIREYA', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N'),
(391, 'FRANKLIN EDUARDO', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N'),
(392, 'FRANKLIN AGUSTIN', 'PÉREZ FARIAS', '', '', '62705285', '', '', 'N'),
(393, 'GLORIA JOSEFINA', 'ROJANO QUINTUÑA', '', '', 'O983293865', '', '', 'N'),
(394, 'LUIS PATRICIO', 'PILAQUINGA LLUGCHA', '', '', 'O995776677', '', '', 'N'),
(395, 'MARÍA TERESA', 'SIGCHA CHUSIN', '', '', 'O983120320', '', '', 'N'),
(396, 'ESTEBAN PATRICIO', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N'),
(397, 'KERLY NICOLE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N'),
(398, 'MAYERLI JAQUELINE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N'),
(399, 'JENNY PAOLA', 'PILAQUINGA SIGCHA', '', '', 'O969504170', '', '', 'N'),
(400, 'GLORIA FERNANDA', 'PILAQUINGA SIGCHA', '', '', 'O983078024', '', '', 'N'),
(401, 'JULIO ALFREDO', 'CALLE MORA', '', '', 'O987778257', '', '', 'N'),
(402, 'LIBER QUINTERO', 'MEDINA ', '', '', '', '', '', 'N'),
(403, 'SAMARI ARROYO', 'SUAREZ ', '', '', '', '', '', 'N'),
(404, 'LEANDRO ARROYO', 'SUAREZ ', '', '', '', '', '', 'N'),
(405, 'JEAN PIERE', 'ARROYO SUAREZ', '', '', '', '', '', 'N'),
(406, 'CONY QUINTERO', 'NARANJO ', '', '', '', '', '', 'N'),
(407, 'CHENOOA QUINTERO', 'NARANJO ', '', '', '', '', '', 'N'),
(408, 'JOHANA NARANJO', 'TELLO ', '', '', '', '', '', 'N'),
(409, 'PAOLA AYOVI', 'NAZARENO ', '', '', '', '', '', 'N'),
(410, 'AURIA BATALLA', 'CAÑOLA ', '', '', '', '', '', 'N'),
(411, 'CINTHIA CATHERINE', 'LOOR HERMIDA', '', '', 'O986663600', '', '', 'N'),
(412, 'ALISSON DAYLIN', 'RAMÓN LOOR', '', '', 'O986663600', '', '', 'N'),
(413, 'MARIANA DE JESÚS', 'CHÁVEZ VARELA', '', '', 'O990541599', '', '', 'N'),
(414, 'LISTON ROSALINO', 'RAMÓN GUANGA', '', '', 'O993846058', '', '', 'N'),
(415, 'KEVIN LISTON', 'RAMÓN CHÁVEZ', '', '', 'O969428054', '', '', 'N'),
(416, 'JORDAN STEVEN', 'RAMON CHÁVEZ', '', '', 'O990541599', '', '', 'N'),
(417, 'TERESA EPIFANIA', 'HERMIDA LUCAS', '', '', 'O985871465', '', '', 'N'),
(418, 'CHARVEL RONALD', 'SUAREZ ROMERO', '', '', 'O992587965', '', '', 'N'),
(419, 'JOSELIN MONSERRATHE', 'HERMIDA CORDOVA', '', '', 'O988577259', '', '', 'N'),
(420, 'TERESA JAQUELINE', 'LUZARDO MARCILLO', '', '', '2294950', '', '', 'N'),
(421, 'JEAN PIERE', 'RUIZ LUZARDO', '', '', '2294950', '', '', 'N'),
(422, 'HILDA ROSARIO', 'LLERENA ZAPATA', '', '', '2294950', '', '', 'N'),
(423, 'EUGENIA DEL ROSARIO', 'RUIZ LLERENA', '', '', '', '', '', 'N'),
(424, 'MARÍA TERESA', 'RUIZ LLERENA', '', '', '2800505', '', '', 'N'),
(425, 'LUIS ARNULFO', 'RUIZ LLERENA', '', '', '2493232', '', '', 'N'),
(426, 'CARMEN ELIZABETH', 'RUIZ LLERENA', '', '', '2294950', '', '', 'N'),
(427, 'TANIA ALEXANDRA', 'FIALLOS ACUÑA', '', '', '3301806', '', '', 'N'),
(428, 'OSWALDO MARCELO', 'LONDOÑO MOLINA', '', '', '2432291', '', '', 'N'),
(429, 'ELIAS RAMÓN', 'SALAZAR ', '', '', '', '', '', 'N'),
(430, 'MARÍA ROSA', 'GUAIGUA ', '', '', '', '', '', 'N'),
(431, 'LIDIA MARISOL', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N'),
(432, 'NORMA LUCIA', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N'),
(433, 'MAYRA LILIANA', 'SALAZAR GUIGUA', '', '', '', '', '', 'N'),
(434, 'VÍCTOR HUGO', 'QUILLUPANGUII ', '', '', '', '', '', 'N'),
(435, 'EDISON RAMIRO', 'CHAFLA ', '', '', '', '', '', 'N'),
(436, 'VICENTE DARWIN', 'NAVARRO ', '', '', '', '', '', 'N'),
(437, 'XAVIER ALEJANDRO', 'SALAZAR CÁRDENAS', '', '', '', '', '', 'N'),
(438, 'TAMAYO PINTO', 'PAOLA TATIANA', '', '', '3132536', '', '', 'N'),
(439, 'GALO HERNÁN', 'SALAZAR ', '', '', '2299964', '', '', 'N'),
(440, 'MARTHA AUDELIA', 'NARVÁEZ TAMAYO', '', '', '2299964', '', '', 'N'),
(441, 'PAOLA TATIANA', 'TAMAYO PINTO', '', '', '3132536', '', '', 'N'),
(442, 'KEVYN HERNÁN', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N'),
(443, 'KERLY PAOLA', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N'),
(444, 'PAUL SANTIAGO', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N'),
(445, 'JESSICA GALEANO', 'CADENA ', '', '', '', '', '', 'N'),
(446, 'CARMEN PINTO', 'URBINA ', '', '', '3132536', '', '', 'N'),
(447, 'KATHY ALEXANDRA', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N'),
(448, 'BLANCA BRENDA', 'ALVARADO JIMÉNEZ', '', '', 'O987034838', '', '', 'N'),
(449, 'CARLOS ANÍBAL', 'SÁNCHEZ MASAQUIZA', '', '', '', '', '', 'N'),
(450, 'HILDA LUCRECIA', 'CHILIQUINGA SUAREZ', '', '', '', '', '', 'N'),
(451, 'TAMARA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N'),
(452, 'DANIELA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N'),
(453, 'NAOMI SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N'),
(454, 'CARLOS ANIBAL', 'SANCHEZ CHILIQUINGA', '', '', '', '', '', 'N'),
(455, 'JAVIER BASTIDAS', ' ', '', '', '', '', '', 'N'),
(456, 'GUADALUPE LEMA', 'CHILIQUINGA ', '', '', '', '', '', 'N'),
(457, 'JANNETTE MONTALVO', 'FLORES ', '', '', '', '', '', 'N'),
(458, 'CAMILA SÁNCHEZ', 'RIOFRIO ', '', '', '', '', '', 'N'),
(459, 'MARCOS ARELLEYRA', ' ', '', '', '', '', '', 'N'),
(460, 'LUZ PONCE', 'ARTEAGA ', '', '', '', '', '', 'N'),
(461, 'RODRIGO LASSO', 'DONOSO ', '', '', '', '', '', 'N'),
(462, 'PATRICIO VILLACRES', ' ', '', '', '', '', '', 'N'),
(463, 'MARÍA LUZ', 'RIOFRIO ', '', '', '', '', '', 'N'),
(464, 'JENNY GUERRERO', ' ', '', '', '', '', '', 'N'),
(465, 'FABRICIO MONCAYO', ' ', '', '', '', '', '', 'N'),
(466, 'MONICA PAZMIÑO', 'AUCANCELA ', '', '', 'O987025081', '', '', 'N'),
(467, 'DANIELA BRIGITTE', 'SOCASI AUCANCELA', '', '', 'O967997047', '', '', 'N'),
(468, 'ANAHI KAREN', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N'),
(469, 'NAOMI VALENTINA', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N'),
(470, 'MANUEL LUIS', 'MORANTE SOCASI', '', '', '2964203', '', '', 'N'),
(471, 'MARIA LUISA', 'CUACES AGUIRRE', '', '', 'O998435259', '', '', 'N'),
(472, 'MIRIAM DEL SOCORRO', 'CAUCES AGUIRRE', '', '', 'O981599236', '', '', 'N'),
(473, 'JULIAN ESPINOZA', 'SOTO ', '', '', 'O983960987', '', '', 'N'),
(474, 'PAOLA RAQUEL', 'CARRILLO HINCHALA', '', '', 'O983960987', '', '', 'N'),
(475, 'JENNIFER GABRIELA', 'LÓPEZ MORALES', '', '', 'O983354585', '', '', 'N'),
(476, 'SARA MARÍA', 'FLORES CASTELLANOS', '', '', '2823648', '', '', 'N'),
(477, 'JOSÉ ALEJANDRO', 'SUAREZ GONZALES', '', '', 'O988068962', '', '', 'N'),
(478, 'LIDIA GRISELDA', 'SUAREZ FLORES', '', '', 'O984550117', '', '', 'N'),
(479, 'EDWIN FERNANDO', 'SUAREZ FLORES', '', '', 'O995617836', '', '', 'N'),
(480, 'MIRIAN GEOVANA', 'SUAREZ FLORES', '', '', '2821480', '', '', 'N'),
(481, 'ERNESTO RAMIRO', 'TRUJILLO CARVAJAL', '', '', 'O998183263', '', '', 'N'),
(482, 'EDWIN NULBERTO', 'SUAREZ MOLINA', '', '', '22821480', '', '', 'N'),
(483, 'ZULMA JEANETH', 'BENAVIDES PULLAS', '', '', 'O999143196', '', '', 'N'),
(484, 'KARINA PAOLA', 'YUGCHA CAJAS', '', '', 'O988299525', '', '', 'N'),
(485, 'CESAR ROGELIO', 'TAPIA VILLAGOMEZ', '', '', '23680193', '', '', 'N'),
(486, 'ROSARIO AMAGUAÑA', 'QUILLUPANGUI ', '', '', '23680193', '', '', 'N'),
(487, 'KARINA PAOLA', 'YUGCHA CAJAS', '', '', 'O988299525', '', '', 'N'),
(488, 'SANDRA SONIA', 'JACOME AMGUAÑA', '', '', '23680193', '', '', 'N'),
(489, 'WILSON PATRICIO', 'TAPIA AMGUAÑA', '', '', 'O985109896', '', '', 'N'),
(490, 'RUTH FONSECA', ' ', '', '', 'O985109896', '', '', 'N'),
(491, 'GABRIELA TAPIA', ' ', '', '', 'O985109896', '', '', 'N'),
(492, 'ALEJANDRA TAPIA', ' ', '', '', 'O985109896', '', '', 'N'),
(493, 'CRISTOPHER ALEJANDRO', 'TAPIA YUGCHA', '', '', 'O988299525', '', '', 'N'),
(494, 'LUIS ENRIQUE', 'TIPANTUÑA SARABIO', '', '', '2974544', '', '', 'N'),
(495, 'ANA YOLANDA', 'CHASIQUIZA A.', '', '', '2974544', '', '', 'N'),
(496, 'BERTHA MAGDALENA', 'PÉREZ GUALA', '', '', 'O986314920', '', '', 'N'),
(497, 'ROSALIA GUAITA', ' ', '', '', '2639284', '', '', 'N'),
(498, 'DAVID TRAVEZ', ' ', '', '', '2639284', '', '', 'N'),
(499, 'AMANDA TRAVEZ', ' ', '', '', '2639284', '', '', 'N'),
(500, 'ADRIANA TRAVEZ', ' ', '', '', '2639284', '', '', 'N'),
(501, 'JEFERSON RUANO', ' ', '', '', '2639284', '', '', 'N'),
(502, 'JORDY RUANO', ' ', '', '', '2639284', '', '', 'N'),
(503, 'JASON TRAVEZ', ' ', '', '', '2639284', '', '', 'N'),
(504, 'ROGELIA TAMAYO', ' ', '', '', '2639284', '', '', 'N'),
(505, 'JULIA FLORES', ' ', '', '', 'O983116403', '', '', 'N'),
(506, 'ELOISA MORALES', ' ', '', '', 'O979603241', '', '', 'N'),
(507, 'MARIUXI PAOLA', 'QUIJIJE M.', '', '', 'O982536099', '', '', 'N'),
(508, 'FRANKLIN JHORELL', 'ULLOA QUIJIJE', '', '', '', '', '', 'N'),
(509, 'STEPHANY DAYANE', 'ULLOA QUIJIJE', '', '', '', '', '', 'N'),
(510, 'MERCY ASTRID', 'SALAZAR ', '', '', 'O993167592', '', '', 'N'),
(511, 'FREDDY ENRIQUE', 'SALAZAR ', '', '', 'O997336152', '', '', 'N'),
(512, 'NELSON EUGENIO', 'SALAZAR ', '', '', 'O989353242', '', '', 'N'),
(513, 'EDWIN RANIO', 'SALAZAR ', '', '', 'O982559036', '', '', 'N'),
(514, 'JOHANA SOLÍS', ' ', '', '', '', '', '', 'N'),
(515, 'JEANETH ALVARADO', 'GUERRERO ', '', '', '', '', '', 'N'),
(516, 'LUIS ENRIQUE', 'URBINA QUINTANA', '', '', '3400736', '', '', 'N'),
(517, 'ADRIANA LUCIA', 'VIVANCO CÁRDENAS', '', '', '3400736', '', '', 'N'),
(518, 'ADRIANA MARGARITA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N'),
(519, 'ANFRE LUCIA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N'),
(520, 'DALILA VERONICA', 'SANTILLAN MELENDEZ', '', '', 'O969387493', '', '', 'N'),
(521, 'JORGE ALFREDO', 'ARIAS URBINA', '', '', 'O987472541', '', '', 'N'),
(522, 'DEYSI PIEDAD', 'VALAREZO ', '', '', 'O984430168', '', '', 'N'),
(523, 'MARTHA YANETH', 'VALAREZO ', '', '', 'O992869809', '', '', 'N'),
(524, 'YOFRE DURVAL', 'VALAREZO ', '', '', 'O984371588', '', '', 'N'),
(525, 'FAUSTO GILBERTO', 'VALAREZO ', '', '', 'O983152847', '', '', 'N'),
(526, 'LUGARDA MAGDALENA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N'),
(527, 'MARITZA LUCIA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N'),
(528, 'KEYLA ABIGAIL', 'ROJAS ', '', '', 'O992869809', '', '', 'N'),
(529, 'KATERINE GALVAN', ' ', '', '', 'O984430168', '', '', 'N'),
(530, 'LUCIA GRIMANEZA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N'),
(531, 'LAURA MARÍA', 'VINAIXA ', '', '', '', '', '', 'N'),
(532, 'JUSTIN VÁSQUEZ', 'CUEVA ', '', '', '', '', '', 'N'),
(533, 'ROCIO DE', 'LOURDES CUEVA', '', '', '', '', '', 'N'),
(534, 'HERNÁN ULLOA', ' ', '', '', '', '', '', 'N'),
(535, 'FANY ANBALUDI', ' ', '', '', '', '', '', 'N'),
(536, 'CECIBEL GUDIÑO', ' ', '', '', '', '', '', 'N'),
(537, 'JOSE LUIS', 'MIRANDA ', '', '', '', '', '', 'N'),
(538, 'RONALD JAIRO', 'VÁSQUEZ ', '', '', '', '', '', 'N'),
(539, 'BARBARA BIRMANIA', ' ', '', '', '', '', '', 'N'),
(540, 'JAQUELINE QUICENO', 'CANO ', '', '', '', '', '', 'N'),
(541, 'MÓNICA VALERIA', 'PULIDO BRAVO', '', '', 'O998245518', '', '', 'N'),
(542, 'MARCO ANTONIO', 'VILLACRES PULIDO', '', '', '', '', '', 'N'),
(543, 'JESSIE VILLACRES', 'PULIDO ', '', '', '', '', '', 'N'),
(544, 'MARIO MORALES', 'ZAMBRANO ', '', '', '', '', '', 'N'),
(545, 'MARCO VILLACRES', 'OROZCO ', '', '', '', '', '', 'N'),
(546, 'MATILDE ASCENCIO', 'LUCAS ', '', '', '', '', '', 'N'),
(547, 'JONATHAN VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N'),
(548, 'ALEXANDRA VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N'),
(549, 'ANTONIO PULIDO', 'FALCONI ', '', '', '', '', '', 'N'),
(550, 'PEPE', 'JUAREZ', '1720802394', '', '0992725859', '', '', 'S'),
(552, 'PEPE ANTONIO', 'RUIZ PEREZ 2', '1720090057', 'dfdf', '0992725859', '', '', 'A'),
(553, 'MARCO', 'RUIZ', '', '', '', '', '', 'E'),
(554, 'ADF', 'PPPPP', '', '', '', '', '', 'N'),
(555, 'WILLIAN', 'ESPINOSA', '1720802394', '', '', '', '', 'S'),
(556, 'PRUEBA', 'PRUEBA2', '', '', '', '', '', 'N'),
(560, 'JOSE', 'CUERVO', '', '', '', '', '', 'N'),
(561, 'AAAA', 'AAAA', '', '', '', '', '', 'N'),
(563, 'CCCC', 'CCCC', '', '', '', '', '', 'N'),
(564, 'BBBB', 'BBBB', '', '', '', '', '', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_ppl` (
  `VIP_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitanten-PPL',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIP_FECHA` date NOT NULL COMMENT 'Fecha del Visitanten-PPL',
  PRIMARY KEY (`VIP_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL' AUTO_INCREMENT=540 ;

--
-- Volcar la base de datos para la tabla `sys_visitante_ppl`
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
(16, 2, 16, 36, '0000-00-00'),
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
(519, 2, 555, 3, '0000-00-00'),
(520, 4, 556, 2, '0000-00-00'),
(527, 6, 556, 17, '0000-00-00'),
(530, 5, 555, 21, '0000-00-00'),
(531, 2, 560, 18, '0000-00-00'),
(532, 6, 560, 17, '0000-00-00'),
(533, 72, 561, 12, '0000-00-00'),
(535, 72, 563, 9, '0000-00-00'),
(536, 73, 563, 13, '0000-00-00'),
(538, 72, 564, 15, '0000-00-00'),
(539, 73, 561, 4, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_sancion` (
  `VSA_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitante-Sancion',
  `SAN_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la Sancion',
  `VIS_COD` int(11) DEFAULT NULL COMMENT 'Codigo secuencial del Visitante',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `VSA_NOTA` varchar(5000) DEFAULT NULL COMMENT 'Nota del Visitante-Sancion',
  `VSA_FECHA_INI` datetime DEFAULT NULL COMMENT 'Fecha del Visitante-Sancion',
  `VSA_FECHA_FIN` date DEFAULT NULL COMMENT 'Fecha del Fin de Sancion',
  PRIMARY KEY (`VSA_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Las sanciones que obtiene un visitante' AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `sys_visitante_sancion`
--

INSERT INTO `sys_visitante_sancion` (`VSA_COD`, `SAN_COD`, `VIS_COD`, `USU_COD`, `VSA_NOTA`, `VSA_FECHA_INI`, `VSA_FECHA_FIN`) VALUES
(1, 4, 3, 1, 'DROGAS', '2014-09-24 00:00:00', '2014-10-14'),
(2, 2, 31, 1, 'Demora en salir de la visita: 0 minutos de Exceso...', '2014-10-01 00:00:00', '2014-11-30'),
(3, 2, 32, 1, 'ASD', '2014-09-18 00:00:00', '2014-11-17'),
(4, 1, 33, 1, 'ASDF', '2014-10-02 00:00:00', NULL),
(5, 3, 34, 1, 'ASDF', '2014-10-03 00:00:00', '2014-11-02'),
(6, 1, 73, 1, 'CUALQUIER COSA', '2014-10-16 00:00:00', NULL),
(7, 2, 35, 1, 'Demora en salir de la visita: 0 minutos de Exceso...', '2014-10-16 00:00:00', '2014-12-15'),
(8, 1, 555, 1, 'DROGAS', '2014-10-24 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitas`
--

CREATE TABLE IF NOT EXISTS `sys_visitas` (
  `VISG_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Visita',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `HOR_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Horario',
  `VISG_FECHA` date NOT NULL COMMENT 'Fecha de la Visita',
  `VISG_HORA_INGRESO` time NOT NULL COMMENT 'Hora de Ingreso a la Visita',
  `VISG_HORA_SALIDA` time NOT NULL COMMENT 'Hora de Salida de la Visita',
  `VISG_TRANSCURRIDO` time NOT NULL COMMENT 'Tiempo Transcurido',
  `VISG_POSCHAR` varchar(2) NOT NULL COMMENT 'Literal de la posicion de la cedula',
  `VISG_POSNUM` int(11) NOT NULL COMMENT 'Secuencial Numerico de la Cedula',
  `VISG_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado de la Visita',
  PRIMARY KEY (`VISG_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Registro de Visitas realizadas' AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `sys_visitas`
--

INSERT INTO `sys_visitas` (`VISG_COD`, `PPL_COD`, `VIP_COD`, `HOR_COD`, `VISG_FECHA`, `VISG_HORA_INGRESO`, `VISG_HORA_SALIDA`, `VISG_TRANSCURRIDO`, `VISG_POSCHAR`, `VISG_POSNUM`, `VISG_ESTADO`) VALUES
(1, 1, 1, 3, '2014-09-22', '14:26:00', '23:59:00', '00:00:00', 'A', 1, 'T'),
(2, 1, 1, 3, '2014-09-23', '12:30:00', '14:30:00', '00:00:02', 'A', 30, 'T'),
(3, 4, 30, 4, '2014-09-29', '08:12:00', '19:30:00', '00:10:00', 'A', 1, 'T'),
(4, 4, 31, 4, '2014-10-01', '08:27:00', '19:30:00', '00:00:00', 'A', 1, 'A'),
(5, 4, 34, 4, '2014-10-16', '09:49:00', '20:30:00', '00:27:00', 'A', 1, 'T'),
(6, 4, 35, 4, '2014-10-16', '10:03:00', '20:30:00', '00:00:00', 'A', 2, 'A'),
(7, 9, 70, 4, '2014-10-16', '10:04:00', '20:30:00', '00:00:00', 'A', 3, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control1`
--
-- en uso(#1356 - View 'bulkenco_sysecure.sys_vw_control1' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

--
-- Volcar la base de datos para la tabla `sys_vw_control1`
--
-- en uso (#1356 - View 'bulkenco_sysecure.sys_vw_control1' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control2`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control2` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`HOR_COD` AS `HOR_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`bulkenco_sysecure`.`sys_visitante` `vs` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp`) join `bulkenco_sysecure`.`sys_control` `c`) join `bulkenco_sysecure`.`sys_ppl` `p`) join `bulkenco_sysecure`.`sys_centro` `ce`) join `bulkenco_sysecure`.`sys_pabellones` `pa`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`) and (`c`.`GAR_COD` = 1) and (`c`.`CON_ESTADO` = 'A'));

--
-- Volcar la base de datos para la tabla `sys_vw_control2`
--

INSERT INTO `sys_vw_control2` (`CON_COD`, `CON_ESTADO`, `VIP_COD`, `HOR_COD`, `CON_FECHA`, `GAR_COD`, `VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `PPL_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_IMG`, `PPL_ESTADO`, `CEN_COD`) VALUES
(1, 'A', 1, 3, '2014-09-24', 1, 1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', 3, '1720802394', '', '2425477', '', '', 'A', 1, NULL, 'ZZZZ', 'XXXXX', '', '', 'E', 1),
(3, 'A', 3, 3, '2014-09-24', 1, 3, 'JESSICA ESTEFANÍA', 'ARCOS GONZÁLEZ', 4, '1720090057', 'sdrrafs', '2425477', '', '', 'S', 1, NULL, 'ZZZZ', 'XXXXX', '', '', 'E', 1),
(6, 'A', 30, 4, '2014-09-29', 1, 31, 'SAMANTA SALOME', 'BERMEO CEVALLOS', 20, '1720090057', '', '0992725859', '', '', 'S', 4, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A', 1),
(9, 'A', 31, 4, '2014-10-01', 1, 32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', 11, '1720802394', '', '0992725859', '', '', 'S', 4, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A', 1),
(12, 'A', 31, 4, '2014-10-07', 1, 32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', 11, '1720802394', '', '0992725859', '', '', 'S', 4, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A', 1),
(14, 'A', 32, 4, '2014-10-07', 1, 33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', 12, '1720090057', '', '2425477', '', '', 'S', 4, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A', 1),
(16, 'A', 33, 4, '2014-10-07', 1, 34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', 4, '1720802394', '', '0992725859', '', '', 'S', 4, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A', 1),
(33, 'A', 519, 6, '2014-10-24', 1, 555, 'WILLIAN', 'ESPINOSA', 3, '1720802394', '', '', '', '', 'S', 2, NULL, 'BYRON ERNESTO', 'ARIAS CHICAIZA', '1721083663', '', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control3`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control3` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`c`.`HOR_COD` AS `HOR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`bulkenco_sysecure`.`sys_visitante` `vs` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp`) join `bulkenco_sysecure`.`sys_control` `c`) join `bulkenco_sysecure`.`sys_ppl` `p`) join `bulkenco_sysecure`.`sys_pabellones` `pa`) join `bulkenco_sysecure`.`sys_centro` `ce`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PAB_COD` = `pa`.`PAB_COD`) and (`ce`.`CEN_COD` = `pa`.`CEN_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 2) and (`c`.`CON_ESTADO` in ('O','A')) and (`vs`.`VIS_ESTADO` = 'A'));

--
-- Volcar la base de datos para la tabla `sys_vw_control3`
--

INSERT INTO `sys_vw_control3` (`CON_COD`, `CON_ESTADO`, `VIP_COD`, `CON_FECHA`, `GAR_COD`, `HOR_COD`, `VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `PPL_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_IMG`, `PPL_ESTADO`, `CEN_COD`) VALUES
(2, 'O', 1, '2014-09-24', 2, 3, 1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', 3, '1720802394', '', '2425477', '', '', 'A', 1, NULL, 'ZZZZ', 'XXXXX', '', '', 'E', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control4`
--

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control4` AS select `v`.`VISG_COD` AS `VISG_COD`,`v`.`PPL_COD` AS `PPL_COD`,`v`.`VIP_COD` AS `VIP_COD`,`v`.`HOR_COD` AS `HOR_COD`,`v`.`VISG_FECHA` AS `VISG_FECHA`,`v`.`VISG_HORA_INGRESO` AS `VISG_HORA_INGRESO`,`v`.`VISG_HORA_SALIDA` AS `VISG_HORA_SALIDA`,`v`.`VISG_TRANSCURRIDO` AS `VISG_TRANSCURRIDO`,`v`.`VISG_POSCHAR` AS `VISG_POSCHAR`,`v`.`VISG_POSNUM` AS `VISG_POSNUM`,`v`.`VISG_ESTADO` AS `VISG_ESTADO`,`vt`.`VIS_COD` AS `VIS_COD`,`vt`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vt`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`vt`.`VIS_CEDULA` AS `VIS_CEDULA`,`vt`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vt`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vt`.`VIS_CORREO` AS `VIS_CORREO`,`vt`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vt`.`VIS_ESTADO` AS `VIS_ESTADO`,`ce`.`CEN_COD` AS `CEN_COD` from (((((`bulkenco_sysecure`.`sys_visitas` `v` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp` on((`vp`.`VIP_COD` = `v`.`VIP_COD`))) join `bulkenco_sysecure`.`sys_visitante` `vt` on((`vt`.`VIS_COD` = `vp`.`VIS_COD`))) join `bulkenco_sysecure`.`sys_pabellones` `pa`) join `bulkenco_sysecure`.`sys_centro` `ce`) join `bulkenco_sysecure`.`sys_ppl` `ppl`) where ((`vt`.`VIS_ESTADO` = 'A') and (`v`.`VISG_ESTADO` = 'A') and (`vp`.`PPL_COD` = `ppl`.`PPL_COD`) and (`ppl`.`PAB_COD` = `pa`.`PAB_COD`) and (`pa`.`CEN_COD` = `ce`.`CEN_COD`));

--
-- Volcar la base de datos para la tabla `sys_vw_control4`
--

INSERT INTO `sys_vw_control4` (`VISG_COD`, `PPL_COD`, `VIP_COD`, `HOR_COD`, `VISG_FECHA`, `VISG_HORA_INGRESO`, `VISG_HORA_SALIDA`, `VISG_TRANSCURRIDO`, `VISG_POSCHAR`, `VISG_POSNUM`, `VISG_ESTADO`, `VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `CEN_COD`) VALUES
(6, 4, 35, 4, '2014-10-16', '10:03:00', '20:30:00', '00:00:00', 'A', 2, 'A', 36, 'MARÍA BERMEO', 'ALCIVAR ', 3, '1720802394', '', '2425477', '', '', 'A', 1),
(7, 9, 70, 4, '2014-10-16', '10:04:00', '20:30:00', '00:00:00', 'A', 3, 'A', 75, 'ALICIA DEL PILAR', 'CARRERA VIZUETE', 20, '1720802394', '', '3130669', '', '', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_ppl`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_ppl` AS select `p`.`PPL_COD` AS `PPL_COD`,`p`.`PAB_COD` AS `PAB_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO`,`pa`.`CEN_COD` AS `CEN_COD`,`pa`.`NVL_COD` AS `NVL_COD`,`pa`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION` from (`bulkenco_sysecure`.`sys_ppl` `p` join `bulkenco_sysecure`.`sys_pabellones` `pa`) where (`p`.`PAB_COD` = `pa`.`PAB_COD`);

--
-- Volcar la base de datos para la tabla `sys_vw_ppl`
--

INSERT INTO `sys_vw_ppl` (`PPL_COD`, `PAB_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_NACIONALIDAD`, `PPL_IMG`, `PPL_ESTADO`, `CEN_COD`, `NVL_COD`, `PAB_DESCRIPCION`) VALUES
(1, 1, NULL, 'ZZZZ', 'XXXXX', '', 'ECUATORIANA', '', 'E', 1, 2, 'A'),
(3, 1, NULL, 'HAROLLD SMITH', 'BARREZUETA TORRES', '1716718372', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(5, 1, NULL, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', '604001313', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(6, 1, NULL, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', '1307909752', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(7, 1, NULL, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', '803110071', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(8, 1, NULL, 'MIGUEL', 'CAMACHO MUÑOZ', '80245604', 'Colombiana', '', 'A', 1, 2, 'A'),
(14, 1, NULL, 'DARWIN STALIN', 'CONDOY ROSERO', '1711551174', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(16, 1, NULL, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', '1711966935', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(28, 1, NULL, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', '802225441', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(31, 1, NULL, 'JOFRE DAVID ', 'LASCANO MONTALVO', '1710443688', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(32, 1, NULL, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', '1715450456', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(33, 1, NULL, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', '1721188280', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(41, 1, NULL, 'LUIS LEONARDO', 'MANTILLA CHITO', '060414760-3', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(42, 1, NULL, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', '171757047-5', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(45, 1, NULL, 'EDUARDO ILARIO', 'MULLO UYANA', '171328476-6', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(47, 1, NULL, 'KLEVER ESTEBAN', 'PAVÓN CHALA', '171623318-2', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(49, 1, NULL, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', '171844952-1', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(54, 1, NULL, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', '050182754-7', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(56, 1, NULL, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 'O101032266', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(58, 1, NULL, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', '1710331271', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(60, 1, NULL, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', '502940406', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(62, 1, NULL, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', '112923552', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(64, 1, NULL, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', '1101046868', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(4, 2, NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(9, 2, NULL, 'GALO ALFREDO', 'CARRERA VIZUETA', '1707502355', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(27, 2, NULL, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', '1710439215', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(30, 2, NULL, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', '1719506238', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(34, 2, NULL, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', '1310007289', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(35, 2, NULL, 'DIEGO ARMANDO', 'LOOR VINUEZA', '1309691390', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(50, 2, NULL, 'LIBER MAURICIO', 'QUINTERO SUAREZ', '080234239-4', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(52, 2, NULL, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', '170635656-3', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(61, 2, NULL, 'EDISON PATRICIO', 'TRAVEZ GUAITA', '1710447119', 'Ecuatoriana', '', 'A', 1, 2, 'B'),
(11, 3, NULL, 'JOSÉ KLEVER ', 'CATOTA CAIZA', '1714128079', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(13, 3, NULL, 'LUIS GONZALO', 'CEVALLOS ROSERO', '400946372', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(22, 3, NULL, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', '502655236', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(23, 3, NULL, 'JORGE ERNESTO', 'GUANOLUISA CURICHO', '502225618', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(24, 3, NULL, 'LUIS ALFREDO', 'GUANOTASIG OÑA', '502251713', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(25, 3, NULL, 'PEDRO', 'GUZMÁN GARCÍA', '', 'R. Dominicana', '', 'A', 1, 2, 'C'),
(26, 3, NULL, 'ERWIN ESTUARDO', 'IBARRA ALAVA', '1203366289', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(29, 3, NULL, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', '1312084617', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(36, 3, NULL, 'JAIRO LEONEL', 'MAFLA ANDRADE', 'O401407838', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(37, 3, NULL, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', '1712774254', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(40, 3, NULL, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', '170473959-6', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(44, 3, NULL, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', '050166588-9', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(51, 3, NULL, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', '092692733-6', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(55, 3, NULL, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', '1802278463', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(57, 3, NULL, 'LUIS ROBERTO', 'SOCASI AGUIRRE', '1709894941', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(59, 3, NULL, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', '1723174973', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(63, 3, NULL, 'LEONARDO RAFAEL', 'URBINA VIVANCO', '1804315875', 'Ecuatoriana', '', 'A', 1, 2, 'C'),
(10, 4, NULL, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', '502313612', 'Ecuatoriana', '', 'A', 1, 2, 'D'),
(12, 4, NULL, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', '1603603580', 'Ecuatoriana', '', 'A', 1, 2, 'D'),
(20, 4, NULL, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', '1203601586', 'Ecuatoriana', '', 'A', 1, 2, 'D'),
(2, 5, NULL, 'BYRON ERNESTO', 'ARIAS CHICAIZA', '1721083663', 'ECUATORIANA', '', 'A', 1, 2, 'OBSERVACION'),
(15, 5, NULL, 'NELSON', 'CUEVA CALDERÓN', '1103914311', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(17, 5, NULL, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', '1717757262', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(18, 5, NULL, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', '1714757521', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(19, 5, NULL, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', '1707441737', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(21, 5, NULL, 'JUAN FRANCISCO', 'GUEVARA PICO', '1713413530', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(38, 5, NULL, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', '171461538-0', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(39, 5, NULL, 'MANUEL ENRIQUE', 'MALLIQUINGA CATAGÑA', '171765854-4', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(43, 5, NULL, 'EDISON FERNANDO', 'MINANGO CONSTANTE', '170798579-0', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(46, 5, NULL, 'PATRICIO JAVIER', 'NAVAS VENEGAS', '050283379-1', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(48, 5, NULL, 'CARLOS CESAR', 'PÉREZ TREJO', '080187832-3', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(53, 5, NULL, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', '171606829-9', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(67, 1, NULL, 'DOUGLAS AUGUSTO', 'YÉPEZ MOGRO', '501827109', 'Ecuatoriana', '', 'A', 1, 2, 'A'),
(70, 1, 1, 'QQQQQQQ', 'WWWWWWWWWW', '', '', '', 'E', 1, 2, 'A'),
(71, 1, 1, 'BBBBBB', 'NNNNNN', '', '', '', 'E', 1, 2, 'A'),
(68, 2, 0, '213', '123', '', '', '', 'E', 1, 2, 'B'),
(65, 5, NULL, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', '917452427', 'Ecuatoriana', '', 'A', 1, 2, 'OBSERVACION'),
(66, 5, NULL, 'DENNIS LEE', 'WALLING', '431146631', 'Estadounidense', '', 'A', 1, 2, 'OBSERVACION'),
(72, 6, 0, 'BLASCO EDWIN', 'ARCOS PEPINOS', '1720090057', 'ECUATORIANAS', '', 'A', 3, 2, 'NORTE-A'),
(73, 6, 0, 'SCARLET NAHOMI', 'ARCOS GONZÁLEZ', '', '', '', 'A', 3, 2, 'NORTE-A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_sanciones`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_sanciones` AS select `v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vp`.`PAR_COD` AS `PAR_COD`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`vs`.`VSA_COD` AS `VSA_COD`,`vs`.`SAN_COD` AS `SAN_COD`,`vs`.`USU_COD` AS `USU_COD`,`vs`.`VSA_NOTA` AS `VSA_NOTA`,`vs`.`VSA_FECHA_INI` AS `VSA_FECHA_INI`,`vs`.`VSA_FECHA_FIN` AS `VSA_FECHA_FIN`,`s`.`TPS_COD` AS `TPS_COD`,`s`.`SAN_DESCRIPCION` AS `SAN_DESCRIPCION`,`s`.`SAN_TIEMPO` AS `SAN_TIEMPO`,`s`.`SAN_TIEMPO_DES` AS `SAN_TIEMPO_DES`,`ts`.`TPS_DESCRIPCION` AS `TPS_DESCRIPCION` from ((((`bulkenco_sysecure`.`sys_visitante_sancion` `vs` join `bulkenco_sysecure`.`sys_visitante` `v`) join `bulkenco_sysecure`.`sys_visitante_ppl` `vp`) join `bulkenco_sysecure`.`sys_tipo_sancion` `ts`) join `bulkenco_sysecure`.`sys_sanciones` `s`) where ((`v`.`VIS_COD` = `vs`.`VIS_COD`) and (`v`.`VIS_COD` = `vp`.`VIS_COD`) and (`ts`.`TPS_COD` = `s`.`TPS_COD`) and (`vs`.`SAN_COD` = `s`.`SAN_COD`) and (`v`.`VIS_ESTADO` = 'S') and (`vs`.`SAN_COD` = 1));

--
-- Volcar la base de datos para la tabla `sys_vw_sanciones`
--

INSERT INTO `sys_vw_sanciones` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `VSA_COD`, `SAN_COD`, `USU_COD`, `VSA_NOTA`, `VSA_FECHA_INI`, `VSA_FECHA_FIN`, `TPS_COD`, `SAN_DESCRIPCION`, `SAN_TIEMPO`, `SAN_TIEMPO_DES`, `TPS_DESCRIPCION`) VALUES
(33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', 12, '1720090057', '', '2425477', '', '', 'S', 4, 1, 1, 'ASDF', '2014-10-02 00:00:00', NULL, 1, 'no definido', 0, '', 'no definido'),
(73, 'MARCO RAMIRO', 'VIZUETE SANTACRUZ', 2, '1720090057', '', '3130669', '', '', 'S', 6, 1, 1, 'CUALQUIER COSA', '2014-10-16 00:00:00', NULL, 1, 'no definido', 0, '', 'no definido'),
(555, 'WILLIAN', 'ESPINOSA', 3, '1720802394', '', '', '', '', 'S', 8, 1, 1, 'DROGAS', '2014-10-24 00:00:00', NULL, 1, 'no definido', 0, '', 'no definido'),
(555, 'WILLIAN', 'ESPINOSA', 21, '1720802394', '', '', '', '', 'S', 8, 1, 1, 'DROGAS', '2014-10-24 00:00:00', NULL, 1, 'no definido', 0, '', 'no definido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_visitante`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_visitante` AS select `vp`.`VIP_COD` AS `VIP_COD`,`vp`.`PPL_COD` AS `PPL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PAB_COD` AS `PAB_COD`,`pab`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`PPL_NACIONALIDAD` AS `PPL_NACIONALIDAD`,`p`.`PPL_IMG` AS `PPL_IMG`,`vp`.`PAR_COD` AS `PAR_COD`,`par`.`PAR_DESCRIPCION` AS `PAR_DESCRIPCION`,`v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`pab`.`CEN_COD` AS `CEN_COD` from ((((`bulkenco_sysecure`.`sys_visitante` `v` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp` on((`v`.`VIS_COD` = `vp`.`VIS_COD`))) join `bulkenco_sysecure`.`sys_ppl` `p` on((`p`.`PPL_COD` = `vp`.`PPL_COD`))) join `bulkenco_sysecure`.`sys_parentesco` `par` on((`par`.`PAR_COD` = `vp`.`PAR_COD`))) join `bulkenco_sysecure`.`sys_pabellones` `pab` on((`pab`.`PAB_COD` = `p`.`PAB_COD`))) where (`v`.`VIS_ESTADO` <> 'E');

--
-- Volcar la base de datos para la tabla `sys_vw_visitante`
--

INSERT INTO `sys_vw_visitante` (`VIP_COD`, `PPL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PAB_COD`, `PAB_DESCRIPCION`, `PPL_NACIONALIDAD`, `PPL_IMG`, `PAR_COD`, `PAR_DESCRIPCION`, `VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `CEN_COD`) VALUES
(1, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 3, 'HIJA/O', 1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', '1720802394', '', '2425477', '', '', 'A', 1),
(2, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 3, 'HIJA/O', 2, 'RAMIRO XAVIER', 'ARCOS GONZÁLEZ', '1720802396', '', '2425477', '', '', 'A', 1),
(3, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 4, 'ABUELA/O', 3, 'JESSICA ESTEFANÍA', 'ARCOS GONZÁLEZ', '1720090057', 'sdrrafs', '2425477', '', '', 'S', 1),
(4, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 19, 'NOVIA/O', 4, 'RENÉ ALFREDO', 'ARCOS PEPINOS', '1720802395', '', '', '', '', 'N', 1),
(5, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 19, 'NOVIA/O', 5, 'BLASCO EDWIN', 'ARCOS PEPINOS', '1720090057', '', '', '', '', 'A', 1),
(6, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 6, 'TÍA/O', 6, 'MATÍAS ARCOS', 'PANAMÁ ', '1720802394', '', '2425477', '', '', 'A', 1),
(7, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 6, 'TÍA/O', 7, 'SEBASTIÁN ARCOS', 'PANAMÁ ', '', '', '2425477', '', '', 'N', 1),
(8, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 10, 'YERNO', 8, 'CRISTIAN ANÍBAL', 'AROS PEPINOS', '', '', '2425477', '', '', 'N', 1),
(9, 1, 'ZZZZ', 'XXXXX', 1, 'A', 'ECUATORIANA', '', 21, 'U.LIBRE', 9, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N', 1),
(19, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 20, 'ALBY DEL', 'CARMEN BARRAZUETA', '', '', '2964764', '', '', 'N', 1),
(20, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 8, 'SOBRINA/O', 21, 'HENRY PAUL', 'BARRAZUETA ', '', '', '2964764', '', '', 'N', 1),
(21, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 22, 'ROCÍO DEL', 'CISNE BARRAZUETA', '', '', '', '', '', 'N', 1),
(22, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 8, 'SOBRINA/O', 23, 'MARCO FERNANDO', 'GAVILANES ', '', '', '2637640', '', '', 'N', 1),
(23, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 9, 'CUÑADA/O', 24, 'CATALINA DEL', 'ROCÍO GAVILANES', '', '', '2964764', '', '', 'N', 1),
(24, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 7, 'PRIMA/O', 25, 'MARCO ALFARO', 'GAVILANES ', '', '', '2964764', '', '', 'N', 1),
(25, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 7, 'PRIMA/O', 26, 'JHON FRANCISCO', 'BARRAZUETA ', '', '', 'O999688876', '', '', 'N', 1),
(26, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 27, 'MIRIAM ALEXANDRA', 'BARRAZUETA ', '', '', '', '', '', 'N', 1),
(27, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 9, 'CUÑADA/O', 28, 'CRISTIAN PAUL', 'CALLE BARRAZUETA', '', '', '', '', '', 'N', 1),
(28, 3, 'HAROLLD SMITH', 'BARREZUETA TORRES', 1, 'A', 'Ecuatoriana', '', 25, 'UNIÓN DE HECHO', 29, 'MAYITA GABRIELA', 'SALAS ', '', '', '', '', '', 'N', 1),
(38, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 40, 'MARÍA ALEJANDRA', 'COBO MEDINA', '', '', '32964310', '', '', 'N', 1),
(39, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 41, 'CAMILA ALEJANDRA', 'BONIFAZ COBO', '', '', '32964310', '', '', 'N', 1),
(40, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 42, 'JOSÉ LUIS', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N', 1),
(41, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 43, 'CRISTÓBAL BONIFAZ', 'BONIFAZ ', '', '', '32928060', '', '', 'N', 1),
(42, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 44, 'VERÓNICA LIZBETH', 'BONIFAZ BONIFAZ', '', '', '32928060', '', '', 'N', 1),
(43, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 45, 'LUIS CRISTÓBAL', 'BONIFAZ YAMBAY', '', '', '32928060', '', '', 'N', 1),
(44, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 24, 'CONVIVIENTE', 46, 'LUZ MARÍA', 'YAMBAY ORDEN', '', '', '32928060', '', '', 'N', 1),
(45, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 47, 'TERESA DE JESÚS', 'YAMBAY BONIFAZ', '', '', '32953632', '', '', 'N', 1),
(46, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 26, 'PADRASTRO', 48, 'MARÍA GABRIELA', 'VERGARA PANCHO', '', '', '', '', '', 'N', 1),
(47, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 7, 'PRIMA/O', 50, 'CARLOS ENRIQUE', 'BOLAÑOS LEÓN', '', '', '', '', '', 'N', 1),
(48, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 51, 'FRED ADRIAN', 'ARTEAGA GÓMEZ', '', '', '', '', '', 'N', 1),
(49, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 52, 'MIGUEL EMILIO', 'MORALES CASTRO', '', '', '42821853', '', '', 'N', 1),
(50, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 53, 'MARÍA JOSÉ', 'MAFLA ANDRADE', '', '', 'O987947094', '', '', 'N', 1),
(51, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 54, 'MARÍA ELISA', 'MAFLA ANDRADE', '', '', '', '', '', 'N', 1),
(52, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 55, 'SERGIO RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N', 1),
(29, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 15, 'HERMANA/O', 30, 'ARACELY REGINA', 'FARIAS FERNÁNDEZ', '', '', '', '', '', 'N', 1),
(30, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 31, 'SAMANTA SALOME', 'BERMEO CEVALLOS', '1720090057', '', '0992725859', '', '', 'S', 1),
(31, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 11, 'NUERA', 32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', '1720802394', '', '0992725859', '', '', 'S', 1),
(32, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 12, 'ESPOSA/O', 33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', '1720090057', '', '2425477', '', '', 'S', 1),
(33, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 4, 'ABUELA/O', 34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '1720802394', '', '0992725859', '', '', 'S', 1),
(34, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 35, 'JOSÉ BERMEO', 'ALCIVAR ', '1720802394', '', '0992725859', '', '', 'S', 1),
(35, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 36, 'MARÍA BERMEO', 'ALCIVAR ', '1720802394', '', '2425477', '', '', 'A', 1),
(36, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 11, 'NUERA', 37, 'PATRICIA FARÍAS', 'FERNÁNDEZ ', '1720802394', '', '', '', '', 'N', 1),
(37, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 11, 'NUERA', 38, 'DANIELA FARÍAS', 'FERNÁNDEZ ', '', '', '', '', '', 'N', 1),
(10, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 3, 'HIJA/O', 10, 'BYRON ROBERTO', 'ARIAS MORALES', '', '', '2778736', '', '', 'N', 1),
(11, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 4, 'ABUELA/O', 11, 'BRENDA GABRIELA', 'ARIAS MORALES', '', '', '2778736', '', '', 'N', 1),
(12, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 2, 'MADRE', 12, 'LUPE EDELINA', 'CHICAIZA VARGAS', '', '', '2777395', '', '', 'N', 1),
(13, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 1, 'PADRE', 13, 'MARIO ERNESTO', 'ARIAS CABRERA', '', '', '2777395', '', '', 'N', 1),
(14, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 19, 'NOVIA/O', 14, 'MARIO ROLANDO', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N', 1),
(15, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 19, 'NOVIA/O', 15, 'BERNARDO ISRAEL', 'ARIAS CHICAIZA', '', '', '2777395', '', '', 'N', 1),
(18, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 21, 'U.LIBRE', 9, 'CRISTIAN PAUL', 'CALLE BARREZUETA', '', '', '', '', '', 'N', 1),
(53, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 56, 'HÉCTOR RICARDO', 'BOWEN BOLAÑOS', '', '', '', '', '', 'N', 1),
(54, 7, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 57, 'VINUEZA ELSA', 'CECILIA ', '', '', 'O994960909', '', '', 'N', 1),
(55, 7, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 58, 'CAGUA VINUEZA', 'RUTH NOEMI', '', '', 'O991262192', '', '', 'N', 1),
(56, 7, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 59, 'MUÑOZ BONE', 'MARCO ANTONIO', '', '', 'O62700626', '', '', 'N', 1),
(57, 7, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 60, 'PARRA VARGAS', 'ROBERTO FERNANDO', '', '', '', '', '', 'N', 1),
(58, 7, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', '1720802394', '', '0992725859', '', '', 'S', 1),
(59, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 22, 'SOBRINA/O M.E.', 63, 'REYES NORMA', 'RITA ', '', '', 'O990477166', '', '', 'N', 1),
(60, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 21, 'U.LIBRE', 64, 'ALBORNOZ JOSÉ', 'LUIS ', '', '', 'O984246121', '', '', 'N', 1),
(61, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 22, 'SOBRINA/O M.E.', 65, 'CASTAÑO VIVIANA', 'MARÍA ', '', '', 'O983893387', '', '', 'N', 1),
(62, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 21, 'U.LIBRE', 66, 'ALBORNOZ CASTAÑO', 'BRYAN ALEXIS', '', '', 'O984205669', '', '', 'N', 1),
(63, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 22, 'SOBRINA/O M.E.', 67, 'JÁCOME DANIELA', ' ', '', '', 'O984205669', '', '', 'N', 1),
(64, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 22, 'SOBRINA/O M.E.', 68, 'ALBORNOZ LUISA', 'MARÍA ', '', '', '', '', '', 'N', 1),
(65, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 22, 'SOBRINA/O M.E.', 69, 'ALBORNOZ DANA', 'GISEL ', '', '', 'O983199712', '', '', 'N', 1),
(66, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 21, 'U.LIBRE', 70, 'BELTRAN ANDRÉS', ' ', '', '', 'O983199712', '', '', 'N', 1),
(67, 8, 'MIGUEL', 'CAMACHO MUÑOZ', 1, 'A', 'Colombiana', '', 25, 'UNIÓN DE HECHO', 71, 'DÁVILA REYES', 'MIRIAM EUGENIA', '', '', 'O999187184', '', '', 'N', 1),
(68, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 73, 'MARCO RAMIRO', 'VIZUETE SANTACRUZ', '1720090057', '', '3130669', '', '', 'S', 1),
(69, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 15, 'HERMANA/O', 74, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', '', '', '2562025', '', '', 'N', 1),
(70, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 75, 'ALICIA DEL PILAR', 'CARRERA VIZUETE', '1720802394', '', '3130669', '', '', 'A', 1),
(71, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 76, 'MÓNICA DEL ROCÍO', 'VIZUETE REVELO', '', '', '', '', '', 'N', 1),
(72, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 77, 'ANDRÉS FELIPE', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 1),
(73, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 78, 'LUIS SEBASTIÁN', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 1),
(74, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 79, 'GALO MATEO', 'CARRERA VINUEZA', '', '', '2562025', '', '', 'N', 1),
(75, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 21, 'U.LIBRE', 80, 'BYRON EDUARDO', 'VITERI ESTEVEZ', '', '', 'O999035799', '', '', 'N', 1),
(76, 9, 'GALO ALFREDO', 'CARRERA VIZUETA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 81, 'ROSA ELENA', 'CARRERA VIZUETE', '', '', '3130669', '', '', 'N', 1),
(86, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 93, 'CAIZA QUERO', 'ROSA MERCEDES', '', '', '2407067', '', '', 'N', 1),
(87, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 94, 'CATOTA TIPANLUISA', 'JOSÉ HILARIO', '', '', '2407067', '', '', 'N', 1),
(88, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 95, 'CAIZA QUERO', 'MARÍA LUISA', '', '', '2811779', '', '', 'N', 1),
(89, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 96, 'CAIZA QUERO', 'HILDA MARÍA', '', '', '2811779', '', '', 'N', 1),
(90, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 97, 'CATOTA CAIZA', 'MARIA CECILIA', '', '', '2407067', '', '', 'N', 1),
(91, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 98, 'CATOTA ACHIG', 'GIOVANNI JAIR', '', '', '3121515', '', '', 'N', 1),
(92, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 99, 'CATOTA ACHIG', 'GEOMEL ALEXANDER', '', '', '3121515', '', '', 'N', 1),
(93, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 100, 'CATOTA ACHIG', 'EDIOSN ALDAIR', '', '', '3121515', '', '', 'N', 1),
(94, 11, 'JOSÉ KLEVER ', 'CATOTA CAIZA', 3, 'C', 'Ecuatoriana', '', 9, 'CUÑADA/O', 101, 'CAIZA GUACHAMIN', 'MARIA FERNANDA', '', '', '', '', '', 'N', 1),
(77, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 83, 'RICARDO ALBERTO', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 1),
(78, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 84, 'RICARDO DAMIÁN', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 1),
(79, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 85, 'RICARDO RAFAEL', 'CARVAJAL HERNÁNDEZ', '', '', 'O987391139', '', '', 'N', 1),
(80, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 1, 'PADRE', 86, 'RICARDO AUGUSTO', 'CARVAJAL ', '', '', 'O995253019', '', '', 'N', 1),
(81, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 2, 'MADRE', 87, 'HILDA MARINA', 'CASTILLO SEMBLANTES', '', '', 'O995270904', '', '', 'N', 1),
(82, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 19, 'NOVIA/O', 88, 'CESAR AUGUSTO', 'CARVAJAL CASTILLO', '', '', 'O999025296', '', '', 'N', 1),
(83, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 19, 'NOVIA/O', 89, 'CRISTIAN FERNANDO', 'CARVAJAL CASTILLO', '', '', 'O987742427', '', '', 'N', 1),
(84, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 20, 'SUEGRA/O', 90, 'JESSICA PAULINA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N', 1),
(85, 10, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', 4, 'D', 'Ecuatoriana', '', 20, 'SUEGRA/O', 91, 'VERÓNICA LORENA', 'CARVAJAL CASTILLO', '', '', '', '', '', 'N', 1),
(95, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 4, 'ABUELA/O', 104, 'CEPEDA PAGUAY', 'LIZBETHESTEFANIA ', '', '', '32951568', '', '', 'N', 1),
(96, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 105, 'CEPEDA PAGUAY', 'ANDRÉS ALEJANDRO', '', '', '32951568', '', '', 'N', 1),
(97, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 106, 'CEPEDA PAGUAY', 'DIEGO FERNANDO', '', '', '32951568', '', '', 'N', 1),
(98, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 1, 'PADRE', 107, 'CEPEDA SOLÍS', 'JOSÉ ENRIQUE', '', '', 'O995452589', '', '', 'N', 1),
(99, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 2, 'MADRE', 108, 'ARÉVALO ANDRADE', 'ANA GRACIELA', '', '', 'O995452589', '', '', 'N', 1),
(100, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 20, 'SUEGRA/O', 109, 'CEPEDA ARÉVALO', 'JHOANA GABRIELA', '', '', 'O998489826', '', '', 'N', 1),
(101, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 19, 'NOVIA/O', 110, 'CEPEDA AREVALO', 'MARCELO RODRIGO', '', '', 'O987616282', '', '', 'N', 1),
(102, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 19, 'NOVIA/O', 111, 'CEPEDA AREVALO', 'JAVIER ENRIQUE', '', '', 'O995497923', '', '', 'N', 1),
(113, 14, 'DARWIN STALIN', 'CONDOY ROSERO', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 124, 'MARÍA GRACIELA', 'VIZCAINO ', '', '', '2748058', '', '', 'N', 1),
(114, 14, 'DARWIN STALIN', 'CONDOY ROSERO', 1, 'A', 'Ecuatoriana', '', 18, 'EX PAREJA', 125, 'DARWIN JOEL', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N', 1),
(115, 14, 'DARWIN STALIN', 'CONDOY ROSERO', 1, 'A', 'Ecuatoriana', '', 18, 'EX PAREJA', 126, 'CLARIBEL NIKYTA', 'CONDOY JIMÉNEZ', '', '', '2748058', '', '', 'N', 1),
(116, 14, 'DARWIN STALIN', 'CONDOY ROSERO', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 127, 'HOMERO DANIEL', 'CONDOY VIZACAINO', '', '', '2748058', '', '', 'N', 1),
(117, 14, 'DARWIN STALIN', 'CONDOY ROSERO', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 128, 'CARLOS HOMERO', 'CONDOY ROSERO', '', '', '2748058', '', '', 'N', 1),
(127, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 138, 'ANA CRISTINA', 'VIVANCO DÍAZ', '', '', '', '', '', 'N', 1),
(128, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 139, 'MARÍA BELÉN', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 1),
(129, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 140, 'VÍCTOR ALEXIS', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 1),
(130, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 141, 'ISABEL CAROLINA', 'ENRÍQUEZ DÍAZ', '', '', '', '', '', 'N', 1),
(131, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 142, 'VÍCTOR ANTONIO', 'ENRÍQUEZ ', '', '', '2960154', '', '', 'N', 1),
(132, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 143, 'ROSA ELENA', 'ENRÍQUEZ CABRERA', '', '', '', '', '', 'N', 1),
(133, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 8, 'SOBRINA/O', 144, 'JULIO CABRERA', 'LOAIZA ', '', '', '', '', '', 'N', 1),
(134, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 9, 'CUÑADA/O', 145, 'MARÍA DEL CARMEN', 'CABRERA LOAIZA', '', '', '', '', '', 'N', 1),
(135, 16, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 146, 'DEISY AMELIA', 'DÍAZ DÍAZ', '', '', '', '', '', 'N', 1),
(104, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 113, 'JAQUELINE BONAFONT', ' ', '', '', '42214269', '', '', 'N', 1),
(105, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 115, 'IVÁN CEVALLOS', ' ', '', '', '', '', '', 'N', 1),
(106, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 116, 'RITA CEVALLOS', ' ', '', '', '', '', '', 'N', 1),
(107, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 117, 'ROSARIO RUEDA', ' ', '', '', '', '', '', 'N', 1),
(108, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 118, 'VERÓNICA ROSERO', ' ', '', '', '', '', '', 'N', 1),
(109, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 119, 'CRISTINA SAAVEDRA', ' ', '', '', '', '', '', 'N', 1),
(110, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 120, 'JIMENA SAAVEDRA', ' ', '', '', '', '', '', 'N', 1),
(111, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 121, 'LIYEN CEVALLOS', ' ', '', '', '', '', '', 'N', 1),
(112, 13, 'LUIS GONZALO', 'CEVALLOS ROSERO', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 122, 'LIZ CEVALLOS', ' ', '', '', '', '', '', 'N', 1),
(103, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 112, 'MANZANO RUÍZ', 'MARY PATRICIA', '', '', 'O993768671', '', '', 'N', 1),
(118, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 129, 'ZARA PÉREZ', ' ', '', '', '3050162', '', '', 'N', 1),
(119, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 130, 'EMILI CUEVA', ' ', '', '', '', '', '', 'N', 1),
(120, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 131, 'MATÍAS SEBASTIÁN', 'CUEVA ', '', '', '', '', '', 'N', 1),
(121, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 132, 'JEREMY CUEVA', ' ', '', '', '', '', '', 'N', 1),
(122, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 133, 'NORMA CUEVA', ' ', '', '', '', '', '', 'N', 1),
(123, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 12, 'ESPOSA/O', 134, 'PEDRO SÁNCHEZ', ' ', '', '', '', '', '', 'N', 1),
(124, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 135, 'PATRICIA PÉREZ', ' ', '', '', '', '', '', 'N', 1),
(125, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 8, 'SOBRINA/O', 136, 'MILTON TORRES', ' ', '', '', '', '', '', 'N', 1),
(126, 15, 'NELSON', 'CUEVA CALDERÓN', 5, 'OBSERVACION', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 137, 'ROSA PÉREZ', ' ', '', '', '', '', '', 'N', 1),
(136, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 147, 'JESICA CAÑIZARES', ' ', '', '', '2732294', '', '', 'N', 1),
(137, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 148, 'CESAR DOMÍNGUEZ', ' ', '', '', '2620271', '', '', 'N', 1),
(138, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 149, 'NORIS CEVALLOS', ' ', '', '', '2620271', '', '', 'N', 1),
(141, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 152, 'JOHANA CAÑIZARES', ' ', '', '', '', '', '', 'N', 1),
(142, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 7, 'PRIMA/O', 153, 'NERBO VERDESOTO', ' ', '', '', '', '', '', 'N', 1),
(143, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 154, 'PILAR REAL', ' ', '', '', '', '', '', 'N', 1),
(144, 17, 'NELSON IVÁN', 'DOMÍNGUEZ CEVALLOS', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 155, 'MILENA DOMÍNGUEZ', ' ', '', '', '', '', '', 'N', 1),
(145, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 157, 'CINTHIA ALEJANDRA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 1),
(146, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 158, 'MAYERLI MICAELA', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 1),
(147, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 159, 'SARAY NICOLL', 'FAJARDO MOROCHO', '', '', '', '', '', 'N', 1),
(148, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 160, 'JOSÉ ARCESIO', 'FAJARDO ', '', '', 'O997299977', '', '', 'N', 1),
(149, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 161, 'LUCIA BEATRIZ', 'GAVIDIA ESTRELLA', '', '', 'O997299977', '', '', 'N', 1),
(152, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 164, 'MARIANA GAVIDIA', 'ESTRELLA ', '', '', 'O997299977', '', '', 'N', 1),
(153, 18, 'FRANK ALEJANDRO', 'FAJARDO GAVIDIA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 165, 'DIANA SORAYA', 'FAJARDO GAVIDIA', '', '', 'O997299977', '', '', 'N', 1),
(154, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 166, 'MARCIA ROBALINO', ' ', '', '', '', '', '', 'N', 1),
(155, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 167, 'ZULEMA MANTILLA', ' ', '', '', '', '', '', 'N', 1),
(156, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 168, 'ADELA FIGUEROA', ' ', '', '', '', '', '', 'N', 1),
(206, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 222, 'ATILIO INTRIAGO', 'CARRANZA ', '', '', '', '', '', 'N', 1),
(207, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 223, 'CARLOS CEVALLOS', 'ESTRADA ', '', '', '', '', '', 'N', 1),
(208, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 224, 'STEVEN INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 1),
(209, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 225, 'ARIEL INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 1),
(210, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 226, 'MATÍAS INTRIAGO', 'ORTIZ ', '', '', '', '', '', 'N', 1),
(212, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 228, 'WASHINGTON PULECIO', 'MELGAR ', '', '', '', '', '', 'N', 1),
(214, 28, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 230, 'NESTOR LENIN', 'MONTAÑO VALENCIA', '', '', '', '', '', 'N', 1),
(198, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 15, 'HERMANA/O', 214, 'SANDRA JANETH', 'LUCERO SÁNCHEZ', '', '', '3020554', '', '', 'N', 1),
(199, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 4, 'ABUELA/O', 215, 'ANDREA ESTEFANIA', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N', 1),
(200, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 4, 'ABUELA/O', 216, 'JAIDI ANALIE', 'IÑIGUEZ LUCERO', '', '', '3020554', '', '', 'N', 1),
(201, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 217, 'MARÍA TERESA', 'TUFIÑO ', '', '', '2630445', '', '', 'N', 1),
(202, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 1, 'PADRE', 218, 'HUGO ISMAEL', 'IÑIGUEZ LUZURIAGA', '', '', '2630445', '', '', 'N', 1),
(205, 27, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 221, 'NANCY SAENZ', 'TUFIÑO ', '', '', '', '', '', 'N', 1),
(180, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 194, 'SEGUNDO AURELIO', 'GUAMÁN ', '', '', '', '', '', 'N', 1),
(181, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 195, 'MARÍA CONCEPCIÓN', 'SIMALUISA COPARA', '', '', '', '', '', 'N', 1),
(182, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 196, 'MIRYAN ESTHER', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 1),
(183, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 197, 'MARÍA ORFELINA', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 1),
(185, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 199, 'EDWIN HIPOLITO', 'GUAMÁN SIMALUISA', '', '', '', '', '', 'N', 1),
(186, 22, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 200, 'JENNY IZA', ' ', '', '', '', '', '', 'N', 1),
(188, 23, 'JORGE ERNESTO', 'GUANOLUISA CURICHO', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 203, 'JOSÉ HERIBERTO', 'GUANOLUISA TIPAN', '', '', '', '', '', 'N', 1),
(193, 24, 'LUIS ALFREDO', 'GUANOTASIG OÑA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 209, 'MILTON EDUARDO', 'GUANOTASIG OÑA', '', '', '', '', '', 'N', 1),
(194, 24, 'LUIS ALFREDO', 'GUANOTASIG OÑA', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 210, 'CRISTINA SIMBAÑA', ' ', '', '', '', '', '', 'N', 1),
(195, 24, 'LUIS ALFREDO', 'GUANOTASIG OÑA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 211, 'ELVIA YOLANDA', 'GUANOTASIG OÑA', '', '', '', '', '', 'N', 1),
(196, 24, 'LUIS ALFREDO', 'GUANOTASIG OÑA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 212, 'VICENTE AGUSTIN', 'GUANOTASIG PILLIZA', '', '', '', '', '', 'N', 1),
(197, 24, 'LUIS ALFREDO', 'GUANOTASIG OÑA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 213, 'ZOILA OÑA', 'PILLIZA ', '', '', '', '', '', 'N', 1),
(215, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 231, 'LORGIO INTRIAGO', 'PINARGOTE ', '', '', '', '', '', 'N', 1),
(216, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 232, 'DENNY GARCÍA', 'DELGADO ', '', '', 'O988814990', '', '', 'N', 1),
(217, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 233, 'JONATHAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N', 1),
(218, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 234, 'ANYERLI INTRIAGO', 'SÁNCHEZ ', '', '', '', '', '', 'N', 1),
(219, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 235, 'ADRIAN INTRIAGO', 'GARCÍA ', '', '', '', '', '', 'N', 1),
(163, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 1, 'PADRE', 176, 'ADOLFO FRUTO', 'VERGARA ', '', '', '', '', '', 'N', 1),
(164, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 2, 'MADRE', 177, 'MARGARITA MÁRQUEZ', 'FERNÁNDEZ ', '', '', '', '', '', 'N', 1),
(165, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 20, 'SUEGRA/O', 178, 'DIANA FRUTO', 'MÁRQUEZ ', '', '', '', '', '', 'N', 1),
(166, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 18, 'EX PAREJA', 179, 'ANTONY FRUTO', 'MORA ', '', '', '', '', '', 'N', 1),
(167, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 21, 'U.LIBRE', 180, 'ALEX GÓMEZ', 'PONCE ', '', '', '', '', '', 'N', 1),
(168, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 181, 'MAGALY DEL', 'ROCÍO PEÑA', '', '', '', '', '', 'N', 1),
(169, 20, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', 4, 'D', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 182, 'ALEJANDRA CORONEL', 'MONTALVO ', '', '', '', '', '', 'N', 1),
(157, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 169, 'CARLA FIGUEROA', ' ', '', '', '', '', '', 'N', 1),
(158, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 21, 'U.LIBRE', 170, 'NEPALÍ MARTÍNEZ', ' ', '', '', '', '', '', 'N', 1),
(159, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 21, 'U.LIBRE', 171, 'GUILLERMO BARRAGÁN', ' ', '', '', '', '', '', 'N', 1),
(160, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 21, 'U.LIBRE', 172, 'MANUEL ÁLVAREZ', ' ', '', '', '', '', '', 'N', 1),
(161, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 173, 'MARCET GUAMÁN', ' ', '', '', '', '', '', 'N', 1),
(162, 19, 'CARLOS EDUARDO', 'FIGUEROA FIGUEROA', 5, 'OBSERVACION', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 174, 'ROCIO ARCE', ' ', '', '', '', '', '', 'N', 1),
(170, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 183, 'MARILYN ERAZO', ' ', '', '', '', '', '', 'N', 1),
(171, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 184, 'FELIX GUEVARA', ' ', '', '', '', '', '', 'N', 1),
(172, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 19, 'NOVIA/O', 185, 'CARLOS GUEVARA', ' ', '', '', '', '', '', 'N', 1),
(173, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 186, 'JUAN DIEGO', 'GUEVARA ', '', '', '', '', '', 'N', 1),
(176, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 12, 'ESPOSA/O', 189, 'ANDRÉS ERAZO', ' ', '', '', '', '', '', 'N', 1),
(177, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 9, 'CUÑADA/O', 190, 'DARWIN GUEVARA', ' ', '', '', '', '', '', 'N', 1),
(178, 21, 'JUAN FRANCISCO', 'GUEVARA PICO', 5, 'OBSERVACION', 'Ecuatoriana', '', 21, 'U.LIBRE', 191, 'FREDY GUEVARA', ' ', '', '', '', '', '', 'N', 1),
(230, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 27, 'MADRASTRA', 246, 'SANDRA AULESTIA', 'ACURIO ', '', '', 'O998884336', '', '', 'N', 1),
(231, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 247, 'BEATRIZ MONTALVO', 'SALAZAR ', '', '', '3163351', '', '', 'N', 1),
(232, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 248, 'LEONIDAS LASCANO', 'MALES ', '', '', 'NO SABE', '', '', 'N', 1),
(233, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 249, 'ISAAC LASCANO', 'CERÓN ', '', '', '', '', '', 'N', 1),
(234, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 250, 'ALISSON LASCANO', 'CERÓN ', '', '', '', '', '', 'N', 1),
(235, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 251, 'MARIANA LASCANO', 'MALES ', '', '', '', '', '', 'N', 1),
(236, 31, 'JOFRE DAVID ', 'LASCANO MONTALVO', 1, 'A', 'Ecuatoriana', '', 7, 'PRIMA/O', 252, 'CARLOS CALLE', 'CABEZAS ', '', '', '', '', '', 'N', 1),
(237, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 254, 'MAYTE SUSANA', 'LASO APOLO', '', '', '2639858', '', '', 'N', 1),
(238, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 255, 'PIEDAD SUSANA', 'LASO ALMEIDA', '', '', '2634763', '', '', 'N', 1),
(239, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 256, 'CRISTIAN DANIEL', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 1),
(240, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 257, 'YESENIA XIMENA', 'TOMALO LASO', '', '', '2639858', '', '', 'N', 1),
(241, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 258, 'LUIS PATRICIO', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 1),
(242, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 259, 'MARTHA YOLANDA', 'LASO ALMEIDA', '', '', '2639858', '', '', 'N', 1),
(243, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 260, 'SEGUNDO EFRAIN', 'ALMEIDA ', '', '', '2639858', '', '', 'N', 1),
(244, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 261, 'LUZMILA ALMEIDA', ' ', '', '', '2910382', '', '', 'N', 1),
(245, 32, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', 1, 'A', 'Ecuatoriana', '', 8, 'SOBRINA/O', 262, 'EDGAR VINICIO', 'GARZÓN ALMEIDA', '', '', '2910382', '', '', 'N', 1),
(246, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 264, 'EULALIA MENESES', 'PAREDES ', '', '', '3035841', '', '', 'N', 1),
(247, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 265, 'GABRIEL LLUMIQUINGA', 'PAUCAR ', '', '', '3035841', '', '', 'N', 1),
(249, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 267, 'WILLIAM LUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N', 1),
(250, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 268, 'KATHERINE LLUMIQUINGA', 'MENESES ', '', '', '3035841', '', '', 'N', 1),
(251, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 269, 'EVELYN LLUMIQUINGA', 'MENESES ', '', '', '', '', '', 'N', 1),
(252, 33, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 270, 'BYRON BUSTOS', 'YAGUACHI ', '', '', '3035841', '', '', 'N', 1),
(222, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 238, 'MARÍA ETELVINA', 'SIMABAÑA ESPINOZA', '', '', '3262234', '', '', 'N', 1),
(223, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 1, 'PADRE', 239, 'ALFONSO JETACAMA', 'YACELGA ', '', '', '3262234', '', '', 'N', 1),
(224, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 240, 'LUIS FERNANDO', 'JETACAMA SIMBAÑA', '', '', '3262234', '', '', 'N', 1),
(225, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 241, 'ÁNGEL SANTIAGO', 'JETACAMA SIMABAÑA', '', '', '', '', '', 'N', 1),
(226, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 242, 'JONATHAN DAVID', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N', 1),
(227, 30, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 243, 'PABLO ALFONSO', 'JETACAMA SIMBAÑA', '', '', '', '', '', 'N', 1),
(255, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 1, 'PADRE', 274, 'PEDRO MIGUEL', 'LOOR SABANDO', '', '', '', '', '', 'N', 1),
(256, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 275, 'SANTA GERARDINA', 'CÓRDOVA CEVALLOS', '', '', '', '', '', 'N', 1),
(257, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 276, 'MIGUEL ADRIAN', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 1),
(258, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 11, 'NUERA', 277, 'MARÍA CRUZ', 'CRUZ LOOR', '', '', '', '', '', 'N', 1),
(259, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 8, 'SOBRINA/O', 278, 'CLEMENTE CEDEÑO', 'CÓRDOVA ', '', '', '', '', '', 'N', 1),
(260, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 279, 'JUANA ERLINDA', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 1),
(261, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 280, 'MIGUEL LEONEL', 'LOOR CÓRDOVA', '', '', '', '', '', 'N', 1),
(262, 34, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', 2, 'B', 'Ecuatoriana', '', 8, 'SOBRINA/O', 281, 'RAMÓN CÓRDOVA', 'MOLINA ', '', '', '', '', '', 'N', 1),
(220, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 7, 'PRIMA/O', 236, 'RICARDO GARCÍA', 'DELGADO ', '', '', '', '', '', 'N', 1),
(221, 29, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', 3, 'C', 'Ecuatoriana', '', 8, 'SOBRINA/O', 237, 'JEFFERSON GARCÍA', 'INTRIAGO ', '', '', '', '', '', 'N', 1),
(274, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 293, 'MAFLA VALVERDE', 'OSWALDO GUILLERMO', '', '', 'O994162519', '', '', 'N', 1),
(275, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 294, 'ANDRADE RUIZ', 'NANCY GUADALUPE', '', '', 'O994162519', '', '', 'N', 1),
(276, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 295, 'MAFLA ANDRADE', 'GUILLERMO ANDRÉS', '', '', 'O986173065', '', '', 'N', 1),
(264, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 15, 'HERMANA/O', 283, 'MARIA GEMA', 'BAZURTO MENDOZA', '', '', '', '', '', 'N', 1),
(265, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 3, 'HIJA/O', 284, 'DIEGO JANVIER', 'LOOR BAZURTO', '', '', '', '', '', 'N', 1),
(266, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 2, 'MADRE', 285, 'FANNY VINUEZA', 'ANCHUNDIA ', '', '', '', '', '', 'N', 1),
(267, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 1, 'PADRE', 286, 'JOSÉ NEPTALI', 'LOOR GARCÍA', '', '', '', '', '', 'N', 1),
(268, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 19, 'NOVIA/O', 287, 'JOSÉ FERNANDO', 'LOOR VINUEZA', '', '', '', '', '', 'N', 1),
(269, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 20, 'SUEGRA/O', 288, 'GEMA MATILDE', 'LOOR VINUEZA', '', '', '', '', '', 'N', 1),
(270, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 12, 'ESPOSA/O', 289, 'OSWALDO BAZURTO', 'MENDOZA ', '', '', '', '', '', 'N', 1),
(271, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 7, 'PRIMA/O', 290, 'JOSÉ OSCAR', 'LOOR GARCÍA', '', '', '', '', '', 'N', 1),
(272, 12, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', 4, 'D', 'Ecuatoriana', '', 7, 'PRIMA/O', 291, 'JOSE MARÍA', 'LOOR GARCÍA', '', '', '', '', '', 'N', 1),
(311, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 330, 'PAULINA ELIZABETH', 'MANTILLA CHITO', '', '', 'O993803415', '', '', 'N', 1),
(312, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 331, 'PAMELA DE LOS ÁNGELES', 'MANTILLA CHITO', '', '', '', '', '', 'N', 1),
(313, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 332, 'DANIEL CARRILLO', ' ', '', '', '', '', '', 'N', 1),
(314, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 333, 'ROCÍO ERAZO', ' ', '', '', '', '', '', 'N', 1),
(315, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 334, 'GUADALUPE ERAZO', ' ', '', '', '', '', '', 'N', 1),
(316, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 335, 'MARTHA CHITO', 'TACURI ', '', '', '', '', '', 'N', 1),
(317, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 9, 'CUÑADA/O', 336, 'BLANCA MANTILLA', ' ', '', '', '', '', '', 'N', 1),
(318, 41, 'LUIS LEONARDO', 'MANTILLA CHITO', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 337, 'MARCELA LÓPEZ', ' ', '', '', '', '', '', 'N', 1),
(319, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 338, 'ROSA MARÍA', 'NOEMÍ VÁSQUEZ', '', '', 'O993126270', '', '', 'N', 1),
(320, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 339, 'SANDRA MARITZA', 'MENESES VÁSQUEZ', '', '', 'O983404353', '', '', 'N', 1),
(323, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 342, 'LUIS ENRIQUE', 'MENESES GONZAGA', '', '', 'O995676170', '', '', 'N', 1),
(324, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 343, 'LIGIA ELENA', 'CHALA MÉNDEZ', '', '', '2498945', '', '', 'N', 1),
(325, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 11, 'NUERA', 344, 'DALILA TADEO', ' ', '', '', '2498945', '', '', 'N', 1),
(326, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 10, 'YERNO', 345, 'HERNÁN PRECIADO', 'MENESES ', '', '', 'O983404353', '', '', 'N', 1),
(327, 42, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 346, 'AIDE ELIZABETH', 'PALACIOS VÁSQUEZ', '', '', 'O985150322', '', '', 'N', 1),
(277, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 296, 'CASTILLO MOLINA', 'ELIANA ELIZABETH', '', '', '', '', '', 'N', 1),
(278, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 297, 'MAFLA CASTILLO', 'NATHALY JULIETE', '', '', '', '', '', 'N', 1),
(279, 36, 'JAIRO LEONEL', 'MAFLA ANDRADE', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 298, 'URUTIA SOTO', 'ROSANA PATRICIA', '', '', 'O62280675', '', '', 'N', 1),
(281, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 300, 'MARIANO LLULLUMA', 'RODRÍGUEZ ', '', '', '2892564', '', '', 'N', 1),
(282, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 301, 'EYMI LLLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 1),
(283, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 302, 'JOSELYN LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 1),
(284, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 303, 'DANTE LLULLUMA', 'PERALTA ', '', '', '', '', '', 'N', 1),
(286, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 305, 'ANITA LUCIA', 'LLULLUMA ÁLVAREZ', '', '', '', '', '', 'N', 1),
(287, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 306, 'MARCO LLULLUMA', 'ÁLVAREZ ', '', '', '', '', '', 'N', 1),
(288, 37, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', 3, 'C', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 307, 'LIBIA BERNAL', 'VERA ', '', '', '', '', '', 'N', 1),
(301, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 320, 'MARIANA DE JESÚS', 'CUEVA CEVALLOS', '', '', '2530151', '', '', 'N', 1),
(302, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 321, 'ANGELO RAMIRO', 'MANOSALVAS CUEVA', '', '', '2530151', '', '', 'N', 1),
(303, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 322, 'ALEXANDER MANOSALVAS', 'CUEVA ', '', '', '2530151', '', '', 'N', 1),
(305, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 324, 'GLORIA INÉS', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N', 1),
(306, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 10, 'YERNO', 325, 'VÍCTOR EMILIO', 'LUDEÑA CUEVA', '', '', '2530151', '', '', 'N', 1),
(307, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 326, 'GERMÁN RODRIGO', 'MANOSALVAS ARIAS', '', '', '2530151', '', '', 'N', 1),
(308, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 327, 'JOSEFINA CUEVA', 'CEVALLOS ', '', '', '2530151', '', '', 'N', 1),
(309, 40, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', 3, 'C', 'Ecuatoriana', '', 12, 'ESPOSA/O', 328, 'MARCO ANICETO', 'CHANGO ', '', '', '2530151', '', '', 'N', 1),
(290, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 309, 'LUIS MATEO', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N', 1),
(291, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 310, 'ALAN ANDRÉS', 'MALLIQUINGA LARA', '', '', '2681000', '', '', 'N', 1),
(292, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 311, 'JOSÉ ALBERTO', 'MALLIQUINGA AGUAYO', '', '', '2681000', '', '', 'N', 1),
(293, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 312, 'MARÍA ANDAGOYA', 'COYAGO ', '', '', '2681000', '', '', 'N', 1),
(294, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 313, 'CARMEN GUADALUPE', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 1),
(295, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 314, 'MARÍA ELIZABETH', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 1),
(296, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 19, 'NOVIA/O', 315, 'VÍCTOR DANIEL', 'MALLIQUINGA ANDAGOYA', '', '', '2681000', '', '', 'N', 1),
(297, 38, 'LUIS ALBERTO', 'MALLIQUINGA ANDAGOYA', 5, 'OBSERVACION', 'Ecuatoriana', '', 11, 'NUERA', 316, 'EVELIN ESTEFANIA', 'CEVALLOS ANDAGOYA', '', '', '2681000', '', '', 'N', 1),
(299, 39, 'MANUEL ENRIQUE', 'MALLIQUINGA CATAGÑA', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 318, 'JOSTIN ARIEL', 'MALLIQUINGA LLUMIQUINGA', '', '', 'O980992267', '', '', 'N', 1),
(300, 39, 'MANUEL ENRIQUE', 'MALLIQUINGA CATAGÑA', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 319, 'MARÍA ZOILA', 'CATAGÑA USHIÑA', '', '', '2787532', '', '', 'N', 1),
(328, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 347, 'BELLA NARDA', 'MARQUEZ LUDEÑA', '', '', 'O992507269', '', '', 'N', 1),
(329, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 348, 'EDISON FERNANDO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 1),
(330, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 349, 'JHON JAIRO', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 1),
(331, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 350, 'KATERIN MISHEL', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 1),
(332, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 351, 'PAOLO JOSUE', 'MINANGO MÁRQUEZ', '', '', '3016458', '', '', 'N', 1),
(334, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 14, 'HIJA/O M.E', 353, 'ANDREA CORTEZ', ' ', '', '', '3016458', '', '', 'N', 1),
(335, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 14, 'HIJA/O M.E', 354, 'GEOVANA TIRADO', ' ', '', '', '3016458', '', '', 'N', 1),
(347, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 366, 'NICOLE KATERINE', 'MULLO PIN', '', '', '', '', '', 'N', 1),
(348, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 367, 'MARÍA TERESA', 'UYANA VELOZ', '', '', '', '', '', 'N', 1),
(349, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 368, 'JOSÉ OCTAVIO', 'MULLO TUTILLO', '', '', '', '', '', 'N', 1),
(352, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 371, 'GUADALUPE ERMIÑA', 'VELOZ ', '', '', '', '', '', 'N', 1),
(353, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 372, 'MARIANA MULLO', 'TUTILLO ', '', '', '', '', '', 'N', 1),
(354, 45, 'EDUARDO ILARIO', 'MULLO UYANA', 1, 'A', 'Ecuatoriana', '', 7, 'PRIMA/O', 373, 'RAÚL PINTO', ' ', '', '', '', '', '', 'N', 1),
(360, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 379, 'JUANA NATIVIDAD', 'PAVÓN CHALA', '', '', 'O997692772', '', '', 'N', 1),
(362, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 381, 'OMAR DAVID', 'CAMPOS PAVÓN', '', '', '', '', '', 'N', 1),
(363, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 382, 'ARIANA VALENTINA', 'PAVÓN MÉNDEZ', '', '', '', '', '', 'N', 1),
(364, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 24, 'CONVIVIENTE', 383, 'CLEMENTINA CHALA', 'DE LA CRUZ ', '', '', '', '', '', 'N', 1),
(365, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 384, 'OLIVA PAVÓN', 'CHALA ', '', '', 'O994797217', '', '', 'N', 1),
(366, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 26, 'PADRASTRO', 385, 'ANA ALEXANDRA', 'MÉNDEZ GONZALO', '', '', '', '', '', 'N', 1),
(367, 47, 'KLEVER ESTEBAN', 'PAVÓN CHALA', 1, 'A', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 386, 'MARIANA DE LOURDES', 'PAVÓN CHALA', '', '', '', '', '', 'N', 1);
INSERT INTO `sys_vw_visitante` (`VIP_COD`, `PPL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PAB_COD`, `PAB_DESCRIPCION`, `PPL_NACIONALIDAD`, `PPL_IMG`, `PAR_COD`, `PAR_DESCRIPCION`, `VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`, `CEN_COD`) VALUES
(375, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 394, 'LUIS PATRICIO', 'PILAQUINGA LLUGCHA', '', '', 'O995776677', '', '', 'N', 1),
(376, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 395, 'MARÍA TERESA', 'SIGCHA CHUSIN', '', '', 'O983120320', '', '', 'N', 1),
(377, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 396, 'ESTEBAN PATRICIO', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 1),
(378, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 397, 'KERLY NICOLE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 1),
(379, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 398, 'MAYERLI JAQUELINE', 'PILAQUINGA ROJANO', '', '', '', '', '', 'N', 1),
(380, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 399, 'JENNY PAOLA', 'PILAQUINGA SIGCHA', '', '', 'O969504170', '', '', 'N', 1),
(381, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 400, 'GLORIA FERNANDA', 'PILAQUINGA SIGCHA', '', '', 'O983078024', '', '', 'N', 1),
(382, 49, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 401, 'JULIO ALFREDO', 'CALLE MORA', '', '', 'O987778257', '', '', 'N', 1),
(383, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 1, 'PADRE', 402, 'LIBER QUINTERO', 'MEDINA ', '', '', '', '', '', 'N', 1),
(384, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 403, 'SAMARI ARROYO', 'SUAREZ ', '', '', '', '', '', 'N', 1),
(385, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 404, 'LEANDRO ARROYO', 'SUAREZ ', '', '', '', '', '', 'N', 1),
(386, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 405, 'JEAN PIERE', 'ARROYO SUAREZ', '', '', '', '', '', 'N', 1),
(387, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 4, 'ABUELA/O', 406, 'CONY QUINTERO', 'NARANJO ', '', '', '', '', '', 'N', 1),
(388, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 4, 'ABUELA/O', 407, 'CHENOOA QUINTERO', 'NARANJO ', '', '', '', '', '', 'N', 1),
(389, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 26, 'PADRASTRO', 408, 'JOHANA NARANJO', 'TELLO ', '', '', '', '', '', 'N', 1),
(390, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 409, 'PAOLA AYOVI', 'NAZARENO ', '', '', '', '', '', 'N', 1),
(391, 50, 'LIBER MAURICIO', 'QUINTERO SUAREZ', 2, 'B', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 410, 'AURIA BATALLA', 'CAÑOLA ', '', '', '', '', '', 'N', 1),
(337, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 356, 'FANNY FAJARDO', 'FAJARDO ', '', '', '32804316', '', '', 'N', 1),
(338, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 357, 'CRISTIAN ANTONIO', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N', 1),
(339, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 358, 'VÍCTOR ANDRÉS', 'MOSCOSO FAJARDO', '', '', '32804316', '', '', 'N', 1),
(340, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 359, 'NELLY MAGDALENA', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N', 1),
(341, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 360, 'ESMERALDA DE JESÚS', 'MOSCOSO BARRERA', '', '', '32803710', '', '', 'N', 1),
(342, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 361, 'PAULINA SALOME', 'QUINTANA MOSCOSO', '', '', '32803710', '', '', 'N', 1),
(343, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 12, 'ESPOSA/O', 362, 'JULIO EDWIN', 'QUINTANA JÁCOME', '', '', '32803710', '', '', 'N', 1),
(344, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 12, 'ESPOSA/O', 363, 'CARLOS ANTONIO', 'RODRÍGUEZ CORAL', '', '', '32803710', '', '', 'N', 1),
(345, 44, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 364, 'MISHEL ESTEFANIA', 'QUINTANA MOSCOSO', '', '', '32804316', '', '', 'N', 1),
(393, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 412, 'ALISSON DAYLIN', 'RAMÓN LOOR', '', '', 'O986663600', '', '', 'N', 1),
(336, 43, 'EDISON FERNANDO', 'MINANGO CONSTANTE', 5, 'OBSERVACION', 'Ecuatoriana', '', 21, 'U.LIBRE', 355, 'CRISTIAN RAMÍREZ', ' ', '', '', '3016458', '', '', 'N', 1),
(356, 46, 'PATRICIO JAVIER', 'NAVAS VENEGAS', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 375, 'GUIOCONDA NOEMÍ', 'VENEGAS MARTÍNEZ', '', '', 'O983555064', '', '', 'N', 1),
(357, 46, 'PATRICIO JAVIER', 'NAVAS VENEGAS', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 376, 'CRISTOPHER DANIEL', 'NAVAS BORJA', '', '', '', '', '', 'N', 1),
(358, 46, 'PATRICIO JAVIER', 'NAVAS VENEGAS', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 377, 'NATALY YADIRA', 'LÓPEZ VENEGAS', '', '', '', '', '', 'N', 1),
(359, 46, 'PATRICIO JAVIER', 'NAVAS VENEGAS', 5, 'OBSERVACION', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 378, 'MARIUXI AMPARITO', 'LAZ SALTOS', '', '', '', '', '', 'N', 1),
(369, 48, 'CARLOS CESAR', 'PÉREZ TREJO', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 388, 'MARÍA INÉS', 'TREJO CHARCOPA', '', '', '62705285', '', '', 'N', 1),
(370, 48, 'CARLOS CESAR', 'PÉREZ TREJO', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 389, 'ELENA ELIZABETH', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 1),
(371, 48, 'CARLOS CESAR', 'PÉREZ TREJO', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 390, 'NELLY MIREYA', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 1),
(372, 48, 'CARLOS CESAR', 'PÉREZ TREJO', 5, 'OBSERVACION', 'Ecuatoriana', '', 19, 'NOVIA/O', 391, 'FRANKLIN EDUARDO', 'PÉREZ TREJO', '', '', '62705285', '', '', 'N', 1),
(373, 48, 'CARLOS CESAR', 'PÉREZ TREJO', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 392, 'FRANKLIN AGUSTIN', 'PÉREZ FARIAS', '', '', '62705285', '', '', 'N', 1),
(419, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 439, 'GALO HERNÁN', 'SALAZAR ', '', '', '2299964', '', '', 'N', 1),
(420, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 440, 'MARTHA AUDELIA', 'NARVÁEZ TAMAYO', '', '', '2299964', '', '', 'N', 1),
(421, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 441, 'PAOLA TATIANA', 'TAMAYO PINTO', '', '', '3132536', '', '', 'N', 1),
(422, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 442, 'KEVYN HERNÁN', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N', 1),
(423, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 443, 'KERLY PAOLA', 'SALAZAR TAMAYO', '', '', '3132536', '', '', 'N', 1),
(424, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 444, 'PAUL SANTIAGO', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N', 1),
(425, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 445, 'JESSICA GALEANO', 'CADENA ', '', '', '', '', '', 'N', 1),
(427, 54, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 447, 'KATHY ALEXANDRA', 'SALAZAR NARVÁEZ', '', '', '', '', '', 'N', 1),
(438, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 458, 'CAMILA SÁNCHEZ', 'RIOFRIO ', '', '', '', '', '', 'N', 1),
(439, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 13, 'ABOGADO', 459, 'MARCOS ARELLEYRA', ' ', '', '', '', '', '', 'N', 1),
(440, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 460, 'LUZ PONCE', 'ARTEAGA ', '', '', '', '', '', 'N', 1),
(441, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 461, 'RODRIGO LASSO', 'DONOSO ', '', '', '', '', '', 'N', 1),
(442, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 462, 'PATRICIO VILLACRES', ' ', '', '', '', '', '', 'N', 1),
(443, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 463, 'MARÍA LUZ', 'RIOFRIO ', '', '', '', '', '', 'N', 1),
(444, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 464, 'JENNY GUERRERO', ' ', '', '', '', '', '', 'N', 1),
(445, 56, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 465, 'FABRICIO MONCAYO', ' ', '', '', '', '', '', 'N', 1),
(401, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 15, 'HERMANA/O', 420, 'TERESA JAQUELINE', 'LUZARDO MARCILLO', '', '', '2294950', '', '', 'N', 1),
(402, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 421, 'JEAN PIERE', 'RUIZ LUZARDO', '', '', '2294950', '', '', 'N', 1),
(403, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 422, 'HILDA ROSARIO', 'LLERENA ZAPATA', '', '', '2294950', '', '', 'N', 1),
(404, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 423, 'EUGENIA DEL ROSARIO', 'RUIZ LLERENA', '', '', '', '', '', 'N', 1),
(405, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 424, 'MARÍA TERESA', 'RUIZ LLERENA', '', '', '2800505', '', '', 'N', 1),
(406, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 425, 'LUIS ARNULFO', 'RUIZ LLERENA', '', '', '2493232', '', '', 'N', 1),
(407, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 426, 'CARMEN ELIZABETH', 'RUIZ LLERENA', '', '', '2294950', '', '', 'N', 1),
(408, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 9, 'CUÑADA/O', 427, 'TANIA ALEXANDRA', 'FIALLOS ACUÑA', '', '', '3301806', '', '', 'N', 1),
(409, 52, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', 2, 'B', 'Ecuatoriana', '', 8, 'SOBRINA/O', 428, 'OSWALDO MARCELO', 'LONDOÑO MOLINA', '', '', '2432291', '', '', 'N', 1),
(394, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 413, 'MARIANA DE JESÚS', 'CHÁVEZ VARELA', '', '', 'O990541599', '', '', 'N', 1),
(395, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 414, 'LISTON ROSALINO', 'RAMÓN GUANGA', '', '', 'O993846058', '', '', 'N', 1),
(396, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 415, 'KEVIN LISTON', 'RAMÓN CHÁVEZ', '', '', 'O969428054', '', '', 'N', 1),
(397, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 416, 'JORDAN STEVEN', 'RAMON CHÁVEZ', '', '', 'O990541599', '', '', 'N', 1),
(400, 51, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 419, 'JOSELIN MONSERRATHE', 'HERMIDA CORDOVA', '', '', 'O988577259', '', '', 'N', 1),
(428, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 448, 'BLANCA BRENDA', 'ALVARADO JIMÉNEZ', '', '', 'O987034838', '', '', 'N', 1),
(429, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 449, 'CARLOS ANÍBAL', 'SÁNCHEZ MASAQUIZA', '', '', '', '', '', 'N', 1),
(430, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 450, 'HILDA LUCRECIA', 'CHILIQUINGA SUAREZ', '', '', '', '', '', 'N', 1),
(431, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 451, 'TAMARA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 1),
(432, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 452, 'DANIELA SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 1),
(433, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 453, 'NAOMI SÁNCHEZ', 'ALVARADO ', '', '', '', '', '', 'N', 1),
(434, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 454, 'CARLOS ANIBAL', 'SANCHEZ CHILIQUINGA', '', '', '', '', '', 'N', 1),
(435, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 8, 'SOBRINA/O', 455, 'JAVIER BASTIDAS', ' ', '', '', '', '', '', 'N', 1),
(436, 55, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', 3, 'C', 'Ecuatoriana', '', 9, 'CUÑADA/O', 456, 'GUADALUPE LEMA', 'CHILIQUINGA ', '', '', '', '', '', 'N', 1),
(446, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 466, 'MONICA PAZMIÑO', 'AUCANCELA ', '', '', 'O987025081', '', '', 'N', 1),
(447, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 467, 'DANIELA BRIGITTE', 'SOCASI AUCANCELA', '', '', 'O967997047', '', '', 'N', 1),
(410, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 429, 'ELIAS RAMÓN', 'SALAZAR ', '', '', '', '', '', 'N', 1),
(411, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 430, 'MARÍA ROSA', 'GUAIGUA ', '', '', '', '', '', 'N', 1),
(412, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 431, 'LIDIA MARISOL', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N', 1),
(413, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 432, 'NORMA LUCIA', 'SALAZAR GUAIGUA', '', '', '', '', '', 'N', 1),
(414, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 433, 'MAYRA LILIANA', 'SALAZAR GUIGUA', '', '', '', '', '', 'N', 1),
(415, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 12, 'ESPOSA/O', 434, 'VÍCTOR HUGO', 'QUILLUPANGUII ', '', '', '', '', '', 'N', 1),
(416, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 12, 'ESPOSA/O', 435, 'EDISON RAMIRO', 'CHAFLA ', '', '', '', '', '', 'N', 1),
(417, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 12, 'ESPOSA/O', 436, 'VICENTE DARWIN', 'NAVARRO ', '', '', '', '', '', 'N', 1),
(418, 53, 'EDGAR RAMIRO', 'SALAZAR GUAIGUA', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 437, 'XAVIER ALEJANDRO', 'SALAZAR CÁRDENAS', '', '', '', '', '', 'N', 1),
(456, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 476, 'SARA MARÍA', 'FLORES CASTELLANOS', '', '', '2823648', '', '', 'N', 1),
(457, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 477, 'JOSÉ ALEJANDRO', 'SUAREZ GONZALES', '', '', 'O988068962', '', '', 'N', 1),
(458, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 478, 'LIDIA GRISELDA', 'SUAREZ FLORES', '', '', 'O984550117', '', '', 'N', 1),
(459, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 479, 'EDWIN FERNANDO', 'SUAREZ FLORES', '', '', 'O995617836', '', '', 'N', 1),
(460, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 480, 'MIRIAN GEOVANA', 'SUAREZ FLORES', '', '', '2821480', '', '', 'N', 1),
(461, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 481, 'ERNESTO RAMIRO', 'TRUJILLO CARVAJAL', '', '', 'O998183263', '', '', 'N', 1),
(462, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 12, 'ESPOSA/O', 482, 'EDWIN NULBERTO', 'SUAREZ MOLINA', '', '', '22821480', '', '', 'N', 1),
(463, 58, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', 1, 'A', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 483, 'ZULMA JEANETH', 'BENAVIDES PULLAS', '', '', 'O999143196', '', '', 'N', 1),
(473, 60, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', 1, 'A', 'Ecuatoriana', '', 1, 'PADRE', 494, 'LUIS ENRIQUE', 'TIPANTUÑA SARABIO', '', '', '2974544', '', '', 'N', 1),
(474, 60, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', 1, 'A', 'Ecuatoriana', '', 2, 'MADRE', 495, 'ANA YOLANDA', 'CHASIQUIZA A.', '', '', '2974544', '', '', 'N', 1),
(475, 60, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 496, 'BERTHA MAGDALENA', 'PÉREZ GUALA', '', '', 'O986314920', '', '', 'N', 1),
(486, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 507, 'MARIUXI PAOLA', 'QUIJIJE M.', '', '', 'O982536099', '', '', 'N', 1),
(487, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 508, 'FRANKLIN JHORELL', 'ULLOA QUIJIJE', '', '', '', '', '', 'N', 1),
(488, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 509, 'STEPHANY DAYANE', 'ULLOA QUIJIJE', '', '', '', '', '', 'N', 1),
(489, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 20, 'SUEGRA/O', 510, 'MERCY ASTRID', 'SALAZAR ', '', '', 'O993167592', '', '', 'N', 1),
(490, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 511, 'FREDDY ENRIQUE', 'SALAZAR ', '', '', 'O997336152', '', '', 'N', 1),
(491, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 512, 'NELSON EUGENIO', 'SALAZAR ', '', '', 'O989353242', '', '', 'N', 1),
(492, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 19, 'NOVIA/O', 513, 'EDWIN RANIO', 'SALAZAR ', '', '', 'O982559036', '', '', 'N', 1),
(493, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 514, 'JOHANA SOLÍS', ' ', '', '', '', '', '', 'N', 1),
(494, 62, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', 1, 'A', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 515, 'JEANETH ALVARADO', 'GUERRERO ', '', '', '', '', '', 'N', 1),
(476, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 497, 'ROSALIA GUAITA', ' ', '', '', '2639284', '', '', 'N', 1),
(477, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 3, 'HIJA/O', 498, 'DAVID TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 1),
(478, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 19, 'NOVIA/O', 499, 'AMANDA TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 1),
(479, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 20, 'SUEGRA/O', 500, 'ADRIANA TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 1),
(480, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 12, 'ESPOSA/O', 501, 'JEFERSON RUANO', ' ', '', '', '2639284', '', '', 'N', 1),
(481, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 10, 'YERNO', 502, 'JORDY RUANO', ' ', '', '', '2639284', '', '', 'N', 1),
(482, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 10, 'YERNO', 503, 'JASON TRAVEZ', ' ', '', '', '2639284', '', '', 'N', 1),
(483, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 24, 'CONVIVIENTE', 504, 'ROGELIA TAMAYO', ' ', '', '', '2639284', '', '', 'N', 1),
(484, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 505, 'JULIA FLORES', ' ', '', '', 'O983116403', '', '', 'N', 1),
(485, 61, 'EDISON PATRICIO', 'TRAVEZ GUAITA', 2, 'B', 'Ecuatoriana', '', 23, 'HIJASTRA/O', 506, 'ELOISA MORALES', ' ', '', '', 'O979603241', '', '', 'N', 1),
(448, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 468, 'ANAHI KAREN', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N', 1),
(449, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 4, 'ABUELA/O', 469, 'NAOMI VALENTINA', 'SOCASI PAZMIÑO', '', '', '2964203', '', '', 'N', 1),
(450, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 470, 'MANUEL LUIS', 'MORANTE SOCASI', '', '', '2964203', '', '', 'N', 1),
(451, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 471, 'MARIA LUISA', 'CUACES AGUIRRE', '', '', 'O998435259', '', '', 'N', 1),
(452, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 472, 'MIRIAM DEL SOCORRO', 'CAUCES AGUIRRE', '', '', 'O981599236', '', '', 'N', 1),
(453, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 21, 'U.LIBRE', 473, 'JULIAN ESPINOZA', 'SOTO ', '', '', 'O983960987', '', '', 'N', 1),
(454, 57, 'LUIS ROBERTO', 'SOCASI AGUIRRE', 3, 'C', 'Ecuatoriana', '', 22, 'SOBRINA/O M.E.', 474, 'PAOLA RAQUEL', 'CARRILLO HINCHALA', '', '', 'O983960987', '', '', 'N', 1),
(464, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 485, 'CESAR ROGELIO', 'TAPIA VILLAGOMEZ', '', '', '23680193', '', '', 'N', 1),
(465, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 486, 'ROSARIO AMAGUAÑA', 'QUILLUPANGUI ', '', '', '23680193', '', '', 'N', 1),
(466, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 15, 'HERMANA/O', 484, 'KARINA PAOLA', 'YUGCHA CAJAS', '', '', 'O988299525', '', '', 'N', 1),
(467, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 488, 'SANDRA SONIA', 'JACOME AMGUAÑA', '', '', '23680193', '', '', 'N', 1),
(468, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 19, 'NOVIA/O', 489, 'WILSON PATRICIO', 'TAPIA AMGUAÑA', '', '', 'O985109896', '', '', 'N', 1),
(469, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 28, 'HERMANA/O M.E.', 490, 'RUTH FONSECA', ' ', '', '', 'O985109896', '', '', 'N', 1),
(470, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 491, 'GABRIELA TAPIA', ' ', '', '', 'O985109896', '', '', 'N', 1),
(471, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 11, 'NUERA', 492, 'ALEJANDRA TAPIA', ' ', '', '', 'O985109896', '', '', 'N', 1),
(472, 59, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', 3, 'C', 'Ecuatoriana', '', 3, 'HIJA/O', 493, 'CRISTOPHER ALEJANDRO', 'TAPIA YUGCHA', '', '', 'O988299525', '', '', 'N', 1),
(495, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 1, 'PADRE', 516, 'LUIS ENRIQUE', 'URBINA QUINTANA', '', '', '3400736', '', '', 'N', 1),
(496, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 2, 'MADRE', 517, 'ADRIANA LUCIA', 'VIVANCO CÁRDENAS', '', '', '3400736', '', '', 'N', 1),
(497, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 518, 'ADRIANA MARGARITA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N', 1),
(498, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 20, 'SUEGRA/O', 519, 'ANFRE LUCIA', 'URBINA VIVANCO', '', '', '3400736', '', '', 'N', 1),
(501, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 522, 'DEYSI PIEDAD', 'VALAREZO ', '', '', 'O984430168', '', '', 'N', 1),
(502, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 523, 'MARTHA YANETH', 'VALAREZO ', '', '', 'O992869809', '', '', 'N', 1),
(503, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 524, 'YOFRE DURVAL', 'VALAREZO ', '', '', 'O984371588', '', '', 'N', 1),
(504, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 3, 'HIJA/O', 525, 'FAUSTO GILBERTO', 'VALAREZO ', '', '', 'O983152847', '', '', 'N', 1),
(505, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 526, 'LUGARDA MAGDALENA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 1),
(506, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 4, 'ABUELA/O', 527, 'MARITZA LUCIA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 1),
(509, 64, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', 1, 'A', 'Ecuatoriana', '', 15, 'HERMANA/O', 530, 'LUCIA GRIMANEZA', 'VALAREZO ', '', '', 'O997641350', '', '', 'N', 1),
(527, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 17, 'PAREJA', 556, 'PRUEBA', 'PRUEBA2', '', '', '', '', '', 'N', 1),
(530, 5, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', 1, 'A', 'Ecuatoriana', '', 21, 'U.LIBRE', 555, 'WILLIAN', 'ESPINOSA', '1720802394', '', '', '', '', 'S', 1),
(532, 6, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', 1, 'A', 'Ecuatoriana', '', 17, 'PAREJA', 560, 'JOSE', 'CUERVO', '', '', '', '', '', 'N', 1),
(520, 4, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', 2, 'B', 'Ecuatoriana', '', 2, 'MADRE', 556, 'PRUEBA', 'PRUEBA2', '', '', '', '', '', 'N', 1),
(499, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 27, 'MADRASTRA', 520, 'DALILA VERONICA', 'SANTILLAN MELENDEZ', '', '', 'O969387493', '', '', 'N', 1),
(500, 63, 'LEONARDO RAFAEL', 'URBINA VIVANCO', 3, 'C', 'Ecuatoriana', '', 8, 'SOBRINA/O', 521, 'JORGE ALFREDO', 'ARIAS URBINA', '', '', 'O987472541', '', '', 'N', 1),
(510, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 15, 'HERMANA/O', 541, 'MÓNICA VALERIA', 'PULIDO BRAVO', '', '', 'O998245518', '', '', 'N', 1),
(511, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 3, 'HIJA/O', 542, 'MARCO ANTONIO', 'VILLACRES PULIDO', '', '', '', '', '', 'N', 1),
(512, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 4, 'ABUELA/O', 543, 'JESSIE VILLACRES', 'PULIDO ', '', '', '', '', '', 'N', 1),
(513, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 17, 'PAREJA', 544, 'MARIO MORALES', 'ZAMBRANO ', '', '', '', '', '', 'N', 1),
(514, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 1, 'PADRE', 545, 'MARCO VILLACRES', 'OROZCO ', '', '', '', '', '', 'N', 1),
(515, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 2, 'MADRE', 546, 'MATILDE ASCENCIO', 'LUCAS ', '', '', '', '', '', 'N', 1),
(516, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 19, 'NOVIA/O', 547, 'JONATHAN VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N', 1),
(517, 65, 'MARCOS ORLANDO', 'VILLACRES ASENCIO', 5, 'OBSERVACION', 'Ecuatoriana', '', 20, 'SUEGRA/O', 548, 'ALEXANDRA VILLACRES', 'ASCENCIO ', '', '', '', '', '', 'N', 1),
(519, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 3, 'HIJA/O', 555, 'WILLIAN', 'ESPINOSA', '1720802394', '', '', '', '', 'S', 1),
(531, 2, 'BYRON ERNESTO', 'ARIAS CHICAIZA', 5, 'OBSERVACION', 'ECUATORIANA', '', 18, 'EX PAREJA', 560, 'JOSE', 'CUERVO', '', '', '', '', '', 'N', 1),
(533, 72, 'BLASCO EDWIN', 'ARCOS PEPINOS', 6, 'NORTE-A', 'ECUATORIANAS', '', 12, 'ESPOSA/O', 561, 'AAAA', 'AAAA', '', '', '', '', '', 'N', 3),
(535, 72, 'BLASCO EDWIN', 'ARCOS PEPINOS', 6, 'NORTE-A', 'ECUATORIANAS', '', 9, 'CUÑADA/O', 563, 'CCCC', 'CCCC', '', '', '', '', '', 'N', 3),
(536, 73, 'SCARLET NAHOMI', 'ARCOS GONZÁLEZ', 6, 'NORTE-A', '', '', 13, 'ABOGADO', 563, 'CCCC', 'CCCC', '', '', '', '', '', 'N', 3),
(538, 72, 'BLASCO EDWIN', 'ARCOS PEPINOS', 6, 'NORTE-A', 'ECUATORIANAS', '', 15, 'HERMANA/O', 564, 'BBBB', 'BBBB', '', '', '', '', '', 'N', 3),
(539, 73, 'SCARLET NAHOMI', 'ARCOS GONZÁLEZ', 6, 'NORTE-A', '', '', 4, 'ABUELA/O', 561, 'AAAA', 'AAAA', '', '', '', '', '', 'N', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
