<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="java.sql.*" %>

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
			//Obtener el consultor de la base de datos
			ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
		
			//Analizar de cual de los dos botones viene el pedido
			String origen = request.getParameter("boton").toString();
			
				//Si viene del boton de inicio de sesion
				if(origen.contentEquals("Ingresar"))
				{
					//Se obtienen los valores ingresador
					String nombreUsuario = request.getParameter("nombreUsuarioIngreso").toString();
					String contraseñaIngresada = request.getParameter("contraseñaIngreso").toString();
					//Buscar en la base de datos el usuario con el nombre ingresado
					ResultSet resultado = consultor.consultarUsuario(nombreUsuario);
					//Si el usuario no existe o la contraseña ingresada no coincide mostrar cartel de error
					if(resultado == null)
					{
						response.sendRedirect("InicioSesion.jsp");
					}
					else
					{
						resultado.next();
						String contraseñaUsuario = resultado.getString("contrasenia");
						if(!contraseñaUsuario.equals(contraseñaIngresada))
						{
							response.sendRedirect("InicioSesion.jsp");
						}
						else
						{
					//Si el usuario existe y la contraseña ingresada es correcta entonces setear el nombre de usuario en la sesion y redirigir a la pagina home
							response.sendRedirect("Home.jsp");
						}
					}
				}
				//Si viene del boton de registro
				else{
					if(origen.contentEquals("registrarse"))
					{
					//Buscar el nombre ingresado en la base de datos
			
					//Si el nombre de usuario ya existe msotrar cartel de nombre de usuario en uso
			
					//Si no existe proceder con el registro
					}
				}
		%>
</body>
</html>