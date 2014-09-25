-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2014 a las 21:55:14
-- Versión del servidor: 5.5.37-cll
-- Versión de PHP: 5.4.23

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
-- Estructura de tabla para la tabla `sys_visitante_ppl`
--

CREATE TABLE IF NOT EXISTS `sys_visitante_ppl` (
  `VIP_COD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Visitanten-PPL',
  `PPL_COD` int(11) NOT NULL COMMENT 'Codigo del PPL',
  `VIS_COD` int(11) NOT NULL COMMENT 'Codigo secuencial del Visitante',
  `PAR_COD` int(11) NOT NULL COMMENT 'Codigo del parentesco',
  `VIP_FECHA` date NOT NULL COMMENT 'Fecha del Visitanten-PPL',
  PRIMARY KEY (`VIP_COD`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Listado de Visitantes que se encuentran ligados a un PPL' AUTO_INCREMENT=170 ;

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
(169, 20, 182, 22, '0000-00-00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;