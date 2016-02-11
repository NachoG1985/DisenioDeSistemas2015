<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="clases.Usuario" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estadísticas y reportes</title>
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
        <a href="estadisticasYReportes_bootstrap.jsp" class="dropdown-toggle" >
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
		
		<h1 class="text-primary text-center"> Estadísticas y reportes </h1><br>
		
		<h4>
		<div class="well well-sm"> Estadísticas </div>
		</h4>
		
		<div class="col-md-offset-1">
		<h4>  Seleccione la estadística que desee generar. Una vez seleccionada, tendrá la posibilidad de elegir entre modalidad semanal o mensual </h4>
		</div>
		
			<form id="estadisticas1" action="modoEstadistica_bootsrap.jsp"
				method="POST" class="form-horizontal">	
				
				 	
				 <div class="col-md-offset-6 col-md-3"> 
					<br>
					<select name="sexo" class="form-control" >
  					<option value="masculino">masculino</option>
  					<option value="masculino">femenino</option>
					</select>
					<span class="help-block">Seleccione un sexo</span>
				 </div> 
				
				
				<div class="col-md-6 col-md-offset-5"> 
				<br>
				<button type="submit" name="boton" value="Recetas mas consultadas (Según sexo)" class="btn btn-default btn-primary  btn-block">Recetas mas consultadas (Según sexo)</button>
				<br>
				</div>
		
			</form>
			<form id="estadisticas2" action="modoEstadistica_bootsrap.jsp"
				method="POST" class="form-horizontal">		
	
		
				
				<div class="col-md-6 col-md-offset-5">
					<br>
					<button type="submit" name="boton" value="Consultas según dificultad" class="btn btn-default btn-primary  btn-block">Consultas según dificultad</button>
					
				</div>
					
			</form>
			<form id="estadisticas3" action="modoEstadistica_bootsrap.jsp"
				method="POST" class="form-horizontal">
				<div class="col-md-6 col-md-offset-5">
					<br><br>
					<button type="submit" name="boton" value="Ranking recetas mas consultadas" class="btn btn-default btn-primary  btn-block">Ranking recetas mas consultadas</button>
					
				</div>
			</form>
		
		</div>
				
		<div class="col-md-1 col-md-offset-0">
			<img src="Imagenes/Contenido estatico/estadisticas.jpg"/>
		</div>
		
		
	</div>
		
	
	
	
	<div class="row">
		<div class="col-md-6">
		<h4>
		<div class="well well-sm"> Reportes </div>
		</h4>	
		
		<div class="col-md-offset-1">
		<h4>  Seleccione el reporte que desee generar. Recuerde completar los campos de aquellos reportes que los tengan antes de hacer click </h4>
		</div>
			
		<form id="reportePeriodo" action="seleccionFecha_bootstrap.jsp" method="POST" class="form-horizontal">
			
			<div class="col-md-6 col-md-offset-5">
				<br>
				<button type="submit" name="boton" value="Preferencias de recetas" class="btn btn-default btn-primary  btn-block">Preferencias de recetas</button>
				<br>
			</div>
		</form>
		
		
		<form id="reportePeriodo" action="Logica/generarReporte.jsp" method="POST" class="form-horizontal">
			
			<div class="col-md-6 col-md-offset-5">
				<br>
				<button type="submit" name="boton" value="Recetas propuestas por usuarios" class="btn btn-default btn-primary  btn-block">Recetas propuestas por usuarios</button>
				<br>
			</div>
		</form>
			
		<form id="reportePeriodo" action="seleccionFecha_bootstrap.jsp" method="POST" class="form-horizontal">
				
			<div class="col-md-3 col-md-offset-6"> 
				<input type="text" name="usuario" class="form-control" placeholder="Nombre Usuario" required>
				<span class="help-block">Ingrese un usuario</span>
			</div>
				
			<div class="col-md-6 col-md-offset-5">
				<br>
					<button type="submit" value="Recetas consultadas por usuario" name="boton" class="btn btn-default btn-primary  btn-block">Recetas consultadas por usuario</button>
				<br>
			</div>
			
		</form>		
			
					
		<form id="reporteCalorias" action="Logica/generarReporte.jsp" method="POST" class="form-horizontal">
					
						
		<div class="form-group">			
			
		<div class="col-md-offset-5"> 
			<label for="valorInicial" class="col-lg-4 control-label">Rango calorías</label>

		<div class="col-lg-3">
					<input type="number" class="form-control" min="0" name="valorMin" id="valorMin" placeholder="min" required>
			<br>
			</div>
								
			<div class="col-lg-3">
					<input type="number" class="form-control" min="0" name="valorMax" id="valorMax" placeholder="max" required>
					<br>
			</div>
			
			
		</div> 
		
		</div>	
						
		<div class="col-md-6 col-md-offset-5"> 
					<button type="submit" name="boton" value="Recetas según un rango de calorías" class="btn btn-default btn-primary  btn-block">Recetas según un rango de calorías </button>
			<br>
			 </div> 
			
			
		</form>				  
		
	<!-- 	<div class="col-md-1" >
			<img src="Imagenes/Contenido estatico/estadisticas2.jpg"/>
			</div> -->
		
		</div>
	</div>	
  </body>
</html>
</body>
</html>