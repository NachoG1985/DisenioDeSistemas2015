
<%@ page import="clases.Usuario"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validacion de registro de usuario</title>
</head>
<body>
	<% 
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("email"), request.getParameter("contraseña1"), request.getParameter("contraseña2"));
		
		if(user.getPassword1().equals(user.getPassword2()))
		{
		out.println("Ingreso de datos correctos");
		out.println("Nombre de usuario: " + user.getName() + " email: " + user.getMail() + " contraseña:" + user.getPassword1());
		}
		else
		{
			out.println("Ingreso de datos incorrectos, por favor ingrese los datos nuevamente.");
			out.println("<script type=text/javascript");
			out.println("location href=RegistroUsuario.jsp;");
			out.println("</script>");
		}
	%>
</body>
</html>