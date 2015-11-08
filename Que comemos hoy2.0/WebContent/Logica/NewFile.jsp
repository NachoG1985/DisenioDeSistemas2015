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
		String ingredientePpal = request.getParameter("ingredientePpal");
		String condimento = request.getParameter("condimento");
		String dieta = request.getParameter("dieta");
		String caloriasMins = request.getParameter("caloriasMin");
		String caloriasMaxs = request.getParameter("caloriasMax");
		String dificultads = request.getParameter("dificultad");
		String nivelAlimenticios = request.getParameter("nivelAlimenticio");
		
		if(ingredientePpal != "")
			out.println("Ingrediente: " + ingredientePpal);
		else
		out.println("error: ingresaste: " + ingredientePpal);
		
		if(dieta != "")
			out.println("dieta: " + dieta);
		else
		out.println("error: ingresaste: " + dieta);
		
		if(condimento != "")
			out.println("condimento: " + ingredientePpal);
		else
		out.println("error: ingresaste: " + condimento);
		
		if(caloriasMins != "")
			out.println("calorias min: " + caloriasMins);
		else
		out.println("error: ingresaste: " + caloriasMins);
		
		if(caloriasMaxs != "")
			out.println("calorias max: " + caloriasMaxs);
		else
		out.println("error: ingresaste: " + caloriasMaxs);
		
		if(dificultads != "")
			out.println("dificultad: " + dificultads);
		else
		out.println("error: ingresaste: " + dificultads);
		
		%>

</body>
</html>