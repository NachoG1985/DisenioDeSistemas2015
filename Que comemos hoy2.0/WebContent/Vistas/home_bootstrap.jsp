    
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Home</title>
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
            data-target="navbar-ex1-collapse">
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
          <li><a href="consultar_bootstrap.html">Consultar Recetas</a></li>
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
          <li><a href="Inicio_bootstrap.html">Salir</a></li>
        </ul>
      </li>
	  
    </ul>
  </div>
</nav>
	
	
	<!-- REJILLA PARA MOSTRAR LAS ULTIMAS 10 RECETAS PARA EL USUARIO-->
	
	<%
	 ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	
	ResultSet resultado = consultor.mostrarRecetasDB();
	
	Set<Receta> recetasAMostrar = new HashSet<Receta>();
	
	Receta receta;
	
	int dificultad;
	int calorias;
	String nombre;
	String ingredientePpal;
	String categorias;
	
	int contador = 0;
	
	while(resultado.next() && contador <10)
	{
		nombre = resultado.getString("nombre");
		ingredientePpal = consultor.obtenerNombreIng(resultado.getInt("ingrediente_ppal_id"));
		dificultad = resultado.getInt("dificultad");
		calorias = resultado.getInt("caloriasTotales");
		categorias = consultor.obtenerNombreCategoria(resultado.getInt("categoria_id"));
		
		receta = new Receta(nombre,ingredientePpal,dificultad,null,null,categorias,null,calorias,null,null);
		
		recetasAMostrar.add(receta);
		
		contador++;
	}
	
	
	%>
	
	<div class="row">
		<div class="col-md-1"></div>
		
			<%
				contador = 0;
			
				Iterator<Receta> it = recetasAMostrar.iterator();
				
				while(it.hasNext() && contador < 5)
				{
					receta = it.next();
					
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
					
					contador++;
				}
			
			
			
			%>
			
	</div>
	
	<div class="row">
		<div class="col-md-1"></div>
		
					<%
				contador = 0;
							
				while(it.hasNext() && contador < 5)
				{
					receta = it.next();
					
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
					
					contador++;
				}
			
			
			
			%>
		
	</div>
</body>
</html>