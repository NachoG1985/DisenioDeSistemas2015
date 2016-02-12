<%@ page import="clases.Usuario" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cargar Receta</title>
 
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
    <a class="navbar-brand" href="home_bootstrapjsp">�Qu� comemos hoy?</a>
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
		<div class="col-md-6">
		
		<h1 class="text-primary text-center"> Primer paso: Datos de la receta </h1><br>
		
			<form id="registro" action="../Logica/cargarDatosReceta.jsp" method="POST" class="form-horizontal">
				
				<div class="form-group">
					<label for="nombreReceta" class="col-lg-4 control-label">Nombre de la receta</label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="nombreReceta" id="nombreReceta" placeholder="Nombre de la receta">
					</div>
				</div>				
				
				<div class="form-group">
					<label for="dificultad" class="col-lg-4 control-label">Dificultad</label>
					<div class="col-lg-2">
						<select name="dificultad" class="form-control">
							<option value="1"> 1 </option>
							<option value="2"> 2 </option>
							<option value="3"> 3 </option>
							<option value="4"> 4 </option>
							<option value="5"> 5 </option>
						</select>
					</div>	
				</div>
				
				<div class="form-group">
					<label for="aptaPara" class="col-lg-4 control-label">Apta para:</label>
					<div class="col-lg-8">
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Celiasis">
									Cel�acos
							</label>
						</div>
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Diabetes">
									Diab�ticos
							</label>
						</div>

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Hipertension">
									Hipertensos
							</label>
						</div>						
						
					</div>	
				</div>
				
				<div class="form-group">
					<label for="categorias" class="col-lg-4 control-label">Categor�as</label>
					<div class="col-lg-8">
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="categorias" id="categorias" value="Desayuno">
									desayuno
							</label>
						</div>	
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="categorias" id="categorias" value="Almuerzo">
									Almuerzo
							</label>
						</div>						

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="categorias" id="categorias" value="Merienda">
									Merienda
							</label>
						</div>	
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="categorias" id="categorias" value="Cena">
									Cena
							</label>
						</div>						
						
					</div>	
				</div>
				
								<div class="form-group">
					<label for="dietas" class="col-lg-4 control-label">Dietas</label>
					<div class="col-lg-8">
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="dietas" id="dietas" value="Normal">
									Normal
							</label>
						</div>
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="Dietas" id="Dietas" value="OvolactoVegetariano">
									OvolactoVegetariano
							</label>
						</div>

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="Dietas" id="Dietas" value="Vegano">
									Vegano
							</label>
						</div>	

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="Dietas" id="Dietas" value="Vegetariano">
									Vegetariano
							</label>
						</div>							
						
					</div>	
				</div>
				
				<div class="form-group">
					<label for="temporadas" class="col-lg-4 control-label">Temporadas</label>
					<div class="col-lg-8">
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="invierno">
									Invierno
							</label>
						</div>
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="navidad">
									Navidad
							</label>
						</div>

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="oto�o">
									Oto�o
							</label>
						</div>	

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="pascuas">
									Pascuas
							</label>
						</div>	

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="primavera">
									Primavera
							</label>
						</div>	

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="temporadas" id="temporadas" value="verano">
									Verano
							</label>
						</div>							
						
					</div>	
				</div>
				
				<br><br>
				<div class="progress col-md-offset-1 ">
					<div class="progress-bar" role="progressbar" aria-valuenow="0"
							aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
							<span class="sr-only">0% completado</span>
					</div>
					</div>
				
				<div class="col-md-4 col-md-offset-5">
					<br><br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Continuar</button>
				</div>
			</form>
		</div>	
  
		<div class="col-md-4 col-md-offset-1">
			<img src="Imagenes/Contenido estatico/cf_cocinero.jpg"/>
		</div>
  	</div>
  </body>
</html>