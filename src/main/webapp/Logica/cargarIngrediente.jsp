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
<title>Cargar Ingrediente</title>
</head>
<body>

	<%
		Receta nuevaReceta = (Receta)session.getAttribute("receta");
		String origen = request.getParameter("boton").toString();
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
		
		consultor.desconectar();
		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		if(origen.equals("Agregar"))
			response.sendRedirect("../cargarIngredientesReceta_bootstrap.jsp?inicial=a");
		else
			response.sendRedirect("../cargarCondimentosReceta_bootstrap.jsp?inicial=a");
		
	%>

</body>
</html>