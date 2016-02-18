<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="clases.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estadisticas y Reportes</title>
 
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

	<%
	
	String estadistica = request.getParameter("boton").toString();
	session.setAttribute("TipoEst",estadistica);
	
	if(estadistica.equals("Recetas mas consultadas (Según sexo)")){
	String sexo = request.getParameter("sexo").toString();
	session.setAttribute("Sexo",sexo);
	}

	%>
	<div class="row">
		<div class="col-md-6">

			<h1 class="text-primary text-center">Modalidad</h1>
			<br>

		<h4> Complete los datos y haga click en el botón continuar de la opción que desee.</h4>
		<br>
		<h4>
		<div class="well well-sm"> Semanal </div>
		</h4>
			<br>
			<!-- cambiar aca por la pag q corresponde -->
			<form id="registro" action="../Logica/generarEstadistica.jsp"
				method="POST" class="form-horizontal">

				<div class="form-group">
					<label for="numeroSemana" class="col-lg-3 control-label">Número de Semana</label>
					<div class="col-lg-2">
						<input type="number" class="form-control" min="1" max="5"
							name="numeroSemana" id="numeroSemana" placeholder="s" required>
					</div>
				</div>

				<div class="form-group">
					<label for="numeroMes" class="col-lg-3 control-label">Mes</label>
					<div class="col-lg-2">
						<input type="number" class="form-control" min="1" max="12" name="mes"
							id="mes" placeholder="mm" required>
					</div>
				</div>

				
				<div class="form-group">
					<label for="email" class="col-lg-3 control-label">Año</label>
					<div class="col-lg-2">
						<input type="number" class="form-control" min="1940" max="2016" name="anio"
							id="anio" placeholder="aaaa" required>
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-5">
					<br>
					<button type="submit" name="boton" value="Semanal"
						class="btn btn-default btn-primary  btn-block">Continuar</button>
						<br>
				</div>
				
		</form>
		</div>
		<div class="col-md-4 col-md-offset-0">
			<img src="Imagenes/Contenido estatico/calendario.png" />
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
		
		<form id="registro" action="../Logica/generarEstadistica.jsp"
				method="POST" class="form-horizontal">
				
				<h4>
				<div class="well well-sm"> Mensual </div>
				</h4>
				
				<div class="form-group">
					<label for="email" class="col-lg-3 control-label">Mes</label>
					<div class="col-lg-2">
						<input type="number" class="form-control" min="1" max="12" name="mes"
							id="mes" placeholder="mm" required>
					</div>
				</div>

				
				<div class="form-group">
					<label for="email" class="col-lg-3 control-label">Año</label>
					<div class="col-lg-2">
						<input type="number" class="form-control" min="1940" max="2016" name="anio"
							id="anio" placeholder="aaaa" required>
					</div>
				</div>

				<div class="col-md-4 col-md-offset-5">
					<br>
					<button type="submit" name="boton" value="Mensual"
						class="btn btn-default btn-primary  btn-block">Continuar</button>
					<br>
				</div>
			</form>
		</div>

		
	</div>

</body>
</html>