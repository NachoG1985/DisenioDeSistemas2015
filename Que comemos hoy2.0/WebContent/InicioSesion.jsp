<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Inicio de sesión</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/inicioSesion.css">
	</head>
	
	<body>
	
		<header>
		
			<h1>¿Que comemos hoy?</h1>
			
			<form id="logger" action="ValidarPaginaIngreso.jsp"  method="POST">
				Nombre de usuario:
				<input type="text" name="nombreUsuarioIngreso" required/>
				
				Contraseña:
				<input type="password" name="contraseñaIngreso" required/>

			
				<input type="submit" name="boton" value="Ingresar"/>			
			</form>
			
		</header>
		
		
		<h2>Registrate</h2>
		
		<p>¿Quién nunca se hizo la pregunta <em><strong>"¿Qué comemos hoy?"</strong></em> ? Si buscas nuevas ideas, compartir tus creaciones, bajar de peso o simplemente mejorar tu alimentacion este es el lugar
		indicado. Inicia el proceso de registro y goza de estos beneficios y mas. </p>
		
		<form id="registro"  action="ValidarPaginaIngreso.jsp" method="POST">
			Nombre de usuario: <input type="text" name="nombreUsuarioRegistro" required/>
			<br>
			
			Email: <input type="email" name="emailRegistro" required/>
			<br>
			
			Contraseña: <input type="password" name="contraseñaRegistro" required/>
			<br>
			
			Repita la contraseña: <input type="password" name="confirmacionContraseñaRegistro" required/>
			<br>
			
			Fecha de nacimiento: 
			<input type="text" name="diaNacimiento" value="dd" size="2" required/> /
			<input type="text" name="mesNacimiento" value="mm" size="2" required/> /
			<input type="text" name="añoNacimiento" value="aaaa" size="4" required/>
			<br>
			<br>
			
			<input type="submit" id="boton" name="boton" value="Registrarse"/>
			
		</form>
		
	<img src="HojasEstilo/Logo.png"/>
	
</body>

</html>