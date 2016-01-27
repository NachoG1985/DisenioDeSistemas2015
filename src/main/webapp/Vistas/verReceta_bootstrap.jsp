<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Iterator" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ver Receta</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	
	<%
		Usuario usuario = (Usuario)session.getAttribute("usuario");	
	%>


<!-- Librería jQuery requerida por los plugins de JavaScript -->
    <script src="http://code.jquery.com/jquery.js"></script>
 
    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="js/bootstrap.min.js"></script>
	
<!-- BARRA DE NAVEGACION SUPERIOR -->
	
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="home_bootstrap.jsp">¿Qué comemos hoy?</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right" style="margin-right:1%">
	  
	  <!-- DESPLEGABLE DE RECETAS-->
	  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Recetas <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="consultar_bootstrap.html">Consultar Recetas</a></li>
          <li><a href="cargarDatosReceta_bootstrap.html">Subir Receta</a></li>
		  <li><a href="#">Recibir Recomendaciones</a></li>
        </ul>
      </li>
	  <!-- DESPLEGABLE DE AMIGOS Y GRUPOS-->
	  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Social <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#">Ver Mis Grupos</a></li>
        </ul>
      </li>
	  <!-- DESPLEGABLE DEL USUARIO-->
	  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span>
        	<%
        		out.println(usuario.getNombreUsuario());    	
        	%>
		 <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="perfil_bootstrap.jsp">Ver Perfil</a></li>
          <li class="divider"></li>
          <li><a href="index.html">Salir</a></li>
        </ul>
      </li>
	  
    </ul>
  </div>
