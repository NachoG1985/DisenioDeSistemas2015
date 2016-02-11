<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.GestorDeEstadisticasYReportes" %>
<%@ page import="clases.ReporteRecetasPorCalorias" %>
<%@ page import="clases.ReporteRecetasNuevas" %>
<%@ page import="clases.Fecha" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Calorías</title>
</head>
<body>
		<%
			GestorDeEstadisticasYReportes gestor = new GestorDeEstadisticasYReportes(null);
			String origen = request.getParameter("boton").toString();
			session.setAttribute("TipoRep",origen);
			Boolean errorCalorias=false;
			String mensajeError="";
			
			if(origen.equals("Recetas según un rango de calorías")){
			double min = Double.parseDouble(request.getParameter("valorMin"));
			session.setAttribute("Min",min); 
			double max = Double.parseDouble(request.getParameter("valorMax"));
			errorCalorias = gestor.comprobarRangoCalorias(min, max);
			session.setAttribute("Max",max); 
			gestor.setTipoCalorias(min, max);
			
			if(errorCalorias){
				mensajeError= "El rango de calorías es incorrecto";		
			}
			}
			
			if(origen.equals("Recetas propuestas por usuarios")){
				gestor.setTipoRecetasNuevas();
			}
			
			if(errorCalorias)
			{
				response.sendRedirect("../error_bootstrap.jsp");
			}
			else{
			ArrayList<String> datosReporte = gestor.generar();
			session.setAttribute("Reporte",(Object)datosReporte); 
			response.sendRedirect("../reporte_bootstrap.jsp");
			}
			
		%>
</body>
</html>