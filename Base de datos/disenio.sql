-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2015 a las 20:36:14
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcularPromedio`()
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT C.recetas_id, AVG(C.calificacion)
FROM calificacion_usuario_receta C GROUP BY C.recetas_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `caloriasRutina`(IN `actividad` VARCHAR(20))
    READS SQL DATA
    SQL SECURITY INVOKER
select calorias 
from rutinas
where tipo like concat("%",actividad,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `condSegunReceta`(IN `rec` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select C.nombre
from condimentos_receta as CR 
inner join condimentos as C on CR.condimentos_id = C.condimentos_id
where CR.recetas_id = rec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaReceta`(IN `nom` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas
where nombre = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaUsuario`(IN `nom` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from usuarios
where nombreUsuario = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ingYCantSegunReceta`(IN `rec` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select I.nombre,IR.cantidad
from ingredientes_receta as IR inner join ingredientes as I on IR.ingredientes_id = I.ingredientes_id
where IR.recetas_id = rec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCondimento`(IN `nom` VARCHAR(40))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into condimentos(nombre) VALUES(nom)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCondReceta`(IN `rec` INT, IN `cond` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `condimentos_receta`(recetas_id,condimentos_id) VALUES(rec,cond)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarConsulta`(IN `fecha` TIMESTAMP, IN `id_usu` INT, IN `id_rec` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into consultareceta (fecha,usuario_id,recetas_id) values (fecha,id_usu,id_rec)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEventoEnHistorial`(IN `usuario` INT(10), IN `receta` INT(10), IN `operacion` VARCHAR(10))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into historial (usuario_id, receta_id, operacion) VALUES(usuario, receta, operacion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarIngReceta`(IN `rec` INT, IN `ing` INT, IN `cant` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `ingredientes_receta`(recetas_id,ingredientes_id,cantidad) VALUES(rec,ing,cant)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarIngrediente`(IN `nombre` VARCHAR(40), IN `porcion` INT, IN `cal` FLOAT, IN `nivel` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into ingredientes(nombre,porcion,calorias,nivel_id) VALUES(nombre,porcion,cal,nivel)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPerfil`(IN `usu` INT(11), IN `nom` VARCHAR(40), IN `ape` VARCHAR(40), IN `sexo` VARCHAR(20), IN `edad` INT(3), IN `altura` DOUBLE, IN `comple` VARCHAR(20), IN `dieta` INT, IN `rutina` INT, IN `cond` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into perfil_usuario(usuario_id,nombre,apellido,sexo,edad,altura,complexion,dieta_id,rutina_id,condicion_id) VALUES(usu,nom,ape,sexo,edad,altura,comple,dieta,rutina,cond)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProcedimiento`(IN `im1` VARCHAR(100), IN `pas1` TEXT, IN `im2` VARCHAR(100), IN `pas2` TEXT, IN `im3` VARCHAR(100), IN `pas3` TEXT, IN `im4` VARCHAR(100), IN `pas4` TEXT, IN `im5` VARCHAR(100), IN `pas5` TEXT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into procedimientos(imagen1,paso1,imagen2,paso2,imagen3,paso3,imagen4,paso4,imagen5,paso5) VALUES(im1,pas1,im2,pas2,im3,pas3,im4,pas4,im5,pas5)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nom` VARCHAR(40), IN `ing` INT, IN `dif` INT(4), IN `tempo` INT, IN `cat` INT, IN `calo` DOUBLE, IN `cond` INT, IN `dieta` INT, IN `proc` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into recetas(nombre,ingrediente_ppal_id,dificultad,temporada_id,categoria_id,caloriasTotales,condicion_id,dieta_id,procedimiento_id) VALUES(nom,ing,dif,tempo,cat,calo,cond,dieta,proc)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarRecUsuario`(IN `usu` INT, IN `rec` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `recetas_usuario`(usuario_id,recetas_id) VALUES(usu,rec)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `pass` VARCHAR(100), IN `fecha` DATE)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into usuarios(nombreUsuario,email,contrasenia,fecha_nacimiento) VALUES(nombre,mail,pass,fecha)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCondimentos`()
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT C.nombre, C.condimentos_id
FROM condimentos C$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarIngredientes`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
SELECT I.nombre, I.ingredientes_id
FROM ingredientes I$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasCreadas`(IN `usu` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from usuarios as U 
inner join historial as H on U.usuario_id = H.usuario_id
inner join recetas R on (R.recetas_id = H.receta_id)
where H.operacion = 'cargar' and U.nombreUsuario = usu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasDB`()
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasDBConFiltros`(IN `nom` VARCHAR(40), IN `ing` INT, IN `dif` INT(4), IN `temp` INT, IN `cat` INT, IN `calo` DOUBLE, IN `cond` INT, IN `dieta` INT, IN `proc` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas
where nombre like concat("%",nom,"%")
and ingrediente_ppal_id = ing
and dificultad = dif
and temporada_id = temp
and categoria_id = cat
and caloriasTotales = calo
and condicion_id = cond
and dieta_id = dieta
and procedimiento_id = proc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCalificacionReceta`(IN `nombre` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select P.calificacion_promedio 
from promedio_calificacion P
inner join recetas R on R.recetas_id = P.recetas_id
where R.nombre like concat("%",nombre,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCondimentos`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select nombre
from condimentos
where condimentos_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCreacionReceta`(IN `nombre` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select H.tiempo, U.nombreUsuario
from historial H
inner join recetas R on R.recetas_id = H.receta_id
inner join usuarios U on U.usuario_id = H.usuario_id
where R.nombre like concat ("%",nombre,"%")
and H.operacion = 'cargar'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDAlimenticio`(IN `tipo` VARCHAR(30))
    READS SQL DATA
    SQL SECURITY INVOKER
select nivel_id 
from nivel_alimenticio
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCategoria`(IN `nom` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select categorias_id 
from categoria_receta
where tipo=nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCondicion`(IN `nom` VARCHAR(60))
    READS SQL DATA
    SQL SECURITY INVOKER
select condicion_id
from condicion_prexistente
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCondimento`(IN `nom` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select condimentos_id
from  condimentos
where nombre=nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCondReceta`(IN `rec` INT, IN `cond` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select condim_recet_id
from `condimentos_receta`
where recetas_id = rec and condimentos_id = cond$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDDieta`(IN `nom` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select dieta_id
from dietas
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDIng`(IN `nom` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT ingredientes_id FROM `ingredientes` WHERE nombre = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDIngReceta`(IN `rec` INT, IN `ing` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select condim_recet_id
from `ingredientes_receta`
where recetas_id = rec and ingredientes_id = ing$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDPerfil`(IN `nom` VARCHAR(40), IN `ape` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT perfil_id FROM `perfil_usuario` WHERE nombre = nom and apellido=ape$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDProcedimiento`(IN `im1` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select procedimientos_id
from procedimientos
where imagen1= im1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDReceta`(IN `nom` VARCHAR(40))
    NO SQL
select recetas_id
from recetas
where nombre = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDRecUsuario`(IN `usu` INT, IN `rec` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select recet_usuario_id
from `recetas_usuario`
where usuario_id = usu and recetas_id = rec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDRutina`(IN `nom` VARCHAR(20))
    READS SQL DATA
    SQL SECURITY INVOKER
select usuario_id
from usuarios
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDSeason`(IN `nom` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select temporada_id 
from temporadas
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDUsuario`(IN `nombre` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select usuario_id
from usuarios
where nombreUsuario = nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreCategoria`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from categoria_receta
where categorias_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreCondicion`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from condicion_prexistente
where condicion_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreDieta`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from dietas
where dieta_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreIng`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select nombre
from ingredientes
where ingredientes_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreTemporada`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from temporadas
where temporada_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPerfil`(IN `usu` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PU.nombre,PU.apellido,PU.sexo,PU.edad,PU.altura,PU.complexion,PU.dieta_id,PU.rutina_id,PU.condicion_id
FROM usuarios as U inner join perfil_usuario as PU on U.usuario_id = PU.usuario_id
WHERE U.nombreUsuario = usu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaMasConsultada`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from historial as H inner join recetas as R on H.receta_id = R.recetas_id
where operacion = 'consultar' and H.tiempo between fecha1 and fecha2
group by receta_id
order by count(*) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunCondicion`(IN `user_id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas R
/*inner join condicion_prexistente C on C.condicion_id = R.condicion_id*/
inner join perfil_usuario P on ( P.condicion_id = R.condicion_id)
where P.usuario_id = user_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunCondimento`(IN `cond` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from condimentos C
inner join condimentos_receta CR on CR.condimentos_id = C.condimentos_id
inner join recetas R on (R.recetas_id = CR.recetas_id)
where C.nombre like concat("%",cond,"%")
order by rand(R.recetas_id)
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunDieta`(IN `dieta` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas R
inner join dietas D on R.dieta_id = D.dieta_id
where D.tipo = dieta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunDificultad`(IN `dif` INT(4))
    NO SQL
select * 
from recetas
where dificultad =dif$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunIngPpal`(IN `ing` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from ingredientes as I inner join recetas as R on  R.ingrediente_ppal_id = I.ingredientes_id 
where I.nombre = ing 
order by rand(R.recetas_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunNivelAlimenticio`(IN `nivel` VARCHAR(30))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas as R
inner join ingredientes as I on R.ingrediente_ppal_id = I.ingredientes_id
inner join nivel_alimenticio as NA on (I.nivel_id = NA.nivel_id)
where NA.tipo like concat("%",nivel,"%")
order by rand(R.recetas_id) 
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunPreferencia`(IN `user_id` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas R
inner join preferencias_alimenticias_usuario PA on R.ingrediente_ppal_id = PA.ingredientes_id
where PA.usuario_id = user_id
order by rand(R.recetas_id) 
limit 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunPrefPeriodo`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from historial as H inner join recetas as R on H.receta_id = R.recetas_id
where H.operacion in ('confirmar','consultar')
and H.tiempo between fecha1 and fecha2
group by receta_id
order by count(*) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaTopTemporada`(IN `temporada` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select * 
from recetas as R inner join temporadas as T on R.temporada_id = T.temporada_id 
inner join promedio_calificacion as P on R.recetas_id = P.recetas_id 
where P.calificacion_promedio = 5 and T.tipo like concat("%",temporada,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteRangoCalorias`(IN `caloria1` DOUBLE, IN `caloria2` DOUBLE)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from recetas re
where re.caloriasTotales between caloria1 and caloria2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteRecetas`(IN `usuario` INT(10), IN `operacion` VARCHAR(10), IN `fecha1` DATE, IN `fecha2` DATE)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from historial
where usuario_id = usuario
and operacion like concat("%",operacion,"%")
and tiempo between fecha1 and fecha2$$

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `calificacion_usuario_receta`
--

INSERT INTO `calificacion_usuario_receta` (`calif_recet_usuario`, `recetas_id`, `usuario_id`, `calificacion`) VALUES
(1, 10, 7, 3),
(2, 12, 46, 4),
(3, 10, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_receta`
--

CREATE TABLE IF NOT EXISTS `categoria_receta` (
  `categorias_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`categorias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `categoria_receta`
--

INSERT INTO `categoria_receta` (`categorias_id`, `tipo`) VALUES
(1, 'Desayuno'),
(2, 'Almuerzo'),
(3, 'Merienda'),
(4, 'Cena'),
(5, 'Desayuno_Almuerzo'),
(6, 'Desayuno_Merienda'),
(7, 'Desayuno_Cena'),
(8, 'Almuerzo_Merienda'),
(9, 'Almuerzo_Cena'),
(10, 'Merienda_Cena'),
(11, 'Desayuno_Almuerzo_Merienda'),
(12, 'Desayuno_Almuerzo_Cena'),
(13, 'Desayuno_Merienda_Cena'),
(14, 'Almuerzo_Merienda_Cena'),
(15, 'Desayuno_Almuerzo_Merienda_Cena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_hora_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `horaMax` time NOT NULL,
  `horaMin` time NOT NULL,
  PRIMARY KEY (`categoria_hora_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_hora_id`, `nombre`, `horaMax`, `horaMin`) VALUES
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
(1, 'Celiasis'),
(2, 'Diabetes'),
(3, 'Hipertension'),
(4, 'Diabetes_Hipertension'),
(5, 'Celiasis_Diabetes'),
(6, 'Celiasis_Hipertension'),
(7, 'Celiasis_Diabetes_Hipertension');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos`
--

CREATE TABLE IF NOT EXISTS `condimentos` (
  `condimentos_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`condimentos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `condimentos`
--

INSERT INTO `condimentos` (`condimentos_id`, `nombre`) VALUES
(1, 'Cilantro'),
(2, 'Canela'),
(3, 'Comino'),
(4, 'Curry'),
(5, 'Jengibre'),
(6, 'Laurel'),
(7, 'Ajo'),
(8, 'Apio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos_receta`
--

CREATE TABLE IF NOT EXISTS `condimentos_receta` (
  `condim_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `condimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`condim_recet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `condimentos_receta`
--

INSERT INTO `condimentos_receta` (`condim_recet_id`, `recetas_id`, `condimentos_id`) VALUES
(1, 8, 1),
(2, 8, 5),
(3, 12, 6),
(4, 24, 3),
(5, 26, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dietas`
--

CREATE TABLE IF NOT EXISTS `dietas` (
  `dieta_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`dieta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `dietas`
--

INSERT INTO `dietas` (`dieta_id`, `tipo`) VALUES
(1, 'Normal'),
(2, 'Ovolactovegetariano'),
(3, 'Vegano'),
(4, 'Vegetariano'),
(5, 'Normal_Ovolactovegetariano'),
(6, 'Normal_Vegano'),
(7, 'Normal_Vegetariano'),
(8, 'Ovolactovegetariano_Vegano'),
(9, 'Ovolactovegetariano_Vegetariano'),
(10, 'Vegano_Vegetariano'),
(11, 'Normal_Ovolactovegetariano_Vegano'),
(12, 'Normal_Ovolactovegetariano_Vegetariano'),
(13, 'Normal_Vegano_Vegetariano'),
(14, 'Ovolactovegetariano_Vegano_Vegetariano'),
(15, 'Normal_Ovolactovegetariano_Vegano_Vegetariano');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`movimiento_id`, `usuario_id`, `receta_id`, `operacion`, `tiempo`) VALUES
(1, 4, 10, 'confirmar', '2015-10-14 18:36:03'),
(2, 45, 24, 'consultar', '2015-10-14 18:53:28'),
(3, 46, 12, 'calificar', '2015-10-14 18:53:28'),
(5, 7, 10, 'calificar', '2015-10-14 18:53:48'),
(6, 45, 12, 'consultar', '2015-10-19 22:06:36'),
(7, 54, 9, 'confirmar', '2015-10-20 01:35:32'),
(8, 49, 12, 'consultar', '2015-10-21 00:32:52'),
(9, 4, 10, 'cargar', '2015-10-26 23:44:03');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`ingredientes_id`, `nombre`, `porcion`, `calorias`, `nivel_id`) VALUES
(1, 'harina', 100, 250, 1),
(2, 'gelatina instantanea', 50, 70, 5),
(3, 'bola de lomo', 250, 500, 3),
(4, 'mozzarella', 150, 300, 3),
(5, 'leche', 5, 400, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_receta`
--

CREATE TABLE IF NOT EXISTS `ingredientes_receta` (
  `ingred_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
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
  `condicion_id` int(11) NOT NULL,
  PRIMARY KEY (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `perfil_usuario`
--

INSERT INTO `perfil_usuario` (`perfil_id`, `usuario_id`, `nombre`, `apellido`, `sexo`, `edad`, `altura`, `complexion`, `dieta_id`, `rutina_id`, `condicion_id`) VALUES
(1, 4, 'Juan', 'Reines', 'Masculino', 20, 1.7, '22.04', 2, 1, 0),
(2, 7, 'Franco', 'Abregu', 'Masculino', 20, 1.68, '20.01', 1, 2, 0),
(3, 46, 'Nacho', 'ghillini', 'Masculino', 28, 1.72, '30', 1, 3, 0),
(6, 45, 'Roman', 'Riquelme', 'Masculino', 25, 1.78, 'Mediana', 4, 1, 0),
(7, 54, 'Michael', 'Calleri', 'Masculino', 21, 1.75, 'Chica', 3, 2, 7);

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
  `ingrediente_ppal_id` int(11) NOT NULL,
  `dificultad` int(4) NOT NULL,
  `temporada_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `caloriasTotales` double NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `dieta_id` int(11) NOT NULL,
  `procedimiento_id` int(11) NOT NULL,
  PRIMARY KEY (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`recetas_id`, `nombre`, `ingrediente_ppal_id`, `dificultad`, `temporada_id`, `categoria_id`, `caloriasTotales`, `condicion_id`, `dieta_id`, `procedimiento_id`) VALUES
(8, 'milanesa a la maryland', 3, 3, 1, 0, 541, 1, 1, 0),
(9, 'pizza', 1, 1, 13, 0, 125, 4, 1, 0),
(10, 'pati a la parrilla', 0, 5, 0, 0, 500, 0, 0, 0),
(11, 'tallarines', 0, 2, 0, 0, 350, 0, 0, 0),
(12, 'buñuelos de acelga', 0, 2, 0, 0, 110, 0, 0, 0),
(13, 'pastel de papa', 0, 3, 0, 0, 110, 0, 0, 0),
(14, 'bizcocho de vainilla', 0, 2, 0, 0, 420, 0, 0, 0),
(20, 'cafe', 0, 1, 0, 0, 514, 0, 0, 0),
(24, 'gelatina', 0, 2, 0, 0, 514, 0, 0, 0),
(25, 'flan', 5, 2, 2, 3, 400.5, 4, 1, 0),
(26, 'empanada de carne', 3, 3, 1, 0, 200.54, 1, 1, 0);

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
  `calorias` double NOT NULL,
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
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=56 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombreUsuario`, `email`, `contrasenia`, `fecha_nacimiento`) VALUES
(4, 'juanchoPebete', 'juan_ellince@gmail.com', 'cherry', '2015-10-10'),
(7, 'franquitoMaquinola', 'franco42@gmail.com', 'abreu', '2015-10-10'),
(45, 'roman', 'roman@gmail.com', 'riquelme', '2015-10-10'),
(46, 'nacho', 'nacho45@yahoo.com', 'calafate', '2015-10-10'),
(48, 'rodrigo', 'lince@telecentro.com', 'vagoneta', '2015-10-10'),
(49, 'santi', 'santi123@hotmail.com', 'aguanteFS', '2015-10-10'),
(50, 'oscarcito', 'oscar_seguime@twitter.com', 'jefeCatedra', '2015-10-10'),
(51, 'tito', 'oscar_seguime@twitter.com', 'jefeCatedra', '2015-10-10'),
(52, 'pepe', 'casas@gmail.com', 'llamamepepe', '2015-10-10'),
(53, 'matiGrippo', 'estaEnMedrano@yahoo.com', 'error404', '2015-10-10'),
(54, 'michael', 'michael54@yahoo.com', 'franquitoAbregu', '2015-10-31');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
