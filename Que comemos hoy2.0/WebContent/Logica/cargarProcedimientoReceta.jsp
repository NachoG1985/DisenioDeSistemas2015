<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Receta" %>
<%@ page import="clases.PasoDeReceta" %>
<%@ page import="clases.IngredienteEnReceta" %>
<%@ page import="clases.Condimento" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="clases.ConsultorBaseDeDatos" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cargar Procedimiento</title>
</head>
<body>

	<%
	
	ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	Receta nuevaReceta = (Receta)session.getAttribute("receta");
	PasoDeReceta paso1, paso2, paso3, paso4, paso5;
	String instruccion1, instruccion2, instruccion3, instruccion4, instruccion5;
	String ruta1, ruta2, ruta3, ruta4, ruta5;
	
	instruccion1 = request.getParameter("textoPaso1");
	instruccion2 = request.getParameter("textoPaso2");
	instruccion3 = request.getParameter("textoPaso3");
	instruccion4 = request.getParameter("textoPaso4");
	instruccion5 = request.getParameter("textoPaso5");
	
	/*
	String currentDirectory;
	File file = new File(".");
	currentDirectory = file.getAbsolutePath();
	
	String directorioImagenes = currentDirectory + "\\Imagenes\\Procedimientos Recetas";
	
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024);
	factory.setRepository(new File(directorioImagenes));
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List<FileItem> partes = upload.parseRequest(request);
	
	for(FileItem item : partes)
	{
		file = new File(directorioImagenes, item.getName());
		item.write(file);
	}
	*/
	
	paso1 = new PasoDeReceta(instruccion1,"");
	paso2 = new PasoDeReceta(instruccion2,"");
	paso3 = new PasoDeReceta(instruccion3,"");
	paso4 = new PasoDeReceta(instruccion4,"");
	paso5 = new PasoDeReceta(instruccion5,"");
	
	nuevaReceta.agregarPasoDeReceta(paso1);
	nuevaReceta.agregarPasoDeReceta(paso2);
	nuevaReceta.agregarPasoDeReceta(paso3);
	nuevaReceta.agregarPasoDeReceta(paso4);
	nuevaReceta.agregarPasoDeReceta(paso5);
	
	consultor.insertarReceta(nuevaReceta.getNombre(), nuevaReceta.getNombreIngredientePrincipal(), nuevaReceta.getDificultad(), 
			nuevaReceta.getTemporada(), nuevaReceta.getCategorias(), nuevaReceta.calcularCalorias(), nuevaReceta.getAptaPara(), nuevaReceta.getDietasAptas());
	
	Iterator<IngredienteEnReceta> it = nuevaReceta.getIngredientes().iterator();
	
	while(it.hasNext())
	{
		IngredienteEnReceta ingrediente = it.next();
		
		consultor.insertarIngReceta(nuevaReceta.getNombre(), ingrediente.getIngrediente().getNombreIngrediente(), ingrediente.getCantidad());
	}
	
	Iterator<Condimento> itCondimento = nuevaReceta.getCondimentos().iterator();
	
	while(it.hasNext())
	{
		Condimento condimento = itCondimento.next();
		
		consultor.insertarCondimentoReceta(nuevaReceta.getNombre(), condimento.getNombreCondimento());
		
	}
	/*
	Iterator<PasoDeReceta> itPaso = nuevaReceta.getProcedimiento().listIterator();
	
	while(itPaso.hasNext())
	{
		PasoDeReceta paso = itPaso.next();
		
		consultor.insertar
	}
	
	*/
	
	response.sendRedirect("../Vistas/home_bootstrap.html");
	
	%>

</body>
</html>