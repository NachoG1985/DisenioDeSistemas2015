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
		
		String aptaParaDB = "";
		String categoriasDB = "";
		String temporadasDB = "";
		String dietasAptasDB = "";
		
		
		nombreReceta = request.getParameter("nombreReceta");
		dificultad = Integer.parseInt(request.getParameter("dificultad"));
		
		aptaPara = request.getParameterValues("aptaPara");
		
		categorias = request.getParameterValues("categorias");
		
		temporadas = request.getParameterValues("temporadas");
		
		dietasAptas = request.getParameterValues("Dietas");
		
		if(aptaPara!= null && aptaPara.length > 0)
		{
			for(int i = 0; i < aptaPara.length; i++)
			{
				if(i > 0)
					aptaParaDB = aptaParaDB + "_";
				
				aptaParaDB = aptaParaDB + aptaPara[i];					
			}
		}
		else{
			aptaParaDB = "Nada";
		}
		
		if(categorias!= null && categorias.length > 0)
		{
			for(int i = 0; i < categorias.length; i++)
			{
				if(i > 0)
					categoriasDB = categoriasDB + "_";
				
				categoriasDB = categoriasDB + categorias[i];					
			}
		}
		else{
			aptaParaDB = "Nada";
		}
		
		if(temporadas!= null && temporadas.length > 0)
		{
			for(int i = 0; i < temporadas.length; i++)
			{
				if(i > 0)
					temporadasDB = temporadasDB + "_";
				
				temporadasDB = temporadasDB + temporadas[i];					
			}
		}
		else{
			temporadasDB = "Nada";
		}
		
		if(dietasAptas!= null && dietasAptas.length > 0)
		{
			for(int i = 0; i < dietasAptas.length; i++)
			{
				if(i > 0)
					dietasAptasDB = dietasAptasDB + "_";
				
				dietasAptasDB = dietasAptasDB + dietasAptas[i];					
			}
		}
		else{
			dietasAptasDB = "Nada";
		}
		
		
		
		nuevaReceta = new Receta(nombreReceta, null, dificultad, dietasAptasDB, aptaParaDB, categoriasDB, temporadasDB, 0, "",  Date.valueOf(LocalDate.now()));
		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
		HashSet<String> ingredientes = new HashSet<String>();
		ResultSet ingredientesDB = consultor.mostrarIngredientesDB();
		HashSet<String> condimentos = new HashSet<String>();
		ResultSet condimentosDB = consultor.mostrarCondimentosDB();
		
		while(ingredientesDB.next())
		{
			ingredientes.add(ingredientesDB.getString("nombre"));
		}
		
		while(condimentosDB.next())
		{
			condimentos.add(condimentosDB.getString("nombre"));
		}
		
		session.setAttribute("ingredientes", (Object)ingredientes);
		session.setAttribute("condimentos", (Object)condimentos);
		
		response.sendRedirect("../Vistas/cargarIngredientePrincipal_bootstrap.jsp?inicial=a");
	
	%>
		
		
		
</body>
</html>