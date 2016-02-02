<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ver Perfil</title>
 
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
<%PerfilUsuario perfil = usuario.getPerfil(); %>

<div class="row">
		<div class="col-md-6">

	<form id="registro" action="../Logica/actualizarPerfilenDB.jsp" method="POST" class="form-horizontal">
				
				<div class="form-group">
					<label for="nombreYApellido" class="col-lg-4 control-label">Nombre y Apellido</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="nombre" id="nombre" value="<%out.println(perfil.getNombre()); %>" placeholder="Nombre" required>
					</div>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="apellido" id="apellido" value="<%out.println(perfil.getApellido()); %>" placeholder="Apellido" required>
					</div>
				</div>				
				
				<div class="form-group">
					<label for="edad" class="col-lg-4 control-label">Edad</label>
					<div class="col-lg-3">
						<input type="number" class="form-control" min="0" max="75" name="edad" id="edad" value="<%out.println(perfil.getEdad()); %>" placeholder="Edad" required>
					</div>
					<label for="altura" class="col-lg-1 control-label">Altura</label>
					<div class="col-lg-4">
						<input type="number" class="form-control" min="0" max="2.20" step="0.01" name="altura" id="altura" value="<%out.println(perfil.getAltura()); %>" placeholder="Altura (mts)" required>
					</div>
				</div>	
								
				<div class="form-group">
					<label for="sexo" class="col-lg-4 control-label">Sexo</label>
					<div class="col-lg-8">
						<div class="radio-inline">
							<label>
								<input type="radio" name="sexo" id="masculino" value="masculino" <%if(perfil.getSexo().equals("masculino")) out.println("checked"); %>>
							Masculino
							</label>
					</div>
					<div class="radio-inline">
						<label>
							<input type="radio" name="sexo" id="femenino" value="femenino" <%if(perfil.getSexo().equals("femenino")) out.println("checked"); %>>
								Femenino
						</label>
					</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="dieta" class="col-lg-4 control-label">Dieta</label>
					<div class="col-lg-8">
						<select name="dieta" class="form-control" required>
						
						<%ArrayList<String> dietas = new ArrayList<String>(); 
						dietas.add("normal");
						dietas.add("ovolactovegetariano");
						dietas.add("vegetariano");
						dietas.add("vegano");
						
						out.println("<option value=\"" + perfil.getDieta() +"\">" + perfil.getDieta() + "</option>");
						
						dietas.remove(perfil.getDieta());
						
						Iterator<String> it = dietas.iterator();
						
						while(it.hasNext())
						{
							String dieta = it.next();
							out.println("<option value=\"" + dieta +"\">" + dieta + "</option>");
						}
						%>
						</select>
					</div>	
				</div>
				
				<div class="form-group">
					<label for="condicionPreexistente" class="col-lg-4 control-label">Condiciones Preexistentes</label>
					<div class="col-lg-8">
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="condicionPreexistente" id="condicionPreexistente" value="Diabetes">
									Diabetes
							</label>
						</div>
						
						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="condicionPreexistente" id="condicionPreexistente" value="Celiasis">
									Celiasis
							</label>
						</div>

						<div class="checkbox-inline">
							<label>
								<input type="checkbox" name="condicionPreexistente" id="condicionPreexistente" value="Hipertension">
									Hipertensión
							</label>
						</div>						
						
					</div>	
				</div>
				
				<div class="form-group">
					<label for="rutina" class="col-lg-4 control-label">Rutina de ejercicios</label>
					<div class="col-lg-8">
						<div class="radio">
							<label>
								<input type="radio" name="rutina" id="nada" value="Nada" <%if(perfil.getRutina().equals("Nada")) out.println("checked"); %>>
							Nada
							</label>
					</div>
					
					<div class="radio">
						<label>
							<input type="radio" name="rutina" id="leve" value="Leve" <%if(perfil.getRutina().equals("Leve")) out.println("checked"); %>>
								Leve
						</label>
					</div>
					
						<div class="radio">
							<label>
								<input type="radio" name="rutina" id="mediana" value="Mediana" <%if(perfil.getRutina().equals("Mediana")) out.println("checked"); %>>
							Mediana
							</label>
					</div>
					
					<div class="radio">
						<label>
							<input type="radio" name="rutina" id="grande" value="Grande" <%if(perfil.getRutina().equals("Grande")) out.println("checked"); %>>
								Grande
						</label>
					</div>
					
					<div class="radio">
						<label>
							<input type="radio" name="rutina" id="intensiva" value="Intensiva" <%if(perfil.getRutina().equals("Intensiva")) out.println("checked"); %>>
								Intensiva
						</label>
					</div>
					
					</div>
				</div>
				
				<div class="form-group">
					<label for="sexo" class="col-lg-4 control-label">Complexion física</label>
					<div class="col-lg-8">
						<div class="radio-inline">
							<label>
								<input type="radio" name="complexion" id="pequeña" value="pequeña" <%if(perfil.getComplexion().equals("pequeña")) out.println("checked"); %>>
							Pequeña
							</label>
					</div>
					<div class="radio-inline">
						<label>
							<input type="radio" name="complexion" id="mediana" value="mediana" <%if(perfil.getComplexion().equals("mediana")) out.println("checked"); %>>
								Mediana
						</label>
					</div>
					
					<div class="radio-inline">
						<label>
							<input type="radio" name="complexion" id="grande" value="grande" <%if(perfil.getComplexion().equals("grande")) out.println("checked"); %>>
								Grande
						</label>
					</div>
					
					</div>
				</div>
			
				<div class="col-md-4 col-md-offset-5">
					<br><br>
					<button type="submit" class="btn btn-default btn-primary  btn-block">Actualizar</button>
				</div>
			</form>
		</div>	

		<div class="col-md-4 col-md-offset-1">
			<img src="Imagenes/Contenido estatico/Logo.png"/>
		</div>
	</div>			

</body>
</html>