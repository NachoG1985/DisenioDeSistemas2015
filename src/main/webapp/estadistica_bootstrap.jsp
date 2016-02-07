<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="clases.GestorDeEstadisticasYReportes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estad�sticas y Reportes</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librer�as opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body> 
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
		
		<%
		String tipo = (String) session.getAttribute("TipoEst");
		String titulo = "Estad�sticas de " + tipo;
		out.println("<h1 class=\"text-primary text-center\">" + titulo + "</h1>");
		String periodo = (String) session.getAttribute("Periodo");
		int mes = (Integer) session.getAttribute("Mes");
		String mesImprimible = String.format("%02d",mes);
		int anio = (Integer) session.getAttribute("Anio");
		
		out.println("<div class=\"well well-sm \">");
		if(periodo.equals("semana")){
			int semana = (Integer) session.getAttribute("Semana");
			
			out.println("<h4> Per�odo: " +  Integer.toString(semana)+ "� semana " + "del "+ mesImprimible + "/"+ Integer.toString(anio) + "</h4>");		
		}
		else
		{
			out.println("<h4> Per�odo: " + mesImprimible + "/"+ Integer.toString(anio) + "</h4>");		
		}
		if(tipo.equals("Recetas mas consultadas (Seg�n sexo)")){
				String sexo = (String) session.getAttribute("Sexo");
				out.println("<h4>Sexo: " + sexo + "</h4>");
			}
		
		Date fechaActual = new Date();
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		out.println("<h4>Fecha: ");
		out.println(formato.format(fechaActual.getTime()));
		out.println("</h4>");
		out.println("</div>");

		ArrayList<String> resultado = (ArrayList<String>) session.getAttribute("Estadistica");
		Iterator<String> iterator = resultado.iterator();
		String renglon;
		while(iterator.hasNext())
		{
			renglon = iterator.next();
			out.println("<div class=\"col-md-4 col-md-offset-3\">");
			out.println("<h2 class=\text-center\">" + renglon + "<h2>");
			out.println("</div>");
		}
		out.println("</div>");
		
		%>

				
		</div>
		
	</div> 
</body>
</html>