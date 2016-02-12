<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Usuario usuario = (Usuario)session.getAttribute("usuario");	
	ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	String nombreReceta = request.getParameter("receta");
	String accion = request.getParameter("accion");
	int calificacion;
	
	if(accion == "confirmar")
	{
		consultor.insertarEventoEnHistorial(usuario.getNombreUsuario(), nombreReceta, "confirmar");	
	}
	else
	{
		calificacion = Integer.parseInt(request.getParameter("calificacion"));
		consultor.insertarEventoEnHistorial(usuario.getNombreUsuario(), nombreReceta, "calificar");	
		//Subir la calificacion
	}
	
	consultor.desconectar();
	response.sendRedirect("../verReceta_bootstrap.jsp?receta=" + nombreReceta);
	
	%>

</body>
</html>