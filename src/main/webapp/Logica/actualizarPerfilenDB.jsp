<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashSet" %>

<%@page import="clases.CondicionPreexistente"%>
<%@page import="clases.Diabetes"%>
<%@page import="clases.Celiasis"%>
<%@page import="clases.Hipertension"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

			ArrayList<CondicionPreexistente> condicionesUsuario = new ArrayList<CondicionPreexistente>();
			
			for(int i = 0; i < condiciones.length; i++)
			{
				if(condiciones[i] == "Hipertension")
					condicionesUsuario.add(new Hipertension());
				
				if(condiciones[i] == "Celiasis")
					condicionesUsuario.add(new Celiasis());
				
				if(condiciones[i] == "Diabetes")
					condicionesUsuario.add(new Diabetes());
				
			}
			
			String rutina = request.getParameter("rutina");
			String complexion = request.getParameter("complexion");
			
			//Se crea el objeto del tipo perfil de usuario
			PerfilUsuario nuevoPerfil = new PerfilUsuario(nombre, apellido, sexo, edad, altura, complexion, dieta, null, rutina, condicionesUsuario);

			//Le agrego al usuario el perfil cargado
			nuevoUsuario.setPerfil(nuevoPerfil);
			
			//Obtengo el consultor de DB y cargo el nuevo usuario y el nuevo perfil
			
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
			
			consultor.actualizarPerfil(nuevoUsuario.getNombreUsuario(), nombre, apellido, sexo, edad, altura, complexion, dieta, rutina/*, condicionesDB*/);
			
			consultor.desconectar();
			
			session.setAttribute("usuario", (Object)nuevoUsuario);
			
			response.sendRedirect("../perfil_bootstrap.jsp");
			
			%>

</body>
</html>