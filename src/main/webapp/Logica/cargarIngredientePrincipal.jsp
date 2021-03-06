<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Receta" %>
<%@ page import="clases.IngredienteEnReceta" %>
<%@ page import="clases.Ingrediente" %>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		Receta nuevaReceta = (Receta)session.getAttribute("receta");
		IngredienteEnReceta nuevoIngredienteEnReceta;
		Ingrediente ingrediente;
		ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	
		String nombreIngrediente;
		int cantidad;
		
		nombreIngrediente = request.getParameter("nombreIngrediente");
		cantidad = Integer.parseInt(request.getParameter("cantidad"));
		
		ingrediente = consultor.mostrarDatosIngrediente(nombreIngrediente);
		
		nuevoIngredienteEnReceta = new IngredienteEnReceta(ingrediente, cantidad);
		
		nuevaReceta.agregarIngrediente(nuevoIngredienteEnReceta);
		
		nuevaReceta.setNombreIngredientePrincipal(nombreIngrediente);
		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		consultor.desconectar();
		
		response.sendRedirect("../Presentacion/cargarIngredientesReceta_bootstrap.jsp?inicial=a");
	
	
	%>

</body>
</html>