<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>
<%@ page import="clases.ConsultorBaseDeDatos"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ver Perfil</title>
 
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

		<div class="col-md-5  col-md-offset-1">
			<h1 class="text-primary text-left">Perfil de: <small><% out.println(usuario.getNombreUsuario()); %></small></h1>
		</div>
	
		<div class="col-md-5  col-md-offset-1">
			<a class="btn btn-primary btn-sm col-md-6" href="actualizarPerfil.jsp"  role="button">Actualizar<span class="glyphicon glyphicon-ok"></span></a>
		</div>
	
	</div>
	<hr>
	
	<div class="row">
	
			<div class="col-md-5  col-md-offset-1">
				<h3 class="text-primary text-left">Email: <small><% out.println(usuario.getEmail()); %></small></h3>
			</div>
		
			<div class="col-md-3">
				<h3 class="text-primary text-left">Fecha de Nacimiento: <small><% out.println(usuario.getFechaNacimiento()); %></small></h3>
			</div>
			
		
		</div>
		
	<div class="row">
		
			<div class="col-md-5 col-md-offset-1">
				<h3 class="text-primary text-left">Nombre y Apellido: <small><%out.println(usuario.getPerfil().getNombre()+ " " + usuario.getPerfil().getApellido()); %></small></h3>
			</div>
			
			<div class="col-md-3">
				<h3 class="text-primary text-left">Edad: <small><%out.println(usuario.getPerfil().getEdad()); %></small></h3>
			</div>
			
			<div class="col-md-3">
				<h3 class="text-primary text-left">Altura: <small><%out.println(usuario.getPerfil().getAltura()); %></small></h3>
			</div>
		</div>
		
		<hr>
		
		
		<div class="row">
		
		<div class="col-md-6 col-md-offset-1">
		
			<h3 class="text-primary text-left" >Perfil Físico </h3>
			<br>
			
			<h4 class="text-info text-left">Sexo: <small><%out.println(usuario.getPerfil().getSexo()); %></small></h4>
			<br>
			<h4 class="text-info text-left">Complexión Física: <small><%out.println(usuario.getPerfil().getComplexion()); %></small></h4>
			<br>
			<%
				ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
				PerfilUsuario perfilDB = consultor.mostrarPerfilUsuario(usuario.getNombreUsuario());
				out.println("guacho:" + perfilDB.getApellido());
			%>
			<h4 class="text-info text-left">Rutina de ejercicios: <small><%out.println(perfilDB.getRutina()); %></small></h4>
			<br>
			<h4 class="text-info text-left">Tipo de Dieta: <small><%out.println(perfilDB.getDieta()); %></small></h4>
			<br>
			<h4 class="text-info text-left">Condiciones Preexistentes: <small><%out.println(perfilDB.mostrarCondiciones()); %></small></h4>
		
		</div>
		
		<div class="col-md-4">
		
			<img src="Imagenes/Contenido estatico/chef-gorro.jpg"/>
		
		</div>

	</div>
  </body>
</html>