<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Fecha" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page import="clases.GestorDeEstadisticasYReportes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		Boolean error;
		Boolean errorUs=false;
		String mensajeError= "";
		String tipo = (String) session.getAttribute("TipoRep");
		
		int diaI = Integer.valueOf(request.getParameter("diaInicio"));
		int mesI = Integer.valueOf(request.getParameter("mesInicio"));
		int anioI = Integer.valueOf(request.getParameter("anioInicio"));
		Fecha comienzo = new Fecha(diaI,mesI,anioI);
		Timestamp fechaInicio = new Timestamp(comienzo.ADate().getTime());
			
		int diaF = Integer.valueOf(request.getParameter("diaFin"));
		int mesF = Integer.valueOf(request.getParameter("mesFin"));
		int anioF = Integer.valueOf(request.getParameter("anioFin"));
		Fecha finalizacion = new Fecha(diaF,mesF,anioF);
		Timestamp fechaFin = new Timestamp(finalizacion.ADate().getTime());
		
		session.setAttribute("FechaInicio",fechaInicio);
		session.setAttribute("FechaFin",fechaFin);
	
			
		GestorDeEstadisticasYReportes gestor = new GestorDeEstadisticasYReportes(null);
		
		if(tipo.equals("Recetas consultadas por usuario")){
			String nombreUsuario = (String) session.getAttribute("Usuario");
			gestor.setTipoRecetasConsultadas(fechaInicio,fechaFin,nombreUsuario);	
			errorUs = gestor.comprobarUsuario(nombreUsuario);
			}
			
			if( errorUs ){
				mensajeError= "Usuario incorrecto, intentelo de nuevo.";						
			}
		
		error = gestor.comprobarPeriodo(fechaInicio, fechaFin);
		if(error){
			mensajeError="El período de tiempo ingresado no es correcto, intentelo de nuevo.";
		}
		
		
			out.println(errorUs);
			out.println(error);
			
		 if(error || errorUs)
		{
			session.setAttribute("Error",mensajeError);
			response.sendRedirect("../Presentacion/error_bootstrap.jsp");
		}
		
		else{
			 if(tipo.equals("Preferencias de recetas")){
				gestor.setTipoPreferencias(fechaInicio,fechaFin);
			 }	
			ArrayList<String> datosReporte = gestor.generar();
			session.setAttribute("Reporte",datosReporte);
			response.sendRedirect("../Presentacion/reporte_bootstrap.jsp");
			
		}
			
		
		
	%>
</body>
</html>