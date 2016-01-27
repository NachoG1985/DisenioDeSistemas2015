<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Condimento" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		Receta nuevaReceta = (Receta)session.getAttribute("receta");
		String origen = request.getParameter("boton").toString();
		Condimento nuevoCondimento;
	
		String nombreCondimento;
		
		nombreCondimento = request.getParameter("nombreCondimento");

		nuevoCondimento = new Condimento(nombreCondimento, "");
		
		nuevaReceta.agregarCondimento(nuevoCondimento);
		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		if(origen.equals("Agregar"))
			response.sendRedirect("../cargarCondimentosReceta_bootstrap.jsp?inicial=a");
		else
			response.sendRedirect("../cargarPasosReceta_bootstrap.html");
		
	%>

</body>
</html>