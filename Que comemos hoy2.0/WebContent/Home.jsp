<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.Receta" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>

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
				<a href="ConsultaRecetas.jsp"> Consultar Recetas </a> | 
				<a href="cargarReceta.html"> Cargar Receta </a> | 
				<a href="InicioSesion.jsp"> Salir </a>
			</nav>
			
		</header>
		
		<h2> Ultimas recetas: </h2>
		
		<%
		
		//Obtener los datos del usuario desde la base de datos
		
		//Obtener las recetas que se van a mostrar segun el criterio de las 10 ultimas
		
		//A traves del ciclo while mostrar las 10 recetas obtenidas
				
		ResultSet recetas = ConsultorBaseDeDatos.getInstance().mostrarRecetasDB();
		
			recetas.first();
			Set<Receta> recetasAMostrar = new HashSet<Receta>();
			Receta receta;
			do{
				receta = new Receta();
				receta.setCaloriasTotales(recetas.getInt("caloriasTotales"));
				receta.setNombre(recetas.getString("nombre"));
				receta.setDificultad(recetas.getInt("dificultad"));
				receta.setTemporada(recetas.getString("temporada"));
				receta.setNombreIngredientePrincipal(recetas.getString("ingrediente_ppal"));
				receta.getCategorias().add(recetas.getString("categoria1"));
				receta.getCategorias().add(recetas.getString("categoria2"));
				receta.getCategorias().add(recetas.getString("categoria3"));
				receta.getCategorias().add(recetas.getString("categoria4"));
				
				recetasAMostrar.add(receta);
				
			
			}while(recetas.next());
			
			Iterator<Receta> it = recetasAMostrar.iterator();
			Iterator<String> itCategorias;
			String categoria;
			while (it.hasNext()) {
				receta = it.next();
				
				out.println("<article id=\"recetaAMostrar\">");
				out.println("<h1>"+receta.getNombre()+"</h1>");
				out.println("<h3 id=\"dificultadReceta\">Dificultad:"+ Integer.toString(receta.getDificultad()) +"</h3>");
				out.println("<h3 id=\"caloriasReceta\">Calorias:"+Float.toString(receta.getCaloriasTotales())+" </h3>");
				out.println("<h5>Ingrediente ppal:"+receta.getNombreIngredientePrincipal()+"</h5>");
				out.println("<div>");
				
				itCategorias = receta.getCategorias().iterator();
				while(itCategorias.hasNext())
				{
					categoria = itCategorias.next();
					if(categoria != null){
					out.println("<h4>"+categoria+"</h4>");
					}
				}
				
				out.println("</div>");
				out.println("<h5>"+receta.getTemporada()+"</h5>");
			out.println("</article>");
			}
			
		
		%>
			
</body>

</html>