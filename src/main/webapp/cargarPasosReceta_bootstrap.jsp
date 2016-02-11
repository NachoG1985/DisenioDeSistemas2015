<%@ page import="clases.Usuario" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cargar Procedimiento</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librer�as opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body> 
  <%
		Usuario usuario = (Usuario)session.getAttribute("usuario");	
	%>
    <!-- Librer�a jQuery requerida por los plugins de JavaScript -->
    <script src="http://code.jquery.com/jquery.js"></script>
 
    <!-- Todos los plugins JavaScript de Bootstrap (tambi�n puedes
         incluir archivos JavaScript individuales de los �nicos
         plugins que utilices) -->
    <script src="js/bootstrap.min.js"></script>
	
<!-- BARRA DE NAVEGACION SUPERIOR -->
	
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- El logotipo y el icono que despliega el men� se agrupan
       para mostrarlos mejor en los dispositivos m�viles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegaci�n</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="home_bootstrap.jsp">�Qu� comemos hoy?</a>
  </div>
 
  <!-- Agrupar los enlaces de navegaci�n, los formularios y cualquier
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


	<div class="row">
		<div class="col-md-6">
		
		<h1 class="text-primary text-center"> �ltimo paso: Procedimiento de la receta </h1><br>
		
		<p class="text-info col-md-offset-2">Para cada uno de los pasos seleccione una imagen que lo represente y agreguele un peque�o p�rrafo explicativo.</p>
		
		
			<form id="registro" action="../Logica/cargarProcedimientoReceta.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">
			
			
				<h3 class="text-primary text-left col-md-offset-1"> Paso 1:</h3>
				<input type="file" class="col-md-offset-1" name="imagenPaso1" id="imagenPaso1" size="50" required>
				<br>
				<textarea class="form-control col-md-offset-1" name="textoPaso1" rows="3" required ></textarea>			
				
				<h3 class="text-primary text-left col-md-offset-1"> Paso 2:</h3>
				<input type="file" name="imagenPaso2" class="col-md-offset-1" id="imagenPaso2" size="50" required>
				<br>
				<textarea class="form-control col-md-offset-1" name="textoPaso2" rows="3" required ></textarea>				
				
				
				<h3 class="text-primary text-left col-md-offset-1"> Paso 3:</h3>
				<input type="file" name="imagenPaso3" class="col-md-offset-1" id="imagenPaso3" size="50" required>
				<br>
				<textarea class="form-control col-md-offset-1" name="textoPaso3" rows="3" required ></textarea>				
				
				
				<h3 class="text-primary text-left col-md-offset-1"> Paso 4:</h3>
				<input type="file" name="imagenPaso4" class="col-md-offset-1" id="imagenPaso4" size="50" required>
				<br>
				<textarea class="form-control col-md-offset-1" name="textoPaso4" rows="3" required ></textarea>				
				
				
				<h3 class="text-primary text-left col-md-offset-1"> Paso 5:</h3>
				<input type="file" name="imagenPaso5" class="col-md-offset-1" id="imagenPaso5" size="50" required>
				<br>
				<textarea class="form-control col-md-offset-1" name="textoPaso5" rows="3" required ></textarea>	
				
				
													
				<br><br>
				<div class="progress col-md-offset-1 ">
					<div class="progress-bar " role="progressbar" aria-valuenow="75"
							aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
							<span class="sr-only">75% completado</span>
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-5">
					<br><br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Finalizar</button>
				</div>
			
			</form>
			
		</div>	
  
		<div class="col-md-4 col-md-offset-1">
			<img src="Imagenes/Contenido estatico/utensillos_cocina.jpg" style="position: fixed"/>
		</div>
  
  	</div>
  </body>
</html>