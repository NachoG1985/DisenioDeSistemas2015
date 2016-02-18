<%@page import="clases.Diabetes"%>
<%@page import="clases.Celiasis"%>
<%@page import="clases.Hipertension"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

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
			
			

			ArrayList<Object> condicionesUsuario = new ArrayList<Object>();
						
				if(request.getParameter("hipertension") != null)
					condicionesUsuario.add(new Hipertension());
				
				if(request.getParameter("celiasis") != null)
					condicionesUsuario.add(new Celiasis());
				
				if(request.getParameter("diabetes") != null)
					condicionesUsuario.add(new Diabetes());
				
			
			String rutina = request.getParameter("rutina");
			out.println(rutina);
			String complexion = request.getParameter("complexion");
			out.println(complexion);
			//Se crea el objeto del tipo perfil de usuario
			PerfilUsuario nuevoPerfil = new PerfilUsuario(nombre, apellido, sexo, edad, altura, complexion, dieta, null, rutina, condicionesUsuario);
			
			
			//Le agrego al usuario el perfil cargado
			nuevoUsuario.setPerfil(nuevoPerfil);
			
			//Obtengo el consultor de DB y cargo el nuevo usuario y el nuevo perfil
			try{
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
			
			consultor.insertarUsuario(nuevoUsuario.getNombreUsuario(), nuevoUsuario.getEmail(), nuevoUsuario.getContrasenia(), nuevoUsuario.getFechaNacimiento());
			consultor.insertarPerfil(nuevoUsuario.getNombreUsuario(), nombre, apellido, sexo, edad, altura, complexion, dieta, rutina);
			
			Iterator<Object> iterador = nuevoPerfil.getCondicionPreexistente().iterator();
			
			while(iterador.hasNext())
			{
				Object aux = iterador.next();
				
				if(aux.getClass() == Diabetes.class)
					consultor.insertarCondicionPerfil(nuevoUsuario.getNombreUsuario(), "Diabetes");
				
				if(aux.getClass() == Hipertension.class)
					consultor.insertarCondicionPerfil(nuevoUsuario.getNombreUsuario(), "Hipertension");
				
				if(aux.getClass() == Celiasis.class)
					consultor.insertarCondicionPerfil(nuevoUsuario.getNombreUsuario(), "Celiasis");
					
			}
			
			
			consultor.desconectar();
			
			session.setAttribute("usuario", nuevoUsuario);
			System.out.println(nuevoPerfil.getRutina());
			response.sendRedirect("../Presentacion/home_bootstrap.jsp");
			}
			catch(Exception e){
				System.out.println("Error al cargar a la db");
				response.sendRedirect("../Presentacion/index.html");
			}
			
			
		%>
		
	</body>
	
</html>