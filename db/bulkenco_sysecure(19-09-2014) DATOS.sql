-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-09-2014 a las 18:18:00
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
  `ACC_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Acceso',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `CEN_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Centro',
  `ACC_FECHA` datetime NOT NULL COMMENT 'Fecha y Hora del Acceso',
  `ACC_IP` varchar(60) NOT NULL COMMENT 'Direccion Ip de la maquina desde la que Accesde',
  `ACC_EQUIPO` varchar(60) NOT NULL COMMENT 'Nombre del Equipo desde donde se Accede',
  PRIMARY KEY (`ACC_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de control de Accesos al Sistema' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_accesos`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos del los centros a nivel Nacional' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `sys_centro`
--

INSERT INTO `sys_centro` (`CEN_COD`, `CIU_COD`, `CEN_DESCRIPCION`, `CEN_DIRECCION`, `CEN_TELEFONO`, `CEN_TIPO`) VALUES
(1, 1, 'CRS VARONES 4', 'El Condado', '', 0);

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
-- Estructura de tabla para la tabla `sys_control`
--

CREATE TABLE IF NOT EXISTS `sys_control` (
  `CON_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del Control',
  `GAR_COD` int(11) NOT NULL COMMENT 'Codigo de la garita',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `HOR_COD` int(11) NOT NULL COMMENT 'Codigo del Horario',
  `CON_FECHA` date NOT NULL COMMENT 'fecha del Control',
  `CON_ESTADO` varchar(1) NOT NULL COMMENT 'A: Autorizado, N:Negado',
  PRIMARY KEY (`CON_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_control`
--


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
  `HOR_DIAS` varchar(200) DEFAULT NULL COMMENT 'Dias disponibles para las visitas',
  `HOR_HORA_ING` time DEFAULT NULL COMMENT 'Hora de Ingreso del Horario',
  `HOR_HORA_SAL` time DEFAULT NULL COMMENT 'Hora de Salida del Horario',
  `HOR_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estadp del Horario',
  PRIMARY KEY (`HOR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Datos de horarios que pueden tener los pabellones para las v' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `sys_horarios`
--

INSERT INTO `sys_horarios` (`HOR_COD`, `PAB_COD`, `TPV_COD`, `HOR_DESCRIPCION`, `HOR_DIAS`, `HOR_HORA_ING`, `HOR_HORA_SAL`, `HOR_ESTADO`) VALUES
(3, 1, 1, '4', 'JUEVES', '08:00:00', '23:59:00', 'A');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la relacion del Rol con las Opciones del ' AUTO_INCREMENT=35 ;

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
(33, 2, 11);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tabla que identifica las opciones que puede tener un Usuario' AUTO_INCREMENT=17 ;

--
-- Volcar la base de datos para la tabla `sys_opciones_usuario`
--

INSERT INTO `sys_opciones_usuario` (`OPU_COD`, `OPU_NOMBRE`, `OPU_LINK`, `OPU_NIVEL`, `OPU_COD_PADRE`, `OPU_ICONO`) VALUES
(1, 'Administrativo', '#', 1, 0, 'fa-bar-chart-o'),
(2, 'Controles', '#', 1, 0, 'fa-table'),
(3, 'Centros', '?modulo=administrativo&op=centros', 2, 1, ''),
(4, 'Horario de visitas', '?modulo=administrativo&op=horarios', 2, 1, ''),
(5, 'Pabellones', '?modulo=administrativo&op=pabellones', 2, 1, ''),
(6, 'Parametros', '?modulo=administrativo&op=parametros', 2, 1, ''),
(7, 'Sanciones', '?modulo=administrativo&op=sanciones', 2, 1, ''),
(8, 'PPL', '?modulo=administrativo&op=ppl', 2, 1, ''),
(9, 'Usuarios', '?modulo=administrativo&op=usuarios', 2, 1, ''),
(10, 'Visitantes', '?modulo=administrativo&op=visitantes', 2, 1, ''),
(11, 'Acceso 1', '?modulo=controles&op=acceso1', 2, 2, ''),
(12, 'Acceso 2', '?modulo=controles&op=acceso2', 2, 2, ''),
(13, 'Acceso 3', '?modulo=controles&op=acceso3', 2, 2, ''),
(14, 'Acceso 4', '?modulo=controles&op=acceso4', 2, 2, ''),
(15, 'Sanciones', '?modulo=controles&op=sanciones', 2, 2, ''),
(16, 'Roles', '?modulo=administrativo&op=roles', 2, 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de los Pabellones de un Centro' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `sys_pabellones`
--

INSERT INTO `sys_pabellones` (`PAB_COD`, `CEN_COD`, `NVL_COD`, `PAB_ALA`, `PAB_DESCRIPCION`, `PAB_CAPACIDAD`, `PAB_DETALLES`) VALUES
(1, 1, 2, 'Norte', 'A', 500, ''),
(2, 1, 2, 'Sur', 'B', 200, ''),
(3, 1, 2, 'Este', 'C', 100, ''),
(4, 1, 2, 'Oeste', 'D', 200, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parametros`
--

CREATE TABLE IF NOT EXISTS `sys_parametros` (
  `PAR_COD` int(11) NOT NULL AUTO_INCREMENT,
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `PAR_MODULO` varchar(60) NOT NULL,
  `PAR_DESCRIPCION` varchar(200) NOT NULL,
  `PAR_VALOR` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PAR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de Parametros Generales' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `sys_parametros`
--

INSERT INTO `sys_parametros` (`PAR_COD`, `CEN_COD`, `PAR_MODULO`, `PAR_DESCRIPCION`, `PAR_VALOR`) VALUES
(1, 1, 'PPL', 'Cantidad de visitantes por PPL', '10'),
(2, 1, 'VISITANTES', 'Cantidad de Visitas por horario', '3'),
(3, 1, 'ACCESO 3', 'Numero de Cedulas por Literal', '30'),
(4, 1, 'ACCESO 4', 'Tiempo de espera para finalizar Visita', '15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parentesco`
--

CREATE TABLE IF NOT EXISTS `sys_parentesco` (
  `PAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Parentesco',
  `TPV_COD` int(11) NOT NULL COMMENT 'Codigo de tipo de Visita',
  `PAR_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Parentesco',
  PRIMARY KEY (`PAR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Parentescos que pueden tener los visitantes' AUTO_INCREMENT=43 ;

--
-- Volcar la base de datos para la tabla `sys_parentesco`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de la persona Provada de Libertad' AUTO_INCREMENT=68 ;

--
-- Volcar la base de datos para la tabla `sys_ppl`
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
(67, 1, NULL, 'DOUGLAS AUGUSTO', 'YÉPEZ MOGRO', '501827109', 'Ecuatoriana', '', 'A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Roles que puede tener un Usuario' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `sys_roles`
--

INSERT INTO `sys_roles` (`ROL_COD`, `ROL_DESCRIPCION`, `ROL_ESTADO`, `ROL_OBSERVACION`) VALUES
(1, 'Super Administrador', 'A', ''),
(2, 'Administrador', 'A', '');

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
(1, 'Willian', 'Espinosa', 'wespinosa', '3e413f53d9f7c57b7250e9515a8d0d4d', '1720802394', 'wespinosa86@gmail.com', '0992725859', 'WillianEspinosa.jpg', 1),
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
  `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del Visitante',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Visitante',
  `VIS_TELEFONO` varchar(12) NOT NULL COMMENT 'Telefono del visitante',
  `VIS_CORREO` varchar(200) NOT NULL COMMENT 'Correo del Visitante',
  `VIS_IMAGEN` varchar(200) NOT NULL COMMENT 'Imagen del visitante',
  `VIS_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado del Visitante',
  PRIMARY KEY (`VIS_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Almacen de Visitantes que pueden Acceder a un Centro' AUTO_INCREMENT=550 ;

--
-- Volcar la base de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`) VALUES
(1, 'LENIN FABIÁN', 'ARCOS GONZÁLEZ', 3, '', '', '2425477', '', '', 'N'),
(2, 'RAMIRO XAVIER', 'ARCOS GONZÁLEZ', 3, '', '', '2425477', '', '', 'N'),
(3, 'JESSICA ESTEFANÍA', 'ARCOS GONZÁLEZ', 4, '', '', '2425477', '', '', 'N'),
(4, 'RENÉ ALFREDO', 'ARCOS PEPINOS', 19, '', '', '', '', '', 'N'),
(5, 'BLASCO EDWIN', 'ARCOS PEPINOS', 19, '', '', '', '', '', 'N'),
(6, 'MATÍAS ARCOS', 'PANAMÁ ', 6, '', '', '2425477', '', '', 'N'),
(7, 'SEBASTIÁN ARCOS', 'PANAMÁ ', 6, '', '', '2425477', '', '', 'N'),
(8, 'CRISTIAN ANÍBAL', 'AROS PEPINOS', 10, '', '', '2425477', '', '', 'N'),
(9, 'CRISTIAN PAUL', 'CALLE BARREZUETA', 21, '', '', '', '', '', 'N'),
(10, 'BYRON ROBERTO', 'ARIAS MORALES', 3, '', '', '2778736', '', '', 'N'),
(11, 'BRENDA GABRIELA', 'ARIAS MORALES', 4, '', '', '2778736', '', '', 'N'),
(12, 'LUPE EDELINA', 'CHICAIZA VARGAS', 2, '', '', '2777395', '', '', 'N'),
(13, 'MARIO ERNESTO', 'ARIAS CABRERA', 1, '', '', '2777395', '', '', 'N'),
(14, 'MARIO ROLANDO', 'ARIAS CHICAIZA', 19, '', '', '2777395', '', '', 'N'),
(15, 'BERNARDO ISRAEL', 'ARIAS CHICAIZA', 19, '', '', '2777395', '', '', 'N'),
(16, 'NANCY GIOVANNI', 'MORALES ', 23, '', '', '2777928', '', '', 'N'),
(17, 'ROSA CABRERA', ' ', 24, '', '', '2390902', '', '', 'N'),
(18, 'CRISTIAN PAUL', 'CALLE BARREZUETA', 21, '', '', '', '', '', 'N'),
(19, 'GABRIELA MARGARITA', 'MORALES ', 15, '', '', '2778736', '', '', 'N'),
(20, 'ALBY DEL', 'CARMEN BARRAZUETA', 23, '', '', '2964764', '', '', 'N'),
(21, 'HENRY PAUL', 'BARRAZUETA ', 8, '', '', '2964764', '', '', 'N'),
(22, 'ROCÍO DEL', 'CISNE BARRAZUETA', 23, '', '', '', '', '', 'N'),
(23, 'MARCO FERNANDO', 'GAVILANES ', 8, '', '', '2637640', '', '', 'N'),
(24, 'CATALINA DEL', 'ROCÍO GAVILANES', 9, '', '', '2964764', '', '', 'N'),
(25, 'MARCO ALFARO', 'GAVILANES ', 7, '', '', '2964764', '', '', 'N'),
(26, 'JHON FRANCISCO', 'BARRAZUETA ', 7, '', '', 'O999688876', '', '', 'N'),
(27, 'MIRIAM ALEXANDRA', 'BARRAZUETA ', 23, '', '', '', '', '', 'N'),
(28, 'CRISTIAN PAUL', 'CALLE BARRAZUETA', 9, '', '', '', '', '', 'N'),
(29, 'MAYITA GABRIELA', 'SALAS ', 25, '', '', '', '', '', 'N'),
(30, 'ARACELY REGINA', 'FARIAS FERNÁNDEZ', 15, '', '', '', '', '', 'N'),
(31, 'SAMANTA SALOME', 'BERMEO CEVALLOS', 20, '', '', '', '', '', 'N'),
(32, 'SCARLET NAHOMI', 'GUAMÁN BERMEO', 11, '', '', '', '', '', 'N'),
(33, 'BYRON STALIN', 'GUAMÁN SANDOVAL', 12, '', '', '', '', '', 'N'),
(34, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', 4, '', '', '', '', '', 'N'),
(35, 'JOSÉ BERMEO', 'ALCIVAR ', 3, '', '', '', '', '', 'N'),
(36, 'MARÍA BERMEO', 'ALCIVAR ', 3, '', '', '', '', '', 'N'),
(37, 'PATRICIA FARÍAS', 'FERNÁNDEZ ', 11, '', '', '', '', '', 'N'),
(38, 'DANIELA FARÍAS', 'FERNÁNDEZ ', 11, '', '', '', '', '', 'N'),
(39, 'ARACELY REGINA', 'FARÍAS FERNÁNDEZ', 15, '', '', '', '', '', 'N'),
(40, 'MARÍA ALEJANDRA', 'COBO MEDINA', 15, '', '', '32964310', '', '', 'N'),
(41, 'CAMILA ALEJANDRA', 'BONIFAZ COBO', 4, '', '', '32964310', '', '', 'N'),
(42, 'JOSÉ LUIS', 'BONIFAZ BONIFAZ', 19, '', '', '32928060', '', '', 'N'),
(43, 'CRISTÓBAL BONIFAZ', 'BONIFAZ ', 19, '', '', '32928060', '', '', 'N'),
(44, 'VERÓNICA LIZBETH', 'BONIFAZ BONIFAZ', 20, '', '', '32928060', '', '', 'N'),
(45, 'LUIS CRISTÓBAL', 'BONIFAZ YAMBAY', 1, '', '', '32928060', '', '', 'N'),
(46, 'LUZ MARÍA', 'YAMBAY ORDEN', 24, '', '', '32928060', '', '', 'N'),
(47, 'TERESA DE JESÚS', 'YAMBAY BONIFAZ', 23, '', '', '32953632', '', '', 'N'),
(48, 'MARÍA GABRIELA', 'VERGARA PANCHO', 26, '', '', '', '', '', 'N'),
(49, 'MARÍA ALEJANDRA', 'COBO MEDINA', 15, '', '', '32964310', '', '', 'N'),
(50, 'CARLOS ENRIQUE', 'BOLAÑOS LEÓN', 7, '', '', '', '', '', 'N'),
(51, 'FRED ADRIAN', 'ARTEAGA GÓMEZ', 21, '', '', '', '', '', 'N'),
(52, 'MIGUEL EMILIO', 'MORALES CASTRO', 21, '', '', '42821853', '', '', 'N'),
(53, 'MARÍA JOSÉ', 'MAFLA ANDRADE', 22, '', '', 'O987947094', '', '', 'N'),
(54, 'MARÍA ELISA', 'MAFLA ANDRADE', 22, '', '', '', '', '', 'N'),
(55, 'SERGIO RICARDO', 'BOWEN BOLAÑOS', 19, '', '', '', '', '', 'N'),
(56, 'HÉCTOR RICARDO', 'BOWEN BOLAÑOS', 19, '', '', '', '', '', 'N'),
(57, 'VINUEZA ELSA', 'CECILIA ', 2, '', '', 'O994960909', '', '', 'N'),
(58, 'CAGUA VINUEZA', 'RUTH NOEMI', 20, '', '', 'O991262192', '', '', 'N'),
(59, 'MUÑOZ BONE', 'MARCO ANTONIO', 12, '', '', 'O62700626', '', '', 'N'),
(60, 'PARRA VARGAS', 'ROBERTO FERNANDO', 21, '', '', '', '', '', 'N'),
(61, 'ANDREA GABRIELA', 'BERMEO CEVALLOS', 22, '', '', '', '', '', 'N'),
(62, 'DIANA ADELAIDA', 'MOREIRA BASURTO', 25, '', '', 'O959565315', '', '', 'N'),
(63, 'REYES NORMA', 'RITA ', 22, '', '', 'O990477166', '', '', 'N'),
(64, 'ALBORNOZ JOSÉ', 'LUIS ', 21, '', '', 'O984246121', '', '', 'N'),
(65, 'CASTAÑO VIVIANA', 'MARÍA ', 22, '', '', 'O983893387', '', '', 'N'),
(66, 'ALBORNOZ CASTAÑO', 'BRYAN ALEXIS', 21, '', '', 'O984205669', '', '', 'N'),
(67, 'JÁCOME DANIELA', ' ', 22, '', '', 'O984205669', '', '', 'N'),
(68, 'ALBORNOZ LUISA', 'MARÍA ', 22, '', '', '', '', '', 'N'),
(69, 'ALBORNOZ DANA', 'GISEL ', 22, '', '', 'O983199712', '', '', 'N'),
(70, 'BELTRAN ANDRÉS', ' ', 21, '', '', 'O983199712', '', '', 'N'),
(71, 'DÁVILA REYES', 'MIRIAM EUGENIA', 25, '', '', 'O999187184', '', '', 'N'),
(72, 'DÁVILA REYES', 'MIRIAM AUGENIA', 25, '', '', 'O999187184', '', '', 'N'),
(73, 'MARCO RAMIRO', 'VIZUETE SANTACRUZ', 2, '', '', '3130669', '', '', 'N'),
(74, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', 15, '', '', '2562025', '', '', 'N'),
(75, 'ALICIA DEL PILAR', 'CARRERA VIZUETE', 20, '', '', '3130669', '', '', 'N'),
(76, 'MÓNICA DEL ROCÍO', 'VIZUETE REVELO', 20, '', '', '', '', '', 'N'),
(77, 'ANDRÉS FELIPE', 'CARRERA VINUEZA', 3, '', '', '2562025', '', '', 'N'),
(78, 'LUIS SEBASTIÁN', 'CARRERA VINUEZA', 3, '', '', '2562025', '', '', 'N'),
(79, 'GALO MATEO', 'CARRERA VINUEZA', 3, '', '', '2562025', '', '', 'N'),
(80, 'BYRON EDUARDO', 'VITERI ESTEVEZ', 21, '', '', 'O999035799', '', '', 'N'),
(81, 'ROSA ELENA', 'CARRERA VIZUETE', 20, '', '', '3130669', '', '', 'N'),
(82, 'IRENE DEL PILAR', 'VINUEZA PROAÑO', 15, '', '', '2562025', '', '', 'N'),
(83, 'RICARDO ALBERTO', 'CARVAJAL HERNÁNDEZ', 3, '', '', 'O987391139', '', '', 'N'),
(84, 'RICARDO DAMIÁN', 'CARVAJAL HERNÁNDEZ', 3, '', '', 'O987391139', '', '', 'N'),
(85, 'RICARDO RAFAEL', 'CARVAJAL HERNÁNDEZ', 3, '', '', 'O987391139', '', '', 'N'),
(86, 'RICARDO AUGUSTO', 'CARVAJAL ', 1, '', '', 'O995253019', '', '', 'N'),
(87, 'HILDA MARINA', 'CASTILLO SEMBLANTES', 2, '', '', 'O995270904', '', '', 'N'),
(88, 'CESAR AUGUSTO', 'CARVAJAL CASTILLO', 19, '', '', 'O999025296', '', '', 'N'),
(89, 'CRISTIAN FERNANDO', 'CARVAJAL CASTILLO', 19, '', '', 'O987742427', '', '', 'N'),
(90, 'JESSICA PAULINA', 'CARVAJAL CASTILLO', 20, '', '', '', '', '', 'N'),
(91, 'VERÓNICA LORENA', 'CARVAJAL CASTILLO', 20, '', '', '', '', '', 'N'),
(92, 'EVELYN DAYANA', 'HERNÁNDEZ GAVILANES', 15, '', '', 'O987391139', '', '', 'N'),
(93, 'CAIZA QUERO', 'ROSA MERCEDES', 2, '', '', '2407067', '', '', 'N'),
(94, 'CATOTA TIPANLUISA', 'JOSÉ HILARIO', 1, '', '', '2407067', '', '', 'N'),
(95, 'CAIZA QUERO', 'MARÍA LUISA', 23, '', '', '2811779', '', '', 'N'),
(96, 'CAIZA QUERO', 'HILDA MARÍA', 23, '', '', '2811779', '', '', 'N'),
(97, 'CATOTA CAIZA', 'MARIA CECILIA', 20, '', '', '2407067', '', '', 'N'),
(98, 'CATOTA ACHIG', 'GIOVANNI JAIR', 3, '', '', '3121515', '', '', 'N'),
(99, 'CATOTA ACHIG', 'GEOMEL ALEXANDER', 3, '', '', '3121515', '', '', 'N'),
(100, 'CATOTA ACHIG', 'EDIOSN ALDAIR', 3, '', '', '3121515', '', '', 'N'),
(101, 'CAIZA GUACHAMIN', 'MARIA FERNANDA', 9, '', '', '', '', '', 'N'),
(102, 'ACHIG ENDARA', 'MARICELA MELBA', 25, '', '', '3121515', '', '', 'N'),
(103, 'PAAGUAY ATUPAÑA', 'SONIA MARICELA', 25, '', '', '32951568', '', '', 'N'),
(104, 'CEPEDA PAGUAY', 'LIZBETHESTEFANIA ', 4, '', '', '32951568', '', '', 'N'),
(105, 'CEPEDA PAGUAY', 'ANDRÉS ALEJANDRO', 3, '', '', '32951568', '', '', 'N'),
(106, 'CEPEDA PAGUAY', 'DIEGO FERNANDO', 3, '', '', '32951568', '', '', 'N'),
(107, 'CEPEDA SOLÍS', 'JOSÉ ENRIQUE', 1, '', '', 'O995452589', '', '', 'N'),
(108, 'ARÉVALO ANDRADE', 'ANA GRACIELA', 2, '', '', 'O995452589', '', '', 'N'),
(109, 'CEPEDA ARÉVALO', 'JHOANA GABRIELA', 20, '', '', 'O998489826', '', '', 'N'),
(110, 'CEPEDA AREVALO', 'MARCELO RODRIGO', 19, '', '', 'O987616282', '', '', 'N'),
(111, 'CEPEDA AREVALO', 'JAVIER ENRIQUE', 19, '', '', 'O995497923', '', '', 'N'),
(112, 'MANZANO RUÍZ', 'MARY PATRICIA', 22, '', '', 'O993768671', '', '', 'N'),
(113, 'JAQUELINE BONAFONT', ' ', 15, '', '', '42214269', '', '', 'N'),
(114, 'JAQUELINE BONAFONT', ' ', 15, '', '', '42214269', '', '', 'N'),
(115, 'IVÁN CEVALLOS', ' ', 19, '', '', '', '', '', 'N'),
(116, 'RITA CEVALLOS', ' ', 20, '', '', '', '', '', 'N'),
(117, 'ROSARIO RUEDA', ' ', 20, '', '', '', '', '', 'N'),
(118, 'VERÓNICA ROSERO', ' ', 20, '', '', '', '', '', 'N'),
(119, 'CRISTINA SAAVEDRA', ' ', 11, '', '', '', '', '', 'N'),
(120, 'JIMENA SAAVEDRA', ' ', 11, '', '', '', '', '', 'N'),
(121, 'LIYEN CEVALLOS', ' ', 4, '', '', '', '', '', 'N'),
(122, 'LIZ CEVALLOS', ' ', 4, '', '', '', '', '', 'N'),
(123, 'LAURA MARLENE', 'MOLINA JIMÉNEZ', 27, '', '', '', '', '', 'N'),
(124, 'MARÍA GRACIELA', 'VIZCAINO ', 2, '', '', '2748058', '', '', 'N'),
(125, 'DARWIN JOEL', 'CONDOY JIMÉNEZ', 18, '', '', '2748058', '', '', 'N'),
(126, 'CLARIBEL NIKYTA', 'CONDOY JIMÉNEZ', 18, '', '', '2748058', '', '', 'N'),
(127, 'HOMERO DANIEL', 'CONDOY VIZACAINO', 19, '', '', '2748058', '', '', 'N'),
(128, 'CARLOS HOMERO', 'CONDOY ROSERO', 19, '', '', '2748058', '', '', 'N'),
(129, 'ZARA PÉREZ', ' ', 15, '', '', '3050162', '', '', 'N'),
(130, 'EMILI CUEVA', ' ', 4, '', '', '', '', '', 'N'),
(131, 'MATÍAS SEBASTIÁN', 'CUEVA ', 3, '', '', '', '', '', 'N'),
(132, 'JEREMY CUEVA', ' ', 3, '', '', '', '', '', 'N'),
(133, 'NORMA CUEVA', ' ', 20, '', '', '', '', '', 'N'),
(134, 'PEDRO SÁNCHEZ', ' ', 12, '', '', '', '', '', 'N'),
(135, 'PATRICIA PÉREZ', ' ', 28, '', '', '', '', '', 'N'),
(136, 'MILTON TORRES', ' ', 8, '', '', '', '', '', 'N'),
(137, 'ROSA PÉREZ', ' ', 28, '', '', '', '', '', 'N'),
(138, 'ANA CRISTINA', 'VIVANCO DÍAZ', 22, '', '', '', '', '', 'N'),
(139, 'MARÍA BELÉN', 'ENRÍQUEZ DÍAZ', 4, '', '', '', '', '', 'N'),
(140, 'VÍCTOR ALEXIS', 'ENRÍQUEZ DÍAZ', 3, '', '', '', '', '', 'N'),
(141, 'ISABEL CAROLINA', 'ENRÍQUEZ DÍAZ', 4, '', '', '', '', '', 'N'),
(142, 'VÍCTOR ANTONIO', 'ENRÍQUEZ ', 1, '', '', '2960154', '', '', 'N'),
(143, 'ROSA ELENA', 'ENRÍQUEZ CABRERA', 20, '', '', '', '', '', 'N'),
(144, 'JULIO CABRERA', 'LOAIZA ', 8, '', '', '', '', '', 'N'),
(145, 'MARÍA DEL CARMEN', 'CABRERA LOAIZA', 9, '', '', '', '', '', 'N'),
(146, 'DEISY AMELIA', 'DÍAZ DÍAZ', 15, '', '', '', '', '', 'N'),
(147, 'JESICA CAÑIZARES', ' ', 15, '', '', '2732294', '', '', 'N'),
(148, 'CESAR DOMÍNGUEZ', ' ', 1, '', '', '2620271', '', '', 'N'),
(149, 'NORIS CEVALLOS', ' ', 2, '', '', '2620271', '', '', 'N'),
(150, 'NANCY BORJA', ' ', 29, '', '', '2732294', '', '', 'N'),
(151, 'LUIS CAÑIZARES', ' ', 30, '', '', '2732294', '', '', 'N'),
(152, 'JOHANA CAÑIZARES', ' ', 28, '', '', '', '', '', 'N'),
(153, 'NERBO VERDESOTO', ' ', 7, '', '', '', '', '', 'N'),
(154, 'PILAR REAL', ' ', 23, '', '', '', '', '', 'N'),
(155, 'MILENA DOMÍNGUEZ', ' ', 4, '', '', '', '', '', 'N'),
(156, 'KATHY YESSENIA', 'MOROCHO IMBACUAN', 15, '', '', '2661954', '', '', 'N'),
(157, 'CINTHIA ALEJANDRA', 'FAJARDO MOROCHO', 4, '', '', '', '', '', 'N'),
(158, 'MAYERLI MICAELA', 'FAJARDO MOROCHO', 4, '', '', '', '', '', 'N'),
(159, 'SARAY NICOLL', 'FAJARDO MOROCHO', 4, '', '', '', '', '', 'N'),
(160, 'JOSÉ ARCESIO', 'FAJARDO ', 1, '', '', 'O997299977', '', '', 'N'),
(161, 'LUCIA BEATRIZ', 'GAVIDIA ESTRELLA', 2, '', '', 'O997299977', '', '', 'N'),
(162, 'VÍCTOR HUGO', 'MOROCHO ', 30, '', '', '2661954', '', '', 'N'),
(163, 'MARÍA IMBACUAN', ' ', 29, '', '', '2661954', '', '', 'N'),
(164, 'MARIANA GAVIDIA', 'ESTRELLA ', 23, '', '', 'O997299977', '', '', 'N'),
(165, 'DIANA SORAYA', 'FAJARDO GAVIDIA', 20, '', '', 'O997299977', '', '', 'N'),
(166, 'MARCIA ROBALINO', ' ', 15, '', '', '', '', '', 'N'),
(167, 'ZULEMA MANTILLA', ' ', 20, '', '', '', '', '', 'N'),
(168, 'ADELA FIGUEROA', ' ', 2, '', '', '', '', '', 'N'),
(169, 'CARLA FIGUEROA', ' ', 4, '', '', '', '', '', 'N'),
(170, 'NEPALÍ MARTÍNEZ', ' ', 21, '', '', '', '', '', 'N'),
(171, 'GUILLERMO BARRAGÁN', ' ', 21, '', '', '', '', '', 'N'),
(172, 'MANUEL ÁLVAREZ', ' ', 21, '', '', '', '', '', 'N'),
(173, 'MARCET GUAMÁN', ' ', 22, '', '', '', '', '', 'N'),
(174, 'ROCIO ARCE', ' ', 22, '', '', '', '', '', 'N'),
(175, 'KATTY LÓPEZ', 'CAICEDO ', 31, '', '', '', '', '', 'N'),
(176, 'ADOLFO FRUTO', 'VERGARA ', 1, '', '', '', '', '', 'N'),
(177, 'MARGARITA MÁRQUEZ', 'FERNÁNDEZ ', 2, '', '', '', '', '', 'N'),
(178, 'DIANA FRUTO', 'MÁRQUEZ ', 20, '', '', '', '', '', 'N'),
(179, 'ANTONY FRUTO', 'MORA ', 18, '', '', '', '', '', 'N'),
(180, 'ALEX GÓMEZ', 'PONCE ', 21, '', '', '', '', '', 'N'),
(181, 'MAGALY DEL', 'ROCÍO PEÑA', 22, '', '', '', '', '', 'N'),
(182, 'ALEJANDRA CORONEL', 'MONTALVO ', 22, '', '', '', '', '', 'N'),
(183, 'MARILYN ERAZO', ' ', 15, '', '', '', '', '', 'N'),
(184, 'FELIX GUEVARA', ' ', 1, '', '', '', '', '', 'N'),
(185, 'CARLOS GUEVARA', ' ', 19, '', '', '', '', '', 'N'),
(186, 'JUAN DIEGO', 'GUEVARA ', 3, '', '', '', '', '', 'N'),
(187, 'SAMUEL ERAZO', ' ', 30, '', '', '', '', '', 'N'),
(188, 'NOEMI NARVÁEZ', ' ', 29, '', '', '', '', '', 'N'),
(189, 'ANDRÉS ERAZO', ' ', 12, '', '', '', '', '', 'N'),
(190, 'DARWIN GUEVARA', ' ', 9, '', '', '', '', '', 'N'),
(191, 'FREDY GUEVARA', ' ', 21, '', '', '', '', '', 'N'),
(192, 'MARY RAQUEL', 'HURTADO CHANGO', 15, '', '', '', '', '', 'N'),
(193, 'MAILY JORDANA', 'GUAMÁN HURTADO', 32, '', '', '', '', '', 'N'),
(194, 'SEGUNDO AURELIO', 'GUAMÁN ', 1, '', '', '', '', '', 'N'),
(195, 'MARÍA CONCEPCIÓN', 'SIMALUISA COPARA', 2, '', '', '', '', '', 'N'),
(196, 'MIRYAN ESTHER', 'GUAMÁN SIMALUISA', 20, '', '', '', '', '', 'N'),
(197, 'MARÍA ORFELINA', 'GUAMÁN SIMALUISA', 20, '', '', '', '', '', 'N'),
(198, 'DIEGO JAVIER', 'SIMALUISA SIMALUISA', 33, '', '', '', '', '', 'N'),
(199, 'EDWIN HIPOLITO', 'GUAMÁN SIMALUISA', 19, '', '', '', '', '', 'N'),
(200, 'JENNY IZA', ' ', 28, '', '', '', '', '', 'N'),
(201, 'JOSUE GUAMÁN', 'IZA ', 33, '', '', '', '', '', 'N'),
(202, 'SONIA JUDITH', 'VERA VINUEZA', 27, '', '', '2321762', '', '', 'N'),
(203, 'JOSÉ HERIBERTO', 'GUANOLUISA TIPAN', 1, '', '', '', '', '', 'N'),
(204, 'AMPARITO AZUCENA', 'MARTÍNEZ MORALES', 15, '', '', '2526266', '', '', 'N'),
(205, 'JESSICA PAOLA', 'TIXILEMA MARTÍNEZ', 34, '', '', '3069334', '', '', 'N'),
(206, 'MAYRA ELIZABETH', 'GUANOLUISA MARTÍNEZ', 34, '', '', '', '', '', 'N'),
(207, 'ANDERSON ALEXANDER', 'RAMÍREZ GUANOLUISA', 35, '', '', '', '', '', 'N'),
(208, 'LADDY ANTONELLA', 'RAMÍREZ GUANOLUISA', 35, '', '', '', '', '', 'N'),
(209, 'MILTON EDUARDO', 'GUANOTASIG OÑA', 19, '', '', '', '', '', 'N'),
(210, 'CRISTINA SIMBAÑA', ' ', 28, '', '', '', '', '', 'N'),
(211, 'ELVIA YOLANDA', 'GUANOTASIG OÑA', 20, '', '', '', '', '', 'N'),
(212, 'VICENTE AGUSTIN', 'GUANOTASIG PILLIZA', 1, '', '', '', '', '', 'N'),
(213, 'ZOILA OÑA', 'PILLIZA ', 2, '', '', '', '', '', 'N'),
(214, 'SANDRA JANETH', 'LUCERO SÁNCHEZ', 15, '', '', '3020554', '', '', 'N'),
(215, 'ANDREA ESTEFANIA', 'IÑIGUEZ LUCERO', 4, '', '', '3020554', '', '', 'N'),
(216, 'JAIDI ANALIE', 'IÑIGUEZ LUCERO', 4, '', '', '3020554', '', '', 'N'),
(217, 'MARÍA TERESA', 'TUFIÑO ', 2, '', '', '2630445', '', '', 'N'),
(218, 'HUGO ISMAEL', 'IÑIGUEZ LUZURIAGA', 1, '', '', '2630445', '', '', 'N'),
(219, 'VÍCTOR EDUARDO', 'LUCERO DÍAZ', 30, '', '', '3020554', '', '', 'N'),
(220, 'MIRIAM CECILIA', 'SÁNCHEZ ARROYO', 29, '', '', '3020554', '', '', 'N'),
(221, 'NANCY SAENZ', 'TUFIÑO ', 20, '', '', '', '', '', 'N'),
(222, 'ATILIO INTRIAGO', 'CARRANZA ', 19, '', '', '', '', '', 'N'),
(223, 'CARLOS CEVALLOS', 'ESTRADA ', 21, '', '', '', '', '', 'N'),
(224, 'STEVEN INTRIAGO', 'ORTIZ ', 3, '', '', '', '', '', 'N'),
(225, 'ARIEL INTRIAGO', 'ORTIZ ', 3, '', '', '', '', '', 'N'),
(226, 'MATÍAS INTRIAGO', 'ORTIZ ', 3, '', '', '', '', '', 'N'),
(227, 'NELLY LILIANA', 'ORTIZ CARRASCO', 36, '', '', '', '', '', 'N'),
(228, 'WASHINGTON PULECIO', 'MELGAR ', 21, '', '', '', '', '', 'N'),
(229, 'GISELLA CAROLINA', 'VALAREZO CHILA', 37, '', '', '', '', '', 'N'),
(230, 'NESTOR LENIN', 'MONTAÑO VALENCIA', 21, '', '', '', '', '', 'N'),
(231, 'LORGIO INTRIAGO', 'PINARGOTE ', 1, '', '', '', '', '', 'N'),
(232, 'DENNY GARCÍA', 'DELGADO ', 2, '', '', 'O988814990', '', '', 'N'),
(233, 'JONATHAN INTRIAGO', 'GARCÍA ', 19, '', '', '', '', '', 'N'),
(234, 'ANYERLI INTRIAGO', 'SÁNCHEZ ', 4, '', '', '', '', '', 'N'),
(235, 'ADRIAN INTRIAGO', 'GARCÍA ', 19, '', '', '', '', '', 'N'),
(236, 'RICARDO GARCÍA', 'DELGADO ', 7, '', '', '', '', '', 'N'),
(237, 'JEFFERSON GARCÍA', 'INTRIAGO ', 8, '', '', '', '', '', 'N'),
(238, 'MARÍA ETELVINA', 'SIMABAÑA ESPINOZA', 2, '', '', '3262234', '', '', 'N'),
(239, 'ALFONSO JETACAMA', 'YACELGA ', 1, '', '', '3262234', '', '', 'N'),
(240, 'LUIS FERNANDO', 'JETACAMA SIMBAÑA', 19, '', '', '3262234', '', '', 'N'),
(241, 'ÁNGEL SANTIAGO', 'JETACAMA SIMABAÑA', 19, '', '', '', '', '', 'N'),
(242, 'JONATHAN DAVID', 'JETACAMA SIMBAÑA', 19, '', '', '', '', '', 'N'),
(243, 'PABLO ALFONSO', 'JETACAMA SIMBAÑA', 19, '', '', '', '', '', 'N'),
(244, 'ALISSON NAYETH', 'JETACAMA CHICAIZA', 32, '', '', '', '', '', 'N'),
(245, 'VIVIANA JAQUELINE', 'CHICAIZA ZARATE', 36, '', '', '2673132', '', '', 'N'),
(246, 'SANDRA AULESTIA', 'ACURIO ', 27, '', '', 'O998884336', '', '', 'N'),
(247, 'BEATRIZ MONTALVO', 'SALAZAR ', 2, '', '', '3163351', '', '', 'N'),
(248, 'LEONIDAS LASCANO', 'MALES ', 1, '', '', 'NO SABE', '', '', 'N'),
(249, 'ISAAC LASCANO', 'CERÓN ', 3, '', '', '', '', '', 'N'),
(250, 'ALISSON LASCANO', 'CERÓN ', 4, '', '', '', '', '', 'N'),
(251, 'MARIANA LASCANO', 'MALES ', 23, '', '', '', '', '', 'N'),
(252, 'CARLOS CALLE', 'CABEZAS ', 7, '', '', '', '', '', 'N'),
(253, 'MYRIAN ANABEL', 'APOLO ÁLVAREZ', 15, '', '', '2639858', '', '', 'N'),
(254, 'MAYTE SUSANA', 'LASO APOLO', 4, '', '', '2639858', '', '', 'N'),
(255, 'PIEDAD SUSANA', 'LASO ALMEIDA', 2, '', '', '2634763', '', '', 'N'),
(256, 'CRISTIAN DANIEL', 'LASO ALMEIDA', 19, '', '', '2639858', '', '', 'N'),
(257, 'YESENIA XIMENA', 'TOMALO LASO', 20, '', '', '2639858', '', '', 'N'),
(258, 'LUIS PATRICIO', 'LASO ALMEIDA', 19, '', '', '2639858', '', '', 'N'),
(259, 'MARTHA YOLANDA', 'LASO ALMEIDA', 20, '', '', '2639858', '', '', 'N'),
(260, 'SEGUNDO EFRAIN', 'ALMEIDA ', 19, '', '', '2639858', '', '', 'N'),
(261, 'LUZMILA ALMEIDA', ' ', 20, '', '', '2910382', '', '', 'N'),
(262, 'EDGAR VINICIO', 'GARZÓN ALMEIDA', 8, '', '', '2910382', '', '', 'N'),
(263, 'KARLA PAOLA', 'BUSTOS YAGUACHI', 38, '', '', '3035841', '', '', 'N'),
(264, 'EULALIA MENESES', 'PAREDES ', 2, '', '', '3035841', '', '', 'N'),
(265, 'GABRIEL LLUMIQUINGA', 'PAUCAR ', 1, '', '', '3035841', '', '', 'N'),
(266, 'JULIANA LUMIQUINGA', 'BUSTOS ', 32, '', '', '3035841', '', '', 'N'),
(267, 'WILLIAM LUMIQUINGA', 'MENESES ', 19, '', '', '3035841', '', '', 'N'),
(268, 'KATHERINE LLUMIQUINGA', 'MENESES ', 20, '', '', '3035841', '', '', 'N'),
(269, 'EVELYN LLUMIQUINGA', 'MENESES ', 20, '', '', '', '', '', 'N'),
(270, 'BYRON BUSTOS', 'YAGUACHI ', 12, '', '', '3035841', '', '', 'N'),
(271, 'ARON LLUMIQUINGA', 'MENESES ', 39, '', '', '3035841', '', '', 'N'),
(272, 'LORENA SIMBA', ' ', 40, '', '', '3035841', '', '', 'N'),
(273, 'MARÍA CRISTINA', 'LOOR BRIONES', 15, '', '', '', '', '', 'N'),
(274, 'PEDRO MIGUEL', 'LOOR SABANDO', 1, '', '', '', '', '', 'N'),
(275, 'SANTA GERARDINA', 'CÓRDOVA CEVALLOS', 2, '', '', '', '', '', 'N'),
(276, 'MIGUEL ADRIAN', 'LOOR CÓRDOVA', 19, '', '', '', '', '', 'N'),
(277, 'MARÍA CRUZ', 'CRUZ LOOR', 11, '', '', '', '', '', 'N'),
(278, 'CLEMENTE CEDEÑO', 'CÓRDOVA ', 8, '', '', '', '', '', 'N'),
(279, 'JUANA ERLINDA', 'LOOR CÓRDOVA', 20, '', '', '', '', '', 'N'),
(280, 'MIGUEL LEONEL', 'LOOR CÓRDOVA', 19, '', '', '', '', '', 'N'),
(281, 'RAMÓN CÓRDOVA', 'MOLINA ', 8, '', '', '', '', '', 'N'),
(282, 'ANA CRISTINA', 'LOOR LOOR', 32, '', '', '', '', '', 'N'),
(283, 'MARIA GEMA', 'BAZURTO MENDOZA', 15, '', '', '', '', '', 'N'),
(284, 'DIEGO JANVIER', 'LOOR BAZURTO', 3, '', '', '', '', '', 'N'),
(285, 'FANNY VINUEZA', 'ANCHUNDIA ', 2, '', '', '', '', '', 'N'),
(286, 'JOSÉ NEPTALI', 'LOOR GARCÍA', 1, '', '', '', '', '', 'N'),
(287, 'JOSÉ FERNANDO', 'LOOR VINUEZA', 19, '', '', '', '', '', 'N'),
(288, 'GEMA MATILDE', 'LOOR VINUEZA', 20, '', '', '', '', '', 'N'),
(289, 'OSWALDO BAZURTO', 'MENDOZA ', 12, '', '', '', '', '', 'N'),
(290, 'JOSÉ OSCAR', 'LOOR GARCÍA', 7, '', '', '', '', '', 'N'),
(291, 'JOSE MARÍA', 'LOOR GARCÍA', 7, '', '', '', '', '', 'N'),
(292, 'PONCE PONCE', 'MARÍA PATRICIA', 37, '', '', 'O980251632', '', '', 'N'),
(293, 'MAFLA VALVERDE', 'OSWALDO GUILLERMO', 1, '', '', 'O994162519', '', '', 'N'),
(294, 'ANDRADE RUIZ', 'NANCY GUADALUPE', 2, '', '', 'O994162519', '', '', 'N'),
(295, 'MAFLA ANDRADE', 'GUILLERMO ANDRÉS', 19, '', '', 'O986173065', '', '', 'N'),
(296, 'CASTILLO MOLINA', 'ELIANA ELIZABETH', 22, '', '', '', '', '', 'N'),
(297, 'MAFLA CASTILLO', 'NATHALY JULIETE', 4, '', '', '', '', '', 'N'),
(298, 'URUTIA SOTO', 'ROSANA PATRICIA', 28, '', '', 'O62280675', '', '', 'N'),
(299, 'DELIA ÁLVAREZ', 'ANAGO ', 36, '', '', '2892564', '', '', 'N'),
(300, 'MARIANO LLULLUMA', 'RODRÍGUEZ ', 1, '', '', '2892564', '', '', 'N'),
(301, 'EYMI LLLULLUMA', 'PERALTA ', 4, '', '', '', '', '', 'N'),
(302, 'JOSELYN LLULLUMA', 'PERALTA ', 4, '', '', '', '', '', 'N'),
(303, 'DANTE LLULLUMA', 'PERALTA ', 3, '', '', '', '', '', 'N'),
(304, 'AURORA PERALTA', 'VILLACIS ', 36, '', '', '', '', '', 'N'),
(305, 'ANITA LUCIA', 'LLULLUMA ÁLVAREZ', 20, '', '', '', '', '', 'N'),
(306, 'MARCO LLULLUMA', 'ÁLVAREZ ', 19, '', '', '', '', '', 'N'),
(307, 'LIBIA BERNAL', 'VERA ', 22, '', '', '', '', '', 'N'),
(308, 'LAURA MARCELA', 'LARA MONAR', 37, '', '', '2681000', '', '', 'N'),
(309, 'LUIS MATEO', 'MALLIQUINGA LARA', 3, '', '', '2681000', '', '', 'N'),
(310, 'ALAN ANDRÉS', 'MALLIQUINGA LARA', 3, '', '', '2681000', '', '', 'N'),
(311, 'JOSÉ ALBERTO', 'MALLIQUINGA AGUAYO', 1, '', '', '2681000', '', '', 'N'),
(312, 'MARÍA ANDAGOYA', 'COYAGO ', 2, '', '', '2681000', '', '', 'N'),
(313, 'CARMEN GUADALUPE', 'MALLIQUINGA ANDAGOYA', 20, '', '', '2681000', '', '', 'N'),
(314, 'MARÍA ELIZABETH', 'MALLIQUINGA ANDAGOYA', 20, '', '', '2681000', '', '', 'N'),
(315, 'VÍCTOR DANIEL', 'MALLIQUINGA ANDAGOYA', 19, '', '', '2681000', '', '', 'N'),
(316, 'EVELIN ESTEFANIA', 'CEVALLOS ANDAGOYA', 11, '', '', '2681000', '', '', 'N'),
(317, 'EVELYN ROXANA', 'LLUMIQUINGA PACHACAMA', 37, '', '', 'O980992267', '', '', 'N'),
(318, 'JOSTIN ARIEL', 'MALLIQUINGA LLUMIQUINGA', 3, '', '', 'O980992267', '', '', 'N'),
(319, 'MARÍA ZOILA', 'CATAGÑA USHIÑA', 2, '', '', '2787532', '', '', 'N'),
(320, 'MARIANA DE JESÚS', 'CUEVA CEVALLOS', 15, '', '', '2530151', '', '', 'N'),
(321, 'ANGELO RAMIRO', 'MANOSALVAS CUEVA', 3, '', '', '2530151', '', '', 'N'),
(322, 'ALEXANDER MANOSALVAS', 'CUEVA ', 3, '', '', '2530151', '', '', 'N'),
(323, 'SOFÍA ISABEL', 'MANOSALVAS CUEVA', 41, '', '', '2530151', '', '', 'N'),
(324, 'GLORIA INÉS', 'MANOSALVAS ARIAS', 20, '', '', '2530151', '', '', 'N'),
(325, 'VÍCTOR EMILIO', 'LUDEÑA CUEVA', 10, '', '', '2530151', '', '', 'N'),
(326, 'GERMÁN RODRIGO', 'MANOSALVAS ARIAS', 19, '', '', '2530151', '', '', 'N'),
(327, 'JOSEFINA CUEVA', 'CEVALLOS ', 28, '', '', '2530151', '', '', 'N'),
(328, 'MARCO ANICETO', 'CHANGO ', 12, '', '', '2530151', '', '', 'N'),
(329, 'MIKAELA ROSIBEL', 'GUZMÁN MOROCHO', 37, '', '', 'O967378926', '', '', 'N'),
(330, 'PAULINA ELIZABETH', 'MANTILLA CHITO', 20, '', '', 'O993803415', '', '', 'N'),
(331, 'PAMELA DE LOS ÁNGELES', 'MANTILLA CHITO', 20, '', '', '', '', '', 'N'),
(332, 'DANIEL CARRILLO', ' ', 12, '', '', '', '', '', 'N'),
(333, 'ROCÍO ERAZO', ' ', 22, '', '', '', '', '', 'N'),
(334, 'GUADALUPE ERAZO', ' ', 22, '', '', '', '', '', 'N'),
(335, 'MARTHA CHITO', 'TACURI ', 23, '', '', '', '', '', 'N'),
(336, 'BLANCA MANTILLA', ' ', 9, '', '', '', '', '', 'N'),
(337, 'MARCELA LÓPEZ', ' ', 22, '', '', '', '', '', 'N'),
(338, 'ROSA MARÍA', 'NOEMÍ VÁSQUEZ', 2, '', '', 'O993126270', '', '', 'N'),
(339, 'SANDRA MARITZA', 'MENESES VÁSQUEZ', 20, '', '', 'O983404353', '', '', 'N'),
(340, 'MARÍA CHELA', 'MÉNDEZ GUDIÑO', 29, '', '', '2498945', '', '', 'N'),
(341, 'RAMIRO PADILLA', ' ', 30, '', '', '2498945', '', '', 'N'),
(342, 'LUIS ENRIQUE', 'MENESES GONZAGA', 1, '', '', 'O995676170', '', '', 'N'),
(343, 'LIGIA ELENA', 'CHALA MÉNDEZ', 28, '', '', '2498945', '', '', 'N'),
(344, 'DALILA TADEO', ' ', 11, '', '', '2498945', '', '', 'N'),
(345, 'HERNÁN PRECIADO', 'MENESES ', 10, '', '', 'O983404353', '', '', 'N'),
(346, 'AIDE ELIZABETH', 'PALACIOS VÁSQUEZ', 20, '', '', 'O985150322', '', '', 'N'),
(347, 'BELLA NARDA', 'MARQUEZ LUDEÑA', 15, '', '', 'O992507269', '', '', 'N'),
(348, 'EDISON FERNANDO', 'MINANGO MÁRQUEZ', 3, '', '', '3016458', '', '', 'N'),
(349, 'JHON JAIRO', 'MINANGO MÁRQUEZ', 3, '', '', '3016458', '', '', 'N'),
(350, 'KATERIN MISHEL', 'MINANGO MÁRQUEZ', 4, '', '', '3016458', '', '', 'N'),
(351, 'PAOLO JOSUE', 'MINANGO MÁRQUEZ', 3, '', '', '3016458', '', '', 'N'),
(352, 'OLGA ENIT', 'LUDEÑA ARELLANO', 29, '', '', '3016458', '', '', 'N'),
(353, 'ANDREA CORTEZ', ' ', 14, '', '', '3016458', '', '', 'N'),
(354, 'GEOVANA TIRADO', ' ', 14, '', '', '3016458', '', '', 'N'),
(355, 'CRISTIAN RAMÍREZ', ' ', 21, '', '', '3016458', '', '', 'N'),
(356, 'FANNY FAJARDO', 'FAJARDO ', 15, '', '', '32804316', '', '', 'N'),
(357, 'CRISTIAN ANTONIO', 'MOSCOSO FAJARDO', 3, '', '', '32804316', '', '', 'N'),
(358, 'VÍCTOR ANDRÉS', 'MOSCOSO FAJARDO', 3, '', '', '32804316', '', '', 'N'),
(359, 'NELLY MAGDALENA', 'MOSCOSO BARRERA', 20, '', '', '32803710', '', '', 'N'),
(360, 'ESMERALDA DE JESÚS', 'MOSCOSO BARRERA', 20, '', '', '32803710', '', '', 'N'),
(361, 'PAULINA SALOME', 'QUINTANA MOSCOSO', 11, '', '', '32803710', '', '', 'N'),
(362, 'JULIO EDWIN', 'QUINTANA JÁCOME', 12, '', '', '32803710', '', '', 'N'),
(363, 'CARLOS ANTONIO', 'RODRÍGUEZ CORAL', 12, '', '', '32803710', '', '', 'N'),
(364, 'MISHEL ESTEFANIA', 'QUINTANA MOSCOSO', 11, '', '', '32804316', '', '', 'N'),
(365, 'SILVIA ESPERANZA', 'PIN CABEZAS', 37, '', '', 'O984909822', '', '', 'N'),
(366, 'NICOLE KATERINE', 'MULLO PIN', 4, '', '', '', '', '', 'N'),
(367, 'MARÍA TERESA', 'UYANA VELOZ', 2, '', '', '', '', '', 'N'),
(368, 'JOSÉ OCTAVIO', 'MULLO TUTILLO', 1, '', '', '', '', '', 'N'),
(369, 'MARTHA CABEZAS', 'GUALOTO ', 29, '', '', '', '', '', 'N'),
(370, 'JORGE WASHINGTON', 'PIN ', 30, '', '', '', '', '', 'N'),
(371, 'GUADALUPE ERMIÑA', 'VELOZ ', 23, '', '', '', '', '', 'N'),
(372, 'MARIANA MULLO', 'TUTILLO ', 23, '', '', '', '', '', 'N'),
(373, 'RAÚL PINTO', ' ', 7, '', '', '', '', '', 'N'),
(374, 'ALBA TERESA', 'BORJA ENRÍQUEZ', 37, '', '', '', '', '', 'N'),
(375, 'GUIOCONDA NOEMÍ', 'VENEGAS MARTÍNEZ', 2, '', '', 'O983555064', '', '', 'N'),
(376, 'CRISTOPHER DANIEL', 'NAVAS BORJA', 3, '', '', '', '', '', 'N'),
(377, 'NATALY YADIRA', 'LÓPEZ VENEGAS', 20, '', '', '', '', '', 'N'),
(378, 'MARIUXI AMPARITO', 'LAZ SALTOS', 22, '', '', '', '', '', 'N'),
(379, 'JUANA NATIVIDAD', 'PAVÓN CHALA', 2, '', '', 'O997692772', '', '', 'N'),
(380, 'ARNULFO SIGIFREDO', 'CAMPOS GONZALES', 42, '', '', '', '', '', 'N'),
(381, 'OMAR DAVID', 'CAMPOS PAVÓN', 19, '', '', '', '', '', 'N'),
(382, 'ARIANA VALENTINA', 'PAVÓN MÉNDEZ', 4, '', '', '', '', '', 'N'),
(383, 'CLEMENTINA CHALA', 'DE LA CRUZ ', 24, '', '', '', '', '', 'N'),
(384, 'OLIVA PAVÓN', 'CHALA ', 23, '', '', 'O994797217', '', '', 'N'),
(385, 'ANA ALEXANDRA', 'MÉNDEZ GONZALO', 26, '', '', '', '', '', 'N'),
(386, 'MARIANA DE LOURDES', 'PAVÓN CHALA', 23, '', '', '', '', '', 'N'),
(387, 'MARÍA REBECA', 'MÉNDEZ VEGA', 37, '', '', 'O990794870', '', '', 'N'),
(388, 'MARÍA INÉS', 'TREJO CHARCOPA', 2, '', '', '62705285', '', '', 'N'),
(389, 'ELENA ELIZABETH', 'PÉREZ TREJO', 20, '', '', '62705285', '', '', 'N'),
(390, 'NELLY MIREYA', 'PÉREZ TREJO', 20, '', '', '62705285', '', '', 'N'),
(391, 'FRANKLIN EDUARDO', 'PÉREZ TREJO', 19, '', '', '62705285', '', '', 'N'),
(392, 'FRANKLIN AGUSTIN', 'PÉREZ FARIAS', 1, '', '', '62705285', '', '', 'N'),
(393, 'GLORIA JOSEFINA', 'ROJANO QUINTUÑA', 37, '', '', 'O983293865', '', '', 'N'),
(394, 'LUIS PATRICIO', 'PILAQUINGA LLUGCHA', 1, '', '', 'O995776677', '', '', 'N'),
(395, 'MARÍA TERESA', 'SIGCHA CHUSIN', 2, '', '', 'O983120320', '', '', 'N'),
(396, 'ESTEBAN PATRICIO', 'PILAQUINGA ROJANO', 3, '', '', '', '', '', 'N'),
(397, 'KERLY NICOLE', 'PILAQUINGA ROJANO', 4, '', '', '', '', '', 'N'),
(398, 'MAYERLI JAQUELINE', 'PILAQUINGA ROJANO', 4, '', '', '', '', '', 'N'),
(399, 'JENNY PAOLA', 'PILAQUINGA SIGCHA', 20, '', '', 'O969504170', '', '', 'N'),
(400, 'GLORIA FERNANDA', 'PILAQUINGA SIGCHA', 20, '', '', 'O983078024', '', '', 'N'),
(401, 'JULIO ALFREDO', 'CALLE MORA', 12, '', '', 'O987778257', '', '', 'N'),
(402, 'LIBER QUINTERO', 'MEDINA ', 1, '', '', '', '', '', 'N'),
(403, 'SAMARI ARROYO', 'SUAREZ ', 20, '', '', '', '', '', 'N'),
(404, 'LEANDRO ARROYO', 'SUAREZ ', 19, '', '', '', '', '', 'N'),
(405, 'JEAN PIERE', 'ARROYO SUAREZ', 19, '', '', '', '', '', 'N'),
(406, 'CONY QUINTERO', 'NARANJO ', 4, '', '', '', '', '', 'N'),
(407, 'CHENOOA QUINTERO', 'NARANJO ', 4, '', '', '', '', '', 'N'),
(408, 'JOHANA NARANJO', 'TELLO ', 26, '', '', '', '', '', 'N'),
(409, 'PAOLA AYOVI', 'NAZARENO ', 22, '', '', '', '', '', 'N'),
(410, 'AURIA BATALLA', 'CAÑOLA ', 22, '', '', '', '', '', 'N'),
(411, 'CINTHIA CATHERINE', 'LOOR HERMIDA', 37, '', '', 'O986663600', '', '', 'N'),
(412, 'ALISSON DAYLIN', 'RAMÓN LOOR', 4, '', '', 'O986663600', '', '', 'N'),
(413, 'MARIANA DE JESÚS', 'CHÁVEZ VARELA', 2, '', '', 'O990541599', '', '', 'N'),
(414, 'LISTON ROSALINO', 'RAMÓN GUANGA', 1, '', '', 'O993846058', '', '', 'N'),
(415, 'KEVIN LISTON', 'RAMÓN CHÁVEZ', 19, '', '', 'O969428054', '', '', 'N'),
(416, 'JORDAN STEVEN', 'RAMON CHÁVEZ', 19, '', '', 'O990541599', '', '', 'N'),
(417, 'TERESA EPIFANIA', 'HERMIDA LUCAS', 29, '', '', 'O985871465', '', '', 'N'),
(418, 'CHARVEL RONALD', 'SUAREZ ROMERO', 30, '', '', 'O992587965', '', '', 'N'),
(419, 'JOSELIN MONSERRATHE', 'HERMIDA CORDOVA', 28, '', '', 'O988577259', '', '', 'N'),
(420, 'TERESA JAQUELINE', 'LUZARDO MARCILLO', 15, '', '', '2294950', '', '', 'N'),
(421, 'JEAN PIERE', 'RUIZ LUZARDO', 3, '', '', '2294950', '', '', 'N'),
(422, 'HILDA ROSARIO', 'LLERENA ZAPATA', 2, '', '', '2294950', '', '', 'N'),
(423, 'EUGENIA DEL ROSARIO', 'RUIZ LLERENA', 20, '', '', '', '', '', 'N'),
(424, 'MARÍA TERESA', 'RUIZ LLERENA', 20, '', '', '2800505', '', '', 'N'),
(425, 'LUIS ARNULFO', 'RUIZ LLERENA', 19, '', '', '2493232', '', '', 'N'),
(426, 'CARMEN ELIZABETH', 'RUIZ LLERENA', 20, '', '', '2294950', '', '', 'N'),
(427, 'TANIA ALEXANDRA', 'FIALLOS ACUÑA', 9, '', '', '3301806', '', '', 'N'),
(428, 'OSWALDO MARCELO', 'LONDOÑO MOLINA', 8, '', '', '2432291', '', '', 'N'),
(429, 'ELIAS RAMÓN', 'SALAZAR ', 1, '', '', '', '', '', 'N'),
(430, 'MARÍA ROSA', 'GUAIGUA ', 2, '', '', '', '', '', 'N'),
(431, 'LIDIA MARISOL', 'SALAZAR GUAIGUA', 20, '', '', '', '', '', 'N'),
(432, 'NORMA LUCIA', 'SALAZAR GUAIGUA', 20, '', '', '', '', '', 'N'),
(433, 'MAYRA LILIANA', 'SALAZAR GUIGUA', 20, '', '', '', '', '', 'N'),
(434, 'VÍCTOR HUGO', 'QUILLUPANGUII ', 12, '', '', '', '', '', 'N'),
(435, 'EDISON RAMIRO', 'CHAFLA ', 12, '', '', '', '', '', 'N'),
(436, 'VICENTE DARWIN', 'NAVARRO ', 12, '', '', '', '', '', 'N'),
(437, 'XAVIER ALEJANDRO', 'SALAZAR CÁRDENAS', 3, '', '', '', '', '', 'N'),
(438, 'TAMAYO PINTO', 'PAOLA TATIANA', 15, '', '', '3132536', '', '', 'N'),
(439, 'GALO HERNÁN', 'SALAZAR ', 1, '', '', '2299964', '', '', 'N'),
(440, 'MARTHA AUDELIA', 'NARVÁEZ TAMAYO', 2, '', '', '2299964', '', '', 'N'),
(441, 'PAOLA TATIANA', 'TAMAYO PINTO', 15, '', '', '3132536', '', '', 'N'),
(442, 'KEVYN HERNÁN', 'SALAZAR TAMAYO', 3, '', '', '3132536', '', '', 'N'),
(443, 'KERLY PAOLA', 'SALAZAR TAMAYO', 4, '', '', '3132536', '', '', 'N'),
(444, 'PAUL SANTIAGO', 'SALAZAR NARVÁEZ', 19, '', '', '', '', '', 'N'),
(445, 'JESSICA GALEANO', 'CADENA ', 28, '', '', '', '', '', 'N'),
(446, 'CARMEN PINTO', 'URBINA ', 29, '', '', '3132536', '', '', 'N'),
(447, 'KATHY ALEXANDRA', 'SALAZAR NARVÁEZ', 20, '', '', '', '', '', 'N'),
(448, 'BLANCA BRENDA', 'ALVARADO JIMÉNEZ', 15, '', '', 'O987034838', '', '', 'N'),
(449, 'CARLOS ANÍBAL', 'SÁNCHEZ MASAQUIZA', 1, '', '', '', '', '', 'N'),
(450, 'HILDA LUCRECIA', 'CHILIQUINGA SUAREZ', 2, '', '', '', '', '', 'N'),
(451, 'TAMARA SÁNCHEZ', 'ALVARADO ', 4, '', '', '', '', '', 'N'),
(452, 'DANIELA SÁNCHEZ', 'ALVARADO ', 4, '', '', '', '', '', 'N'),
(453, 'NAOMI SÁNCHEZ', 'ALVARADO ', 4, '', '', '', '', '', 'N'),
(454, 'CARLOS ANIBAL', 'SANCHEZ CHILIQUINGA', 19, '', '', '', '', '', 'N'),
(455, 'JAVIER BASTIDAS', ' ', 8, '', '', '', '', '', 'N'),
(456, 'GUADALUPE LEMA', 'CHILIQUINGA ', 9, '', '', '', '', '', 'N'),
(457, 'JANNETTE MONTALVO', 'FLORES ', 37, '', '', '', '', '', 'N'),
(458, 'CAMILA SÁNCHEZ', 'RIOFRIO ', 4, '', '', '', '', '', 'N'),
(459, 'MARCOS ARELLEYRA', ' ', 13, '', '', '', '', '', 'N'),
(460, 'LUZ PONCE', 'ARTEAGA ', 22, '', '', '', '', '', 'N'),
(461, 'RODRIGO LASSO', 'DONOSO ', 21, '', '', '', '', '', 'N'),
(462, 'PATRICIO VILLACRES', ' ', 21, '', '', '', '', '', 'N'),
(463, 'MARÍA LUZ', 'RIOFRIO ', 22, '', '', '', '', '', 'N'),
(464, 'JENNY GUERRERO', ' ', 22, '', '', '', '', '', 'N'),
(465, 'FABRICIO MONCAYO', ' ', 21, '', '', '', '', '', 'N'),
(466, 'MONICA PAZMIÑO', 'AUCANCELA ', 15, '', '', 'O987025081', '', '', 'N'),
(467, 'DANIELA BRIGITTE', 'SOCASI AUCANCELA', 4, '', '', 'O967997047', '', '', 'N'),
(468, 'ANAHI KAREN', 'SOCASI PAZMIÑO', 4, '', '', '2964203', '', '', 'N'),
(469, 'NAOMI VALENTINA', 'SOCASI PAZMIÑO', 4, '', '', '2964203', '', '', 'N'),
(470, 'MANUEL LUIS', 'MORANTE SOCASI', 1, '', '', '2964203', '', '', 'N'),
(471, 'MARIA LUISA', 'CUACES AGUIRRE', 2, '', '', 'O998435259', '', '', 'N'),
(472, 'MIRIAM DEL SOCORRO', 'CAUCES AGUIRRE', 20, '', '', 'O981599236', '', '', 'N'),
(473, 'JULIAN ESPINOZA', 'SOTO ', 21, '', '', 'O983960987', '', '', 'N'),
(474, 'PAOLA RAQUEL', 'CARRILLO HINCHALA', 22, '', '', 'O983960987', '', '', 'N'),
(475, 'JENNIFER GABRIELA', 'LÓPEZ MORALES', 37, '', '', 'O983354585', '', '', 'N'),
(476, 'SARA MARÍA', 'FLORES CASTELLANOS', 2, '', '', '2823648', '', '', 'N'),
(477, 'JOSÉ ALEJANDRO', 'SUAREZ GONZALES', 1, '', '', 'O988068962', '', '', 'N'),
(478, 'LIDIA GRISELDA', 'SUAREZ FLORES', 20, '', '', 'O984550117', '', '', 'N'),
(479, 'EDWIN FERNANDO', 'SUAREZ FLORES', 19, '', '', 'O995617836', '', '', 'N'),
(480, 'MIRIAN GEOVANA', 'SUAREZ FLORES', 20, '', '', '2821480', '', '', 'N'),
(481, 'ERNESTO RAMIRO', 'TRUJILLO CARVAJAL', 12, '', '', 'O998183263', '', '', 'N'),
(482, 'EDWIN NULBERTO', 'SUAREZ MOLINA', 12, '', '', '22821480', '', '', 'N'),
(483, 'ZULMA JEANETH', 'BENAVIDES PULLAS', 28, '', '', 'O999143196', '', '', 'N'),
(484, 'KARINA PAOLA', 'YUGCHA CAJAS', 15, '', '', 'O988299525', '', '', 'N'),
(485, 'CESAR ROGELIO', 'TAPIA VILLAGOMEZ', 1, '', '', '23680193', '', '', 'N'),
(486, 'ROSARIO AMAGUAÑA', 'QUILLUPANGUI ', 2, '', '', '23680193', '', '', 'N'),
(487, 'KARINA PAOLA', 'YUGCHA CAJAS', 15, '', '', 'O988299525', '', '', 'N'),
(488, 'SANDRA SONIA', 'JACOME AMGUAÑA', 20, '', '', '23680193', '', '', 'N'),
(489, 'WILSON PATRICIO', 'TAPIA AMGUAÑA', 19, '', '', 'O985109896', '', '', 'N'),
(490, 'RUTH FONSECA', ' ', 28, '', '', 'O985109896', '', '', 'N'),
(491, 'GABRIELA TAPIA', ' ', 11, '', '', 'O985109896', '', '', 'N'),
(492, 'ALEJANDRA TAPIA', ' ', 11, '', '', 'O985109896', '', '', 'N'),
(493, 'CRISTOPHER ALEJANDRO', 'TAPIA YUGCHA', 3, '', '', 'O988299525', '', '', 'N'),
(494, 'LUIS ENRIQUE', 'TIPANTUÑA SARABIO', 1, '', '', '2974544', '', '', 'N'),
(495, 'ANA YOLANDA', 'CHASIQUIZA A.', 2, '', '', '2974544', '', '', 'N'),
(496, 'BERTHA MAGDALENA', 'PÉREZ GUALA', 15, '', '', 'O986314920', '', '', 'N'),
(497, 'ROSALIA GUAITA', ' ', 2, '', '', '2639284', '', '', 'N'),
(498, 'DAVID TRAVEZ', ' ', 3, '', '', '2639284', '', '', 'N'),
(499, 'AMANDA TRAVEZ', ' ', 19, '', '', '2639284', '', '', 'N'),
(500, 'ADRIANA TRAVEZ', ' ', 20, '', '', '2639284', '', '', 'N'),
(501, 'JEFERSON RUANO', ' ', 12, '', '', '2639284', '', '', 'N'),
(502, 'JORDY RUANO', ' ', 10, '', '', '2639284', '', '', 'N'),
(503, 'JASON TRAVEZ', ' ', 10, '', '', '2639284', '', '', 'N'),
(504, 'ROGELIA TAMAYO', ' ', 24, '', '', '2639284', '', '', 'N'),
(505, 'JULIA FLORES', ' ', 23, '', '', 'O983116403', '', '', 'N'),
(506, 'ELOISA MORALES', ' ', 23, '', '', 'O979603241', '', '', 'N'),
(507, 'MARIUXI PAOLA', 'QUIJIJE M.', 15, '', '', 'O982536099', '', '', 'N'),
(508, 'FRANKLIN JHORELL', 'ULLOA QUIJIJE', 3, '', '', '', '', '', 'N'),
(509, 'STEPHANY DAYANE', 'ULLOA QUIJIJE', 4, '', '', '', '', '', 'N'),
(510, 'MERCY ASTRID', 'SALAZAR ', 20, '', '', 'O993167592', '', '', 'N'),
(511, 'FREDDY ENRIQUE', 'SALAZAR ', 19, '', '', 'O997336152', '', '', 'N'),
(512, 'NELSON EUGENIO', 'SALAZAR ', 19, '', '', 'O989353242', '', '', 'N'),
(513, 'EDWIN RANIO', 'SALAZAR ', 19, '', '', 'O982559036', '', '', 'N'),
(514, 'JOHANA SOLÍS', ' ', 22, '', '', '', '', '', 'N'),
(515, 'JEANETH ALVARADO', 'GUERRERO ', 22, '', '', '', '', '', 'N'),
(516, 'LUIS ENRIQUE', 'URBINA QUINTANA', 1, '', '', '3400736', '', '', 'N'),
(517, 'ADRIANA LUCIA', 'VIVANCO CÁRDENAS', 2, '', '', '3400736', '', '', 'N'),
(518, 'ADRIANA MARGARITA', 'URBINA VIVANCO', 20, '', '', '3400736', '', '', 'N'),
(519, 'ANFRE LUCIA', 'URBINA VIVANCO', 20, '', '', '3400736', '', '', 'N'),
(520, 'DALILA VERONICA', 'SANTILLAN MELENDEZ', 27, '', '', 'O969387493', '', '', 'N'),
(521, 'JORGE ALFREDO', 'ARIAS URBINA', 8, '', '', 'O987472541', '', '', 'N'),
(522, 'DEYSI PIEDAD', 'VALAREZO ', 4, '', '', 'O984430168', '', '', 'N'),
(523, 'MARTHA YANETH', 'VALAREZO ', 4, '', '', 'O992869809', '', '', 'N'),
(524, 'YOFRE DURVAL', 'VALAREZO ', 3, '', '', 'O984371588', '', '', 'N'),
(525, 'FAUSTO GILBERTO', 'VALAREZO ', 3, '', '', 'O983152847', '', '', 'N'),
(526, 'LUGARDA MAGDALENA', 'VALAREZO ', 4, '', '', 'O997641350', '', '', 'N'),
(527, 'MARITZA LUCIA', 'VALAREZO ', 4, '', '', 'O997641350', '', '', 'N'),
(528, 'KEYLA ABIGAIL', 'ROJAS ', 41, '', '', 'O992869809', '', '', 'N'),
(529, 'KATERINE GALVAN', ' ', 41, '', '', 'O984430168', '', '', 'N'),
(530, 'LUCIA GRIMANEZA', 'VALAREZO ', 15, '', '', 'O997641350', '', '', 'N'),
(531, 'LAURA MARÍA', 'VINAIXA ', 15, '', '', '', '', '', 'N'),
(532, 'JUSTIN VÁSQUEZ', 'CUEVA ', 21, '', '', '', '', '', 'N'),
(533, 'ROCIO DE', 'LOURDES CUEVA', 22, '', '', '', '', '', 'N'),
(534, 'HERNÁN ULLOA', ' ', 17, '', '', '', '', '', 'N'),
(535, 'FANY ANBALUDI', ' ', 22, '', '', '', '', '', 'N'),
(536, 'CECIBEL GUDIÑO', ' ', 22, '', '', '', '', '', 'N'),
(537, 'JOSE LUIS', 'MIRANDA ', 7, '', '', '', '', '', 'N'),
(538, 'RONALD JAIRO', 'VÁSQUEZ ', 21, '', '', '', '', '', 'N'),
(539, 'BARBARA BIRMANIA', ' ', 22, '', '', '', '', '', 'N'),
(540, 'JAQUELINE QUICENO', 'CANO ', 22, '', '', '', '', '', 'N'),
(541, 'MÓNICA VALERIA', 'PULIDO BRAVO', 15, '', '', 'O998245518', '', '', 'N'),
(542, 'MARCO ANTONIO', 'VILLACRES PULIDO', 3, '', '', '', '', '', 'N'),
(543, 'JESSIE VILLACRES', 'PULIDO ', 4, '', '', '', '', '', 'N'),
(544, 'MARIO MORALES', 'ZAMBRANO ', 17, '', '', '', '', '', 'N'),
(545, 'MARCO VILLACRES', 'OROZCO ', 1, '', '', '', '', '', 'N'),
(546, 'MATILDE ASCENCIO', 'LUCAS ', 2, '', '', '', '', '', 'N'),
(547, 'JONATHAN VILLACRES', 'ASCENCIO ', 19, '', '', '', '', '', 'N'),
(548, 'ALEXANDRA VILLACRES', 'ASCENCIO ', 20, '', '', '', '', '', 'N'),
(549, 'ANTONIO PULIDO', 'FALCONI ', 30, '', '', '', '', '', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_ppl` (
  `VIP_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitanten-PPL',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `VIP_FECHA` date NOT NULL COMMENT 'Fecha del Visitanten-PPL',
  PRIMARY KEY (`VIP_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_visitante_ppl`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Las sanciones que obtiene un visitante' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_visitante_sancion`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registro de Visitas realizadas' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sys_visitas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control1`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control1` AS select `p`.`PPL_COD` AS `PPL_COD`,`p`.`PAB_COD` AS `PAB_COD`,`pa`.`PAB_DESCRIPCION` AS `PAB_DESCRIPCION`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (`bulkenco_sysecure`.`sys_ppl` `p` join `bulkenco_sysecure`.`sys_pabellones` `pa` on((`pa`.`PAB_COD` = `p`.`PAB_COD`))) where (`p`.`PPL_ESTADO` = 'A');

--
-- Volcar la base de datos para la tabla `sys_vw_control1`
--

INSERT INTO `sys_vw_control1` (`PPL_COD`, `PAB_COD`, `PAB_DESCRIPCION`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_IMG`, `PPL_ESTADO`) VALUES
(1, 1, 'A', NULL, 'FABIÁN GUSTAVO', 'ARCOS PEPINOS', '1706664024', '', 'A'),
(3, 1, 'A', NULL, 'HAROLLD SMITH', 'BARREZUETA TORRES', '1716718372', '', 'A'),
(5, 1, 'A', NULL, 'HUGO MARCELO', 'BONIFAZ AUCANCELA', '604001313', '', 'A'),
(6, 1, 'A', NULL, 'EMILIO SEGUNDO', 'BOWEN BOLAÑOS', '1307909752', '', 'A'),
(7, 1, 'A', NULL, 'VLADIMIR ALFREDO', 'CAGUA VINUEZA', '803110071', '', 'A'),
(8, 1, 'A', NULL, 'MIGUEL', 'CAMACHO MUÑOZ', '80245604', '', 'A'),
(14, 1, 'A', NULL, 'DARWIN STALIN', 'CONDOY ROSERO', '1711551174', '', 'A'),
(16, 1, 'A', NULL, 'VÍCTOR MANUEL ', 'ENRÍQUEZ CABRERA', '1711966935', '', 'A'),
(28, 1, 'A', NULL, 'EDISON ARNULFO', 'INTRIAGO CARRANZA', '802225441', '', 'A'),
(31, 1, 'A', NULL, 'JOFRE DAVID ', 'LASCANO MONTALVO', '1710443688', '', 'A'),
(32, 1, 'A', NULL, 'OSWALDO GIOVANNI', 'LASO ALMEIDA', '1715450456', '', 'A'),
(33, 1, 'A', NULL, 'JULIO JAVIER', 'LLUMIQUINGA MENESES', '1721188280', '', 'A'),
(41, 1, 'A', NULL, 'LUIS LEONARDO', 'MANTILLA CHITO', '060414760-3', '', 'A'),
(42, 1, 'A', NULL, 'EDWIN FERNANDO', 'MENESES VÁSQUEZ', '171757047-5', '', 'A'),
(45, 1, 'A', NULL, 'EDUARDO ILARIO', 'MULLO UYANA', '171328476-6', '', 'A'),
(47, 1, 'A', NULL, 'KLEVER ESTEBAN', 'PAVÓN CHALA', '171623318-2', '', 'A'),
(49, 1, 'A', NULL, 'EDWIN PATRICIO', 'PILAQUINGA SIGCHA', '171844952-1', '', 'A'),
(54, 1, 'A', NULL, 'HERNÁN PATRICIO', 'SALAZAR NARVÁEZ', '050182754-7', '', 'A'),
(56, 1, 'A', NULL, 'VICENTE HUMBERTO', 'SÁNCHEZ SILVA', 'O101032266', '', 'A'),
(58, 1, 'A', NULL, 'DARWIN ALEJANDRO', 'SUAREZ FLORES', '1710331271', '', 'A'),
(60, 1, 'A', NULL, 'LUIS HERNÁN', 'TIPANTUÑA CHASIQUIZA', '502940406', '', 'A'),
(62, 1, 'A', NULL, 'JOSÉ FRANKLIN', 'ULLOA SALAZAR', '112923552', '', 'A'),
(64, 1, 'A', NULL, 'FAUSTO JUVENTINO', 'VALAREZO VIVANCO', '1101046868', '', 'A'),
(67, 1, 'A', NULL, 'DOUGLAS AUGUSTO', 'YÉPEZ MOGRO', '501827109', '', 'A'),
(4, 2, 'B', NULL, 'HOMERO AGAPITO', 'BERMEO ALCIVAR', '1301453682', '', 'A'),
(9, 2, 'B', NULL, 'GALO ALFREDO', 'CARRERA VIZUETA', '1707502355', '', 'A'),
(27, 2, 'B', NULL, 'DIGAR HUMBERTO', 'IÑIGUEZ TUFIÑO', '1710439215', '', 'A'),
(30, 2, 'B', NULL, 'JESÚS PAUL ', 'JETACAMA SIMBAÑA', '1719506238', '', 'A'),
(34, 2, 'B', NULL, 'WILSON MONSERRATE', 'LOOR CÓRDOVA', '1310007289', '', 'A'),
(35, 2, 'B', NULL, 'DIEGO ARMANDO', 'LOOR VINUEZA', '1309691390', '', 'A'),
(50, 2, 'B', NULL, 'LIBER MAURICIO', 'QUINTERO SUAREZ', '080234239-4', '', 'A'),
(52, 2, 'B', NULL, 'BOLÍVAR MARCELO', 'RUIZ LLERENA', '170635656-3', '', 'A'),
(61, 2, 'B', NULL, 'EDISON PATRICIO', 'TRAVEZ GUAITA', '1710447119', '', 'A'),
(11, 3, 'C', NULL, 'JOSÉ KLEVER ', 'CATOTA CAIZA', '1714128079', '', 'A'),
(13, 3, 'C', NULL, 'LUIS GONZALO', 'CEVALLOS ROSERO', '400946372', '', 'A'),
(22, 3, 'C', NULL, 'SEGUNDO ARQUIMIDES', 'GUAMÁN SIMALUISA', '502655236', '', 'A'),
(23, 3, 'C', NULL, 'JORGE ERNESTO', 'GUANOLUISA CURICHO', '502225618', '', 'A'),
(24, 3, 'C', NULL, 'LUIS ALFREDO', 'GUANOTASIG OÑA', '502251713', '', 'A'),
(25, 3, 'C', NULL, 'PEDRO', 'GUZMÁN GARCÍA', '', '', 'A'),
(26, 3, 'C', NULL, 'ERWIN ESTUARDO', 'IBARRA ALAVA', '1203366289', '', 'A'),
(29, 3, 'C', NULL, 'LORGIO MARCELO', 'INTRIAGO GARCÍA', '1312084617', '', 'A'),
(36, 3, 'C', NULL, 'JAIRO LEONEL', 'MAFLA ANDRADE', 'O401407838', '', 'A'),
(37, 3, 'C', NULL, 'RICARDO MARIANO', 'LLULLUMA ÁLVAREZ', '1712774254', '', 'A'),
(40, 3, 'C', NULL, 'HÉCTOR RAMIRO', 'MANOSALVAS ARIAS', '170473959-6', '', 'A'),
(44, 3, 'C', NULL, 'ANÍBAL ANTONIO', 'MOSCOSO BARRERA', '050166588-9', '', 'A'),
(51, 3, 'C', NULL, 'FREDDY JAVIER', 'RAMÓN CHÁVEZ', '092692733-6', '', 'A'),
(55, 3, 'C', NULL, 'LUIS ÁNGEL', 'SÁNCHEZ CHILIQUINGA', '1802278463', '', 'A'),
(57, 3, 'C', NULL, 'LUIS ROBERTO', 'SOCASI AGUIRRE', '1709894941', '', 'A'),
(59, 3, 'C', NULL, 'CRISTHIAN XAVIER', 'TAPIA AMAGUAÑA', '1723174973', '', 'A'),
(63, 3, 'C', NULL, 'LEONARDO RAFAEL', 'URBINA VIVANCO', '1804315875', '', 'A'),
(10, 4, 'D', NULL, 'VINICIO RICARDO', 'CARVAJAL CASTILLO', '502313612', '', 'A'),
(12, 4, 'D', NULL, 'DIEGO ARMANDO', 'CEPEDA ARÉVALO', '1603603580', '', 'A'),
(20, 4, 'D', NULL, 'HÉCTOR ADOLFO', 'FRUTO MÁRQUEZ', '1203601586', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control2`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control2` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`HOR_COD` AS `HOR_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vs`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (((`bulkenco_sysecure`.`sys_visitante` `vs` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp`) join `bulkenco_sysecure`.`sys_control` `c`) join `bulkenco_sysecure`.`sys_ppl` `p`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 1) and (`c`.`CON_ESTADO` = 'A'));

--
-- Volcar la base de datos para la tabla `sys_vw_control2`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control3`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control3` AS select `c`.`CON_COD` AS `CON_COD`,`c`.`CON_ESTADO` AS `CON_ESTADO`,`c`.`VIP_COD` AS `VIP_COD`,`c`.`CON_FECHA` AS `CON_FECHA`,`c`.`GAR_COD` AS `GAR_COD`,`c`.`HOR_COD` AS `HOR_COD`,`vs`.`VIS_COD` AS `VIS_COD`,`vs`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vs`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vs`.`PAR_COD` AS `PAR_COD`,`vs`.`VIS_CEDULA` AS `VIS_CEDULA`,`vs`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vs`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vs`.`VIS_CORREO` AS `VIS_CORREO`,`vs`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vs`.`VIS_ESTADO` AS `VIS_ESTADO`,`p`.`PPL_COD` AS `PPL_COD`,`p`.`CEL_COD` AS `CEL_COD`,`p`.`PPL_NOMBRE` AS `PPL_NOMBRE`,`p`.`PPL_APELLIDO` AS `PPL_APELLIDO`,`p`.`PPL_CEDULA` AS `PPL_CEDULA`,`p`.`PPL_IMG` AS `PPL_IMG`,`p`.`PPL_ESTADO` AS `PPL_ESTADO` from (((`bulkenco_sysecure`.`sys_visitante` `vs` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp`) join `bulkenco_sysecure`.`sys_control` `c`) join `bulkenco_sysecure`.`sys_ppl` `p`) where ((`vs`.`VIS_COD` = `vp`.`VIS_COD`) and (`c`.`VIP_COD` = `vp`.`VIP_COD`) and (`p`.`PPL_COD` = `vp`.`PPL_COD`) and (`c`.`GAR_COD` = 2) and (`c`.`CON_ESTADO` = 'O') and (`vs`.`VIS_ESTADO` = 'A'));

--
-- Volcar la base de datos para la tabla `sys_vw_control3`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_control4`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_control4` AS select `v`.`VISG_COD` AS `VISG_COD`,`v`.`PPL_COD` AS `PPL_COD`,`v`.`VIP_COD` AS `VIP_COD`,`v`.`HOR_COD` AS `HOR_COD`,`v`.`VISG_FECHA` AS `VISG_FECHA`,`v`.`VISG_HORA_INGRESO` AS `VISG_HORA_INGRESO`,`v`.`VISG_HORA_SALIDA` AS `VISG_HORA_SALIDA`,`v`.`VISG_TRANSCURRIDO` AS `VISG_TRANSCURRIDO`,`v`.`VISG_POSCHAR` AS `VISG_POSCHAR`,`v`.`VISG_POSNUM` AS `VISG_POSNUM`,`v`.`VISG_ESTADO` AS `VISG_ESTADO`,`vt`.`VIS_COD` AS `VIS_COD`,`vt`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`vt`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`vt`.`PAR_COD` AS `PAR_COD`,`vt`.`VIS_CEDULA` AS `VIS_CEDULA`,`vt`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`vt`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`vt`.`VIS_CORREO` AS `VIS_CORREO`,`vt`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`vt`.`VIS_ESTADO` AS `VIS_ESTADO` from ((`bulkenco_sysecure`.`sys_visitas` `v` join `bulkenco_sysecure`.`sys_visitante_ppl` `vp` on((`vp`.`VIP_COD` = `v`.`VIP_COD`))) join `bulkenco_sysecure`.`sys_visitante` `vt` on((`vt`.`VIS_COD` = `vp`.`VIS_COD`))) where ((`vt`.`VIS_ESTADO` = 'A') and (`v`.`VISG_ESTADO` = 'A'));

--
-- Volcar la base de datos para la tabla `sys_vw_control4`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_vw_sanciones`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bulkenco_sysecure`.`sys_vw_sanciones` AS select `v`.`VIS_COD` AS `VIS_COD`,`v`.`VIS_NOMBRE` AS `VIS_NOMBRE`,`v`.`VIS_APELLIDO` AS `VIS_APELLIDO`,`v`.`PAR_COD` AS `PAR_COD`,`v`.`VIS_CEDULA` AS `VIS_CEDULA`,`v`.`VIS_DIRECCION` AS `VIS_DIRECCION`,`v`.`VIS_TELEFONO` AS `VIS_TELEFONO`,`v`.`VIS_CORREO` AS `VIS_CORREO`,`v`.`VIS_IMAGEN` AS `VIS_IMAGEN`,`v`.`VIS_ESTADO` AS `VIS_ESTADO`,`vs`.`VSA_COD` AS `VSA_COD`,`vs`.`SAN_COD` AS `SAN_COD`,`vs`.`USU_COD` AS `USU_COD`,`vs`.`VSA_NOTA` AS `VSA_NOTA`,`vs`.`VSA_FECHA_INI` AS `VSA_FECHA_INI`,`vs`.`VSA_FECHA_FIN` AS `VSA_FECHA_FIN`,`s`.`TPS_COD` AS `TPS_COD`,`s`.`SAN_DESCRIPCION` AS `SAN_DESCRIPCION`,`s`.`SAN_TIEMPO` AS `SAN_TIEMPO`,`s`.`SAN_TIEMPO_DES` AS `SAN_TIEMPO_DES`,`ts`.`TPS_DESCRIPCION` AS `TPS_DESCRIPCION` from (((`bulkenco_sysecure`.`sys_visitante_sancion` `vs` join `bulkenco_sysecure`.`sys_visitante` `v`) join `bulkenco_sysecure`.`sys_tipo_sancion` `ts`) join `bulkenco_sysecure`.`sys_sanciones` `s`) where ((`v`.`VIS_COD` = `vs`.`VIS_COD`) and (`ts`.`TPS_COD` = `s`.`TPS_COD`) and (`vs`.`SAN_COD` = `s`.`SAN_COD`) and (`v`.`VIS_ESTADO` = 'S'));

--
-- Volcar la base de datos para la tabla `sys_vw_sanciones`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
