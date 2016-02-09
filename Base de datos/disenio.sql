-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2016 a las 19:49:33
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCondicionPerfil`(IN `perf_id` INT, IN `condNueva_id` INT, IN `condVieja_id` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
update condicion_prexistente_perfil
set condicion_id=condNueva_id
where perfil_id = perf_id and condicion_id = condVieja_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPreferenciaPerfil`(IN `perf_id` INT, IN `preferNueva_id` INT, IN `preferVieja_id` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
update preferencias_alimenticias_perfil
set ingredientes_id=preferNueva_id
where perfil_id = perf_id and ingredientes_id = preferVieja_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calcularPromedio`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
TRUNCATE TABLE promedio_calificacion_temp;

INSERT INTO promedio_calificacion_temp (recetas_id, calificacion_promedio)
SELECT C.recetas_id, ROUND (AVG(C.calificacion),2)
FROM calificacion_usuario_receta C 
GROUP BY C.recetas_id;

IF ((SELECT COUNT(*) FROM promedio_calificacion_temp)>0)
THEN CALL cargarPromedio();
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calificarRecetaUsuario`(IN `usu_id` INT, IN `rec_id` INT, IN `calif` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into calificacion_usuario_receta (recetas_id,usuario_id,calificacion)
values (usu_id,rec_id,calif)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `caloriasRutina`(IN `actividad` VARCHAR(20))
    READS SQL DATA
    SQL SECURITY INVOKER
select calorias 
from rutinas
where tipo like concat("%",actividad,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarPromedio`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
BEGIN
TRUNCATE TABLE promedio_calificacion;
ALTER TABLE promedio_calificacion AUTO_INCREMENT = 0;

INSERT INTO promedio_calificacion (recetas_id,calificacion_promedio)
SELECT recetas_id, calificacion_promedio FROM promedio_calificacion_temp;

END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarEventoEnHistorial`(IN `nombreUsu` VARCHAR(50), IN `nombreRec` VARCHAR(40), IN `operac` VARCHAR(10))
    READS SQL DATA
    SQL SECURITY INVOKER
select H.tiempo
from historial H
inner join usuarios U on H.usuario_id = U.usuario_id
inner join recetas R on H.receta_id = R.recetas_id
where (U.nombreUsuario = nombreUsu and R.nombre = nombreRec) and H.operacion = operac$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaUsuario`(IN `nom` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from usuarios
where nombreUsuario = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `countOperacion`(IN `operacion` VARCHAR(10))
    READS SQL DATA
    SQL SECURITY INVOKER
select H.operacion, count(H.operacion)
from historial H 
where H.operacion = operacion
group by H.operacion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `estadisticaRankingRecetaConsultada`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre, count(H.operacion) as count
from historial H inner join recetas R on H.receta_id = R.recetas_id
where H.operacion = 'consultar' and (H.tiempo between fecha1 and fecha2)
group by H.receta_id
Order by count(H.operacion) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `estadisticaRecetaDificultad`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad, count(H.receta_id) as count
from historial H 
inner join recetas R on R.recetas_id = H.receta_id
where H.operacion = 'consultar' and (H.tiempo between fecha1 and fecha2)
group by R.dificultad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `estadisticaSegunSexo`(IN `sexo` VARCHAR(20), IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,count(H.operacion) as count
from historial H 
inner join perfil_usuario PU on PU.usuario_id = H.usuario_id
inner join recetas R on H.receta_id = R.recetas_id
where H.operacion = 'consultar' and (H.tiempo between fecha1 and fecha2)
and PU.sexo = sexo
group by H.usuario_id
order by count(H.operacion) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ingYCantSegunReceta`(IN `rec` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select I.nombre,IR.cantidad
from ingredientes_receta as IR inner join ingredientes as I on IR.ingredientes_id = I.ingredientes_id
where IR.recetas_id = rec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoriaReceta`(IN `receta` INT, IN `categ` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `categoria_receta`(recetas_id,categoria_id) VALUES(receta,categ)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCondicionPerfil`(IN `perfil` INT, IN `cond` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `condicion_prexistente_perfil`(perfil_id,condicion_id)
VALUES (perfil,cond)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCondicionReceta`(IN `rec` INT, IN `cond` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `condicion_receta`(recetas_id,condicion_id) VALUES(rec,cond)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDietaPerfil`(IN `perfil` INT, IN `dieta` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `dieta_perfil`(perfil_id,dieta_id) VALUES(perfil,dieta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDietaReceta`(IN `rec` INT, IN `dieta` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `dieta_receta`(recetas_id,dieta_id) VALUES(rec,dieta)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPerfil`(IN `usu` INT(11), IN `nom` VARCHAR(40), IN `ape` VARCHAR(40), IN `sexo` VARCHAR(20), IN `edad` INT(3), IN `altura` DOUBLE, IN `comple` VARCHAR(20), IN `dieta` INT, IN `rutina` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into perfil_usuario(usuario_id,nombre,apellido,sexo,edad,altura,complexion,dieta_id,rutina_id) VALUES(usu,nom,ape,sexo,edad,altura,comple,dieta,rutina)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPreferenciaPerfil`(IN `perf_id` INT, IN `prefer_id` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `preferencias_alimenticias_perfil`(perfil_id,ingredientes_id)
VALUES (perf_id,prefer_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProcedimiento`(IN `im1` VARCHAR(100), IN `pas1` TEXT, IN `im2` VARCHAR(100), IN `pas2` TEXT, IN `im3` VARCHAR(100), IN `pas3` TEXT, IN `im4` VARCHAR(100), IN `pas4` TEXT, IN `im5` VARCHAR(100), IN `pas5` TEXT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into procedimientos(imagen1,paso1,imagen2,paso2,imagen3,paso3,imagen4,paso4,imagen5,paso5) VALUES(im1,pas1,im2,pas2,im3,pas3,im4,pas4,im5,pas5)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReceta`(IN `nom ` VARCHAR(40), IN `ing` INT, IN `dif` INT(4), IN `calo` INT, IN `proc` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into recetas(nombre,ingrediente_ppal_id,dificultad,caloriasTotales,procedimiento_id) values (nom,ing,dif,calo,proc)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarRecUsuario`(IN `usu` INT, IN `rec` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `recetas_usuario`(usuario_id,recetas_id) VALUES(usu,rec)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTemporadaReceta`(IN `receta` INT, IN `temp` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
insert into `temporadas_receta`(recetas_id,temporada_id) VALUES(receta,temp)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `nombre` VARCHAR(50), IN `mail` VARCHAR(100), IN `pass` VARCHAR(100), IN `fecha` DATE)
    MODIFIES SQL DATA
insert into usuarios(nombreUsuario,email,contrasenia,fecha_nacimiento) VALUES(nombre,mail,pass,fecha)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCondimentos`()
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT C.nombre, C.condimentos_id
FROM condimentos C$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarHome`(IN `operacion` VARCHAR(10), IN `limite` TINYINT)
    READS SQL DATA
    SQL SECURITY INVOKER
select *
from historial
where usuario_id = usuario
and operacion like concat("%",operacion,"%")
limit limite$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarIngredientes`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
SELECT I.nombre, I.ingredientes_id
FROM ingredientes I$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarPerfilUsuario`(IN `nom` VARCHAR(40), IN `ape` VARCHAR(40), IN `sex` VARCHAR(20), IN `ed` INT(3), IN `alt` DOUBLE, IN `compl` VARCHAR(20), IN `diet` INT, IN `rutin` INT, IN `cond` INT, IN `usu` INT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
update perfil_usuario
set nombre=nom,apellido=ape,sexo=sex,edad=ed,altura=alt,complexion=compl,dieta_id=diet,rutina_id=rutin,condicion_id=cond
where usuario_id = usu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarDatosIng`(IN `nom` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select porcion, calorias, nivel_id
from ingredientes
where nombre = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarProcedimientoReceta`(IN `nombreReceta` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select P.imagen1,P.paso1,P.imagen2,P.paso2,P.imagen3,P.paso3,P.imagen4,P.paso4,P.imagen5,P.paso5
from recetas R inner join procedimientos P on R.procedimiento_id = P.procedimientos_id
where R.nombre = nombreReceta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasCreadas`(IN `usu_id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas R
inner join historial H on (R.recetas_id = H.receta_id)
inner join categoria_receta CR on (R.recetas_id = CR.recetas_id)
where H.operacion = 'cargar' and H.usuario_id = usu_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarRecetasCreadasEnDB`()
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id 
from recetas R
inner join historial H on (R.recetas_id = H.receta_id)
where H.operacion = 'cargar'$$

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
from recetas R
inner join promedio_calificacion P on R.recetas_id = P.recetas_id
where R.nombre like concat("%",nombre,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCalificacionRecetaBeta`(IN `nombreRec` VARCHAR(40), OUT `promedio` FLOAT)
    READS SQL DATA
    SQL SECURITY INVOKER
select AVG(C.calificacion) into promedio
from calificacion_usuario_receta C
inner join recetas R on C.recetas_id=R.recetas_id
where R.nombre = nombreRec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCalificacionRecetaUsuario`(IN `nombreUsu` VARCHAR(50), IN `nombreRec` VARCHAR(40), OUT `calificacion` FLOAT)
    READS SQL DATA
    SQL SECURITY INVOKER
select CUR.calificacion into calificacion
from calificacion_usuario_receta CUR
inner join usuarios U on CUR.usuario_id = U.usuario_id
inner join recetas R on CUR.recetas_id = R.recetas_id
where U.nombreUsuario = nombreUsu and R.nombre=nombreRec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCategoriaReceta`(IN `nomRec` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select C.nombre
from categoria_receta CR
inner join recetas R on CR.recetas_id = R.recetas_id
inner join categorias C on CR.categoria_id = C.categoria_id
where R.nombre = nomRec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCondicionPerfil`(IN `perf_id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select C.tipo
from condicion_prexistente_perfil CP
inner join condicion_prexistente C on CP.condicion_id = C.condicion_id
where CP.perfil_id = perf_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCondicionReceta`(IN `nomRec` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select C.tipo
from condicion_receta CR
inner join recetas R on CR.recetas_id = R.recetas_id
inner join condicion_prexistente C on CR.condicion_id = C.condicion_id
where R.nombre = nomRec$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDietaReceta`(IN `nomRec` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select D.tipo
from dieta_receta DR
inner join recetas R on DR.recetas_id = R.recetas_id
inner join dietas D on DR.dieta_id = D.dieta_id
where R.nombre = nomRec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDAlimenticio`(IN `tipo` VARCHAR(30))
    READS SQL DATA
    SQL SECURITY INVOKER
select nivel_id 
from nivel_alimenticio
where tipo = nom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIDCategoria`(IN `nom` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select categoria_id 
from categorias
where nombre=nom$$

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
select nombre
from categorias
where categoria_id = id$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreNivelAlim`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo 
from nivel_alimenticio
where nivel_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreRutina`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from rutinas
where rutina_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreTemporada`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select tipo
from temporadas
where temporada_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNombreUsuario`(IN `id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select nombreUsuario
from usuarios
where usuario_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPerfil`(IN `nombre` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PU.nombre,PU.apellido,PU.sexo,PU.edad,PU.altura,PU.complexion,PU.dieta_id,PU.rutina_id
FROM perfil_usuario PU
inner join usuarios U on PU.usuario_id = U.usuario_id
WHERE U.nombreUsuario = nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPreferenciaPerfil`(IN `perf_id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select I.nombre
from preferencias_alimenticias_perfil PR
inner join ingredientes I on PR.ingredientes_id = I.ingredientes_id
where PR.perfil_id = perf_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTemporadaReceta`(IN `nomRec` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select T.tipo
from temporadas_receta TR
inner join recetas R on TR.recetas_id = R.recetas_id
inner join temporadas T on TR.temporada_id = T.temporada_id
where R.nombre = nomRec$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaMasConsultada`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP, IN `nombre` VARCHAR(50))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from historial as H 
inner join recetas as R on H.receta_id = R.recetas_id
inner join usuarios as U on H.usuario_id = U.usuario_id
where (operacion = 'consultar' and H.tiempo between fecha1 and fecha2) and
U.nombreUsuario = nombre
group by receta_id
order by count(*) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunCondicion`(IN `user_id` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id,CAR.categoria_id,TR.temporada_id,R.dieta_id
from recetas as R
inner join perfil_usuario as P  on ( R.condicion_id = P.condicion_id)
inner join categoria_receta  CAR on R.recetas_id = CAR.recetas_id
inner join temporadas_receta  TR on R.recetas_id = TR.recetas_id
where P.usuario_id = user_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunCondimento`(IN `cond` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from condimentos_receta CR
inner join condimentos C on  CR.condimentos_id=C.condimentos_id
inner join recetas R on (CR.recetas_id = R.recetas_id)
where C.nombre like concat("%",cond,"%")
order by rand(R.recetas_id)
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunDieta`(IN `dieta` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas R
inner join dietas D on R.dieta_id = D.dieta_id
where D.tipo = dieta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunDificultad`(IN `dif` INT(4))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas R
where dificultad = dif$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunIngPpal`(IN `ing` VARCHAR(40))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas as R 
inner join ingredientes as I on  R.ingrediente_ppal_id = I.ingredientes_id 
where I.nombre = ing 
order by rand(R.recetas_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunInteresPeriodo`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id,R.categoria_id,R.temporada_id,R.dieta_id
from historial as H inner join recetas as R on H.receta_id = R.recetas_id
where H.operacion in ('confirmar','consultar')
and H.tiempo between fecha1 and fecha2
group by receta_id
order by count(*) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunNivelAlimenticio`(IN `nivelID` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas as R
where R.ingrediente_ppal_id = nivelID
order by rand(R.recetas_id) 
limit 5$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunPreferencia`(IN `user_id` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas R
inner join preferencias_alimenticias_usuario PA on R.ingrediente_ppal_id = PA.ingredientes_id
where PA.usuario_id = user_id
order by rand(R.recetas_id) 
limit 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunPrefPeriodo`(IN `fecha1` TIMESTAMP, IN `fecha2` TIMESTAMP)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from historial as H 
inner join recetas as R on H.receta_id = R.recetas_id
where H.operacion in ('confirmar','consultar')
and H.tiempo between fecha1 and fecha2
group by receta_id
order by count(*) desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaSegunTemporada`(IN `temporada` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas as R inner join temporadas as T on R.temporada_id = T.temporada_id 
where T.tipo like concat("%",temporada,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recetaTopTemporada`(IN `temporada` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas as R
inner join temporadas as T on R.temporada_id = T.temporada_id 
inner join promedio_calificacion as P on R.recetas_id = P.recetas_id 
where T.tipo like concat("%",temporada,"%")
order by P.calificacion_promedio desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteRangoCalorias`(IN `caloria1` DOUBLE, IN `caloria2` DOUBLE)
    READS SQL DATA
    SQL SECURITY INVOKER
select R.nombre,R.dificultad,R.caloriasTotales,R.ingrediente_ppal_id
from recetas R
where R.caloriasTotales between caloria1 and caloria2$$

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
  PRIMARY KEY (`calif_recet_usuario`),
  KEY `recetas_id` (`recetas_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `calificacion_usuario_receta`
--

INSERT INTO `calificacion_usuario_receta` (`calif_recet_usuario`, `recetas_id`, `usuario_id`, `calificacion`) VALUES
(1, 10, 7, 3),
(2, 12, 46, 4),
(3, 10, 2, 1),
(4, 10, 60, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_receta`
--

CREATE TABLE IF NOT EXISTS `categoria_receta` (
  `categorias_receta_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`categorias_receta_id`),
  KEY `recetas_id` (`recetas_id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `categoria_receta`
--

INSERT INTO `categoria_receta` (`categorias_receta_id`, `recetas_id`, `categoria_id`) VALUES
(1, 10, 2),
(2, 8, 2),
(3, 24, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `horaMax` time NOT NULL,
  `horaMin` time NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre`, `horaMax`, `horaMin`) VALUES
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `condicion_prexistente`
--

INSERT INTO `condicion_prexistente` (`condicion_id`, `tipo`) VALUES
(1, 'Celiasis'),
(2, 'Diabetes'),
(3, 'Hipertension'),
(4, 'Nada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_prexistente_perfil`
--

CREATE TABLE IF NOT EXISTS `condicion_prexistente_perfil` (
  `condicion_prex_perfil_id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  PRIMARY KEY (`condicion_prex_perfil_id`),
  KEY `perfil_id` (`perfil_id`,`condicion_id`),
  KEY `condicion_id` (`condicion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `condicion_prexistente_perfil`
--

INSERT INTO `condicion_prexistente_perfil` (`condicion_prex_perfil_id`, `perfil_id`, `condicion_id`) VALUES
(1, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_receta`
--

CREATE TABLE IF NOT EXISTS `condicion_receta` (
  `condicion_receta_id` int(11) NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  PRIMARY KEY (`condicion_receta_id`),
  KEY `recetas_id` (`recetas_id`,`condicion_id`),
  KEY `condicion_id` (`condicion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `condicion_receta`
--

INSERT INTO `condicion_receta` (`condicion_receta_id`, `recetas_id`, `condicion_id`) VALUES
(2, 10, 1),
(1, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos`
--

CREATE TABLE IF NOT EXISTS `condimentos` (
  `condimentos_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`condimentos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `condimentos`
--

INSERT INTO `condimentos` (`condimentos_id`, `nombre`) VALUES
(1, 'cilantro'),
(2, 'canela'),
(3, 'comino'),
(4, 'curry'),
(5, 'jengibre'),
(6, 'laurel'),
(7, 'eucalipto'),
(8, 'apio'),
(9, 'sal'),
(10, 'pimienta negra'),
(11, 'orégano'),
(12, 'pimentón picante'),
(13, 'azafrán'),
(14, 'clavo de olor'),
(15, 'hinojo'),
(16, 'nuez moscada'),
(17, 'pimentón dulce'),
(18, 'pimienta blanca'),
(19, 'menta'),
(20, 'romero'),
(22, 'vainilla'),
(23, 'perejil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condimentos_receta`
--

CREATE TABLE IF NOT EXISTS `condimentos_receta` (
  `condim_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `condimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`condim_recet_id`),
  KEY `recetas_id` (`recetas_id`,`condimentos_id`),
  KEY `condimentos_id` (`condimentos_id`)
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
-- Estructura de tabla para la tabla `dieta_receta`
--

CREATE TABLE IF NOT EXISTS `dieta_receta` (
  `dieta_receta_id` int(11) NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `dieta_id` int(11) NOT NULL,
  PRIMARY KEY (`dieta_receta_id`),
  KEY `recetas_id` (`recetas_id`,`dieta_id`),
  KEY `dieta_id` (`dieta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `dieta_receta`
--

INSERT INTO `dieta_receta` (`dieta_receta_id`, `recetas_id`, `dieta_id`) VALUES
(1, 10, 1);

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
(4, 'Vegetariano');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`movimiento_id`, `usuario_id`, `receta_id`, `operacion`, `tiempo`) VALUES
(1, 4, 10, 'confirmar', '2015-10-14 18:36:03'),
(2, 59, 24, 'consultar', '2015-10-14 18:53:28'),
(3, 46, 12, 'calificar', '2015-10-14 18:53:28'),
(5, 7, 10, 'calificar', '2015-10-14 18:53:48'),
(6, 60, 12, 'consultar', '2015-10-19 22:06:36'),
(7, 54, 9, 'confirmar', '2015-10-20 01:35:32'),
(8, 60, 12, 'consultar', '2015-10-21 00:32:52'),
(9, 59, 10, 'cargar', '2015-10-26 23:44:03'),
(10, 7, 12, 'consultar', '2016-01-29 22:07:42'),
(11, 59, 8, 'consultar', '2016-01-31 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
  `ingredientes_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `porcion` int(11) NOT NULL,
  `calorias` double NOT NULL,
  `nivel_id` int(11) NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=104 ;

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
(102, 'sorgo', 100, 339, 1),
(103, 'ajo', 100, 149, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_receta`
--

CREATE TABLE IF NOT EXISTS `ingredientes_receta` (
  `ingred_recet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`ingred_recet_id`),
  KEY `recetas_id` (`recetas_id`),
  KEY `ingredientes_id` (`ingredientes_id`),
  KEY `nivel_id` (`nivel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ingredientes_receta`
--

INSERT INTO `ingredientes_receta` (`ingred_recet_id`, `recetas_id`, `ingredientes_id`, `nivel_id`, `cantidad`) VALUES
(1, 9, 1, 1, 250),
(2, 10, 64, 3, 500),
(3, 14, 1, 1, 1000),
(4, 11, 1, 1, 100),
(5, 9, 4, 3, 300);

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
  `perfil_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `altura` double NOT NULL,
  `complexion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `dieta_id` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL,
  PRIMARY KEY (`perfil_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `dieta_id` (`dieta_id`),
  KEY `rutina_id` (`rutina_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `perfil_usuario`
--

INSERT INTO `perfil_usuario` (`perfil_id`, `usuario_id`, `nombre`, `apellido`, `sexo`, `edad`, `altura`, `complexion`, `dieta_id`, `rutina_id`) VALUES
(8, 59, 'Juan Cruz', 'Reines', 'masculino', 21, 1.78, 'mediana', 1, 3),
(9, 60, 'Roberto', 'Carlos', 'masculino', 35, 2, 'pequeña', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias_alimenticias_perfil`
--

CREATE TABLE IF NOT EXISTS `preferencias_alimenticias_perfil` (
  `prefe_alim_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL,
  PRIMARY KEY (`prefe_alim_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `preferencias_alimenticias_perfil`
--

INSERT INTO `preferencias_alimenticias_perfil` (`prefe_alim_perfil`, `perfil_id`, `ingredientes_id`) VALUES
(1, 8, 1),
(2, 8, 3),
(3, 9, 1),
(4, 9, 2);

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
  `promedio_califacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `calificacion_promedio` decimal(4,2) NOT NULL,
  PRIMARY KEY (`promedio_califacion_id`),
  UNIQUE KEY `promedio_califacion_id` (`promedio_califacion_id`,`recetas_id`),
  KEY `recetas_id` (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `promedio_calificacion`
--

INSERT INTO `promedio_calificacion` (`promedio_califacion_id`, `recetas_id`, `calificacion_promedio`) VALUES
(1, 10, '2.00'),
(2, 12, '4.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promedio_calificacion_temp`
--

CREATE TABLE IF NOT EXISTS `promedio_calificacion_temp` (
  `recetas_id` int(11) NOT NULL,
  `calificacion_promedio` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `promedio_calificacion_temp`
--

INSERT INTO `promedio_calificacion_temp` (`recetas_id`, `calificacion_promedio`) VALUES
(10, '2.00'),
(12, '4.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
  `recetas_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `ingrediente_ppal_id` int(11) NOT NULL,
  `dificultad` int(4) NOT NULL,
  `caloriasTotales` double NOT NULL,
  `procedimiento_id` int(11) NOT NULL,
  PRIMARY KEY (`recetas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`recetas_id`, `nombre`, `ingrediente_ppal_id`, `dificultad`, `caloriasTotales`, `procedimiento_id`) VALUES
(8, 'milanesa a la maryland', 3, 3, 541, 0),
(9, 'pizza', 1, 1, 125, 0),
(10, 'pati a la parrilla', 64, 5, 500, 0),
(11, 'tallarines', 1, 2, 350, 0),
(12, 'buñuelos de acelga', 0, 1, 110, 0),
(13, 'pastel de papa', 0, 3, 110, 0),
(14, 'bizcocho de vainilla', 1, 2, 420, 0),
(20, 'cafe', 0, 1, 514, 0),
(24, 'gelatina', 0, 3, 514, 0),
(25, 'flan', 5, 2, 400.5, 0),
(26, 'empanada de carne', 3, 3, 200.54, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_usuario`
--

CREATE TABLE IF NOT EXISTS `recetas_usuario` (
  `recet_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `recetas_id` int(11) NOT NULL,
  PRIMARY KEY (`recet_usuario_id`),
  KEY `recetas_id` (`recetas_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `recetas_id_2` (`recetas_id`)
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
(6, 'Pascua');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas_receta`
--

CREATE TABLE IF NOT EXISTS `temporadas_receta` (
  `temporadas_receta_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recetas_id` int(11) NOT NULL,
  `temporada_id` int(11) NOT NULL,
  PRIMARY KEY (`temporadas_receta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `temporadas_receta`
--

INSERT INTO `temporadas_receta` (`temporadas_receta_id`, `recetas_id`, `temporada_id`) VALUES
(1, 10, 1),
(2, 8, 1),
(3, 24, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=61 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombreUsuario`, `email`, `contrasenia`, `fecha_nacimiento`) VALUES
(59, 'JuanCruzReines', 'juancruz@hotmail.com', 'diseño2015', '1994-04-16'),
(60, 'Roberto Carlos', 'croberto@hotmail.com', 'brasil', '1965-07-26');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_receta`
--
ALTER TABLE `categoria_receta`
  ADD CONSTRAINT `categoria_receta_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `categoria_receta_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condicion_prexistente_perfil`
--
ALTER TABLE `condicion_prexistente_perfil`
  ADD CONSTRAINT `condicion_prexistente_perfil_ibfk_2` FOREIGN KEY (`condicion_id`) REFERENCES `condicion_prexistente` (`condicion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `condicion_prexistente_perfil_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil_usuario` (`perfil_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condicion_receta`
--
ALTER TABLE `condicion_receta`
  ADD CONSTRAINT `condicion_receta_ibfk_2` FOREIGN KEY (`condicion_id`) REFERENCES `condicion_prexistente` (`condicion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `condicion_receta_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condimentos_receta`
--
ALTER TABLE `condimentos_receta`
  ADD CONSTRAINT `condimentos_receta_ibfk_2` FOREIGN KEY (`condimentos_id`) REFERENCES `condimentos` (`condimentos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `condimentos_receta_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dieta_receta`
--
ALTER TABLE `dieta_receta`
  ADD CONSTRAINT `dieta_receta_ibfk_2` FOREIGN KEY (`dieta_id`) REFERENCES `dietas` (`dieta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dieta_receta_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingredientes_receta`
--
ALTER TABLE `ingredientes_receta`
  ADD CONSTRAINT `ingredientes_receta_ibfk_3` FOREIGN KEY (`nivel_id`) REFERENCES `nivel_alimenticio` (`nivel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingredientes_receta_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingredientes_receta_ibfk_2` FOREIGN KEY (`ingredientes_id`) REFERENCES `ingredientes` (`ingredientes_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfil_usuario`
--
ALTER TABLE `perfil_usuario`
  ADD CONSTRAINT `perfil_usuario_ibfk_3` FOREIGN KEY (`rutina_id`) REFERENCES `rutinas` (`rutina_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_usuario_ibfk_2` FOREIGN KEY (`dieta_id`) REFERENCES `dietas` (`dieta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `promedio_calificacion`
--
ALTER TABLE `promedio_calificacion`
  ADD CONSTRAINT `promedio_calificacion_ibfk_1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`recetas_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
