<%@page import="clases.PasoDeReceta"%>
<%@page import="clases.Condimento"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.List" %>
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
	  
	      <!-- DESPLEGABLE DE ESTADISTICAS-->
		<li>
          <a href="estadisticasYReportes_bootstrap.jsp" >
          Reportes y Estadisticas <b class="caret"></b>
        </a>
		</li>
	  
	  <!-- DESPLEGABLE DE RECETAS-->
	  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Recetas <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="consultar_bootstrap.jsp">Consultar Recetas</a></li>
          <li><a href="cargarDatosReceta_bootstrap.jsp">Subir Receta</a></li>
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
						
			Set<Condimento> condimentosObtenidos = consultor.obtenerCondimentos(nombreReceta);

			ArrayList<String> ingredientesObtenidos = consultor.obtenerIngyCant(nombreReceta);
			
			receta.setProcedimiento(consultor.procedimientoDeReceta(receta.getNombre()));
						
			
			out.println("<h1 class=\"text-primary text-left col-md-offset-1 col-md-5\">"+ receta.getNombre() +"</h1>");
			
			out.println("<div class=\"row\" style=\"margin-top:20px;\">");
			
			
			
			if(consultor.consultarEventoEnHistorial(usuario.getNombreUsuario(), receta.getNombre(), "confirmar") == null)
				out.println("<a class=\"btn btn-primary btn-sm col-md-1\" href=\"Logica/confirmar_calificar_receta.jsp?accion=confirmar&receta=" + receta.getNombre() + "\" role=\"button\">Confirmar<span class=\"glyphicon glyphicon-ok\"></span></a>");
			else
				out.println("<p>Confirmada <span class=\"col-md-1 glyphicon glyphicon-ok\"></span></p>");
			
			if(consultor.consultarEventoEnHistorial(usuario.getNombreUsuario(), receta.getNombre(), "calificar") == null)
			{
				out.println("<form id=\"registro\" action=\"Logica/confirmar_calificar_receta.jsp?accion=calificar&receta=" + receta.getNombre() + "\" method=\"POST\" class=\"form-horizontal\">");
				out.println("<div class=\" col-md-3 form-group\">");
				out.println("<div class=\"col-md-5\">");
				out.println("<select name=\"calificacion\" class=\"pull-left form-control\">");
				out.println("<option value=\"1\"> 1 </option>");
				out.println("<option value=\"2\"> 2 </option>");
				out.println("<option value=\"3\"> 3 </option>");
				out.println("<option value=\"4\"> 4 </option>");
				out.println("<option value=\"5\"> 5 </option>");
				out.println("</select>");
				out.println("</div>");
				
				out.println("<button type=\"submit\" class=\"col-md-5 btn btn-default btn-primary  \">Calificar</button>");
				
				out.println("</div>");
			}
			else
				out.println("<p class=\"col-md-3\">" + consultor.obtenerCalificacionRecetaUsuario(usuario.getNombreUsuario(), receta.getNombre()) +" <span class=\"glyphicon glyphicon-star\"></span></p>");
			
			out.println("</div>");
		
		%>
		
		
		<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
				<h3 class="text-primary text-left">Fecha de creacion: <small>dd/mm/aaaa</small></h3>
			</div>
			
			<div class="col-md-5">
				<h3 class="text-primary text-left">Calificación: <small>
				
				<%
				float calificacion = consultor.obtenerCalificacionReceta(receta.getNombre());
				if(calificacion > 0)
					out.println(calificacion);
				else
					out.println("Sin calificar");	%>

				</small></h3>
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
				
				Iterator<String> it = receta.getCategorias().iterator();
				
				while(it.hasNext())
					out.println("<li>" + it.next() + "</li>");
				
				%>

				</ul>
			</div>
			
			<div class="col-md-5">
			
				<h2 class="text-primary text-left">Temporadas: </h2>
				<ul>
				
				<%
				
				it = receta.getTemporada().iterator();
				
				while(it.hasNext())
					out.println("<li>" + it.next() + "</li>");
				%>
				</ul>
			</div>
		</div>
		
				<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
			
				<h2 class="text-primary text-left">Dietas: </h2>
				
				<ul>
				
				<%
				
				it = receta.getDietasAptas().iterator();
				
				while(it.hasNext())
					out.println("<li>" + it.next() + "</li>");
				
				%>

				</ul>
			</div>
			
			<div class="col-md-5">
			
				<h2 class="text-primary text-left">Apta para: </h2>
				<ul>
				
				<%
				
				it = receta.getAptaPara().iterator();
				
				while(it.hasNext())
					out.println("<li>" + it.next() + "</li>");
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
					it = ingredientesObtenidos.iterator();
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
					 Iterator<Condimento> itCondimentos = condimentosObtenidos.iterator();
					Condimento auxCondimento;
					contador = 1;
				
					while(itCondimentos.hasNext())
					{
						auxCondimento = itCondimentos.next();
						
						out.println("<tr>");
						out.println("<td>"+ String.valueOf(contador) + "</td>");
						out.println("<td>" + auxCondimento.getNombreCondimento() + "</td>");
						out.println("</tr>");
						
						contador++;
					}
					
				%>
			
			</table>
				
			</div>			
		
		</div>
		
		

		<div class="row">
		
		<% Iterator<PasoDeReceta> itPasos = receta.getProcedimiento().iterator();
		PasoDeReceta paso;
		int i= 1;
		
		while(itPasos.hasNext())
		{
			paso = (PasoDeReceta)itPasos.next();
			
			if(i == 1)
				out.println("<div class=\"col-md-2 col-md-offset-1\">");
			else
				out.println("<div class=\"col-md-2\">");
			
			out.println("<div class=\"thumbnail\">");
			out.println("<img src=\"" + paso.getImagen() + " \" alt=\"...\">");
			out.println("<div class=\"caption\">");
			out.println("<h3 class=\"text-primary text-center\">Paso " + i + "</h3>");
			out.println("<p>" + paso.getDescripcion() + "</p>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
			
			i++;
			
		}
		
		%>
		
		</div>


</body>
</html>