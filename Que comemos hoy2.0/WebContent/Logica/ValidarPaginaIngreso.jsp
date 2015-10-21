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
			String contraseņaIngresada;
			ResultSet resultado;
			String contraseņaUsuario;
			Usuario nuevoUsuario;
			//Analizar de cual de los dos botones viene el pedido
			String origen = request.getParameter("boton").toString();
			
				//Si viene del boton de inicio de sesion
				if(origen.contentEquals("Ingresar"))
				{
					//Se obtienen los valores ingresador
					nombreUsuario = request.getParameter("nombreUsuarioIngreso");
					contraseņaIngresada = request.getParameter("contraseniaIngreso");
					//Buscar en la base de datos el usuario con el nombre ingresado
					resultado = consultor.consultarUsuario(nombreUsuario);
					//Si el usuario no existe o la contraseņa ingresada no coincide mostrar cartel de error
					if(!resultado.first())
					{
						response.sendRedirect("../Vistas/Inicio_bootstrap.html");
					}
					else
					{
						contraseņaUsuario = resultado.getString("contrasenia");
						if(!contraseņaUsuario.equals(contraseņaIngresada))
						{
							response.sendRedirect("../Vistas/Inicio_bootstrap.html");
						}
						else
						{
					//Si el usuario existe y la contraseņa ingresada es correcta entonces setear el nombre de usuario en la sesion y redirigir a la pagina home
							
							//session.setAttribute("usuario", (Object)nuevoUsuario);
							response.sendRedirect("../Vistas/home_bootstrap.jsp");
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
							String contraseņa = request.getParameter("contraseniaRegistro");
							String confirmacionContraseņa= request.getParameter("confirmacionContraseniaRegistro");
							String email = request.getParameter("emailRegistro");
							String diaNacimiento = request.getParameter("diaNacimiento");
							String mesNacimiento = request.getParameter("mesNacimiento");
							String aņoNacimiento = request.getParameter("anioNacimiento");
							
							String fecha = aņoNacimiento + "-" + mesNacimiento + "-" + diaNacimiento;
							
							Date fechaNacimiento = Date.valueOf(fecha);
							
							if(contraseņa.equals(confirmacionContraseņa))
							{
								nuevoUsuario = new Usuario(nombreUsuario, email, fechaNacimiento,contraseņa);
								session.setAttribute("usuario", (Object)nuevoUsuario);
								response.sendRedirect("../Vistas/registro_bootstrap.html");
								
							}
							else
							{
								response.sendRedirect("../Vistas/Inicio_bootstrap.html");
							}
						}
					//Si el nombre de usuario ya existe msotrar cartel de nombre de usuario en uso
						else
						{
							response.sendRedirect("../Vistas/Inicio_bootstrap.html");
						}
					}
				}
		%>
</body>
</html>