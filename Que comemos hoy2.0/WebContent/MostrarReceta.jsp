<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar Receta</title>
		<link rel="stylesheet" type="text/css" href="HojasEstilo/MostrarReceta.css">
	</head>

	<body>

		<header>
	
			<h1>¿Que comemos hoy?</h1>
		
			<nav>
				<a href="Home.jsp"> Home </a> | 
				<a href="cargarReceta.html"> Cargar Receta </a> |
				<a href="ConsultarRecetas.jsp"> Consultar Recetas</a> |
				<a href="InicioSesion.jsp"> Salir </a>
			</nav>
			
		</header>	
		
		<h1>Nombre de Receta</h1>
		
		<div id="informacion">
		<h2>Informacion De la receta</h2>
		<div>
			<h3>Calorias Totales</h3>
			<h3>Calificacion</h3>
		</div>
		<div>
			<h3>Categorias</h3>
			<h3>Temporada</h3>
		</div>
		<div>
			<h3>Dificultad</h3>
			<h3>Fecha creacion</h3>
		</div>
		</div>
		
		<div id="ingredientes">
		<h2>Ingredientes:</h2>
		<ul>
			<li>Ingrediente --- Cantidad</li>
			<li>Ingrediente --- Cantidad</li>
			<li>Ingrediente --- Cantidad</li>
			<li>Ingrediente --- Cantidad</li>
		</ul>	
		</div>
		
		<div id="condimentos">
		<h2>Condimentos</h2>
		<ul>
			<li>Condimento</li>
			<li>Condimento</li>
			<li>Condimento</li>
			<li>Condimento</li>
		</ul>
		</div>
		
		<div id="procedimiento">
		<h2>Procedimiento</h2>
		<article>
			<img src="" alt="Paso" width="200" heigth="200">
			<p>Descripcion del paso de la receta</p>
		</article>
		
		<article>
			<img src="" alt="Paso" width="200" heigth="200">
			<p>Descripcion del paso de la receta</p>
		</article>
		</div>

	</body>

</html>