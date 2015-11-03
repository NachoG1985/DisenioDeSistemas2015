<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="clases.Receta" %>
<%@ page import="clases.Usuario" %>
<%@ page import="clases.PasoDeReceta" %>
<%@ page import="clases.IngredienteEnReceta" %>
<%@ page import="clases.Condimento" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

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
	String[] rutas = new String[5];
	int contador = 0;
	
	instruccion1 = request.getParameter("textoPaso1");
	instruccion2 = request.getParameter("textoPaso2");
	instruccion3 = request.getParameter("textoPaso3");
	instruccion4 = request.getParameter("textoPaso4");
	instruccion5 = request.getParameter("textoPaso5");
	
	
	File file ;
	   int maxFileSize = 5000 * 1024;
	   int maxMemSize = 5000 * 1024;
	   ServletContext context = pageContext.getServletContext();
	   String filePath = context.getInitParameter("file-upload");

	   // Verify the content type
	   String contentType = request.getContentType();
	   if ((contentType.indexOf("multipart/form-data") >= 0)) {

	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File("c:\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );
	      try{ 
	         // Parse the request to get file items.
	         List fileItems = upload.parseRequest(request);

	         // Process the uploaded file items
	         Iterator i = fileItems.iterator();

	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>JSP File upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	         while ( i.hasNext () ) 
	         {
	            FileItem fi = (FileItem)i.next();
	            if ( !fi.isFormField () )	
	            {
	            // Get the uploaded file parameters
	            String fieldName = fi.getFieldName();
	            String fileName = fi.getName();
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            // Write the file
	            if( fileName.lastIndexOf("\\") >= 0 ){
	            file = new File( filePath + 
	            fileName.substring( fileName.lastIndexOf("\\"))) ;
	            }else{
	            file = new File( filePath + 
	            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	            }
	            fi.write( file ) ;
	            out.println("Uploaded Filename: " + filePath + 
	            fileName + "<br>");
	            
	            rutas[contador] = fileName;
	            
	            contador++;
	            
	            }
	         }
	         out.println("</body>");
	         out.println("</html>");
	      }catch(Exception ex) {
	         System.out.println(ex);
	      }
	   }else{
	      out.println("<html>");
	      out.println("<head>");
	      out.println("<title>Servlet upload</title>");  
	      out.println("</head>");
	      out.println("<body>");
	      out.println("<p>No file uploaded</p>"); 
	      out.println("</body>");
	      out.println("</html>");
	   }

	   
		paso1 = new PasoDeReceta(instruccion1,rutas[0]);
		paso2 = new PasoDeReceta(instruccion2,rutas[1]);
		paso3 = new PasoDeReceta(instruccion3,rutas[2]);
		paso4 = new PasoDeReceta(instruccion4,rutas[3]);
		paso5 = new PasoDeReceta(instruccion5,rutas[4]);
		
		nuevaReceta.agregarPasoDeReceta(paso1);
		nuevaReceta.agregarPasoDeReceta(paso2);
		nuevaReceta.agregarPasoDeReceta(paso3);
		nuevaReceta.agregarPasoDeReceta(paso4);
		nuevaReceta.agregarPasoDeReceta(paso5);
		
		
	consultor.insertarProcedimiento(rutas[0], instruccion1, rutas[1], instruccion2, rutas[2], instruccion3, rutas[3], instruccion4, rutas[4], instruccion5);
	
	
	consultor.insertarReceta(nuevaReceta.getNombre(), nuevaReceta.getNombreIngredientePrincipal(), nuevaReceta.getDificultad(), 
			nuevaReceta.getTemporada(), nuevaReceta.getCategorias(), 666, nuevaReceta.getAptaPara(), nuevaReceta.getDietasAptas(), "");
	
	consultor.insertarRecUsuario(((Usuario)session.getAttribute("usuario")).getNombreUsuario(), nuevaReceta.getNombre());
	
	Iterator<IngredienteEnReceta> it = nuevaReceta.getIngredientes().iterator();
	
	while(it.hasNext())
	{
		IngredienteEnReceta ingrediente = it.next();
		
		consultor.insertarIngReceta(nuevaReceta.getNombre(), ingrediente.getIngrediente().getNombreIngrediente(), ingrediente.getCantidad());
	}
	
	Iterator<Condimento> itCondimento = nuevaReceta.getCondimentos().iterator();
	
	while(itCondimento.hasNext())
	{
		Condimento condimento = itCondimento.next();
		
		consultor.insertarCondimentoReceta(nuevaReceta.getNombre(), condimento.getNombreCondimento());
		
	}
	
	response.sendRedirect("../Vistas/home_bootstrap.jsp");
	
	%>

</body>
</html>