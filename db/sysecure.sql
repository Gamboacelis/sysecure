-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2014 a las 00:27:53
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

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
-- Estructura de tabla para la tabla `sys_usuarios`
--

CREATE TABLE IF NOT EXISTS `sys_usuarios` (
  `USU_COD` int(11) NOT NULL AUTO_INCREMENT,
  `USU_NOMBRE` varchar(100) CHARACTER SET utf8 NOT NULL,
  `USU_APELLIDO` varchar(100) CHARACTER SET utf8 NOT NULL,
  `USU_USUARIO` varchar(60) CHARACTER SET utf8 NOT NULL,
  `USU_CLAVE` varchar(60) CHARACTER SET utf8 NOT NULL,
  `USU_CEDULA` varchar(13) CHARACTER SET utf8 NOT NULL,
  `USU_EMAIL` varchar(200) CHARACTER SET utf8 NOT NULL,
  `USU_CELULAR` varchar(20) CHARACTER SET utf8 NOT NULL,
  `USU_AVATAR` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT 'Imagen del Usuario',
  `ROL_COD` int(11) NOT NULL COMMENT 'Codigo del Grupo',
  PRIMARY KEY (`USU_COD`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Tabla de Usuarios del Sistema' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_usuarios`
--

INSERT INTO `sys_usuarios` (`USU_COD`, `USU_NOMBRE`, `USU_APELLIDO`, `USU_USUARIO`, `USU_CLAVE`, `USU_CEDULA`, `USU_EMAIL`, `USU_CELULAR`, `USU_AVATAR`, `ROL_COD`) VALUES
(2, 'Willian', 'Espinosa', 'wie', '3e413f53d9f7c57b7250e9515a8d0d4d', '1720802394', 'wespinosa86@gmail.com', '0992725859', 'img/avatars/wie.jpg', 1),
(1, 'Administrador', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1720802394', '', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_visitante`
--

CREATE TABLE IF NOT EXISTS `sys_visitante` (
  `VIS_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de la Visita',
  `VIS_NOMBRE` varchar(250) NOT NULL COMMENT 'nombre de la Visita',
  `VIS_APELLIDO` varchar(250) NOT NULL COMMENT 'Apellido de la Visita',
  `VIS_CEDULA` varchar(13) NOT NULL COMMENT 'Cedula de la Visita',
  `VIS_DIRECCION` varchar(500) NOT NULL,
  `VIS_TELEFONO` varchar(12) NOT NULL,
  `VIS_CORREO` varchar(200) NOT NULL,
  `VIS_IMAGEN` varchar(200) NOT NULL,
  PRIMARY KEY (`VIS_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sys_visitante`
--

INSERT INTO `sys_visitante` (`VIS_COD`, `VIS_NOMBRE`, `VIS_APELLIDO`, `VIS_CEDULA`, `VIS_DIRECCION`, `VIS_TELEFONO`, `VIS_CORREO`, `VIS_IMAGEN`) VALUES
(1, 'WILLIAN', 'ESPINOSA', '1720802394', 'CALDERON', '3811697', '', 'uploads/imagenes/visitas/WillianEspinosa.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
