<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cargar Datos Receta</title>
</head>
<body>
		
	<%
	
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		Receta nuevaReceta;
		String nombreReceta;
		int dificultad;
		String aptaPara;
		String categorias;
		String temporadas;
		String dietasAptas;
		
		
		nombreReceta = request.getParameter("nombreReceta");
		dificultad = Integer.parseInt(request.getParameter("dificultad"));
		
		aptaPara = request.getParameter("aptaPara");
		if(aptaPara.contains(","))
			aptaPara = aptaPara.replaceAll(",", "-");
		
		categorias = request.getParameter("categorias");
		if(categorias.contains(","))
			categorias = categorias.replaceAll(",", "-");
		
		temporadas = request.getParameter("temporadas");
		if(temporadas.contains(","))
			temporadas = temporadas.replaceAll(",", "-");
		
		dietasAptas = request.getParameter("Dietas");
		if(dietasAptas.contains(","))
			dietasAptas = dietasAptas.replaceAll(",", "-");
		
		nuevaReceta = new Receta(nombreReceta, null, dificultad, dietasAptas, aptaPara, categorias, temporadas, 0, "",  Date.valueOf(LocalDate.now()));
		
		session.setAttribute("receta", (Object)nuevaReceta);
	
		response.sendRedirect("../Vistas/cargarIngredientePrincipal_bootstrap.html");
	
	%>
		
		
		
</body>
</html>