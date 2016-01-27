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



<%@ page import="com.cloudinary.*" %>
<%@ page import="com.cloudinary.utils.ObjectUtils" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.URI" %>

<%@ page import="clases.ConsultorBaseDeDatos" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cargar Procedimiento</title>
</head>
<body>

	<%
	
	//CODIGO DE LA APP DE HEROKU CLOUDINARY PARA EL MANEJO DE IMAGENES EN LA NUBE
	//OBTENGO LAS VARIABLES NECESARIAS PARA INICIAR CLOUDINATY

	//INICIO UN OBJETO CLOUDINARY ENCARGADO DEL MANEJO DE LAS IMAGENES
	Cloudinary cloudinary = new Cloudinary(System.getenv("CLOUDINARY_URL"));
	
	ConsultorBaseDeDatos consultor = ConsultorBaseDeDatos.getInstance();
	Receta nuevaReceta = (Receta)session.getAttribute("receta");
	PasoDeReceta paso1, paso2, paso3, paso4, paso5;
	String instruccion1="", instruccion2 ="", instruccion3="", instruccion4="", instruccion5="";
	String[] rutas = new String[5];
	String nombreCampo;
	int contador = 0;
	
	
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
	            //CARGO LA NUEVA IMAGEN A TRAVES DEL OBJETO CLOUDINARY Y ALMACENO EN EL UPLOAD RESULT LOS DATOS DE LA IMAGEN SUBIDA A LA NUBE
	            Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
	            //TOMO DEL RESULTADO LA URL GENERADA PARA LA IMAGEN SUBIDA Y LA ALMACENO PARA INSERTARLA A LA DB Y LUEGO PODER CONSULTARLA
	            rutas[contador] = (String) uploadResult.get("url");
	            
	            contador++;
	            
	            }
	            else
	            {
	            	nombreCampo = fi.getFieldName();
	            	
	            	if(nombreCampo.equals("textoPaso1"))
	            		instruccion1 = fi.getString();
	            	
	            	if(nombreCampo.equals("textoPaso2"))
	            		instruccion2 = fi.getString();
	            	
	            	if(nombreCampo.equals("textoPaso3"))
	            		instruccion3 = fi.getString();
	            	
	            	if(nombreCampo.equals("textoPaso4"))
	            		instruccion4 = fi.getString();
	            	
	            	if(nombreCampo.equals("textoPaso5"))
	            		instruccion5 = fi.getString();
	            }
	         }

	      }catch(Exception ex) {
	         System.out.println(ex);
	      }
	   }else{

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