<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registro de nuevo usuario</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/registroUsuario.css">
	</head>
	
	<body>
	
		<header>
		
			<h1>¿Que comemos hoy?</h1>
			
		</header>
		
		<h2>Registro de nuevo usuario</h2>
		
		
		<form  method="POST">
			
			Nombre y apellido: <input type="text" name="nombreYApellido" size="40" required/>
			<br>
			
			Altura: <input type="text" name="altura" required/>  
			
			Edad: <input type="text" name="edad" required/>
			<br>
			
			Sexo:
			<input type="radio" name="sexo" value="masculino" required> Masculino 
			<input type="radio" name="sexo" value="femenino" required> Femenino
			<br>
			
			Dieta:
			<select name="dieta" required>
				<option value="normal"> Normal </option>
				<option value="ovolactovegetariano"> Ovolactovegetariano </option>
				<option value="vegetariano"> Vegetariano </option>
				<option value="vegano"> Vegano </option>
			</select>
			<br>
			
			Condicion preexistente:
			<input type="checkbox" name="diabetes" value="diabetes"> Diabetes
			<input type="checkbox" name="hipertension" value="hipertension"> Celiasis
			<input type="checkbox" name="celiasis" value="celiasis"> Celiasis
			<br>
			
			Rutina de ejercicios:<br>
			<input type="radio" name="rutina" value="nada" required> Nada <br>
			<input type="radio" name="rutina" value="leve" required> Leve 	<br>		
			<input type="radio" name="rutina" value="mediana" required> Mediana <br>
			<input type="radio" name="rutina" value="grande" required> Grande <br>
			<input type="radio" name="rutina" value="intensiva" required> Intensiva 
			<br>
			
			complexion fisica:
			<input type="radio" name="complexion" value="pequeña" required> Pequeña
			<input type="radio" name="complexion" value="mediana" required> Mediana 			
			<input type="radio" name="complexion" value="grande" required> Grande
			<br>
			
			<input id="boton" type="submit" name="registrar"/>
			
		</form>
		
		<%
			//Ingresar los datos a la base de datos
			
			//Corroborar que los datos se hayan ingresado de forma correcta
			
			//Redirigir al home del usuario
		
		%>
</body>

</html>