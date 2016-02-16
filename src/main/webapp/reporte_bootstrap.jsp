<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.*" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reporte</title>
 
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
    <a class="navbar-brand" href="home_bootstrapjsp">¿Qué comemos hoy?</a>
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
          <li><a href="cargarDatosReceta_bootstrap.html">Subir Receta</a></li>
		  <li><a href="recomendacionesReceta_bootstrap.jsp">Recibir Recomendaciones</a></li>
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
	<div class="row">
		<!--<div class="col-md-6"> -->
		<%	
			String tipo = (String) session.getAttribute("TipoRep");
			ArrayList<String> datos = (ArrayList<String>) session.getAttribute("Reporte");
			String titulo = "Reporte de " + tipo;
			out.println("<h1 class=\"text-primary text-center\">" + titulo + "</h1>");
			
			out.println("<div class=\"well well-sm col-md-offset-3 col-md-5\">");
				Date fechaActual = new Date();
				SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
				out.println("<h4>Fecha: ");
				out.println(formato.format(fechaActual.getTime()));
				out.println("</h4>");
				
				if(tipo.equals("Preferencias de recetas") || tipo.equals("Recetas consultadas por usuario")){
					Timestamp inicio = (Timestamp) session.getAttribute("FechaInicio");
					Timestamp fin = (Timestamp) session.getAttribute("FechaFin");
					out.println("<h4>Periodo: ");
					out.println(formato.format(inicio.getTime()));
					out.println(" a ");
					out.println(formato.format(fin.getTime()));
					out.println("</h4>");
				}
				
				if(tipo.equals("Recetas consultadas por usuario")){
					String nombreUsuario = (String) session.getAttribute("Usuario");
					out.println("<h4>Usuario: " + nombreUsuario + "</h4>");
				}
				
				if(tipo.equals("Recetas según un rango de calorías")){
					Double minimo = (Double) session.getAttribute("Min");
					Double maximo = (Double) session.getAttribute("Max");
					out.println("<h4>");
					out.println("Rango de calorías: ");
					out.println(minimo);
					out.println(" a ");
					out.println(maximo);
					out.println("</h4>");
				}
				
			out.println("</div>"); %>
		<!--</div> -->
	</div>


	<div class="row">		
			<div class="col-md-4 col-md-offset-3">
				<table class="table table-striped">
			<%
				Iterator<String> iterator = datos.iterator();
				String renglon;
				int i = 0;
				
				if(tipo.equals("Recetas según un rango de calorías")){
					out.print("<tr>");
					out.print("<td><strong> Receta </strong></td>"); 
					out.print("<td><strong> Calorias </strong></td>");
					out.print("</tr>");
					while(iterator.hasNext()){
					renglon = iterator.next();
					if(i == 0){
						out.println("<tr>");
						}
					out.println("<td>" + renglon + "</td>");
					i++;
					if(i == 2){
						out.println("</tr>");
						i = 0;
						}
					} 
				}
				else{
					out.print("<tr>");
					out.print("<td><strong> Receta </strong></td>"); 
					out.print("</tr>");
					while(iterator.hasNext()){
					renglon = iterator.next();
					out.println("<tr>");
					out.println("<td>" + renglon + "</td>");
					out.println("</tr>");
					}
				}
			//
		%>
		
				</table>
		</div>
		
			
	</div>

	
	<div class="row">
	     <form id="reporteCalorias" action="estadisticasYReportes_bootstrap.jsp"
				method="POST" class="form-horizontal">
	     <div class="col-md-3 col-md-offset-3">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Volver</button>
				</div>
	   	 </form>
	</div>
</body>
</html>