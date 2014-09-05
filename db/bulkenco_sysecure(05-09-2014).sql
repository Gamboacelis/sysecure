-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-09-2014 a las 08:17:18
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.3.28

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de control de Accesos al Sistema' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `sys_accesos`
--

INSERT INTO `sys_accesos` (`ACC_COD`, `USU_COD`, `CEN_COD`, `ACC_FECHA`, `ACC_IP`, `ACC_EQUIPO`) VALUES
(1, 2, 1, '2014-09-02 23:48:18', '127.0.0.1', 'DANNYURIBE-PC'),
(2, 2, 1, '2014-09-02 23:59:52', '127.0.0.1', 'DANNYURIBE-PC'),
(3, 2, 1, '2014-09-03 22:09:16', '127.0.0.1', 'DANNYURIBE-PC'),
(4, 2, 1, '2014-09-03 23:19:59', '127.0.0.1', 'DANNYURIBE-PC'),
(5, 1, 1, '2014-09-04 00:04:17', '::1', 'Willian-PC'),
(6, 1, 1, '2014-09-04 22:31:28', '::1', 'Willian-PC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_celdas`
--

CREATE TABLE IF NOT EXISTS `sys_celdas` (
`CEL_COD` int(11) NOT NULL COMMENT 'Codigo de la celda',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_DESCRPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la celda'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Celdas que tiene un Pabellon de un centro' AUTO_INCREMENT=3 ;

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
  `CEN_TELEFONO` varchar(13) NOT NULL COMMENT 'Telefono del Centro'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos del los centros a nivel Nacional' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_centro`
--

INSERT INTO `sys_centro` (`CEN_COD`, `CIU_COD`, `CEN_DESCRIPCION`, `CEN_DIRECCION`, `CEN_TELEFONO`) VALUES
(1, 1, 'Penal Garcia Moreno', '', ''),
(2, 1, 'Centro 2', '', ''),
(3, 1, 'Centro 3', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ciudad`
--

CREATE TABLE IF NOT EXISTS `sys_ciudad` (
`CIU_COD` int(11) NOT NULL COMMENT 'Codigo de Ciudad',
  `CIU_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion de la Ciudad'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de las Ciudades del Ecuador' AUTO_INCREMENT=3 ;

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
  `CON_ESTADO` varchar(1) NOT NULL COMMENT 'A: Autorizado, N:Negado'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `sys_control`
--

INSERT INTO `sys_control` (`CON_COD`, `GAR_COD`, `VIP_COD`, `HOR_COD`, `CON_FECHA`, `CON_ESTADO`) VALUES
(1, 1, 6, 3, '2014-09-04', 'S'),
(2, 2, 6, 3, '2014-09-04', 'S'),
(3, 3, 6, 3, '2014-09-04', 'A'),
(4, 1, 4, 3, '2014-09-04', 'S'),
(5, 2, 4, 3, '2014-09-04', 'S'),
(6, 3, 4, 3, '2014-09-04', 'A'),
(7, 1, 4, 3, '2014-09-04', 'S'),
(8, 2, 4, 3, '2014-09-04', 'S'),
(9, 3, 4, 3, '2014-09-04', 'A'),
(10, 1, 4, 3, '2014-09-04', 'S'),
(11, 2, 4, 3, '2014-09-04', 'S'),
(12, 3, 4, 3, '2014-09-04', 'A'),
(13, 1, 4, 3, '2014-09-04', 'S'),
(14, 2, 4, 3, '2014-09-04', 'S'),
(15, 3, 4, 3, '2014-09-04', 'A'),
(16, 1, 4, 3, '2014-09-04', 'S'),
(17, 2, 4, 3, '2014-09-04', 'S'),
(18, 3, 4, 3, '2014-09-04', 'A'),
(19, 1, 8, 3, '2014-09-04', 'S'),
(20, 2, 8, 3, '2014-09-04', 'S'),
(21, 3, 8, 3, '2014-09-04', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_etapas`
--

CREATE TABLE IF NOT EXISTS `sys_etapas` (
`NVL_COD` int(11) NOT NULL COMMENT 'Codigo de Etapas del Pabellon',
  `NVL_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de las Etapas del Pabellon'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Etapas en las que se encuentra un pabellon' AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla del Historial del PPL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_horarios`
--

CREATE TABLE IF NOT EXISTS `sys_horarios` (
`HOR_COD` int(11) NOT NULL COMMENT 'Codigo del Horario',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo del Tipo de Visita',
  `HOR_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Horario',
  `HOR_DIAS` varchar(200) DEFAULT NULL COMMENT 'Dias disponibles para las visitas',
  `HOR_HORA_ING` time DEFAULT NULL COMMENT 'Hora de Ingreso del Horario',
  `HOR_HORA_SAL` time DEFAULT NULL COMMENT 'Hora de Salida del Horario',
  `HOR_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estadp del Horario'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Datos de horarios que pueden tener los pabellones para las v' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `sys_horarios`
--

INSERT INTO `sys_horarios` (`HOR_COD`, `PAB_COD`, `TPV_COD`, `HOR_DESCRIPCION`, `HOR_DIAS`, `HOR_HORA_ING`, `HOR_HORA_SAL`, `HOR_ESTADO`) VALUES
(1, 1, 1, 'Horario en la Mañana', 'Martes', '08:20:00', '20:20:00', 'A'),
(2, 1, 3, 'Horario en la Tarde', 'Sábado', '14:00:00', '16:00:00', 'I'),
(3, 1, 1, 'Horaio en la Tarde', 'Jueves', '01:00:00', '03:00:00', 'A'),
(4, 1, 2, 'Visita Conyugal', 'Miércoles', '10:30:00', '24:00:00', 'A'),
(5, 2, 3, 'Horario en la Mañana', 'Lunes', '10:30:00', '12:30:00', 'A'),
(6, 1, 2, 'Visita Conyugal', 'Miércoles', '10:00:00', '24:00:00', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Huellas Dactilares ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_item_tipos`
--

CREATE TABLE IF NOT EXISTS `sys_item_tipos` (
`ITS_COD` int(11) NOT NULL COMMENT 'Codigo del Item-Tipo-Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `ITS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Item-Tipo-Sancion'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Todos los items que pueden tener los tipos de sancion' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de los Pabellones de un Centro' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_pabellones`
--

INSERT INTO `sys_pabellones` (`PAB_COD`, `CEN_COD`, `NVL_COD`, `PAB_ALA`, `PAB_DESCRIPCION`, `PAB_CAPACIDAD`, `PAB_DETALLES`) VALUES
(1, 1, 1, 'Norte', 'A', 500, ''),
(2, 1, 2, 'Sur', 'B', 200, ''),
(3, 1, 3, 'Este', 'C', 100, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parametros`
--

CREATE TABLE IF NOT EXISTS `sys_parametros` (
`PAR_COD` int(11) NOT NULL,
  `PAR_MODULO` varchar(60) NOT NULL,
  `PAR_DESCRIPCION` varchar(200) NOT NULL,
  `PAR_VALOR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de Parametros Generales' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `sys_parametros`
--

INSERT INTO `sys_parametros` (`PAR_COD`, `PAR_MODULO`, `PAR_DESCRIPCION`, `PAR_VALOR`) VALUES
(1, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(2, 'VISITANTES', 'Cantidad de Visitas por horario', '2'),
(3, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(4, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parentesco`
--

CREATE TABLE IF NOT EXISTS `sys_parentesco` (
`PAR_COD` int(11) NOT NULL COMMENT 'Codigo del Parentesco',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo de tipo de Visita',
  `PAR_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Parentesco'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Parentescos que pueden tener los visitantes' AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `sys_parentesco`
--

INSERT INTO `sys_parentesco` (`PAR_COD`, `TPV_COD`, `PAR_DESCRIPCION`) VALUES
(1, 1, 'Papá'),
(2, 1, 'Mamá'),
(3, 1, 'Hijo'),
(4, 1, 'Abuelo'),
(5, 1, 'Nieto'),
(6, 1, 'Bisnieto'),
(7, 1, 'Tío'),
(8, 1, 'Primo'),
(9, 1, 'Sobrino'),
(10, 1, 'Suegro'),
(11, 1, 'Cuñado'),
(12, 1, 'Yerno'),
(13, 1, 'Nuera'),
(14, 1, 'Consuegro'),
(15, 1, 'Concuñado'),
(16, 1, 'Padrino'),
(17, 1, 'Madrina'),
(18, 2, 'Esposa'),
(19, 2, 'Esposo'),
(20, 3, 'Abogado');

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
  `PPL_IMG` varchar(200) NOT NULL COMMENT 'Imagen del PPL',
  `PPL_ESTADO` varchar(2) NOT NULL COMMENT 'Estado del PPL'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de la persona Provada de Libertad' AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `sys_ppl`
--

INSERT INTO `sys_ppl` (`PPL_COD`, `PAB_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_IMG`, `PPL_ESTADO`) VALUES
(3, 2, 1, 'Carlos', 'Rosales', '1720090057', 'rcontreras.jpg', 'L'),
(4, 1, 2, 'aaaaaaaaa', 'ssssssssssss', '1720802394', 'cpazmino.jpg', 'A'),
(5, 1, 2, 'rrrrrrrrr', 'rrrrrrrrrrr', '1720090057', '', 'T'),
(6, 1, 1, 'vvvvvvvv', 'vvvvvvvvvvv', 'vvvv', '', 'D'),
(7, 1, 1, 'Administrador', 'Hernandez', 'asdfasdf', '', 'L'),
(8, 1, 2, 'Willian', 'Uribe', '1720802394', '', 'A'),
(9, 1, 1, 'qqqqqqqqqq', 'qqqqqqqqqqqqqq', '1720802394', '', 'A'),
(10, 1, 2, 'Willian', 'Espinosa', '1720802394', '', 'A'),
(11, 1, 1, 'Carlos', 'Alfredo', 'sdfa', 'wie.jpg', 'A'),
(12, 1, 1, 'sx', 'Peralta', '1720802394', 'ovillamil.jpg', 'A'),
(13, 1, 0, 'Administrador', 'Peralta', '1720802394', 'ambiente23.jpg', 'A'),
(14, 2, 0, 'Andres', 'Hernandez', '1720802394', 'dvasquez.jpg', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_roles`
--

CREATE TABLE IF NOT EXISTS `sys_roles` (
`ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol',
  `ROL_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Rol',
  `ROL_ESTADO` varchar(1) NOT NULL COMMENT 'A: Activo, I: Inactivo'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Roles que puede tener un Usuario' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_roles`
--

INSERT INTO `sys_roles` (`ROL_COD`, `ROL_DESCRIPCION`, `ROL_ESTADO`) VALUES
(1, 'Super Administrador', 'A'),
(2, 'Administrador', 'A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de almacenamiento de Sanciones de las Visitas' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_sanciones`
--

INSERT INTO `sys_sanciones` (`SAN_COD`, `TPS_COD`, `SAN_DESCRIPCION`, `SAN_TIEMPO`, `SAN_TIEMPO_DES`) VALUES
(1, 1, 'no definido', 0, ''),
(2, 2, 'intento ingreso de armas', 60, 'dias'),
(3, 2, 'intento de ingreso de drogas', 30, 'dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipoactor`
--

CREATE TABLE IF NOT EXISTS `sys_tipoactor` (
`ACT_COD` int(11) NOT NULL COMMENT 'Codigo secuencial de Actor',
  `ACT_DESCRIPCION` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Actor'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla tipo actores de las Huellas' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipovisita`
--

CREATE TABLE IF NOT EXISTS `sys_tipovisita` (
`TPV_COD` int(11) NOT NULL COMMENT 'Codigo de Tipo de Visita',
  `TPV_DESCRIPCION` varchar(200) NOT NULL COMMENT 'descripcion del Tipo de Visita'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla con Tipos de visitantes' AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relacion entre los tipos de Visitas en los diferentes horari' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipo_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_tipo_sancion` (
`TPS_COD` int(11) NOT NULL COMMENT 'Codigo del tipo-Sancion',
  `TPS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'descripcion del  tipo-Sancion'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Listado de Tipos que puede tener una sancion' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_tipo_sancion`
--

INSERT INTO `sys_tipo_sancion` (`TPS_COD`, `TPS_DESCRIPCION`) VALUES
(1, 'no definido'),
(2, 'drogas');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Almacen de usuarios que ingresan al sistema' AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`USU_COD`, `USU_NOMBRE`, `USU_APELLIDO`, `USU_USUARIO`, `USU_CLAVE`, `USU_CEDULA`, `USU_EMAIL`, `USU_CELULAR`, `USU_AVATAR`, `ROL_COD`) VALUES
(1, 'Willian', 'Espinosa', 'wespinosa', '3e413f53d9f7c57b7250e9515a8d0d4d', '1720802394', 'wespinosa86@gmail.com', '0992725859', 'WillianEspinosa.jpg', 1),
(2, 'Administrador', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', 2),
(5, 'Danny', 'Uribe', 'duribe', '76d80224611fc919a5d54f0ff9fba446', '', 'duribe@gmail.com', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuario_centro`
--

CREATE TABLE IF NOT EXISTS `sys_usuario_centro` (
`UCE_COD` int(11) NOT NULL COMMENT 'Codigo de la tabla',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo del usuario',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Usuarios que pertenece aun centro' AUTO_INCREMENT=13 ;

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
(12, 5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante`
--

CREATE TABLE IF NOT EXISTS `sys_visitante` (
`VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Visitante',
  `VIS_TELEFONO` varchar(12) NOT NULL COMMENT 'Telefono del visitante',
  `VIS_CORREO` varchar(200) NOT NULL COMMENT 'Correo del Visitante',
  `VIS_IMAGEN` varchar(200) NOT NULL COMMENT 'Imagen del visitante',
  `VIS_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado del Visitante'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Almacen de Visitantes que pueden Acceder a un Centro' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`) VALUES
(2, 'Mariana', 'Figueroa', 18, '', '', '', '', '', 'A'),
(3, 'Pedro', 'Suarez', 1, '', '', '', '', '', 'A'),
(4, 'Maria', 'Claudia', 2, '', '', '', '', '', 'S'),
(5, 'Jose', 'Coronel', 1, '', '', '', '', '', 'A'),
(7, 'Jose', 'Perez', 1, '', '', '', '', '', 'A'),
(8, 'marco', 'Montalvo', 19, '', '', '', '', '', 'A'),
(9, 'Marco', 'Montalvo', 1, '', '', '', '', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_ppl` (
`VIP_COD` int(11) NOT NULL COMMENT 'Codigo del Visitanten-PPL',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `VIP_FECHA` date NOT NULL COMMENT 'Fecha del Visitanten-PPL'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `sys_visitante_ppl`
--

INSERT INTO `sys_visitante_ppl` (`VIP_COD`, `PPL_COD`, `VIS_COD`, `VIP_FECHA`) VALUES
(1, 3, 2, '0000-00-00'),
(2, 3, 3, '0000-00-00'),
(3, 4, 4, '0000-00-00'),
(4, 4, 5, '0000-00-00'),
(5, 4, 6, '0000-00-00'),
(6, 4, 7, '0000-00-00'),
(7, 4, 8, '0000-00-00'),
(8, 10, 9, '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Las sanciones que obtiene un visitante' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sys_visitante_sancion`
--

INSERT INTO `sys_visitante_sancion` (`VSA_COD`, `SAN_COD`, `VIS_COD`, `USU_COD`, `VSA_NOTA`, `VSA_FECHA_INI`, `VSA_FECHA_FIN`) VALUES
(1, 3, 4, 1, 'todo mal', '2014-09-04 00:00:00', '2014-10-04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Registro de Visitas realizadas' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_visitas`
--

INSERT INTO `sys_visitas` (`VISG_COD`, `PPL_COD`, `VIP_COD`, `HOR_COD`, `VISG_FECHA`, `VISG_HORA_INGRESO`, `VISG_HORA_SALIDA`, `VISG_TRANSCURRIDO`, `VISG_POSCHAR`, `VISG_POSNUM`, `VISG_ESTADO`) VALUES
(1, 4, 4, 3, '2014-09-04', '01:10:00', '03:00:00', '00:00:00', 'A', 1, 'A'),
(2, 4, 4, 3, '2014-09-04', '01:01:00', '03:00:00', '00:00:00', 'A', 2, 'A'),
(3, 10, 8, 3, '2014-09-04', '01:35:00', '03:00:00', '00:00:00', 'A', 3, 'A');

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
-- Estructura para la vista `sys_vw_control1`
--
DROP TABLE IF EXISTS `sys_vw_control1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control1` AS select `p`.`PPL_COD` AS `PPL_COD`,`p`.`PAB_COD` AS `PAB_COD`,`pa`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (`sys_ppl` `p` join `sys_pabellones` `pa` on((`pa`.`PAB_COD` = `p`.`PAB_COD`))) where (`p`.`PPL_ESTADO` = 'A');

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control2`
--
DROP TABLE IF EXISTS `sys_vw_control2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control2` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`HOR_COD` AS `HOR_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vs`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 1) and (`c`.`CON_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control3`
--
DROP TABLE IF EXISTS `sys_vw_control3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control3` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`c`.`HOR_COD` AS `HOR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vs`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (((`sys_visitante` `vs` join `sys_visitante_ppl` `vp`) join `sys_control` `c`) join `sys_ppl` `p`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 2) and (`c`.`CON_ESTADO` = 'A') and (`vs`.`VIS_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_control4`
--
DROP TABLE IF EXISTS `sys_vw_control4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_control4` AS select `v`.`VISG_COD` AS `VISG_COD`,`v`.`PPL_COD` AS `PPL_COD`,`v`.`VIP_COD` AS `VIP_COD`,`v`.`HOR_COD` AS `HOR_COD`,`v`.`VISG_FECHA` AS `VISG_FECHA`,`v`.`VISG_HORA_INGRESO` AS `VISG_HORA_INGRESO`,`v`.`VISG_HORA_SALIDA` AS `VISG_HORA_SALIDA`,`v`.`VISG_TRANSCURRIDO` AS `VISG_TRANSCURRIDO`,`v`.`VISG_POSCHAR` AS `VISG_POSCHAR`,`v`.`VISG_POSNUM` AS `VISG_POSNUM`,`v`.`VISG_ESTADO` AS `VISG_ESTADO`,`vt`.`VIS_COD` AS `VIS_COD`,`vt`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vt`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vt`.`PAR_COD` AS `PAR_COD`,`vt`.`VIS_CEDULA` AS `VIS_CEDULA`,`vt`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vt`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vt`.`VIS_CORREO` AS `VIS_CORREO`,`vt`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vt`.`VIS_ESTADO` AS `VIS_ESTADO` from ((`sys_visitas` `v` join `sys_visitante_ppl` `vp` on((`vp`.`VIP_COD` = `v`.`VIP_COD`))) join `sys_visitante` `vt` on((`vt`.`VIS_COD` = `vp`.`VIS_COD`))) where ((`vt`.`VIS_ESTADO` = 'A') and (`v`.`VISG_ESTADO` = 'A'));

-- --------------------------------------------------------

--
-- Estructura para la vista `sys_vw_sanciones`
--
DROP TABLE IF EXISTS `sys_vw_sanciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sys_vw_sanciones` AS select `v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`PAR_COD` AS `PAR_COD`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`vs`.`VSA_COD` AS `VSA_COD`,`vs`.`SAN_COD` AS `SAN_COD`,`vs`.`USU_COD` AS `USU_COD`,`vs`.`VSA_NOTA` AS `VSA_NOTA`,`vs`.`VSA_FECHA_INI` AS `VSA_FECHA_INI`,`vs`.`VSA_FECHA_FIN` AS `VSA_FECHA_FIN`,`s`.`TPS_COD` AS `TPS_COD`,`s`.`SAN_DESCRIPCION` AS `SAN_DESCRIPCION`,`s`.`SAN_TIEMPO` AS `SAN_TIEMPO`,`s`.`SAN_TIEMPO_DES` AS `SAN_TIEMPO_DES`,`ts`.`TPS_DESCRIPCION` AS `TPS_DESCRIPCION` from (((`sys_visitante_sancion` `vs` join `sys_visitante` `v`) join `sys_tipo_sancion` `ts`) join `sys_sanciones` `s`) where ((`v`.`VIS_COD` = `vs`.`VIS_COD`) and (`ts`.`TPS_COD` = `s`.`TPS_COD`) and (`vs`.`SAN_COD` = `s`.`SAN_COD`) and (`v`.`VIS_ESTADO` = 'S'));

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
 ADD PRIMARY KEY (`CEL_COD`), ADD KEY `FK_REFERENCE_17` (`PAB_COD`);

--
-- Indices de la tabla `sys_centro`
--
ALTER TABLE `sys_centro`
 ADD PRIMARY KEY (`CEN_COD`), ADD KEY `FK_REFERENCE_8` (`CIU_COD`);

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
-- Indices de la tabla `sys_pabellones`
--
ALTER TABLE `sys_pabellones`
 ADD PRIMARY KEY (`PAB_COD`);

--
-- Indices de la tabla `sys_parametros`
--
ALTER TABLE `sys_parametros`
 ADD PRIMARY KEY (`PAR_COD`);

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
MODIFY `ACC_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Acceso',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `sys_celdas`
--
ALTER TABLE `sys_celdas`
MODIFY `CEL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la celda',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_centro`
--
ALTER TABLE `sys_centro`
MODIFY `CEN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Centro',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sys_ciudad`
--
ALTER TABLE `sys_ciudad`
MODIFY `CIU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Ciudad',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_control`
--
ALTER TABLE `sys_control`
MODIFY `CON_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del Control',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `sys_etapas`
--
ALTER TABLE `sys_etapas`
MODIFY `NVL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Etapas del Pabellon',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sys_garita`
--
ALTER TABLE `sys_garita`
MODIFY `GAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la garita',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_historia_ppl`
--
ALTER TABLE `sys_historia_ppl`
MODIFY `HIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Historial de cambios del PPL';
--
-- AUTO_INCREMENT de la tabla `sys_horarios`
--
ALTER TABLE `sys_horarios`
MODIFY `HOR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Horario',AUTO_INCREMENT=7;
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
-- AUTO_INCREMENT de la tabla `sys_pabellones`
--
ALTER TABLE `sys_pabellones`
MODIFY `PAB_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del pabellon',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sys_parametros`
--
ALTER TABLE `sys_parametros`
MODIFY `PAR_COD` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sys_parentesco`
--
ALTER TABLE `sys_parentesco`
MODIFY `PAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Parentesco',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `sys_ppl`
--
ALTER TABLE `sys_ppl`
MODIFY `PPL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del PPL',AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `sys_roles`
--
ALTER TABLE `sys_roles`
MODIFY `ROL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Rol',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_sanciones`
--
ALTER TABLE `sys_sanciones`
MODIFY `SAN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Sancion',AUTO_INCREMENT=4;
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
MODIFY `TPS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del tipo-Sancion',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_usuarios`
--
ALTER TABLE `sys_usuarios`
MODIFY `USU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Usuario',AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `sys_usuario_centro`
--
ALTER TABLE `sys_usuario_centro`
MODIFY `UCE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la tabla',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `sys_visitante`
--
ALTER TABLE `sys_visitante`
MODIFY `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del Visitante',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `sys_visitante_ppl`
--
ALTER TABLE `sys_visitante_ppl`
MODIFY `VIP_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitanten-PPL',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `sys_visitante_sancion`
--
ALTER TABLE `sys_visitante_sancion`
MODIFY `VSA_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitante-Sancion',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sys_visitas`
--
ALTER TABLE `sys_visitas`
MODIFY `VISG_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Visita',AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sys_celdas`
--
ALTER TABLE `sys_celdas`
ADD CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`PAB_COD`) REFERENCES `sys_pabellones` (`PAB_COD`);

--
-- Filtros para la tabla `sys_centro`
--
ALTER TABLE `sys_centro`
ADD CONSTRAINT `FK_REFERENCE_8` FOREIGN KEY (`CIU_COD`) REFERENCES `sys_ciudad` (`CIU_COD`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
