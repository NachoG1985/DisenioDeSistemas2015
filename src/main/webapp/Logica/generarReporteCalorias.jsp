<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.GestorDeEstadisticasYReportes" %>
<%@ page import="clases.ReporteRecetasPorCalorias" %>
<%@ page import="clases.ReporteRecetasNuevas" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Calorías</title>
</head>
<body>
		<%
			/* creo un gestor con un estado cualquiera
		    ReporteRecetasNuevas estado = new ReporteRecetasNuevas();
			GestorDeEstadisticasYReportes gestor = new GestorDeEstadisticasYReportes(estado);
			session.setAttribute("Gestor",gestor); */
		
			double min = Double.parseDouble(request.getParameter("valorMin"));
			double max = Double.parseDouble(request.getParameter("valorMax"));
			ReporteRecetasPorCalorias reporteCalorias = new ReporteRecetasPorCalorias(min,max);
			GestorDeEstadisticasYReportes gestor = new GestorDeEstadisticasYReportes(reporteCalorias);
			session.setAttribute("Gestor",gestor); 
		    response.sendRedirect("../reporte_bootstrap.jsp");
			
		%>
</body>
</html>