</nav>

		<%
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
			Receta receta;
			String nombreReceta = request.getParameter("receta");
			int dificultad;
			int calorias;
			String aux;
			int contador = 0;
			String ingredientePpal;
			String categorias;
			String temporadas;
			
			receta = consultor.consultarReceta(nombreReceta);
						
			Set<String> condimentosObtenidos = consultor.obtenerCondimentos(nombreReceta);
			
			Set<String> ingredientesObtenidos = consultor.obtenerIngyCant(nombreReceta);
			
			out.println("<h1 class=\"text-primary text-left col-md-offset-1\">"+ receta.getNombre() +"</h1>");
		%>
		
		<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
				<h3 class="text-primary text-left">Fecha de creacion: <small>dd/mm/aaaa</small></h3>
			</div>
			
			<div class="col-md-5">
				<h3 class="text-primary text-left">Calificación: <small>C</small></h3>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
			<%
				out.println("<h3 class=\"text-primary text-left\">Dificultad: <small>" + String.valueOf(receta.getDificultad()) + "</small></h3>");
			%>
			</div>
			
			<div class="col-md-5">
			<%
				out.println("<h3 class=\"text-primary text-left\">Calorias totales: <small>" + String.valueOf(receta.getCaloriasTotales()) + "</small></h3>");
			%>
			</div>
		
		</div>		
		
		<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
			
				<h2 class="text-primary text-left">Categorías: </h2>
				
				<ul>
				
				<%
				
				if(receta.getCategorias() != null)
				{
					if(receta.getCategorias().contains("_"))
					{
						String[] categoriasReceta = receta.getCategorias().split("_");
						
						while(contador < categoriasReceta.length)
						{
							out.println("<li>"+ categoriasReceta[contador] + "</li>");
							
							contador++;
						}
					}
					else
					{
						out.println("<li>"+ receta.getCategorias() + "</li>");
					}
				}

				%>

				</ul>
			</div>
			
			<div class="col-md-5">
			
				<h2 class="text-primary text-left">Temporadas: </h2>
				<ul>
				
				<%
				
				if(receta.getTemporada() != null)
				{
				
				if(receta.getTemporada().contains("_"))
				{
					String[] temporadasReceta = receta.getTemporada().split("_");
					contador = 0;
				
					while(contador < temporadasReceta.length)
					{
					out.println("<li>"+ temporadasReceta[contador] + "</li>");
					
					contador++;
					}
				}
				else 
				{
					out.println("<li>"+ receta.getTemporada() + "</li>");
				}
				
				}
				%>
				</ul>
			</div>
		</div>


		<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
		
				<h2 class="text-primary text-left">Ingredientes: </h2>
				
				<table class="table table-striped">
				
				<tr>
					<td><strong>#</strong></td>
					<td><strong>Ingrediente</strong></td> 
					<td><strong>Cantidad</strong></td>
				</tr>
				
				<%
					Iterator<String> it = ingredientesObtenidos.iterator();
					contador = 1;
				
					while(it.hasNext())
					{
						aux = it.next();
						
						out.println("<tr>");
						
						out.println("<td>"+ String.valueOf(contador) + "</td>");
						out.println("<td>" + aux + "</td>");
						
						aux = it.next();
						
						out.println("<td>" + aux + "</td>");
						out.println("</tr>");
						
						contador++;
					}
				%>

			</table>				
		
			</div>
			
			<div class="col-md-5">
		
				<h2 class="text-primary text-left">Condimentos: </h2>

				<table class="table table-striped">
				<tr>
					<td><strong>#</strong></td>
					<td><strong>Condimento</strong></td> 
				</tr>
				
					<%
					 it = condimentosObtenidos.iterator();
					contador = 1;
				
					while(it.hasNext())
					{
						aux = it.next();
						
						out.println("<tr>");
						out.println("<td>"+ String.valueOf(contador) + "</td>");
						out.println("<td>" + aux + "</td>");
						out.println("</tr>");
						
						contador++;
					}
				%>
			
			</table>
				
			</div>			
		
		</div>

		<div class="row">
		
			<div class="col-md-2 col-md-offset-1">
			
				<div class="thumbnail">
					<img src="Imagenes/Procedimientos recetas/pizza-stock.jpg" alt="...">
					<div class="caption">
						<h3 class="text-primary text-center">Paso 1</h3>
						<p>Paso de la receta que representa a la imagen de arriba. Contendra la información para llevar adelante el paso ilustrado.
						Deberá no ser muy extenso y ser claro para el usuario que la lea. Este es un parrafo de ejemplo para ver como quedaría el 
						diseño de la imagen con su parrafo.</p>
					</div>
				
				</div>
	
			</div>
			
			<div class="col-md-2">
			
				<div class="thumbnail">
					<img src="Imagenes/Procedimientos recetas/hamburguesa.jpg" alt="...">
					<div class="caption">
						<h3 class="text-primary text-center">Paso 2</h3>
						<p>Paso de la receta que representa a la imagen de arriba. Contendra la información para llevar adelante el paso ilustrado.
						Deberá no ser muy extenso y ser claro para el usuario que la lea. Este es un parrafo de ejemplo para ver como quedaría el 
						diseño de la imagen con su parrafo.</p>
					</div>
				
				</div>
				
			</div>
			
			<div class="col-md-2">
			
				<div class="thumbnail">
					<img src="Imagenes/Procedimientos recetas/raviolesconsalsadetomates.jpg" alt="...">
					<div class="caption">
						<h3 class="text-primary text-center">Paso 3</h3>
						<p>Paso de la receta que representa a la imagen de arriba. Contendra la información para llevar adelante el paso ilustrado.
						Deberá no ser muy extenso y ser claro para el usuario que la lea. Este es un parrafo de ejemplo para ver como quedaría el 
						diseño de la imagen con su parrafo.</p>
					</div>
				
				</div>			
			
			</div>
			
			<div class="col-md-2">
			
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3 class="text-primary text-center">Paso 4</h3>
						<p>Paso de la receta que representa a la imagen de arriba. Contendra la información para llevar adelante el paso ilustrado.
						Deberá no ser muy extenso y ser claro para el usuario que la lea. Este es un parrafo de ejemplo para ver como quedaría el 
						diseño de la imagen con su parrafo.</p>
					</div>
				
				</div>			
			
			</div>
			
			<div class="col-md-2">
			
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3 class="text-primary text-center">Paso 5</h3>
						<p>Paso de la receta que representa a la imagen de arriba. Contendra la información para llevar adelante el paso ilustrado.
						Deberá no ser muy extenso y ser claro para el usuario que la lea. Este es un parrafo de ejemplo para ver como quedaría el 
						diseño de la imagen con su parrafo.</p>
					</div>
				
				</div>			
			
			</div>
		
		</div>


</body>
</html>