-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2015 a las 17:35:57
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarConsulta`(IN `fecha` TIMESTAMP, IN `id_usu` INT, IN `id_rec` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into consultareceta (fecha,usuario_id,recetas_id) values (fecha,id_usu,id_rec)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEventoEnHistorial`(IN `usuario` INT(10), IN `receta` INT(10), IN `operacion` VARCHAR(10) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into historial (usuario_id, receta_id, operacion) VALUES(usuario, receta, operacion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nombre` VARCHAR(40), IN `ing` VARCHAR(50), IN `difi` TINYINT, IN `tempo` VARCHAR(15), IN `cat1` VARCHAR(20), IN `cat2` VARCHAR(20), IN `cat3` VARCHAR(20), IN `cat4` VARCHAR(20), IN `cal` INT, IN `crea` VARCHAR(50), IN `dia` INT, IN `mes` INT, IN `anio` INT)
    NO SQL
insert into recetas(nombre,ingrediente_ppal,dificultad,temporada,categoria1,categoria2,categoria3,categoria4,caloriasTotales,creador,dia,mes,anio) VALUES(nombre,ing,difi,tempo,cat1,cat2,cat3,cat4,cal,crea,dia,mes,anio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `pass` VARCHAR(100), IN `dia` INT, IN `mes` INT, IN `anio` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into usuarios(nombreUsuario,email,contrasenia,dia,mes,anio) VALUES(nombre,mail,pass,dia,mes,anio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasDB`()
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasDBConFiltros`(IN `nom` VARCHAR(40) CHARSET utf8, IN `ingredient` VARCHAR(50) CHARSET utf8, IN `dif` INT(4), IN `season` VARCHAR(15) CHARSET utf8, IN `cat1` VARCHAR(20) CHARSET utf8, IN `cat2` VARCHAR(20) CHARSET utf8, IN `cat3` VARCHAR(20) CHARSET utf8, IN `cat4` VARCHAR(20) CHARSET utf8, IN `calorias` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas
where nombre like '%nom%'
and ingrediente_ppal like '%ingredient%'
and dificultad = dif
and temporada = season
and categoria1 = cat1
and categoria2 = cat2
and categoria3 = cat3
and categoria4 = cat4
and caloriasTotales = calorias$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCondimentos`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select nombre
from condimentos
where condimentos_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCondimentos`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select condimentos_id
from `condimentos de una receta`
where recetas_id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDIng`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT ingredientes_id,cantidad FROM `ingredientes de una receta` WHERE recetas_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDPerfil`(IN `id` INT)
    NO SQL
SELECT perfil_id FROM `perfil de un usuario` WHERE usuario_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDReceta`(IN `nom` VARCHAR(40))
    NO SQL
select recetas_id
from recetas
where nombre = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDUsuario`(IN `nombre` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select usuario_id
from usuarios
where nombreUsuario = nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIng`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT nombre,porcion FROM ingredientes WHERE ingredientes_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteRangoCalorias`(IN `caloria1` INT(11), IN `caloria2` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas re
where re.caloriasTotales between caloria1 and caloria2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteRecetas`(IN `usuario` INT(10), IN `operacion` VARCHAR(10) CHARSET utf8, IN `fecha1` DATE, IN `fecha2` DATE)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from historial
where usuario_id = usuario
and operacion = '%operacion%'
and tiempo between fecha1 and fecha2$$

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `condimentos`
--

INSERT INTO `condimentos` (`condimentos_id`, `nombre`) VALUES
(1, 'Cilantro'),
(2, 'Canela'),
(3, 'Comino'),
(4, 'Curry'),
(5, 'Jengibre'),
(6, 'Laurel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos de una receta`
--

CREATE TABLE IF NOT EXISTS `condimentos de una receta` (
  `condim_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `condimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`condim_recet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `condimentos de una receta`
--

INSERT INTO `condimentos de una receta` (`condim_recet_id`, `recetas_id`, `condimentos_id`) VALUES
(1, 8, 1),
(2, 8, 5),
(3, 12, 6),
(4, 24, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultareceta`
--

CREATE TABLE IF NOT EXISTS `consultareceta` (
  `consulta_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`consulta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `consultareceta`
--

INSERT INTO `consultareceta` (`consulta_id`, `fecha`, `usuario_id`, `recetas_id`) VALUES
(1, '2015-09-15 05:15:16', 48, 10),
(2, '2015-09-12 22:33:21', 53, 12),
(3, '2015-09-12 22:35:04', 45, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `movimiento_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) NOT NULL,
  `receta_id` int(10) NOT NULL,
  `operacion` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`movimiento_id`)
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
  `nivelAlimenticio` int(11) NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`ingredientes_id`, `nombre`, `porcion`, `calorias`, `nivelAlimenticio`) VALUES
(1, 'harina', 100, 250, 1),
(2, 'gelatina instantanea', 50, 70, 2),
(3, 'carne', 250, 500, 4),
(4, 'queso', 150, 300, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes de una receta`
--

CREATE TABLE IF NOT EXISTS `ingredientes de una receta` (
  `ingred_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`ingred_recet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ingredientes de una receta`
--

INSERT INTO `ingredientes de una receta` (`ingred_recet_id`, `recetas_id`, `ingredientes_id`, `cantidad`) VALUES
(1, 9, 1, 250),
(2, 10, 3, 0),
(3, 14, 1, 0),
(4, 11, 1, 100),
(5, 9, 4, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil de un usuario`
--

CREATE TABLE IF NOT EXISTS `perfil de un usuario` (
  `perfilUsuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`perfilUsuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `perfil de un usuario`
--

INSERT INTO `perfil de un usuario` (`perfilUsuario_id`, `usuario_id`, `perfil_id`) VALUES
(1, 45, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil usuario`
--

CREATE TABLE IF NOT EXISTS `perfil usuario` (
  `perfil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `altura` double NOT NULL,
  `complexion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `dieta` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `rutina` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `perfil usuario`
--

INSERT INTO `perfil usuario` (`perfil_id`, `nombre`, `apellido`, `sexo`, `edad`, `altura`, `complexion`, `dieta`, `rutina`) VALUES
(1, 'Juan', 'Reines', 'Masculino', 20, 1.7, '22.04', 'Normal', 'Nada'),
(2, 'Franco', 'Abregu', 'Masculino', 20, 1.68, '20.01', 'Vegano', 'Activo'),
(3, 'Nacho', 'ghillini', 'Masculino', 28, 1.72, '30', 'Ovolactovegetariano', 'Mediano'),
(6, 'Roman', 'Riquelme', 'Masculino', 25, 1.78, 'Mediana', 'Normal', 'Intenso');

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
  `imagen1` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `paso1` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagen2` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `paso2` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagen3` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `paso3` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagen4` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `paso4` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagen5` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=25 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=54 ;

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
