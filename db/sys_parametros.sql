-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2014 a las 17:38:56
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
