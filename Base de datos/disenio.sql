-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2015 a las 00:08:33
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nombre` VARCHAR(40), IN `ing` VARCHAR(50), IN `difi` TINYINT, IN `tempo` VARCHAR(15), IN `cat1` VARCHAR(20), IN `cat2` VARCHAR(20), IN `cat3` VARCHAR(20), IN `cat4` VARCHAR(20), IN `cal` INT, IN `crea` VARCHAR(50), IN `dia` INT, IN `mes` INT, IN `anio` INT)
    NO SQL
insert into recetas(nombre,ingrediente_ppal,dificultad,temporada,categoria1,categoria2,categoria3,categoria4,caloriasTotales,creador,dia,mes,anio) VALUES(nombre,ing,difi,tempo,cat1,cat2,cat3,cat4,cal,crea,dia,mes,anio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `pass` VARCHAR(100), IN `dia` INT, IN `mes` INT, IN `anio` INT)
    NO SQL
insert into usuarios(nombreUsuario,email,contrasenia,dia,mes,anio) VALUES(nombre,mail,pass,dia,mes,anio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasDB`()
    NO SQL
select * 
from recetas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(IN `nombre` VARCHAR(50))
    NO SQL
select * 
from usuarios
where nombreUsuario = nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `testReceta`(IN `nombreReceta` VARCHAR(40))
    NO SQL
select * 
from recetas
where nombre = nombreReceta$$

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
  `ingrediente_ppal` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `dificultad` int(4) NOT NULL,
  `temporada` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria1` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria2` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria3` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria4` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `caloriasTotales` int(11) NOT NULL,
  `creador` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`recetas_id`, `nombre`, `ingrediente_ppal`, `dificultad`, `temporada`, `categoria1`, `categoria2`, `categoria3`, `categoria4`, `caloriasTotales`, `creador`, `dia`, `mes`, `anio`) VALUES
(8, 'milanesa a la maryland', 'milanesa', 3, 'Invierno', 'cena', 'almuerzo', NULL, NULL, 541, '', 0, 0, 0),
(9, 'pizza', 'harina', 1, 'Verano', 'cena', NULL, NULL, NULL, 125, '', 0, 0, 0),
(10, 'pati a la parrilla', 'carne', 5, 'Verano', 'cena', 'almuerzo', NULL, NULL, 500, '', 0, 0, 0),
(11, 'tallarines', 'harina', 2, 'Invierno', NULL, NULL, NULL, NULL, 350, '', 0, 0, 0),
(12, 'buñuelos de acelga', 'acelga', 2, 'Invierno', 'almuerzo', NULL, NULL, NULL, 110, '', 0, 0, 0),
(13, 'pastel de papa', 'papa', 3, 'Invierno', 'cena', NULL, NULL, NULL, 110, '', 0, 0, 0),
(14, 'bizcocho de vainilla', 'harina', 2, 'Otonio', 'merienda', NULL, NULL, NULL, 420, '', 0, 0, 0),
(20, 'cafe', 'cafe instantaneo', 1, 'Invierno', 'desayuno', NULL, NULL, NULL, 514, '', 0, 0, 0),
(24, 'gelatina', 'gelatina instantanea', 2, 'Invierno', 'desayuno', NULL, NULL, NULL, 514, 'roman', 0, 0, 0);

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
  `contrasenia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombreUsuario`, `email`, `contrasenia`, `dia`, `mes`, `anio`) VALUES
(4, 'juanchoPebete', 'juan_ellince@gmail.com', 'cherry', 0, 0, 0),
(7, 'franquitoMaquinola', 'franco42@gmail.com', 'abreu', 0, 0, 0),
(45, 'roman', 'roman@gmail.com', 'riquelme', 0, 0, 0),
(46, 'nacho', 'nacho45@yahoo.com', 'calafate', 0, 0, 0),
(48, 'rodrigo', 'lince@telecentro.com', 'vagoneta', 0, 0, 0),
(49, 'santi', 'santi123@hotmail.com', 'aguanteFS', 0, 0, 0),
(50, 'oscarcito', 'oscar_seguime@twitter.com', 'jefeCatedra', 0, 0, 0),
(51, 'tito', 'oscar_seguime@twitter.com', 'jefeCatedra', 0, 0, 0),
(52, 'pepe', 'casas@gmail.com', 'llamamepepe', 0, 0, 0),
(53, 'matiGrippo', 'estaEnMedrano@yahoo.com', 'error404', 24, 4, 1994);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
