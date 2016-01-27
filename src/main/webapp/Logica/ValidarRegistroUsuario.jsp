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
			Usuario nuevoUsuario = (Usuario)session.getAttribute("usuario");
		
			//Obtengo los datos del perfil de usuario cargados en el formulario
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			double altura = Double.parseDouble(request.getParameter("altura"));
			int edad = Integer.parseInt(request.getParameter("edad"));
			String sexo = request.getParameter("sexo");
			String dieta = request.getParameter("dieta");
			
			String condiciones[] = request.getParameterValues("condicionPreexistente");
			String condicionesDB = "";
			
			if(condiciones!= null && condiciones.length > 0)
			{
				for(int i = 0; i < condiciones.length; i++)
				{
					if(i > 0)
						condicionesDB = condicionesDB + "_";
					
					condicionesDB = condicionesDB + condiciones[i];					
				}
			}
			else{
				condicionesDB = "Nada";
			}
			
			String rutina = request.getParameter("rutina");
			String complexion = request.getParameter("complexion");
			
			//Se crea el objeto del tipo perfil de usuario
			PerfilUsuario nuevoPerfil = new PerfilUsuario(nombre, apellido, sexo, edad, altura, complexion, dieta, null, rutina, condicionesDB);
			
			//Le agrego al usuario el perfil cargado
			nuevoUsuario.setPerfil(nuevoPerfil);
			
			//Obtengo el consultor de DB y cargo el nuevo usuario y el nuevo perfil
			try{
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
			
			consultor.insertarUsuario(nuevoUsuario.getNombreUsuario(), nuevoUsuario.getEmail(), nuevoUsuario.getContraseña(), nuevoUsuario.getFechaNacimiento());
			consultor.insertarPerfil(nuevoUsuario.getNombreUsuario(), nombre, apellido, sexo, edad, altura, complexion, dieta, rutina, condicionesDB);
			
			session.setAttribute("usuario", (Object)nuevoUsuario);
			response.sendRedirect("../Vistas/home_bootstrap.jsp");
			}
			catch(Exception e){
				System.out.println("Error al cargar a la db");
				response.sendRedirect("../Vistas/index.html");
			}
			
			
		%>
		
	</body>
	
</html>