<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Receta" %>
<%@ page import="clases.IngredienteEnReceta" %>
<%@ page import="clases.Ingrediente" %>
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
	
		String nombreIngrediente;
		int cantidad;
		
		nombreIngrediente = request.getParameter("nombreIngrediente");
		cantidad = Integer.parseInt(request.getParameter("cantidad"));
		
		ingrediente = new Ingrediente(nombreIngrediente,0, 0, 0);
		
		nuevoIngredienteEnReceta = new IngredienteEnReceta(ingrediente, cantidad);
		
		nuevaReceta.agregarIngrediente(nuevoIngredienteEnReceta);
		
		session.setAttribute("receta", (Object)nuevaReceta);
		
		if(origen.equals("Agregar"))
			response.sendRedirect("../Vistas/cargarIngredientesReceta_bootstrap.html");
		else
			response.sendRedirect("../Vistas/cargarCondimentosReceta_bootstrap.html");
		
	%>

</body>
</html>