-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2015 a las 21:13:08
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
CREATE DATABASE IF NOT EXISTS `disenio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `disenio`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nombre` VARCHAR(40), IN `dificultad` ENUM('1','2','3','4','5'), IN `temporada` ENUM('Verano','Invierno','Otonio','Primavera'), IN `caloriasTotales` INT)
    NO SQL
insert into recetas(nombre,dificultad,temporada,caloriasTotales) VALUES(nombre,dificultad,temporada,caloriasTotales)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `fecha` CHAR(8), IN `pass` VARCHAR(100))
    NO SQL
insert into usuarios(nombreUsuario,email,fechaNac,contrasenia) VALUES(nombre,mail,fecha,pass)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(IN `nombre` VARCHAR(50))
    NO SQL
select * 
from usuarios
where nombreUsuario = nombre$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos de un usuario`
--

CREATE TABLE IF NOT EXISTS `amigos de un usuario` (
  `amigo_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `amigoUsuario_id` int(11) NOT NULL,
  PRIMARY KEY (`amigo_usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion de un usuario a receta`
--

CREATE TABLE IF NOT EXISTS `calificacion de un usuario a receta` (
  `calif_recet_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `calificaciones_id` int(11) NOT NULL,
  PRIMARY KEY (`calif_recet_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE IF NOT EXISTS `calificaciones` (
  `calificaciones_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calificacion` enum('0','0.5','1','1.5','2','2.5','3','3.5','4','4.5','5') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`calificaciones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria de una receta`
--

CREATE TABLE IF NOT EXISTS `categoria de una receta` (
  `categ_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `categorias_id` int(11) NOT NULL,
  PRIMARY KEY (`categ_recet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categorias_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `horaMax` double NOT NULL,
  `horaMin` double NOT NULL,
  PRIMARY KEY (`categorias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos`
--

CREATE TABLE IF NOT EXISTS `condimentos` (
  `condimentos_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`condimentos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos de una receta`
--

CREATE TABLE IF NOT EXISTS `condimentos de una receta` (
  `condim_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `codimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`condim_recet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
  `ingredientes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `porcion` int(11) NOT NULL,
  `calorias` int(11) NOT NULL,
  `nivelAlimenticio` enum('1','2','3','4') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes de una receta`
--

CREATE TABLE IF NOT EXISTS `ingredientes de una receta` (
  `ingred_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  PRIMARY KEY (`ingred_recet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil usuario`
--

CREATE TABLE IF NOT EXISTS `perfil usuario` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` enum('Masculino','Femenino','','') COLLATE utf8_spanish2_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `altura` double NOT NULL,
  `complexion` double NOT NULL,
  `dieta` enum('Normal','Ovolactovegetariano','Vegetariano','Vegano') COLLATE utf8_spanish2_ci NOT NULL,
  `rutina` enum('Leve','Nada','Mediano','Intensivo','Activo') COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `perfil usuario`
--

INSERT INTO `perfil usuario` (`usuario_id`, `nombre`, `apellido`, `sexo`, `edad`, `altura`, `complexion`, `dieta`, `rutina`) VALUES
(1, 'Juan', 'Reines', 'Masculino', 20, 1.7, 22.04, 'Normal', 'Nada'),
(2, 'Franco', 'Abregu', 'Masculino', 20, 1.68, 20.01, 'Vegano', 'Activo'),
(3, 'Nacho', 'ghillini', 'Masculino', 28, 1.72, 30, 'Ovolactovegetariano', 'Mediano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias alimenticias de usuario`
--

CREATE TABLE IF NOT EXISTS `preferencias alimenticias de usuario` (
  `prefe_usuario_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recetas_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`prefe_usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento de una receta`
--

CREATE TABLE IF NOT EXISTS `procedimiento de una receta` (
  `proced_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `procedimientos_id` int(11) NOT NULL,
  PRIMARY KEY (`proced_recet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimientos`
--

CREATE TABLE IF NOT EXISTS `procedimientos` (
  `procedimientos_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paso1` text COLLATE utf8_spanish2_ci NOT NULL,
  `paso2` text COLLATE utf8_spanish2_ci NOT NULL,
  `paso3` text COLLATE utf8_spanish2_ci NOT NULL,
  `paso4` text COLLATE utf8_spanish2_ci NOT NULL,
  `paso5` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`procedimientos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
  `recetas_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `dificultad` enum('1','2','3','4','5','6','7','8','9','10') COLLATE utf8_spanish2_ci NOT NULL,
  `temporada` enum('Verano','Invierno','Otonio','Primavera') COLLATE utf8_spanish2_ci NOT NULL,
  `caloriasTotales` int(11) NOT NULL,
  PRIMARY KEY (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`recetas_id`, `nombre`, `dificultad`, `temporada`, `caloriasTotales`) VALUES
(1, 'Matambre a la pizza', '7', 'Primavera', 500),
(2, 'milanesa', '6', 'Verano', 45),
(3, 'milanesa napolitana', '7', 'Invierno', 542),
(6, 'milanesa maryland', '9', 'Invierno', 1000),
(7, 'merluza a la vasca', '8', 'Otonio', 350);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas calificadas`
--

CREATE TABLE IF NOT EXISTS `recetas calificadas` (
  `recet_calificadas_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_calificadas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas confirmadas`
--

CREATE TABLE IF NOT EXISTS `recetas confirmadas` (
  `recet_confirmadas_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_confirmadas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas consultadas`
--

CREATE TABLE IF NOT EXISTS `recetas consultadas` (
  `recet_consultadas_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_consultadas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas de un usuario`
--

CREATE TABLE IF NOT EXISTS `recetas de un usuario` (
  `recet_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `recetas de un usuario`
--

INSERT INTO `recetas de un usuario` (`recet_usuario_id`, `usuario_id`, `recetas_id`) VALUES
(1, 45, 1),
(2, 45, 7),
(5, 46, 2),
(6, 46, 6),
(7, 46, 3),
(8, 47, 7),
(9, 48, 3),
(10, 49, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNac` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombreUsuario`, `email`, `fechaNac`, `contrasenia`) VALUES
(4, 'juanchoPebete', 'juan_ellince@gmail.com', '15101195', 'cherry'),
(7, 'franquitoMaquinola', 'franco42@gmail.com', '01211993', 'abreu'),
(45, 'roman', 'roman@gmail.com', '19940406', 'riquelme'),
(46, 'nacho', 'nacho45@yahoo.com', '19901103', 'calafate'),
(48, 'rodrigo', 'lince@telecentro.com', '15641103', 'vagoneta'),
(49, 'santi', 'santi123@hotmail.com', '15641103', 'aguanteFS'),
(50, 'oscarcito', 'oscar_seguime@twitter.com', '15641103', 'jefeCatedra'),
(51, 'tito', 'oscar_seguime@twitter.com', '15641103', 'jefeCatedra'),
(52, 'pepe', 'casas@gmail.com', '19963201', 'llamamepepe');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
