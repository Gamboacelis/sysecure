-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-08-2014 a las 19:47:35
-- Versión del servidor: 5.5.25a
-- Versión de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
  `ACC_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Acceso',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `CEN_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Centro',
  `ACC_FECHA` datetime NOT NULL COMMENT 'Fecha y Hora del Acceso',
  `ACC_IP` varchar(60) NOT NULL COMMENT 'Direccion Ip de la maquina desde la que Accesde',
  `ACC_EQUIPO` varchar(60) NOT NULL COMMENT 'Nombre del Equipo desde donde se Accede',
  PRIMARY KEY (`ACC_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de control de Accesos al Sistema' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_celdas`
--

CREATE TABLE IF NOT EXISTS `sys_celdas` (
  `CEL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la celda',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_DESCRPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la celda',
  PRIMARY KEY (`CEL_COD`),
  KEY `FK_REFERENCE_17` (`PAB_COD`)
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
  `CEN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Centro',
  `CIU_COD` int(11) NOT NULL COMMENT 'Codigo de la Ciudad',
  `CEN_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Centro',
  `CEN_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Centro',
  `CEN_TELEFONO` varchar(13) NOT NULL COMMENT 'Telefono del Centro',
  PRIMARY KEY (`CEN_COD`),
  KEY `FK_REFERENCE_8` (`CIU_COD`)
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
  `CIU_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Ciudad',
  `CIU_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion de la Ciudad',
  PRIMARY KEY (`CIU_COD`)
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
  `CON_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del Control',
  `GAR_COD` int(11) NOT NULL COMMENT 'Codigo de la garita',
  `VIP_COD` int(11) DEFAULT NULL COMMENT 'Codigo del Visitanten-PPL',
  `CON_FECHA` date NOT NULL COMMENT 'Fecha del Control',
  `CON_ESTADO` varchar(1) NOT NULL COMMENT 'A: Activo, I:inactivo',
  PRIMARY KEY (`CON_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sys_control`
--

INSERT INTO `sys_control` (`CON_COD`, `GAR_COD`, `VIP_COD`, `CON_FECHA`, `CON_ESTADO`) VALUES
(1, 1, 1, '2014-08-22', 'A');

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
  `GAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la garita',
  `GAR_DESCRIPCION` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Descripcion de la garita',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo de Usuario',
  `GAR_ESTADO` varchar(1) CHARACTER SET utf8 NOT NULL COMMENT 'Estado de la Garita',
  PRIMARY KEY (`GAR_COD`)
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
  `HIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Historial de cambios del PPL',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `PPL_COD` int(11) DEFAULT NULL COMMENT 'Codigo del PPL',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `HIS_FECHA` datetime NOT NULL COMMENT 'fecha de Cambios del Historia',
  `HIS_MOTIVO` varchar(500) NOT NULL COMMENT 'MOtivo de los cambios',
  PRIMARY KEY (`HIS_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla del Historial del PPL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_horarios`
--

CREATE TABLE IF NOT EXISTS `sys_horarios` (
  `HOR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Horario',
  `PAB_COD` int(11) DEFAULT NULL COMMENT 'Codigo del pabellon',
  `HOR_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Horario',
  `HOR_DIAS` varchar(200) DEFAULT NULL COMMENT 'Dias disponibles para las visitas',
  `HOR_HORA_ING` time DEFAULT NULL COMMENT 'Hora de Ingreso del Horario',
  `HOR_HORA_SAL` time DEFAULT NULL COMMENT 'Hora de Salida del Horario',
  `HOR_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estadp del Horario',
  PRIMARY KEY (`HOR_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Datos de horarios que pueden tener los pabellones para las v' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de los Pabellones de un Centro' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `sys_pabellones`
--

INSERT INTO `sys_pabellones` (`PAB_COD`, `CEN_COD`, `NVL_COD`, `PAB_ALA`, `PAB_DESCRIPCION`, `PAB_CAPACIDAD`, `PAB_DETALLES`) VALUES
(1, 1, 1, 'Norte', 'A', 500, ''),
(2, 1, 2, 'Sur', 'B', 200, ''),
(3, 1, 3, 'Este', 'C', 100, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_parentesco`
--

CREATE TABLE IF NOT EXISTS `sys_parentesco` (
  `PAR_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Parentesco',
  `PAR_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Parentesco',
  PRIMARY KEY (`PAR_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Parentescos que pueden tener los visitantes' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_parentesco`
--

INSERT INTO `sys_parentesco` (`PAR_COD`, `PAR_DESCRIPCION`) VALUES
(1, 'Papá'),
(2, 'Mamá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_ppl` (
  `PPL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del PPL',
  `CEL_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la celda',
  `PPL_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del PPL',
  `PPL_APELLIDO` varchar(200) NOT NULL COMMENT 'Apellidos del PPL',
  `PPL_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula del PPL',
  `PPL_IMG` varchar(200) NOT NULL COMMENT 'Imagen del PPL',
  `PPL_HUELLA` varchar(200) NOT NULL COMMENT 'Huella del PPL',
  `PPL_ESTADO` varchar(2) NOT NULL COMMENT 'Estado del PPL',
  PRIMARY KEY (`PPL_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de la persona Provada de Libertad' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_ppl`
--

INSERT INTO `sys_ppl` (`PPL_COD`, `CEL_COD`, `PPL_NOMBRE`, `PPL_APELLIDO`, `PPL_CEDULA`, `PPL_IMG`, `PPL_HUELLA`, `PPL_ESTADO`) VALUES
(1, 1, 'Antonio', 'Gonzales', '1720802394', 'AntonioGonzales.jpg', 'EDS65498', 'A'),
(2, 2, 'Carlos', 'Moreno', '1720090057', 'CarlosMoreno.jpg', 'FFDD654', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_roles`
--

CREATE TABLE IF NOT EXISTS `sys_roles` (
  `ROL_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Rol',
  `ROL_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Descripcion del Rol',
  `ROL_ESTADO` varchar(1) NOT NULL COMMENT 'A: Activo, I: Inactivo',
  PRIMARY KEY (`ROL_COD`)
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
  `SAN_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Sancion',
  `TPS_COD` int(11) DEFAULT NULL COMMENT 'Codigo del tipo-Sancion',
  `SAN_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Descripcion de la Sancion',
  `SAN_TIEMPO` int(11) DEFAULT NULL COMMENT 'Tiempo en Numeros Sancionado',
  `SAN_TIEMPO_DES` varchar(60) DEFAULT NULL COMMENT 'Descripcion del Tiempo de la Sancion',
  PRIMARY KEY (`SAN_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de almacenamiento de Sanciones de las Visitas' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tipo_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_tipo_sancion` (
  `TPS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del tipo-Sancion',
  `TPS_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'descripcion del  tipo-Sancion',
  PRIMARY KEY (`TPS_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Listado de Tipos que puede tener una sancion' AUTO_INCREMENT=1 ;

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
  `UCE_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la tabla',
  `USU_COD` int(11) NOT NULL COMMENT 'Codigo del usuario',
  `CEN_COD` int(11) NOT NULL COMMENT 'Codigo del Centro',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Rol',
  PRIMARY KEY (`UCE_COD`)
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
  `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial del Visitante',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_HUELLA` varchar(200) NOT NULL COMMENT 'Codigo de la Huella Dactilar',
  `VIS_DIRECCION` varchar(500) NOT NULL COMMENT 'Direccion del Visitante',
  `VIS_TELEFONO` varchar(12) NOT NULL COMMENT 'Telefono del visitante',
  `VIS_CORREO` varchar(200) NOT NULL COMMENT 'Correo del Visitante',
  `VIS_IMAGEN` varchar(200) NOT NULL COMMENT 'Imagen del visitante',
  `VIS_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado del Visitante',
  PRIMARY KEY (`VIS_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Almacen de Visitantes que pueden Acceder a un Centro' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `PAR_COD`, `VIS_CEDULA`, `VIS_HUELLA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`, `VIS_ESTADO`) VALUES
(1, 'David', 'Lara', 1, '17208021397', '987asda54', 'Calderon', '3811679', '', '', 'A'),
(2, 'Willian', 'Espinosa', 1, '1720802394', 'EFAF654987', '', '09928789', '', '', 'E'),
(3, 'Juan', 'Perez', 2, '1720823654', 'FDSDFS987325', '', '09864164', '', '', 'A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sys_visitante_ppl`
--

INSERT INTO `sys_visitante_ppl` (`VIP_COD`, `PPL_COD`, `VIS_COD`, `VIP_FECHA`) VALUES
(1, 1, 1, '0000-00-00'),
(2, 2, 2, '0000-00-00'),
(3, 1, 3, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante_sancion`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_sancion` (
  `VSA_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitante-Sancion',
  `SAN_COD` int(11) DEFAULT NULL COMMENT 'Codigo de la Sancion',
  `VIS_COD` int(11) DEFAULT NULL COMMENT 'Codigo secuencial del Visitante',
  `USU_COD` int(11) DEFAULT NULL COMMENT 'Codigo de Usuario',
  `VSA_NOTA` varchar(500) DEFAULT NULL COMMENT 'Nota del Visitante-Sancion',
  `VSA_FECHA` datetime DEFAULT NULL COMMENT 'Fecha del Visitante-Sancion',
  PRIMARY KEY (`VSA_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Las sanciones que obtiene un visitante' AUTO_INCREMENT=1 ;

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
  `VISG_ESTADO` varchar(2) DEFAULT NULL COMMENT 'Estado de la Visita',
  PRIMARY KEY (`VISG_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registro de Visitas realizadas' AUTO_INCREMENT=1 ;

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
