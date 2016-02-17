<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
    
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
		String aptaPara[];
		String categorias[];
		String temporadas[];
		String dietasAptas[];
				
		
		nombreReceta = request.getParameter("nombreReceta");
		dificultad = Integer.parseInt(request.getParameter("dificultad"));
		
		aptaPara = request.getParameterValues("aptaPara");
		
		categorias = request.getParameterValues("categorias");
		
		temporadas = request.getParameterValues("temporadas");
		
		dietasAptas = request.getParameterValues("Dietas");
		
		nuevaReceta = new Receta(nombreReceta, null, dificultad, 0, "", Date.valueOf(LocalDate.now()));
		
		
			for(int i = 0; i < aptaPara.length; i++)
				nuevaReceta.agregarCondicionApta(aptaPara[i]);	
			
			for(int i = 0; i < categorias.length; i++)
				nuevaReceta.agregarCategoria(categorias[i]);
			
			for(int i = 0; i < temporadas.length; i++)
				nuevaReceta.agregarTemporada(temporadas[i]);
			
			for(int i = 0; i < dietasAptas.length; i++)
				nuevaReceta.agregarDietaApta(dietasAptas[i]);

		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
		HashSet<String> ingredientes = consultor.mostrarIngredientesDB();
		HashSet<String> condimentos = consultor.mostrarCondimentosDB();
		session.setAttribute("ingredientes", (Object)ingredientes);
		session.setAttribute("condimentos", (Object)condimentos);
		
		consultor.desconectar();
		
		response.sendRedirect("../Presentacion/cargarIngredientePrincipal_bootstrap.jsp?inicial=a");
	
	%>
		
		
		
</body>
</html>