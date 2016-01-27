<%@ page import="clases.ConsultorBaseDeDatos" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PerfilUsuario" %>
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
			PerfilUsuario perfil = null;
			String nombreUsuario;
			String contrase�aIngresada;
			ResultSet resultado, resultadoPerfil;
			String contrase�aUsuario;
			Usuario nuevoUsuario;
			//Analizar de cual de los dos botones viene el pedido
			String origen = request.getParameter("boton").toString();
			
				//Si viene del boton de inicio de sesion
				if(origen.contentEquals("Ingresar"))
				{
					//Se obtienen los valores ingresador
					nombreUsuario = request.getParameter("nombreUsuarioIngreso");
					contrase�aIngresada = request.getParameter("contraseniaIngreso");
					//Buscar en la base de datos el usuario con el nombre ingresado
					nuevoUsuario = consultor.consultarUsuario(nombreUsuario);
					//Si el usuario no existe o la contrase�a ingresada no coincide mostrar cartel de error
					if(nuevoUsuario == null)
					{
						response.sendRedirect("../Vistas/index.html");
					}
					else
					{
						contrase�aUsuario = nuevoUsuario.getContrase�a();
						if(!contrase�aUsuario.equals(contrase�aIngresada))
						{
							response.sendRedirect("../Vistas/index.html");
						}
						
						nuevoUsuario.setPerfil(consultor.mostrarPerfilUsuario(nombreUsuario));
							

							session.setAttribute("usuario", (Object)nuevoUsuario);
							response.sendRedirect("../Vistas/home_bootstrap.jsp");
					
					}
				}
				//Si viene del boton de registro
				else{
					if(origen.contentEquals("Registrarse"))
					{
						nombreUsuario = request.getParameter("nombreUsuarioRegistro");
					//Buscar el nombre ingresado en la base de datos
						nuevoUsuario = consultor.consultarUsuario(nombreUsuario);
					//Si no existe proceder con el registro
						if(nuevoUsuario == null)
						{
							String contrase�a = request.getParameter("contraseniaRegistro");
							String confirmacionContrase�a= request.getParameter("confirmacionContraseniaRegistro");
							String email = request.getParameter("emailRegistro");
							String diaNacimiento = request.getParameter("diaNacimiento");
							String mesNacimiento = request.getParameter("mesNacimiento");
							String a�oNacimiento = request.getParameter("anioNacimiento");
							
							String fecha = a�oNacimiento + "-" + mesNacimiento + "-" + diaNacimiento;
							
							Date fechaNacimiento = Date.valueOf(fecha);
							
							if(contrase�a.equals(confirmacionContrase�a))
							{
								nuevoUsuario = new Usuario(nombreUsuario, email, fechaNacimiento,contrase�a);
								session.setAttribute("usuario", (Object)nuevoUsuario);
								response.sendRedirect("../Vistas/registro_bootstrap.html");
								
							}
							else
							{
								response.sendRedirect("../Vistas/index.html");
							}
						}
					//Si el nombre de usuario ya existe msotrar cartel de nombre de usuario en uso
						else
						{
							response.sendRedirect("../Vistas/index.html");
						}
					}
				}
		%>
</body>
</html>