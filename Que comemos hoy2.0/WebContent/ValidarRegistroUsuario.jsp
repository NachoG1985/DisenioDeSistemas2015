<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Validar registro usuario</title>
		
	</head>
	
	<body>

		<%
			//Obtengo los datos del usuario ingresados inicialmente
			Usuario nuevoUsuario = (Usuario)request.getAttribute("nuevoUsuario");
		
			//Obtengo los datos del perfil de usuario cargados en el formulario
			String nombreYApellido = request.getParameter("nombreYApellido");
			int altura = Integer.parseInt(request.getParameter("altura"));
			int edad = Integer.parseInt(request.getParameter("edad"));
			String sexo = request.getParameter("sexo");
			String dieta = request.getParameter("dieta");
			String condicionesPreexistentes[] = request.getParameter("condicionPreexistente").split(",");
			String rutina = request.getParameter("rutina");
			String complexion = request.getParameter("complexion");
			
			//Se crea el objeto del tipo perfil de usuario
			PerfilUsuario nuevoPerfil = new PerfilUsuario(nombreYApellido, sexo, edad, altura, complexion, dieta, null, rutina, condicionesPreexistentes);
			
			//Le agrego al usuario el perfil cargado
			nuevoUsuario.cargarPerfil(nuevoPerfil);
			
			//Obtengo el consultor de DB y cargo el nuevo usuario y el nuevo perfil
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
			
			
		%>
		
	</body>
	
</html>