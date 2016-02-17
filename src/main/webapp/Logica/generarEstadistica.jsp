<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.GestorDeEstadisticasYReportes" %>
<%@ page import="clases.EstadisticaDificultad" %>
<%@ page import="clases.EstadisticaRanking" %>
<%@ page import="clases.EstadisticaSexo" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Timestamp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		String tipo = (String) session.getAttribute("TipoEst");
		out.println(tipo);
		int mes = Integer.valueOf(request.getParameter("mes"));
		int anio = Integer.valueOf(request.getParameter("anio"));
		String origen = request.getParameter("boton").toString();
		GestorDeEstadisticasYReportes gestor = new GestorDeEstadisticasYReportes(null);
		Date primerDia= new Date();
		Date ultimoDia= new Date();
		String periodo;
		session.setAttribute("Anio",anio);	
		session.setAttribute("Mes",mes);
		Boolean errorSemanal=false;
		
				
		if(origen.equals("Semanal")){
			int numeroDeSemana = Integer.valueOf(request.getParameter("numeroSemana"));
			primerDia = gestor.obtenerPrimerDiaDeSemana(mes, anio, numeroDeSemana);
			ultimoDia = gestor.obtenerUltimoDiaDeSemana(mes, anio, numeroDeSemana);
			periodo = "semana";	
			session.setAttribute("Semana",numeroDeSemana);
			errorSemanal = primerDia == null || ultimoDia == null;
			}
		
		else{
			primerDia = gestor.obtenerPrimerDiaDelMes(mes, anio);
			ultimoDia = gestor.obtenerUltimoDiaDelMes(mes,anio);
			periodo = "mes";			
		}
		if(errorSemanal){
			session.setAttribute("Error","El mes no tiene esa cantidad de semanas, vuelva a intentarlo.");
			response.sendRedirect("../Presentacion/error_bootstrap.jsp");
		}
		else{
		session.setAttribute("Periodo",periodo);	
		Timestamp fechaInicio = new Timestamp(primerDia.getTime());
		out.println(fechaInicio);
		Timestamp fechaFin = new Timestamp(ultimoDia.getTime());
		out.println(fechaFin);
		
		if(tipo.equals("Recetas mas consultadas (Según sexo)")){
			String sexo = (String) session.getAttribute("Sexo");
			gestor.setTipoSexo(fechaInicio,fechaFin,sexo);		
		}
		
		if(tipo.equals("Consultas según dificultad")){
			gestor.setTipoDificultad(fechaInicio,fechaFin);	
		}
		
		if(tipo.equals("Ranking recetas mas consultadas")){
			gestor.setTipoRanking(fechaInicio,fechaFin);
		}
		
		ArrayList<String> estadistica = gestor.getTipo().generar();
		
		session.setAttribute("Estadistica",estadistica); 	
		response.sendRedirect("../Presentacion/estadistica_bootstrap.jsp");
		}
		%>
		
</body>
</html>