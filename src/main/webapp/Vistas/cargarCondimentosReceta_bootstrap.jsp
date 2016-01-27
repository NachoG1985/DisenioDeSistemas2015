<%@ page import="java.util.Iterator" %>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Condimento" %>
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
    <title>Cargar Condimentos</title>
 
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.innerHTML);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    document.getElementById("condimentoDropeado").innerHTML = data;
    document.getElementById("condimento").value = data;
}
function validateForm() {
    var x = document.forms["agregadoCondimento"]["nombreCondimento"].value;
    if (x == null || x == "") {
        alert("Agregue un condimento antes de continuar");
        return false;
    }
}
</script>
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
		
		<h1 class="text-primary text-center"> Tercer paso: Condimentos de la receta </h1><br>
		
		<p class="text-info col-md-offset-2"><strong>Arrastre</strong> un condimento hasta la casilla <strong>"Condimento"</strong> y presione el boton <strong>"Agregar Ingrediente"</strong>. 
		Una vez agregados todos los ingredientes presione el boton <strong> "Continuar"</strong> para continuar con el proceso.</p>
		
		<h3 class="text-primary text-left col-md-offset-1"> Lista de ingredientes:</h3>
		
		<div class="text-primary text-left col-md-offset-3 ">
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=a">A</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=b">B</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=c">C</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=d">D</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=e">E</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=f">F</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=g">G</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=h">H</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=i">I</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=j">J</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=k">K</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=l">L</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=m">M</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=n">N</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=ñ">Ñ</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=o">O</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=p">P</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=q">Q</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=r">R</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=s">S</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=t">T</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=u">U</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=v">V</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=w">W</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=x">X</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=y">Y</a>
			<a href="cargarCondimentosReceta_bootstrap.jsp?inicial=z">Z</a>
		</div>
					
			<br>

		
			<form id="registro" name="agregadoCondimento" onsubmit="return validateForm()" action="../Logica/cargarCondimentos.jsp" method="POST" class="form-horizontal">
			
			
			<%
			String letraInicial = request.getParameter("inicial");
			String nombreCondimento;
			HashSet<String> condimentos = (HashSet<String>)session.getAttribute("condimentos");
			Iterator<String> it = condimentos.iterator();
			
			while(it.hasNext())
			{
				nombreCondimento = it.next();
				if(nombreCondimento.startsWith(letraInicial))
					out.println("<p class=\"form-control-static col-md-offset-1 pull-left \"  draggable=\"true\" id=" + nombreCondimento + " ondragstart=\"drag(event)\">" + nombreCondimento + "</p>");
			}
			
			%>
			
								
			<div class="form-group " style="clear: both">
			
				<br><br>
					<label for="ingrediente" class="col-lg-2 col-lg-offset-2 control-label">Condimento</label>
					
					<div class="col-lg-5" ondrop="drop(event)" ondragover="allowDrop(event)" style="padding-top:10px;padding-bottom:10px;color:inherit;background-color:#eee;" id="dropDiv">
						<p id="condimentoDropeado" class="text-center center-block">Arrastre el condimento aqui</p>
						<input type="hidden" class="form-control" name="nombreCondimento"  id="condimento" required>
					</div>
					
			</div>
							
				<br><br>
				<div class="progress col-md-offset-1 ">
					<div class="progress-bar " role="progressbar" aria-valuenow="50"
							aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
							<span class="sr-only">50% completado</span>
					</div>
				</div>
				
				<div class="row">
				
					<div class="col-md-5 col-md-offset-1">
						<br><br>
						<button type="submit"  name="boton" value="Agregar" class="btn btn-default btn-primary  btn-block">Agregar Condimento</button>
					</div>
				
					<div class="col-md-5 col-md-offset-1">
						<br><br>
						<button type="submit"  name="boton" value="Continuar" class="btn btn-default btn-primary  btn-block">Continuar</button>
					</div>
			
				</div>
			
			</form>
			
		</div>	
  
		<div class="col-md-4 col-md-offset-1">
			<table class="table table-striped">
				<tr>
					<td><strong>#</strong></td>
					<td><strong>Condimento</strong></td> 
				</tr>
				
				<%
				int i = 1;
				Receta nuevaReceta = (Receta)session.getAttribute("receta");
				Condimento condimento;
				
				Iterator<Condimento> itCondimentosEnReceta = nuevaReceta.getCondimentos().iterator();
				
				while(itCondimentosEnReceta.hasNext())
				{
					condimento = itCondimentosEnReceta.next();
					
					out.println("<tr>");
					out.println("<td>" + String.valueOf(i) + "</td>");
					out.println("<td>" + condimento.getNombreCondimento()  + "</td>");
					out.println("</tr>");					
					i++;
				}
				
				
				%>
			
			</table>
		</div>
		
	</div>
  
  </body>
</html>