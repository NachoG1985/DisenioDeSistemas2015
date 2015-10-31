-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2015 a las 23:32:07
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `disenio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
  `ingredientes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `porcion` int(11) NOT NULL,
  `calorias` double NOT NULL,
  `nivel_id` int(11) NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=103 ;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`ingredientes_id`, `nombre`, `porcion`, `calorias`, `nivel_id`) VALUES
(1, 'harina', 100, 364, 1),
(2, 'gelatina instantanea', 50, 70, 5),
(3, 'bola de lomo', 100, 131, 3),
(4, 'queso mozzarella', 100, 300, 3),
(5, 'leche', 128, 634.9, 3),
(6, 'manzana', 100, 80, 2),
(7, 'tomate', 100, 17, 2),
(8, 'lechuga', 100, 12, 2),
(9, 'banana', 100, 88, 2),
(10, 'zanahoria', 100, 18, 2),
(11, 'naranja', 100, 42, 2),
(12, 'cebolla', 100, 40, 2),
(13, 'papa', 100, 83, 2),
(14, 'brocoli', 100, 28, 2),
(15, 'pepino', 100, 12, 2),
(16, 'palta', 100, 160, 2),
(17, 'melon', 100, 24, 2),
(18, 'pera', 100, 57, 2),
(19, 'calabaza', 100, 20, 2),
(20, 'espinaca', 100, 23, 2),
(21, 'kiwi', 100, 60, 2),
(22, 'durazno', 100, 45, 2),
(23, 'limon', 100, 22, 2),
(24, 'frutillas', 100, 32, 2),
(25, 'zapallo', 100, 25, 2),
(26, 'remolacha', 100, 43, 2),
(27, 'repollo', 100, 14, 2),
(28, 'acelga', 100, 20, 2),
(29, 'soja', 100, 45, 2),
(30, 'champiñon', 100, 33, 2),
(31, 'esparragos', 100, 18, 2),
(32, 'pure de tomate', 100, 37, 2),
(33, 'morron', 100, 20, 2),
(34, 'huevo', 56, 80, 3),
(35, 'queso parmesano', 100, 431, 3),
(36, 'queso azul', 100, 353, 3),
(37, 'queso cheddar', 100, 403, 3),
(38, 'dulce de leche', 100, 315, 3),
(39, 'queso provolone', 100, 351, 3),
(40, 'clara de huevo', 33, 17, 3),
(41, 'yema de huevo', 17, 54, 3),
(42, 'manteca', 5, 35.9, 3),
(43, 'queso de cabra', 100, 452, 3),
(44, 'huevo de codorniz', 100, 158, 3),
(45, 'queso pategras', 100, 333, 3),
(46, 'aceite de oliva', 100, 884, 4),
(47, 'mayonesa', 100, 688, 4),
(48, 'mayonesa light', 100, 324, 4),
(49, 'aceite de girasol', 100, 884, 4),
(50, 'aceite de maiz', 100, 884, 4),
(51, 'margarina', 100, 713, 4),
(52, 'grasa de pollo', 100, 900, 4),
(53, 'grasa bovina', 100, 889, 4),
(54, 'grasa de cerdo', 100, 902, 4),
(55, 'pollo-pechuga', 100, 263, 3),
(56, 'pollo-pata', 100, 215, 3),
(57, 'pollo', 100, 111, 3),
(58, 'cerdo', 100, 169, 3),
(59, 'panceta', 100, 548, 3),
(60, 'carne vacuna', 100, 192, 3),
(61, 'cabrito', 100, 109, 3),
(62, 'conejo', 100, 197, 3),
(63, 'cordero', 100, 290, 3),
(64, 'carne picada', 100, 332, 3),
(65, 'salmon', 100, 142, 3),
(66, 'atun (en agua)', 100, 116, 3),
(67, 'atun (en aceite)', 100, 186, 3),
(68, 'merluza', 100, 90, 3),
(69, 'camarón', 100, 119, 3),
(70, 'calamar', 100, 175, 3),
(71, 'mejillón', 100, 172, 3),
(72, 'pulpo', 100, 164, 3),
(73, 'caviar', 100, 264, 3),
(74, 'anchoa', 100, 131, 3),
(75, 'langosta', 100, 89, 3),
(76, 'trucha', 100, 168, 3),
(77, 'almeja', 100, 142, 3),
(78, 'langostino', 100, 96, 3),
(79, 'nuez', 100, 575, 1),
(80, 'semilla de lino', 100, 534, 1),
(81, 'semilla de girasol', 100, 584, 1),
(82, 'semilla de chia', 100, 490, 1),
(83, 'almendras', 100, 575, 1),
(84, 'castañas', 100, 245, 1),
(85, 'poroto', 100, 155, 1),
(86, 'lenteja', 100, 114, 1),
(87, 'maní', 100, 567, 1),
(88, 'garbanzo', 100, 164, 1),
(89, 'hamburguesa vegetal', 100, 177, 1),
(90, 'tofu', 100, 77, 1),
(91, 'quinoa', 100, 368, 1),
(92, 'arroz blanco', 100, 130, 1),
(93, 'arroz integral', 100, 111, 1),
(94, 'avena', 100, 389, 1),
(95, 'maíz', 100, 365, 1),
(96, 'germen de trigo', 100, 360, 1),
(97, 'cuscus', 100, 112, 1),
(98, 'cebada', 100, 354, 1),
(99, 'fideos', 100, 138, 1),
(100, 'harina de maiz', 100, 362, 1),
(101, 'harina de centeno', 100, 325, 1),
(102, 'sorgo', 100, 339, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
