<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estadísticas y Reportes</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body> 
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
	  
	  <!-- DESPLEGABLE DE RECETAS-->
	  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Recetas <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="consultar_bootstrap.jsp">Consultar Recetas</a></li>
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
          Usuario <b class="caret"></b>
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
		
		<h1 class="text-primary text-center"> Estadísticas y reportes </h1><br>
		
		<h4>
		<div class="well well-sm"> Estadísticas </div>
		</h4>
		<div class="col-md-6 col-md-offset-5">
					
					<button type="submit" class="btn btn-default btn-primary  btn-block">Recetas mas consultadas (Según sexo)</button>
				</div>
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Consultas según dificultad</button>
				</div>
				
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Ranking recetas mas consultadas</button>
				</div>
	
	    <br><br><br><br><br><br>
		<h4>
		<div class="well well-sm"> Reportes </div>
		</h4>		
				<div class="col-md-6 col-md-offset-5">
					
					<button type="submit" class="btn btn-default btn-primary  btn-block">Recetas consultadas por mi</button>
				</div>
				
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Recetas propuestas por usuarios</button>
				</div>
				
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Preferencias de recetas </button>
				</div>
			
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Recetas según un rango de calorías </button>
				</div>
		
		</div>	
  
		<div class="col-md-6 col-md-offset-0">
			<img src="Imagenes/Contenido estatico/estadisticas.jpg"/>
		</div>
  	</div>
  </body>
</html>
</body>
</html>