<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/home.css">
	</head>
	
	<body>
	
		<header>
	
			<h1>¿Que comemos hoy?</h1>
		
			<nav>
				<a href="consultarRecetas.html"> Consultar Recetas </a> | 
				<a href="cargarReceta.html"> Cargar Receta </a> | 
				<a href="InicioSesion.jsp"> Salir </a>
			</nav>
			
		</header>
		
		<h2> Ultimas recetas: </h2>
		
		<%
		
		//Obtener los datos del usuario desde la base de datos
		
		//Obtener las recetas que se van a mostrar segun el criterio de las 10 ultimas
		
		//A traves del ciclo while mostrar las 10 recetas obtenidas
		
		int i = 0;
		
		for(i = 0; i<10; i++)
		{
			
			out.println("<article id=\"recetaAMostrar\">");
				out.println("<h1>Nombre receta</h1>");
				out.println("<h3>Dificultad</h3>");
				out.println("<h3>calorias</h3>");
				out.println("<h3>Ingrediente principal</h3>");
				out.println("<h4>Categoria1</h4>");
				out.println("<h4>Categoria2</h4>");
				out.println("<h4>Categoria3</h4>");
				out.println("<h4>Categoria4</h4>");
				out.println("<h3>Temporada</h3>");
			out.println("</article>");
		
		}
		%>
			
</body>

</html>