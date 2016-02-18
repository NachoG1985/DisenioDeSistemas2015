<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Filtro de recetas</title>
</head>
<body>

	<%

		String ingredientePpal = request.getParameter("IngredientePpal");
		String condimento = request.getParameter("condimento");
		String dieta = request.getParameter("dieta");
		String caloriasMins = request.getParameter("CaloriasMin");
		String caloriasMaxs = request.getParameter("CaloriasMax");
		String dificultads = request.getParameter("dificultad");
		String nivelAlimenticios = request.getParameter("nivelAlimenticio");
		
		double caloriasMin; 
		double caloriasMax;
		
		if(caloriasMins != "")
			caloriasMin = Double.parseDouble(caloriasMins);
		else
			caloriasMin = 0;
		
		if(caloriasMaxs != "")
			caloriasMax = Double.parseDouble(caloriasMaxs);
		else
			caloriasMax = 10000;
		
		HashSet<Receta> recetasSegunIngrediente = null;
		HashSet<Receta> recetasSegunCondimento = null;
		HashSet<Receta> recetasSegunDieta = null;
		HashSet<Receta> recetasSegunCalorias = null;
		HashSet<Receta> recetasSegunDificultad = null;
		HashSet<Receta> recetasSegunNivelAlimenticio = null;	
		
		ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
		Iterator<Receta> it;
		
		Receta aux;
		
		recetasSegunCalorias = consultor.recetaSegunCalorias(caloriasMin, caloriasMax);
		
		if(!ingredientePpal.equals(""))
			recetasSegunCalorias.retainAll(consultor.recetaSegunIngPpal(ingredientePpal));
			
		if(!condimento.equals(""))
			recetasSegunCalorias.retainAll(consultor.recetaSegunCond(condimento));

		if(!dieta.equals(""))
			recetasSegunCalorias.retainAll(consultor.recetaSegunDieta(dieta));
				
		if(!dificultads.equals(""))
			recetasSegunCalorias.retainAll(consultor.recetaSegunDificultad(Integer.parseInt(dificultads)));
			

			session.setAttribute("recetasFiltradas", recetasSegunCalorias);
		
			consultor.desconectar();
			
			response.sendRedirect("../Presentacion/consultar_bootstrap.jsp");
			
		%>
		
	</body>
</html>