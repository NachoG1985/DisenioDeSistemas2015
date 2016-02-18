<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.RecomendadorDeRecetas" %>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="java.util.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recomendaciones de recetas</title>
 
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
        <a href="recomendacionesReceta_bootstrap.jsp" class="dropdown-toggle" data-toggle="dropdown">
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
          <li><a href="verGrupos_bootstrap.jsp">Ver Mis Grupos</a></li>
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
	RecomendadorDeRecetas recomendador = new RecomendadorDeRecetas();
	ArrayList<String> recomendacionesPreparacion = recomendador.recomendacionesPreparacion(usuario.getPerfil());
	ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	HashSet<Receta> recetas = consultor.recetaSegunCondicion(usuario.getPerfil().getCondicionPreexistente());
%>
<div class="row">
		<div class="col-md-6">
			<h1 class="text-primary text-center"> Recomendaciones de recetas para
				<%
				out.println(" " + usuario.getNombreUsuario());
				%>
			</h1><br>
			<h4 class="col-md-offset-1"> Recomendaciones de preparación </h4>
			<h4 class="col-md-offset-1">
			<%
			Iterator<String> iteradorPreparacion = recomendacionesPreparacion.iterator();
			String recomendacionPreparacion;
			while(iteradorPreparacion.hasNext()){
				recomendacionPreparacion = iteradorPreparacion.next();
				out.println(recomendacionPreparacion);
			}
			%>
			</h4>	
		</div>
</div>

<%
	Iterator<Receta> iteradorRecetas = recetas.iterator();
	Receta receta;
%>
<div class="row">
		<div class="col-md-1">
		<%	while(iteradorRecetas.hasNext()){
					receta = iteradorRecetas.next();
					
					out.println("<div class=\"col-md-2\">");
						out.println("<div class=\"jumbotron text-center\" >");
							out.println("<div class=\"container\">");
								out.println("<h3 class=\"text-primary\">" +receta.getNombre() + "</h3>");
								
								out.println("<h5 >Dificultad: " + String.valueOf(receta.getDificultad()) +"</h5>");
								out.println("<h5 >Calorías: " + String.valueOf(receta.getCaloriasTotales()) +"</h5>");
								out.println("<h5>" + receta.getNombreIngredientePrincipal() + "</h5>");
								out.println("<a class=\"btn btn-primary btn-sm btn-block\" href=\"verReceta_bootstrap.jsp?receta=" + receta.getNombre() + " \" role=\"button\">  Ver más <span class=\"glyphicon glyphicon-cutlery\"></span></a>");
								
							out.println("</div>");
						out.println("</div>");		
					out.println("</div>");	
				}	
		%>
		</div>
</div>
</body>
</html>