<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de nuevo usuario</title>
</head>
<body>
	<form action="validarRegistro.jsp" method="POST">
		Nombre de usuario: <input type="text" name="nombreUsuario"/>
		<br>
		Email: <input type="text" name="email"/>
		<br>
		Contraseņa: <input type="password" name="contraseņa1"/>
		<br>
		Repita la contraseņa: <input type="password" name="contraseņa2"/>
		<br><br>
		<input type="submit" name="registrar"/>
	</form>
</body>
</html></html>