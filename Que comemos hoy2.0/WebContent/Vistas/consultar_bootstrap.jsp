<%@ page import="clases.Receta" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Consultar Recetas</title>
 
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
          <li><a href="#">Consultar Recetas</a></li>
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
          <li><a href="Inicio_bootstrap.html">Salir</a></li>
        </ul>
      </li>
	  
    </ul>
  </div>
</nav>

	<div class="row">
	
		<div class="col-md-3">
		
		<div class="col-md-offset-1">
		
			<div class="panel panel-primary" style="position:fixed">
	
				<div class="panel-heading">
					<h3 class="panel-title">Filtros de Busqueda</h3>
				</div>
		
				<div class="panel-body">
				
				<form id="registro" action="../Logica/filtrarRecetas.jsp" method="POST" class="form-horizontal ">
				
										
									<div class="radio-inline ">
										<label>
											<input type="radio" name="catalogo" id="todas" value="todas" checked disabled>
											Todas
										</label>
									</div>
					
									<div class="radio-inline ">
										<label>
											<input type="radio" name="catalogo" id="propias" value="propias" disabled>
											Propias
											</label>
									</div>
					
									<div class="radio-inline ">
										<label>
											<input type="radio" name="catalogo" id="noPropias" value="noPropias" disabled>
											No propias
											</label>
									</div>
							
							<hr>
							
							<div class="form-group">
								<input type="text" class="form-control center-block " name="IngredientePpal" placeholder="Ingrediente Principal">
								<input type="text" class="form-control center-block " name="condimento" placeholder="Condimento">
								<div class="row">
									<div class="col-md-6">
										<input type="number" min="0" max="10000" step="0.01" class="form-control center-block " name="CaloriasMin" placeholder="Calorías Mínimas">
									</div>
									<div class="col-md-6">
										<input type="number"  min="0" max="10000" step="0.01" class="form-control center-block " name="CaloriasMax" placeholder="Calorías Máximas">
									</div>
								</div>
								<input type="number" min="1" max="5" class="form-control center-block " name="calificacion" placeholder="Calificación" disabled>
								<input type="number" min="1" max="5" class="form-control center-block " name="dificultad" placeholder="Dificultad">
								<input type="number" min="1" max="5" class="form-control center-block " name="nivelAlimenticio" placeholder="Nivel de la piramide alimenticia">
								
								
								<label for="dieta" class="control-label">Dieta</label>
								<select name="dieta" class="form-control">
									<option value=""> </option>
									<option value="normal"> Normal </option>
									<option value="ovolactovegetariano"> Ovolactovegetariano </option>
									<option value="vegetariano"> Vegetariano </option>
									<option value="vegano"> Vegano </option>
								</select>
								
								<label for="dieta" class="control-label">Temporada</label>
								<select name="temporada" class="form-control" disabled>
									<option value=""> </option>
									<option value="verano"> verano </option>
									<option value="otoño"> otoño </option>
									<option value="invierno"> invierno </option>
									<option value="primavera"> primavera </option>
									<option value="navidad"> navidad </option>
									<option value="pascua"> pascua </option>
								</select>						
							
							<label for="dieta" class="control-label">Categoria</label>
								<select name="dieta" class="form-control" disabled>
									<option value=""> </option>
									<option value="Desayuno"> Desayuno </option>
									<option value="Almuerzo"> Almuerzo </option>
									<option value="Merienda"> Merienda </option>
									<option value="Cena"> Cena </option>
								</select>

							<hr>
							
							<label for="aptaPara" class="control-label">Apta para:  </label>
							<br>
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Celiacos" disabled>
									Celíacos
							</label>
						</div>
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Diabeticos" disabled>
									Diabéticos
							</label>
						</div>

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="aptaPara" id="aptaPara" value="Hipertensos" disabled>
									Hipertensos
							</label>
						</div>						
						

								
						</div>					
													
							<br>
							<div class="form-group">
								<button type="submit" class="btn btn-primary  btn-block">Aplicar filtros</button>
							</div>
				</form>
			
			
				</div>

			</div>
		</div>
		</div>

		
		<div class="col-md-7 col-md-offset-1">


		<%
		
		HashSet<Receta> recetasFiltradas = (HashSet<Receta>)session.getAttribute("recetasFiltradas");
		int contadorColumnas = 0;
		Iterator<Receta> it;
		Receta aux;
		String[] categorias;
		
		if(recetasFiltradas != null)
		{
			it = recetasFiltradas.iterator();
			
			while(it.hasNext())
			{
				aux = it.next();
				
				if(contadorColumnas == 0)
					out.println("<div class=\"row\">");
				
				out.println("<div class=\"col-md-3\">");
				out.println("<div class=\"jumbotron text-center\" >");	
				out.println("<div class=\"container\">");
				out.println("<h3 class=\"text-primary\">" + aux.getNombre() +"</h3>");
						
				out.println("<h5 >Dificultad: " + aux.getDificultad() + "</h5>");
				out.println("<h5 >Calorías: " + aux.getCaloriasTotales() + "</h5>");
						
				out.println("<h5>" + aux.getNombreIngredientePrincipal()+ "</h5>");
				/*
				categorias = aux.getCategorias().split("_");
				
				for(int i = 0; i < categorias.length ; i++)
				{
					if((i % 2) == 0)
						out.println("<div class=\"row\">");
					
					out.println("<div class=\"col-md-6\">" + categorias[i] + "</div>");
					
					if((i % 2) == 1)
						out.println("</div>");
				}*/
						
				out.println("<a class=\"btn btn-primary btn-sm btn-block\" href=\"verReceta_bootstrap.jsp?receta=" + aux.getNombre() + " role=\"button\">"
						+ "Ver más <span class=\"glyphicon glyphicon-cutlery\"></span></a>");
						out.println("</div>");
						out.println("</div>");
						out.println("</div>");
				
				if(contadorColumnas ==3)
				{
					out.println("</div>");
					contadorColumnas = 0;
				}
				else
					contadorColumnas++;
				
			}
		}
		
		%>
	
	
	</div>

	</div>
  </body>
</html>