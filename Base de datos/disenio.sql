-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2015 a las 22:57:40
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `caloriasRutina`(IN `actividad` VARCHAR(20) CHARSET utf8, OUT `calorias` FLOAT)
    READS SQL DATA
    SQL SECURITY INVOKER
select calorias 
from rutinas
where tipo like '%actividad%'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarConsulta`(IN `fecha` TIMESTAMP, IN `id_usu` INT, IN `id_rec` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into consultareceta (fecha,usuario_id,recetas_id) values (fecha,id_usu,id_rec)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEventoEnHistorial`(IN `usuario` INT(10), IN `receta` INT(10), IN `operacion` VARCHAR(10) CHARSET utf8)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into historial (usuario_id, receta_id, operacion) VALUES(usuario, receta, operacion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nombre` VARCHAR(40), IN `ing` VARCHAR(50), IN `difi` TINYINT, IN `tempo` VARCHAR(15), IN `cat1` VARCHAR(20), IN `cat2` VARCHAR(20), IN `cat3` VARCHAR(20), IN `cat4` VARCHAR(20), IN `cal` INT)
    NO SQL
insert into recetas(nombre,ingrediente_ppal,dificultad,temporada,categoria1,categoria2,categoria3,categoria4,caloriasTotales,creador,dia,mes,anio) VALUES(nombre,ing,difi,tempo,cat1,cat2,cat3,cat4,cal,crea,dia,mes,anio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `pass` VARCHAR(100), IN `dia` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into usuarios(nombreUsuario,email,contrasenia,fecha_nacimiento) VALUES(nombre,mail,pass,fecha)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunCondimento`(IN `cond` VARCHAR(40) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from condimentos as C, recetas as R inner join condimentos_receta as CR on R.recetas_id = CR.recetas_id 
where C.condimentos_id = CR.condimentos_id and C.nombre like `%cond%` 
order by rand(R.recetas_id) 
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunDieta`(IN `dieta` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas R
inner join dietas D on R.dieta_id = D.dieta_id
where D.tipo = dieta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunNivelAlimenticio`(IN `nivel` VARCHAR(30) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from nivel_alimenticio as NA,recetas as R
inner join ingredientes as I on R.ingrediente_ppal = I.ingredientes_id
where I.nivel_id = NA.nivel_id
and NA.tipo like '%nivel%'
order by rand(R.recetas_id) 
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunPreferencia`(IN `user_id` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas R
inner join preferencias_alimenticias_usuario PA on R.ingrediente_ppal = PA.ingredientes_id
where PA.usuario_id = user_id
order by rand(R.recetas_id) 
limit 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaTopTemporada`(IN `temporada` VARCHAR(100) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas as R inner join temporadas as T on R.temporada_id = T.temporada_id 
inner join promedio_calificacion as P on R.recetas_id = P.recetas_id 
where P.calificacion_promedio = 5 and T.tipo like '%temporada%'$$

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
-- Estructura de tabla para la tabla `amigos_usuario`
--

CREATE TABLE IF NOT EXISTS `amigos_usuario` (
  `amigo_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `amigoUsuario_id` int(11) NOT NULL,
  PRIMARY KEY (`amigo_usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `amigos_usuario`
--

INSERT INTO `amigos_usuario` (`amigo_usuario_id`, `usuario_id`, `amigoUsuario_id`) VALUES
(1, 4, 7),
(2, 7, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_usuario_receta`
--

CREATE TABLE IF NOT EXISTS `calificacion_usuario_receta` (
  `calif_recet_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  PRIMARY KEY (`calif_recet_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `calificacion_usuario_receta`
--

INSERT INTO `calificacion_usuario_receta` (`calif_recet_usuario`, `recetas_id`, `usuario_id`, `calificacion`) VALUES
(1, 10, 7, 3),
(2, 12, 46, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_receta`
--

CREATE TABLE IF NOT EXISTS `categoria_receta` (
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
  `horaMax` time NOT NULL,
  `horaMin` time NOT NULL,
  PRIMARY KEY (`categorias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categorias_id`, `nombre`, `horaMax`, `horaMin`) VALUES
(1, 'Desayuno', '11:00:00', '04:00:00'),
(2, 'Almuerzo', '14:30:00', '11:00:00'),
(3, 'Merienda', '20:00:00', '14:30:00'),
(4, 'Cena', '04:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_prexistente`
--

CREATE TABLE IF NOT EXISTS `condicion_prexistente` (
  `condicion_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`condicion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `condicion_prexistente`
--

INSERT INTO `condicion_prexistente` (`condicion_id`, `tipo`) VALUES
(1, 'Diabetes'),
(2, 'Hipertension'),
(3, 'Celiasis'),
(4, 'Diabetes_Hipertension'),
(5, 'Diabetes_Celiasis'),
(6, 'Hipertension_Celiasis'),
(7, 'Diabetes_Hipertension_Celiasis');

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
-- Estructura de tabla para la tabla `condimentos_receta`
--

CREATE TABLE IF NOT EXISTS `condimentos_receta` (
  `condim_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `condimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`condim_recet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `condimentos_receta`
--

INSERT INTO `condimentos_receta` (`condim_recet_id`, `recetas_id`, `condimentos_id`) VALUES
(1, 8, 1),
(2, 8, 5),
(3, 12, 6),
(4, 24, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dietas`
--

CREATE TABLE IF NOT EXISTS `dietas` (
  `dieta_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`dieta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `dietas`
--

INSERT INTO `dietas` (`dieta_id`, `tipo`) VALUES
(1, 'Normal'),
(2, 'Ovolactovegetariano'),
(3, 'Vegetariano'),
(4, 'Vegano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `movimiento_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) NOT NULL,
  `receta_id` int(10) NOT NULL,
  `operacion` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`movimiento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`movimiento_id`, `usuario_id`, `receta_id`, `operacion`, `tiempo`) VALUES
(1, 4, 10, 'confirmar', '2015-10-14 18:36:03'),
(2, 45, 24, 'consultar', '2015-10-14 18:53:28'),
(3, 46, 12, 'calificar', '2015-10-14 18:53:28'),
(5, 7, 10, 'calificar', '2015-10-14 18:53:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
  `ingredientes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `porcion` int(11) NOT NULL,
  `calorias` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`ingredientes_id`, `nombre`, `porcion`, `calorias`, `nivel_id`) VALUES
(1, 'harina', 100, 250, 1),
(2, 'gelatina instantanea', 50, 70, 5),
(3, 'bola de lomo', 250, 500, 3),
(4, 'mozzarella', 150, 300, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_receta`
--

CREATE TABLE IF NOT EXISTS `ingredientes_receta` (
  `ingred_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`ingred_recet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ingredientes_receta`
--

INSERT INTO `ingredientes_receta` (`ingred_recet_id`, `recetas_id`, `ingredientes_id`, `cantidad`) VALUES
(1, 9, 1, 250),
(2, 10, 3, 0),
(3, 14, 1, 0),
(4, 11, 1, 100),
(5, 9, 4, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_alimenticio`
--

CREATE TABLE IF NOT EXISTS `nivel_alimenticio` (
  `nivel_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `nivel_alimenticio`
--

INSERT INTO `nivel_alimenticio` (`nivel_id`, `tipo`) VALUES
(1, 'Grano'),
(2, 'Fruta_Verdura'),
(3, 'Lacteo_Carne_Legumbre'),
(4, 'Grasa_Aceite'),
(5, 'Azucar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_usuario`
--

CREATE TABLE IF NOT EXISTS `perfil_usuario` (
  `perfil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `altura` double NOT NULL,
  `complexion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `dieta_id` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL,
  PRIMARY KEY (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `perfil_usuario`
--

INSERT INTO `perfil_usuario` (`perfil_id`, `usuario_id`, `nombre`, `apellido`, `sexo`, `edad`, `altura`, `complexion`, `dieta_id`, `rutina_id`) VALUES
(1, 4, 'Juan', 'Reines', 'Masculino', 20, 1.7, '22.04', 2, 1),
(2, 7, 'Franco', 'Abregu', 'Masculino', 20, 1.68, '20.01', 1, 2),
(3, 46, 'Nacho', 'ghillini', 'Masculino', 28, 1.72, '30', 1, 3),
(6, 45, 'Roman', 'Riquelme', 'Masculino', 25, 1.78, 'Mediana', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias_alimenticias_usuario`
--

CREATE TABLE IF NOT EXISTS `preferencias_alimenticias_usuario` (
  `prefe_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ingredientes_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`prefe_usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `preferencias_alimenticias_usuario`
--

INSERT INTO `preferencias_alimenticias_usuario` (`prefe_usuario_id`, `ingredientes_id`, `usuario_id`) VALUES
(1, 1, 4),
(2, 3, 7),
(3, 1, 46),
(4, 2, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento_receta`
--

CREATE TABLE IF NOT EXISTS `procedimiento_receta` (
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
-- Estructura de tabla para la tabla `promedio_calificacion`
--

CREATE TABLE IF NOT EXISTS `promedio_calificacion` (
  `promedio_califacion_id` int(10) NOT NULL AUTO_INCREMENT,
  `recetas_id` int(10) NOT NULL,
  `calificacion_promedio` tinyint(4) NOT NULL,
  PRIMARY KEY (`promedio_califacion_id`),
  UNIQUE KEY `promedio_califacion_id` (`promedio_califacion_id`,`recetas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
  `recetas_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `ingrediente_ppal` int(10) NOT NULL,
  `dificultad` int(4) NOT NULL,
  `temporada_id` int(11) NOT NULL,
  `categoria1` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria2` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria3` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria4` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `caloriasTotales` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `dieta_id` int(11) NOT NULL,
  PRIMARY KEY (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`recetas_id`, `nombre`, `ingrediente_ppal`, `dificultad`, `temporada_id`, `categoria1`, `categoria2`, `categoria3`, `categoria4`, `caloriasTotales`, `condicion_id`, `dieta_id`) VALUES
(8, 'milanesa a la maryland', 3, 3, 1, 'cena', 'almuerzo', NULL, NULL, 541, 1, 1),
(9, 'pizza', 1, 1, 13, 'cena', NULL, NULL, NULL, 125, 4, 1),
(10, 'pati a la parrilla', 0, 5, 0, 'cena', 'almuerzo', NULL, NULL, 500, 0, 0),
(11, 'tallarines', 0, 2, 0, NULL, NULL, NULL, NULL, 350, 0, 0),
(12, 'buñuelos de acelga', 0, 2, 0, 'almuerzo', NULL, NULL, NULL, 110, 0, 0),
(13, 'pastel de papa', 0, 3, 0, 'cena', NULL, NULL, NULL, 110, 0, 0),
(14, 'bizcocho de vainilla', 0, 2, 0, 'merienda', NULL, NULL, NULL, 420, 0, 0),
(20, 'cafe', 0, 1, 0, 'desayuno', NULL, NULL, NULL, 514, 0, 0),
(24, 'gelatina', 0, 2, 0, 'desayuno', NULL, NULL, NULL, 514, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_usuario`
--

CREATE TABLE IF NOT EXISTS `recetas_usuario` (
  `recet_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `recetas_usuario`
--

INSERT INTO `recetas_usuario` (`recet_usuario_id`, `usuario_id`, `recetas_id`) VALUES
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
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE IF NOT EXISTS `rutinas` (
  `rutina_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `calorias` float NOT NULL,
  PRIMARY KEY (`rutina_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`rutina_id`, `tipo`, `calorias`) VALUES
(1, 'Nada', 1250),
(2, 'Leve', 1500),
(3, 'Intermedio', 2000),
(4, 'Mediano', 2500),
(5, 'Intensivo', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE IF NOT EXISTS `temporadas` (
  `temporada_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`temporada_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `temporadas`
--

INSERT INTO `temporadas` (`temporada_id`, `tipo`) VALUES
(1, 'Verano'),
(2, 'Otonio'),
(3, 'Invierno'),
(4, 'Primavera'),
(5, 'Navidad'),
(6, 'Pascua'),
(7, 'Verano_Otonio'),
(8, 'Verano_Primavera'),
(9, 'Otonio_Primavera'),
(10, 'Otonio_Invierno'),
(11, 'Primavera_Invierno'),
(12, 'Verano_Invierno'),
(13, 'Anual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=54 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombreUsuario`, `email`, `contrasenia`, `fecha_nacimiento`) VALUES
(4, 'juanchoPebete', 'juan_ellince@gmail.com', 'cherry', '2015-10-10 21:09:15'),
(7, 'franquitoMaquinola', 'franco42@gmail.com', 'abreu', '2015-10-10 21:09:15'),
(45, 'roman', 'roman@gmail.com', 'riquelme', '2015-10-10 21:09:15'),
(46, 'nacho', 'nacho45@yahoo.com', 'calafate', '2015-10-10 21:09:15'),
(48, 'rodrigo', 'lince@telecentro.com', 'vagoneta', '2015-10-10 21:09:15'),
(49, 'santi', 'santi123@hotmail.com', 'aguanteFS', '2015-10-10 21:09:15'),
(50, 'oscarcito', 'oscar_seguime@twitter.com', 'jefeCatedra', '2015-10-10 21:09:15'),
(51, 'tito', 'oscar_seguime@twitter.com', 'jefeCatedra', '2015-10-10 21:09:15'),
(52, 'pepe', 'casas@gmail.com', 'llamamepepe', '2015-10-10 21:09:15'),
(53, 'matiGrippo', 'estaEnMedrano@yahoo.com', 'error404', '2015-10-10 21:09:15');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
