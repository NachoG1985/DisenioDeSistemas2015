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
					
					<input type="text" name="ingredientePrincipal" value="indiferente">
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
			
			String catalogoAConsultar = request.getParameter("Catalogo");
			String dificultadBuscada = request.getParameter("dificultad");
			String calificacionBuscada = request.getParameter("calificacion");
			String ingredienteBuscado = request.getParameter("ingredientePrincipal");
			String categoriaBuscada = request.getParameter("categoria");
			
			
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