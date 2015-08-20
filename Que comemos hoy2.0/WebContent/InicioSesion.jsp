<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Inicio de sesi�n</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/inicioSesion.css">
	</head>
	
	<body>

		<header>
		
			<h1>�Que comemos hoy?</h1>
			
			<form id="logger"  method="POST">
				Nombre de usuario:
				<input type="text" name="nombreUsuarioIngreso" required/>
				
				Contrase�a:
				<input type="password" name="contrase�aIngreso" required/>

			
				<input type="submit" name="ingresar" value="Ingresar"/>			
			</form>
			
		</header>
		
		<%
		
			//Analizar de cual de los dos botones viene el pedido
			
				//Si viene del boton de inicio de sesion
				
					//Buscar en la base de datos el usuario con el nombre ingresado
			
					//Si el usuario no existe o la contrase�a ingresada no coincide mostrar cartel de error
			
					//Si el usuario existe y la contrase�a ingresada es correcta entonces setear el nombre de usuario en la sesion y redirigir a la pagina home
			
				//Si viene del boton de registro
					
					//Buscar el nombre ingresado en la base de datos
			
					//Si el nombre de usuario ya existe msotrar cartel de nombre de usuario en uso
			
					//Si no existe proceder con el registro
		
		%>
		
		<h2>Registrate</h2>
		
		<p>�Qui�n nunca se hizo la pregunta <em><strong>"�Qu� comemos hoy?"</strong></em> ? Si buscas nuevas ideas, compartir tus creaciones, bajar de peso o simplemente mejorar tu alimentacion este es el lugar
		indicado. Inicia el proceso de registro y goza de estos beneficios y mas. </p>
		
		<form id="registro" method="POST">
			Nombre de usuario: <input type="text" name="nombreUsuarioRegistro" required/>
			<br>
			
			Email: <input type="email" name="emailRegistro" required/>
			<br>
			
			Contrase�a: <input type="password" name="contrase�aRegistro" required/>
			<br>
			
			Repita la contrase�a: <input type="password" name="confirmacionContrase�aRegistro" required/>
			<br>
			<br>
			
			<input type="submit" name="registrarse" value="Registrarse"/>
			
		</form>
		
	<img src="HojasEstilo/Logo.png"/>
</body>

</html>