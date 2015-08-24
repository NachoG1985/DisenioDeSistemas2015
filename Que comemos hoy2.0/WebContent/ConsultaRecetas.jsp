<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Consulta Recetas</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/consultaReceta.css">
		
	</head>
	
	<body>
		
		<header>
	
			<h1>¿Que comemos hoy?</h1>
		
			<nav>
				<a href="Home.jsp"> Home </a> | 
				<a href="cargarReceta.html"> Cargar Receta </a> | 
				<a href="InicioSesion.jsp"> Salir </a>
			</nav>
			
		</header>
		
		<form id="formularioFiltros"  method="POST">
		
			Catalogo a consultar:<br>
			<div id="catalogoAConsultar">
			
				<input type="radio" name="catalogo" value="todas" checked> Todas<br>
				<input type="radio" name="catalogo" value="solo personales" > Solo personales<br>
				<input type="radio" name="catalogo" value="solo generales" > Solo generales<br>
				
			</div>
			
			Filtros:<br>
			
			<div id="filtros">
			
				Dificultad: 
					<select name="dificultad">
						<option value="indiferente"> </option>
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5"> 5 </option>
				</select>
				
				Calificacion: 
					<select name="calificacion">
						<option value="indiferente"> </option>
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5"> 5 </option>
				</select>
				
				Ingrediente principal:<br>
					
					<input type="text" name="ingredientePrincipal">
					<br>
					
				Categoria:
					
				<select id="categoria" name="categoria">
						<option value="indiferente"> </option>
						<option value="desayuno"> Desayuno </option>
						<option value="almuerzo"> Almuerzo </option>
						<option value="merienda"> Merienda </option>
						<option value="cena"> Cena </option>
				</select><br>
			
			</div>
			
			<input id="boton" type="submit" name="aplicarFiltros" value="Aplicar filtros"/>
		
		</form>
		
		<%
			//Si se entra por primera vez obtener de la base de datos todas las recetas que el usuario pueda ver y ponerlas en la pantalla
			
			//Si se entra como resultado del boton de aplicar filtros luego de obtener las recetas se filtran segun los distintos criterios y se muestran en la pantalla
			
					int i = 0;
		
		for(i = 0; i<20; i++)
		{
			
			out.println("<article id=\"recetaAMostrar\">");
				out.println("<h1>Nombre receta</h1>");
				out.println("<h3 id=\"dificultadReceta\">Dificultad: 3</h3>");
				out.println("<h3 id=\"caloriasReceta\">Calorias: 40000</h3>");
				out.println("<h5>Ingrediente principal</h5>");
				out.println("<div>");
				out.println("<h4>Categoria1</h4>");
				out.println("<h4>Categoria2</h4>");
				out.println("<h4>Categoria3</h4>");
				out.println("<h4>Categoria4</h4>");
				out.println("</div>");
				out.println("<h5>Temporada</h5>");
			out.println("</article>");
		
		}
		%>

	</body>
	
</html>