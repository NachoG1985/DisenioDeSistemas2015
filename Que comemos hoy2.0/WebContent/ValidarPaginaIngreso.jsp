<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.Fecha" %>
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
			String nombreUsuario;
			String contraseñaIngresada;
			ResultSet resultado;
			String contraseñaUsuario;
			Usuario nuevoUsuario;
			//Analizar de cual de los dos botones viene el pedido
			String origen = request.getParameter("boton").toString();
			
				//Si viene del boton de inicio de sesion
				if(origen.contentEquals("Ingresar"))
				{
					//Se obtienen los valores ingresador
					nombreUsuario = request.getParameter("nombreUsuarioIngreso").toString();
					contraseñaIngresada = request.getParameter("contraseñaIngreso").toString();
					//Buscar en la base de datos el usuario con el nombre ingresado
					resultado = consultor.consultarUsuario(nombreUsuario);
					//Si el usuario no existe o la contraseña ingresada no coincide mostrar cartel de error
					if(!resultado.first())
					{
						response.sendRedirect("InicioSesion.jsp");
					}
					else
					{
						contraseñaUsuario = resultado.getString("contrasenia");
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
					if(origen.contentEquals("Registrarse"))
					{
						nombreUsuario = request.getParameter("nombreUsuarioRegistro");
					//Buscar el nombre ingresado en la base de datos
						resultado = consultor.consultarUsuario(nombreUsuario);
					//Si no existe proceder con el registro
						if(!resultado.first())
						{
							String contraseña = request.getParameter("contraseñaRegistro");
							String confirmacionContraseña= request.getParameter("confirmacionContraseñaRegistro");
							String email = request.getParameter("emailRegistro");
							int diaNacimiento = Integer.parseInt(request.getParameter("diaNacimiento"));
							int mesNacimiento = Integer.parseInt(request.getParameter("mesNacimiento"));
							int añoNacimiento = Integer.parseInt(request.getParameter("añoNacimiento"));
							Fecha fechaNacimiento = new Fecha(diaNacimiento, mesNacimiento, añoNacimiento);
							
							if(contraseña.equals(confirmacionContraseña))
							{
								nuevoUsuario = new Usuario(nombreUsuario, email, fechaNacimiento, contraseña);
								session.setAttribute("usuario", (Object)nuevoUsuario);
								response.sendRedirect("RegistroUsuario.jsp");
								
														
								/*consultor.insertarUsuario(nombreUsuario, email, contraseña, diaNacimiento, mesNacimiento, añoNacimiento);
								
								response.sendRedirect("Home.jsp");*/
							}
							else
							{
								response.sendRedirect("InicioSesion.jsp");
							}
						}
					//Si el nombre de usuario ya existe msotrar cartel de nombre de usuario en uso
						else
						{
							response.sendRedirect("InicioSesion.jsp");
						}
					}
				}
		%>
</body>
</html>