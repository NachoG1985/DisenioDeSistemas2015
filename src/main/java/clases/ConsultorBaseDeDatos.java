package clases;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;
import java.sql.Date;
import java.util.*;





public class ConsultorBaseDeDatos {

	// Atributos de la clase
	private static String rutaBaseDeDatos;
	private  static ConsultorBaseDeDatos instance;
	private Connection miConexion;
	private String username, password, dbUrl;
	
	
	
	// Constructor de la clase
	private ConsultorBaseDeDatos()
	{
		
	}

//********************** Funciones DB***************************	
	//Patron Singleton
	public static ConsultorBaseDeDatos getInstance()
	{
		if(instance == null)  
		{
			instance = new ConsultorBaseDeDatos();
			instance.conectar();
		}
		return instance;
	}
	
	// Metodos de la clase
	
	public void setRutaDb(String ruta)
	{
		rutaBaseDeDatos = ruta;
	}
	public String getRutaDb()
	{
		return rutaBaseDeDatos;
	}
	
	public void setConexion(Connection conexion) {
        this.miConexion = conexion;
	} 
	
	public Connection getConexion(Connection conexion) {
        return conexion;
	} 

	public ConsultorBaseDeDatos setInstance(){
		return instance;
	}
	
	public ConsultorBaseDeDatos conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            //Version para la aplicacion hosteada
            URI dbUri = new URI(System.getenv("CLEARDB_DATABASE_URL"));
            
            //Version para la aplicacion corriendo en local con wamp
            //URI dbUri = new URI("mysql://root:@localhost/disenio");

           this.username = dbUri.getUserInfo().split(":")[0];
           this.password = dbUri.getUserInfo().split(":")[1];
           this.dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

            
            setConexion(DriverManager.getConnection(dbUrl, username, password));
            
            if(miConexion != null){
                System.out.println("Conexion Exitosa!");
            }else{
                System.out.println("Conexion Fallida!");                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this;
    }
	
	
	
	
	
	//Retorna la conexion de la DB
	private Connection getConexion(String BD, String usuario, String contrasenia)
	{
        try {
            //llamar a la clase o driver de jdbc
            Class.forName("com.mysql.jdbc.Driver");
            //String servidor = "jdbc:mysql://localhost:3306/" + BD
            
            miConexion = DriverManager.getConnection(BD,usuario,contrasenia);
        } 
        catch (ClassNotFoundException e)
        {
            System.err.println("No se encontro Driver");
            miConexion = null;
        }
        catch(SQLException ex)
        {
            System.err.println("No se pudo conectar a la base de datos");
            ex.printStackTrace();
            miConexion = null;
        }
        
        return miConexion;
    }

	//Metodo que ejecuta las sentencias INSERT, UPDATE, DELETE, y devuelve true o false en caso de exito o fallo
	public boolean ejecutar(String sql)
	{
        try {
            Statement sentencia = getConexion(dbUrl, username, password).createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate(sql);
            sentencia.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }        return true;
    }
	
	
	//Devuelve un objeto con los datos en caso de fallo devuelve null :3
	public ResultSet consultar(String sql)
	{
        ResultSet resultado;
        try {
            Statement sentencia = getConexion(dbUrl, username, password).createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }        return resultado;
    }
	

//************************ Funciones INSERT*************************
	
	 public void insertarUsuario(String nombre,String mail,String pass,java.sql.Date fecha) {
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	           
	             cst = cn.prepareCall("{call insertarUsuario(?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setString(2,mail);
	             cst.setString(3,pass);
	             cst.setDate(4,fecha);
	             cst.executeUpdate();
	           
	              
	            
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
       
	 }  
	 
	 
	 public void insertarReceta(String nombre,String ingrediente,int dificultad,double calorias,String imagen1) {
		 	int ing,im1;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	        	           	 
	           	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 im1 = obtenerIDProcedimiento(imagen1, cn, cst);
	           
	             cst = cn.prepareCall("{call insertarReceta(?,?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,ing);
	             cst.setInt(3,dificultad);
	             cst.setDouble(4,calorias);
	             cst.setInt(5,im1);
	             cst.executeUpdate();
	         
	         	                
	                         
	        }catch (Exception e) {	
	        	e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
		        
	 }  
	
	 
	 public void insertarIngrediente(String nombre,int porcion,double calorias,String nivel) {
		 	int level; 
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 level= obtenerIDAlimenticio(nivel, cn, cst);
	             cst = cn.prepareCall("{call insertarIngrediente(?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,porcion);
	             cst.setDouble(3,calorias);
	             cst.setInt(4,level);
	             cst.executeUpdate();
	             
	          	                
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	   
	       
	 }  
	 
	 public void insertarCondimento(String nombre) {
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	           
	             cst = cn.prepareCall("{call insertarCondimento(?)}");
	             cst.setString(1,nombre);
	             cst.executeUpdate();
	                   
	          
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();	
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	        
	      
	 }  
	 
	 
	 public void insertarPerfil(String usuario,String nombre,String apellido,String sexo,int edad,double altura,String complexion,String dieta,String rutina) {
		 	int usu,diet,routine;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	        	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 diet = obtenerIDDieta(dieta, cn, cst);
	        	 routine = obtenerIDRutina(rutina, cn, cst);
	        	
	           	           
	             cst = cn.prepareCall("{call insertarPerfil(?,?,?,?,?,?,?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setString(2,nombre);
	             cst.setString(3,apellido);
	             cst.setString(4,sexo);
	             cst.setInt(5,edad);
	             cst.setDouble(6,altura);
	             cst.setString(7,complexion);
	             cst.setInt(8,diet);
	             cst.setInt(9,routine);
	             cst.executeUpdate();
	                   
	           
	                         
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	      
	 }  
	 
	 public void insertarCondimentoReceta(String receta,String condimento) {
		 	int cond, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 cond = obtenerIDCondimento(condimento, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarCondReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,cond);
	             cst.executeUpdate();
	                
	         
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	        
	    
	 }  
	 
	 public void insertarIngReceta(String receta,String ingrediente,int cantidad) {
		 	int ing, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarIngReceta(?,?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,ing);
	             cst.setInt(3,cantidad);
	             cst.executeUpdate();
	                    
	               
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 public void insertarCategoriaReceta(String nombreReceta,String nombreCategoria) {
		 	int cat, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 cat = obtenerIDCategoria(nombreCategoria, cn, cst);
	        	 rec = obtenerIDReceta(nombreReceta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarCategoriaReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,cat);
	             cst.executeUpdate();
	                    
	            
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 public void insertarCondicionReceta(String nombreReceta,String nombreCondicion) {
		 	int cond, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 cond = obtenerIDCondicion(nombreCondicion, cn, cst);
	        	 rec = obtenerIDReceta(nombreReceta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarCondicionReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,cond);
	             cst.executeUpdate();
	                    
	         
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 public void insertarDietaReceta(String nombreReceta,String nombreDieta) {
		 	int diet, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 diet = obtenerIDDieta(nombreDieta, cn, cst);
	        	 rec = obtenerIDReceta(nombreReceta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarDietaReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,diet);
	             cst.executeUpdate();
	                    
	          
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 } 
	 
	 public void insertarTemporadaReceta(String nombreReceta,String nombreTemporada) {
		 	int temp, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 temp = obtenerIDTemporada(nombreTemporada, cn, cst);
	        	 rec = obtenerIDReceta(nombreReceta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarTemporadaReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,temp);
	             cst.executeUpdate();
	                    
	          
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 public void insertarRecUsuario(String usuario,String receta) {
		  	int usu, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 			 	
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarRecUsuario(?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.executeUpdate();
	             
	             String operacion = "cargar";
	             cst = cn.prepareCall("{call insertarEventoEnHistorial(?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.setString(3,operacion);
	             cst.executeUpdate();
	                    
	       
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
    }  
	 
	 public void insertarEventoEnHistorial(String usuario,String receta,String operacion) {
		 	int usu, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarEventoEnHistorial(?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.setString(3,operacion);
	             cst.executeUpdate();
	            
	                
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	        
	 } 
	 
	 public void insertarProcedimiento(String im1,java.lang.String pas1,String im2,java.lang.String pas2,String im3,java.lang.String pas3,String im4,java.lang.String pas4,String im5,java.lang.String pas5) {
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	           
	             cst = cn.prepareCall("{call insertarProcedimiento(?,?,?,?,?,?,?,?,?,?)}");
	             cst.setString(1,im1);
	             cst.setString(2,pas1);
	             cst.setString(3,im2);
	             cst.setString(4,pas2);
	             cst.setString(5,im3);
	             cst.setString(6,pas3);
	             cst.setString(7,im4);
	             cst.setString(8,pas4);
	             cst.setString(9,im5);
	             cst.setString(10,pas5);
	             cst.executeUpdate();
	            
	                
	                         
	        }catch (Exception e) {
	        	e.printStackTrace();	        	
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	        
	        return ;
	 }  
	 
	 //Inserta una calificacion a una receta dado el usuario.
	 public void calificarRecetaUsuario(String usuario,String receta,int calificacion) {
		 	int usu, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call calificarRecetaUsuario(?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.setInt(3,calificacion);
	             cst.executeUpdate();
	        
	             String operacion = "calificar";
	             cst = cn.prepareCall("{call insertarEventoEnHistorial(?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.setString(3,operacion);
	             cst.executeUpdate();
	           
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	        
	 } 
	 
	 //inserta una condicion prexistente de un perfil.
	 public void insertarCondicionPerfil(String nombreUsuario,String nombreCondicion) {
		 	int perfil,cond;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	        	 System.out.println(nombreUsuario);
	           	 
	        	 perfil = obtenerIDPerfil(nombreUsuario, cn, cst);
	        	 cond = obtenerIDCondicion(nombreCondicion, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarCondicionPerfil(?,?)}");
	             cst.setInt(1,perfil);
	             cst.setInt(2,cond);
	             cst.executeUpdate();
	                    
	           
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 public void insertarPreferenciaPerfil(String nombreUsuario,String nombreIngrediente) {
		 	int perfil,ing;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion(dbUrl, username, password);
	           	 
	        	 perfil = obtenerIDPerfil(nombreUsuario, cn, cst);
	        	 ing = obtenerIDIng(nombreIngrediente, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarPreferenciaPerfil(?,?)}");
	             cst.setInt(1,perfil);
	             cst.setInt(2,ing);
	             cst.executeUpdate();
	                    
	       
	                         
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        }finally {
	            try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
	 }  
	 
	 
	 
//****************Funciones CONSULTA**************************
//Devuelve todos los datos de un usuario	
	 public Usuario consultarUsuario(String nombre) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
	 	Usuario usuarioBuscado = null;
	 	String nombreUsuario;
		String email;
		String contrasenia;
		Date fechaNacimiento;
	 	try {
        	 cn = getConexion(dbUrl, username, password);
             cst = cn.prepareCall("{call consultaUsuario(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
             
             if(data.next())
             {
            	 nombreUsuario = data.getString("nombreUsuario");
            	 email = data.getString("email");
            	 contrasenia = data.getString("contrasenia");
            	 fechaNacimiento = data.getDate("fecha_nacimiento");
            	 usuarioBuscado = new Usuario(nombreUsuario,email,fechaNacimiento,contrasenia);
             }
            
        }catch (Exception e) {
        	e.printStackTrace();
        	System.out.println("Error");
        }finally {
        	try { data.close(); } catch (Exception e) {  }
        	try { cst.close(); } catch (Exception e) { }
            try { cn.close(); } catch (Exception e) {  }
        }
	 	return usuarioBuscado;
 }  
	
	
	 public Receta consultarReceta(String nombre) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
	 	Receta recetaBuscada=null;
        try {
        	 cn = getConexion(dbUrl, username, password);
           	           
             cst = cn.prepareCall("{call consultaReceta(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
             
             if(data.next())
             {
             String nombreReceta = data.getString("nombre");
			 int dificultad = data.getInt("dificultad");
			 float calorias = data.getInt("caloriasTotales");
			 String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
			 
			 recetaBuscada = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
			 
			 recetaBuscada.setCategorias(obtenerCategoriasReceta(nombre));
			 recetaBuscada.setTemporada(obtenerTemporadasReceta(nombre));
			 recetaBuscada.setAptaPara(obtenerCondicionesReceta(nombre));
			 recetaBuscada.setDietasAptas(obtenerDietasReceta(nombre));
			 
             }
			
			
        }catch (Exception e) {
        	e.printStackTrace();
        	System.out.println("Error");
        }finally {
        	try { data.close(); } catch (Exception e) {  }
        	try { cst.close(); } catch (Exception e) { }
            try { cn.close(); } catch (Exception e) {  }
        } return recetaBuscada;
 }  
	
	public HashSet<Receta> mostrarRecetasDB( ) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
	 	HashSet<Receta> recetasDB = new HashSet<Receta>();
	 	Receta recetaDB;
        try {
        	 cn = getConexion(dbUrl, username, password);
           	           
             cst = cn.prepareCall("{call mostrarRecetasDB()}");
             data = cst.executeQuery();
             while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				recetaDB = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
								 
				recetaDB.setCategorias(obtenerCategoriasReceta(nombreReceta));
				recetaDB.setTemporada(obtenerTemporadasReceta(nombreReceta));
				recetaDB.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				recetaDB.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				recetasDB.add(recetaDB);
			 }
          
             
        }catch (Exception e) {
        	 e.printStackTrace();
        	System.out.println("Error");
        	
        }finally {
        	try { data.close(); } catch (Exception e) {  }
        	try { cst.close(); } catch (Exception e) { }
            try { cn.close(); } catch (Exception e) {  }
        } return recetasDB;
 }  
	
	
 
	//devuelve los ingredientes y cant de una receta en un Set
	 public ArrayList<String> obtenerIngyCant(String nombre) {
		 	ResultSet data=null;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	ArrayList<String> lista = new ArrayList<String>();
		 	int rec;
		 	try {
		 		cn = getConexion(dbUrl, username, password);
	           	 
		 		rec = obtenerIDReceta(nombre, cn, cst);
	        	 
		 		cst = cn.prepareCall("{call ingYCantSegunReceta(?)}");
		 		cst.setInt(1,rec);
		 		data = cst.executeQuery();
		 		while (data.next())
		 		{
		 			lista.add(data.getString("nombre"));
		 			lista.add(""+data.getInt("cantidad"));
	            	
		 		}      
	             
	           	                          
	            
	        }catch (Exception e) {
	        	 e.printStackTrace();	
	        } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return lista;
	 }  
		 
		 //devuelve los condimentos de una receta en un Set
	 public HashSet<Condimento> obtenerCondimentos(String nombreReceta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<Condimento> buscadas = new HashSet<Condimento>();
		 Condimento aux;
		 int rec;
		 try {
			 cn = getConexion(dbUrl, username, password);
	           	 
			 rec = obtenerIDReceta(nombreReceta, cn, cst);
	        	 
			 cst = cn.prepareCall("{call condSegunReceta(?)}");
			 cst.setInt(1,rec);
			 data = cst.executeQuery();
			 
			 while (data.next())
			 {
				String nombreCond = data.getString("nombre");
				aux = new Condimento(nombreCond);
				buscadas.add(aux);
				 
			 }               
	                         
			
		 }catch (Exception e) {
			 e.printStackTrace();	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }  

	//devuelve las recetas segun condimento dado 
	 public HashSet<Receta> recetaSegunCond(String condim) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
			 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call recetaSegunCondimento(?)}");
			 cst.setString(1,condim);
			 data = cst.executeQuery();
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
			
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
		                
			
		                
		 }catch (Exception e) {
			 e.printStackTrace();  	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }  
		 
	 //devuelve las recetas segun dieta dada 
	 public HashSet<Receta> recetaSegunDieta(String dieta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
				 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call recetaSegunDieta(?)}");
			 cst.setString(1,dieta);
			 data = cst.executeQuery();
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			            
			
			                
		 }catch (Exception e) {
			 e.printStackTrace();       	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }  
			 
	 //devuelve las recetas segun dieta dada 
	 public HashSet<Receta> recetaSegunNivelAlimenticio(String nivel) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
				 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	   	      	 
			 cst = cn.prepareCall("{call recetaSegunNivelAlimenticio(?)}");
			 cst.setString(1,nivel);
			 data = cst.executeQuery();
			 
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
								
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			                       
	
			                
		 }catch (Exception e) {
			 e.printStackTrace();       	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }  
			 
	 //devuelve las recetas segun los gustos del usuario dado 
	 public HashSet<Receta> recetaSegunPreferencia(String nombreUsuario) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 int usu;	 
		 
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
			 usu = obtenerIDUsuario(nombreUsuario, cn, cst);  	      	 
			 cst = cn.prepareCall("{call recetaSegunPreferencia(?)}");
			 cst.setInt(1,usu);
			 data = cst.executeQuery();
			 
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
								
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			                           
			
		 }catch (Exception e) {
			 e.printStackTrace();      	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }
	 
	 //devuelve las recetas segun dentro de un periodo
	 public HashSet<Receta> recetaSegunPreferenciaPorPeriodo(java.sql.Timestamp fecha1,java.sql.Timestamp fecha2) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 	 
		 
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
			 cst = cn.prepareCall("{call recetaSegunPrefPeriodo(?,?)}");
			 cst.setTimestamp(1,fecha1);
			 cst.setTimestamp(2,fecha2);
			 data = cst.executeQuery();
			 
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
								
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			                           
			
		 }catch (Exception e) {
			 e.printStackTrace();       	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }
			 
	 //devuelve las recetas segun ing ppal dado 
	 public HashSet<Receta> recetaSegunIngPpal(String ingrediente) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
				 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call recetaSegunIngPpal(?)}");
			 cst.setString(1,ingrediente);
			 data = cst.executeQuery();
			 
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			            
			
			                
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }  
			 
	 public HashSet<Receta> recetaSegunDificultad(int dificultad) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
				 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	  	      	 
			 cst = cn.prepareCall("{call recetaSegunDificultad(?)}");
			 cst.setInt(1,dificultad);
			 data = cst.executeQuery();
			 

			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultadReceta = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
								
				aux = new Receta(nombreReceta, ingredientePpal, dificultadReceta,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			          
			 
		
			                
		 }catch (Exception e) {
			 e.printStackTrace();      	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }  
			 
	 //segun un rango de calorias devuelve las recetas con calorias dentro de ese rango
	 public HashSet<Receta> recetaSegunCalorias(double cal1,double cal2) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
				 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	  	      	 
			 cst = cn.prepareCall("{call reporteRangoCalorias(?,?)}");
			 cst.setDouble(1,cal1);
			 cst.setDouble(2,cal2);
			 data = cst.executeQuery();

			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			 
		
			 		             
			                
		 }catch (Exception e) {
			e.printStackTrace();        	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }  
			 
	//Devuelve las recetas mas consultadas dado un periodo de tiempo para un usuario dado.		 
	 public ArrayList<Receta> recetaMasConsultada(java.sql.Timestamp fecha1,java.sql.Timestamp fecha2,String nombreUsuario) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 		 
		 ArrayList<Receta> buscadas = new ArrayList<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call recetaMasConsultada(?,?,?)}");
			 cst.setTimestamp(1,fecha1);
			 cst.setTimestamp(2,fecha2);
			 cst.setString(3,nombreUsuario);
			 data = cst.executeQuery();
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
		
			             
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }  
		
	 // Devuelve las recetas creadas por un usuario dado.
	 public HashSet<Receta> recetaCreadasPorUsuario(String nombreUsuario) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 int usu;
		
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 usu = obtenerIDUsuario(nombreUsuario, cn, cst);
			 cst = cn.prepareCall("{call mostrarRecetasCreadas(?)}");
			 cst.setInt(1,usu);
			 data = cst.executeQuery();
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			            
			
			             
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return buscadas;
	 }
	 
	// Devuelve las recetas creadas por todos los usuarios.
		 public HashSet<Receta> recetaCreadasPorTodosLosUsuarios() {
			 ResultSet data=null;
			 Connection cn = null;
			 CallableStatement cst = null;
			 
			
			 HashSet<Receta> buscadas = new HashSet<Receta>();
			 Receta aux;
			 try {
				 cn = getConexion(dbUrl, username, password);
				 
				 cst = cn.prepareCall("{call mostrarRecetasCreadasEnDB()}");
				 data = cst.executeQuery();
				 
				 while(data.next())
				 {			 
				 	String nombreReceta = data.getString("nombre");
					int dificultad = data.getInt("dificultad");
					float calorias = data.getInt("caloriasTotales");
					String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
					
					aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
					
					aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
					aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
					aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
					aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
					
					buscadas.add(aux);
				 }
				            
			
				             
			 }catch (Exception e) {
				        	
			 } finally {
		        	try { data.close(); } catch (Exception e) {  }
		        	try { cst.close(); } catch (Exception e) { }
		            try { cn.close(); } catch (Exception e) {  }
		        }return buscadas;
		 }

	 //devuelve todos los ing de la db
	 public HashSet<String> mostrarIngredientesDB( ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<String> nombresIngredientes = new HashSet<String>();
		 String nombreIngrediente;
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	           
			 cst = cn.prepareCall("{call listarIngredientes()}");
			 data = cst.executeQuery();
			 while(data.next())
			 {			 
			 	nombreIngrediente = data.getString("nombre");
				nombresIngredientes.add(nombreIngrediente);		
			 }           
		
			            
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return nombresIngredientes;
	 }
	
	 //devuelve todos los condimentos de la db 
	 public HashSet<String> mostrarCondimentosDB( ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<String> nombresCondimentos = new HashSet<String>();
		 String nombreCondimento;
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	           
			 cst = cn.prepareCall("{call listarCondimentos()}");
			 data = cst.executeQuery();
			 while(data.next())
			 {			 
			 	nombreCondimento = data.getString("nombre");
				nombresCondimentos.add(nombreCondimento);		
			 }
		
			            
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return nombresCondimentos;
	 }  
	 
	 //devuelve el perfil del usuario
	 public PerfilUsuario mostrarPerfilUsuario(String nombreUsuario ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 PerfilUsuario perfilBuscado = null;
		 try {
			 cn = getConexion(dbUrl, username, password);        	           
			 cst = cn.prepareCall("{call obtenerPerfil(?)}");
			 cst.setString(1,nombreUsuario);
			 data = cst.executeQuery();
			 if(data.next())
			 {
			 String nombre = data.getString("nombre");
			 String apellido = data.getString("apellido");
			 String sexo = data.getString("sexo");
			 int edad = data.getInt("edad");
			 double altura = data.getDouble("altura");
			 String complexion = data.getString("complexion");
			 int id_dieta = data.getInt("dieta_id");
			 String dieta = obtenerNombreDieta(id_dieta,cn);
			  System.out.println("guachin:" + Integer.toBinaryString(id_dieta));
			 String rutina = obtenerNombreRutina(data.getInt("rutina_id"),cn);

			 perfilBuscado = new PerfilUsuario(nombre,apellido,sexo,edad,altura,complexion,dieta,null,rutina,null);
			 }
			 perfilBuscado.setCondicionPreexistente(obtenerCondicionesPerfil(nombreUsuario));
			 perfilBuscado.setPreferencias(obtenerPreferenciasPerfil(nombreUsuario));
			
			            
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return perfilBuscado;
	 }  
	 
	//devuelve recetas dada una temporada
	 public HashSet<Receta> recetaSegunTemporada(String temporada) {  
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
			
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call recetaSegunTemporada(?)}");
			 cst.setString(1,temporada);
			 data = cst.executeQuery();
				 
			 while(data.next())
			 {			 
				 String nombreReceta = data.getString("nombre");
				 int dificultad = data.getInt("dificultad");
				 float calorias = data.getInt("caloriasTotales");
				 String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
					
				 aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
					
					aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
					aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
					aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
					aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
					
				 buscadas.add(aux);
			 }
				            
			
		 }catch (Exception e) {
			 e.printStackTrace();	 
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }
	 
	 
	 
	 //devuelve recetas mejor calificadas.
	 public HashSet<Receta> recetaTopTemporada(String temporada) {  
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call recetaTopTemporada(?)}");
			 cst.setString(1,temporada);
			 data = cst.executeQuery();
			 
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			            
			 
		 }catch (Exception e) {
			 e.printStackTrace(); 
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }
	 
	
	 //Devuelve las recetas que se encuentran en el rango de calorias.
	 public HashSet<Receta> recetaSegunRangoCalorias(double cal1,double cal2) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		
		 HashSet<Receta> buscadas = new HashSet<Receta>();
		 Receta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call reporteRangoCalorias(?,?)}");
			 cst.setDouble(1,cal1);
			 cst.setDouble(2,cal2);
			 data = cst.executeQuery();
			
			 while(data.next())
			 {			 
			 	String nombreReceta = data.getString("nombre");
				int dificultad = data.getInt("dificultad");
				float calorias = data.getInt("caloriasTotales");
				String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
				
				aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
				
				aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
				aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
				aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
				aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
				
				buscadas.add(aux);
			 }
			
				                
		 }catch (Exception e) {
			 e.printStackTrace();	 
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 } 
	 
	//Devuelve las recetas segun la lista de condiciones de un perfil usuario.
	 public HashSet<Receta> recetaSegunCondicion(ArrayList<Object> condicionPreexistente) {	
			ResultSet data=null;
			Connection cn = null;
			CallableStatement cst = null;
			Receta aux;
			Iterator<Object> iterator = condicionPreexistente.iterator();
			Object elemento;
			HashSet<Receta> recomendaciones = new HashSet<Receta>();
			try{
			cn = getConexion(dbUrl, username, password);
			while(iterator.hasNext()) {
					elemento = iterator.next();
					String condicion = elemento.getClass().toString();
					int condicion_id = obtenerIDCondicion(condicion,cn,cst);
					
					cst = cn.prepareCall("{call recetaSegunCondicion(?)}");
					cst.setInt(1,condicion_id);
					data = cst.executeQuery();
					data = cst.executeQuery();
					while(data.next()){	
						String nombreReceta = data.getString("nombre");
						int dificultad = data.getInt("dificultad");
						float calorias = data.getInt("caloriasTotales");
						String ingredientePpal = obtenerNombreIng(data.getInt("ingrediente_ppal_id"),cn);
						
						aux = new Receta(nombreReceta, ingredientePpal, dificultad,calorias,"",null);
						
						aux.setCategorias(obtenerCategoriasReceta(nombreReceta));
						aux.setTemporada(obtenerTemporadasReceta(nombreReceta));
						aux.setAptaPara(obtenerCondicionesReceta(nombreReceta));
						aux.setDietasAptas(obtenerDietasReceta(nombreReceta));
						recomendaciones.add(aux);	
					}		
				}
			 }catch (Exception e) {
				 e.printStackTrace();
			}finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
			return recomendaciones;
		}

		 
		 
	 //devuelve la porcion, calorias y nivel_id(el cual se puede convertir a string via la func aux)
	 public Ingrediente mostrarDatosIngrediente(String nombre) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 Ingrediente ingredienteBuscado= null;		 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call mostrarDatosIng(?)}");
			 cst.setString(1,nombre);
			 data = cst.executeQuery();
			 data.next();
			 int porcion = data.getInt("porcion");
			 int calorias = data.getInt("calorias");
			 String nivel = obtenerNombreNivelAlim(data.getInt("nivel_id"),cn);
			 ingredienteBuscado = new Ingrediente(nombre,porcion,calorias,nivel);        
			 
			}catch (Exception e) {
			 e.printStackTrace();	 
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return ingredienteBuscado;
	 }
	 
	 //Devuelve los pasos/procedimiento de una receta.
	 public ArrayList<PasoDeReceta> procedimientoDeReceta(String nombreReceta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		
		 ArrayList<PasoDeReceta> buscadas = new ArrayList<PasoDeReceta>();
		 PasoDeReceta aux;
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call mostrarProcedimientoReceta(?)}");
			 cst.setString(1,nombreReceta);
			 data = cst.executeQuery();
			
			 data.next();
			 String imagen1 = data.getString("imagen1");
			 String paso1 = data.getString("paso1");
			 aux = new PasoDeReceta(paso1,imagen1);
			 buscadas.add(aux);
			 String imagen2 = data.getString("imagen2");
			 String paso2 = data.getString("paso2");
			 aux = new PasoDeReceta(paso2,imagen2);
			 buscadas.add(aux);
			 String imagen3 = data.getString("imagen3");
			 String paso3 = data.getString("paso3");
			 aux = new PasoDeReceta(paso3,imagen3);
			 buscadas.add(aux);
			 String imagen4 = data.getString("imagen4");
			 String paso4 = data.getString("paso4");
			 aux = new PasoDeReceta(paso4,imagen4);
			 buscadas.add(aux);
			 String imagen5 = data.getString("imagen5");
			 String paso5 = data.getString("paso5");
			 aux = new PasoDeReceta(paso5,imagen5);
			 buscadas.add(aux);
		 
							                
		 }catch (Exception e) {
			 e.printStackTrace();	 
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return buscadas;
	 }  
	 
	 //devuelve el promedio de las calificaciones a una receta.
	 public float obtenerCalificacionReceta(String nombreReceta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 float resultado= 0;
		 	 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call obtenerCalificacionRecetaBeta(?,?)}");
			 cst.setString(1,nombreReceta);
			 cst.registerOutParameter("promedio",java.sql.Types.FLOAT );
			 data = cst.executeQuery();
			 if(data.next())
				 resultado = data.getFloat("promedio");
			
		 }catch (Exception e) {
			 e.printStackTrace();	 
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return resultado;
	 }
	 
	 //devuelve la calificacion hecha por un usuario a una receta.
	 public float obtenerCalificacionRecetaUsuario(String nombreUsuario,String nombreReceta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 float resultado = 5;
		 	 		 
		 try {
			 cn = getConexion(dbUrl, username, password);
				 
			 cst = cn.prepareCall("{call obtenerCalificacionRecetaUsuario(?,?,?)}");
			 cst.setString(1,nombreUsuario);
			 cst.setString(2,nombreReceta);
			 cst.registerOutParameter("calificacion",java.sql.Types.FLOAT );
			 data = cst.executeQuery();
			 data.next();
			 resultado = data.getFloat("calificacion");
			
		 }catch (Exception e) {
			 e.printStackTrace();	 
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return resultado;
	 }
	 
	 //Dado el usuario, receta yla operacion(cargar,consultar,calificar,confirmar) devuelve la fecha en q lo hizo.
	 public java.sql.Timestamp consultarEventoEnHistorial(String nombreUsuario,String nombreReceta,String operacion) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 java.sql.Timestamp fecha = null;		 
		 try {
			 cn = getConexion(dbUrl, username, password);
			 
			 cst = cn.prepareCall("{call consultarEventoEnHistorial(?,?,?)}");
			 cst.setString(1,nombreUsuario);
			 cst.setString(2,nombreReceta);
			 cst.setString(3,operacion);
			 data = cst.executeQuery();
			 data.next();
			 fecha = data.getTimestamp("tiempo");
			
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return fecha;
	 }  
	 
	 //Devuelve las recetas mas consultadas por sexo en un periodo.
	 public ArrayList<String> estadisticaSegunSexo(String sexo,java.sql.Timestamp fecha1,java.sql.Timestamp fecha2) {
		 	ResultSet data=null;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	ArrayList<String> lista = new ArrayList<String>();
		 
		 	try {
		 		cn = getConexion(dbUrl, username, password);
	           		 		       	 
		 		cst = cn.prepareCall("{call estadisticaSegunSexo(?,?,?)}");
		 		cst.setString(1,sexo);
		 		cst.setTimestamp(2,fecha1);
		 		cst.setTimestamp(3,fecha2);
		 		data = cst.executeQuery();
		 		while (data.next())
		 		{
		 			lista.add(data.getString("nombre"));
		 			lista.add(""+data.getInt("count"));
	            	
		 		}      
	             
	        	                          
	            
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return lista;
	 }  
	 
	 //Devuelve las recetas mas consultadas segun la dificultad dentro de un periodo.
	 public ArrayList<String> estadisticaRecetaDificultad(java.sql.Timestamp fecha1,java.sql.Timestamp fecha2) {
		 	ResultSet data=null;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	ArrayList<String> lista = new ArrayList<String>();
		 
		 	try {
		 		cn = getConexion(dbUrl, username, password);
	           		 		       	 
		 		cst = cn.prepareCall("{call estadisticaRecetaDificultad(?,?)}");
		 		cst.setTimestamp(1,fecha1);
		 		cst.setTimestamp(2,fecha2);
		 		data = cst.executeQuery();
		 		while (data.next())
		 		{
		 			lista.add(data.getString("nombre"));
		 			lista.add(""+data.getInt("dificultad"));
		 			lista.add(""+data.getInt("count"));
	            	
		 		}      
	             
		 			                          
	            
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return lista;
	 }  
	 
	 //Devuelve las recetas mas consultadas en un periodo.
	 public ArrayList<String> estadisticaRankingRecetaConsultada(java.sql.Timestamp fecha1,java.sql.Timestamp fecha2) {
		 	ResultSet data=null;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	ArrayList<String> lista = new ArrayList<String>();
		 
		 	try {
		 		cn = getConexion(dbUrl, username, password);
	           		 		       	 
		 		cst = cn.prepareCall("{call estadisticaRankingRecetaConsultada(?,?)}");
		 		cst.setTimestamp(1,fecha1);
		 		cst.setTimestamp(2,fecha2);
		 		data = cst.executeQuery();
		 		while (data.next())
		 		{
		 			lista.add(data.getString("nombre"));
		 			lista.add(""+data.getInt("count"));
	            	
		 		}      
	             
		 	                         
	            
	        }catch (Exception e) {
	        	 e.printStackTrace();
	        } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return lista;
	 }  
	 
	 //Devuelve todas las categorias de una receta.
	 public HashSet<String> obtenerCategoriasReceta(String nombreReceta ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<String> nombresCategorias = new HashSet<String>();
		 String nombreCategoria;
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	           
			 cst = cn.prepareCall("{call obtenerCategoriaReceta(?)}");
			 cst.setString(1,nombreReceta);
			 data = cst.executeQuery();
			 while(data.next())
			 {			 
				 nombreCategoria = data.getString("nombre");
				 nombresCategorias.add(nombreCategoria);		
			 }           
			
			            
		 }catch (Exception e) {
			 e.printStackTrace();        	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return nombresCategorias;
	 }
	 
	 //Devuelve todas las condiciones de una receta.
	 public HashSet<String> obtenerCondicionesReceta(String nombreReceta ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<String> nombres = new HashSet<String>();
		 String nombre;
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	           
			 cst = cn.prepareCall("{call obtenerCondicionReceta(?)}");
			 cst.setString(1,nombreReceta);
			 data = cst.executeQuery();
			 while(data.next())
			 {			 
				 nombre = data.getString("tipo");
				 nombres.add(nombre);		
			 }           
			
		 }catch (Exception e) {
			 e.printStackTrace();       	
		 } finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }return nombres;
	 }
	
	 //Devuelve todas las dietas de una receta.
	 public HashSet<String> obtenerDietasReceta(String nombreReceta ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 HashSet<String> nombres = new HashSet<String>();
		 String nombre;
		 try {
			 cn = getConexion(dbUrl, username, password);
			           	           
			 cst = cn.prepareCall("{call obtenerDietaReceta(?)}");
			 cst.setString(1,nombreReceta);
			 data = cst.executeQuery();
			 while(data.next())
			 {			 
				 nombre = data.getString("tipo");
				 nombres.add(nombre);		
			 }           
			
		 }catch (Exception e) {
			 e.printStackTrace();       	
		 }finally {
	        	try { data.close(); } catch (Exception e) {  }
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        } return nombres;
	 }
	 
	//Devuelve todas las dietas de una receta.
		 public HashSet<String> obtenerTemporadasReceta(String nombreReceta ) {
			 ResultSet data=null;
			 Connection cn = null;
			 CallableStatement cst = null;
			 HashSet<String> nombres = new HashSet<String>();
			 String nombre;
			 try {
				 cn = getConexion(dbUrl, username, password);
				           	           
				 cst = cn.prepareCall("{call obtenerTemporadaReceta(?)}");
				 cst.setString(1,nombreReceta);
				 data = cst.executeQuery();
				 while(data.next())
				 {			 
					 nombre = data.getString("tipo");
					 nombres.add(nombre);		
				 }           
				 
				            
			 }catch (Exception e) {
				        	
			 }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        	try { cst.close(); } catch (Exception e) { }
		            try { cn.close(); } catch (Exception e) {  }
		        } return nombres;
		 }
		 
		 public ArrayList<Object> obtenerCondicionesPerfil(String nombreUsuario ) {
			 ResultSet data=null;
			 Connection cn = null;
			 CallableStatement cst = null;
			 int perfil;
			 ArrayList<Object> nombresCondiciones = new ArrayList<Object>();
			 String nombreCondicion;
			 try {
				 cn = getConexion(dbUrl, username, password);
				 
				 perfil = obtenerIDPerfil(nombreUsuario, cn, cst);
				 cst = cn.prepareCall("{call obtenerCondicionPerfil(?)}");
				 cst.setInt(1,perfil);
				 data = cst.executeQuery();
				 while(data.next())
				 {			 
					 nombreCondicion = data.getString("tipo");
					 if(nombreCondicion.equals("Diabetes")){
						 Diabetes diabetes = new Diabetes();
						 nombresCondiciones.add(diabetes);	
					 }
					 if(nombreCondicion.equals("Celiasis")){
						 Celiasis celiasis = new Celiasis();
						 nombresCondiciones.add(celiasis);	
					 }
					 if(nombreCondicion.equals("Hipertension")){
						 Hipertension hiper = new Hipertension();
						 nombresCondiciones.add(hiper);	
					 }
				 }           
				
				            
			 }catch (Exception e) {
				 e.printStackTrace();        	
			 } finally {
		        	try { data.close(); } catch (Exception e) {  }
		        	try { cst.close(); } catch (Exception e) { }
		            try { cn.close(); } catch (Exception e) {  }
		        }return nombresCondiciones;
		 }
		 
		 public HashSet<String> obtenerPreferenciasPerfil(String nombreUsuario ) {
			 ResultSet data=null;
			 Connection cn = null;
			 CallableStatement cst = null;
			 int perfil;
			 HashSet<String> nombresCondiciones = new HashSet<String>();
			 String nombreCondicion;
			 try {
				 cn = getConexion(dbUrl, username, password);
				 
				 perfil = obtenerIDPerfil(nombreUsuario, cn, cst);
				 cst = cn.prepareCall("{call obtenerPreferenciaPerfil(?)}");
				 cst.setInt(1,perfil);
				 data = cst.executeQuery();
				 while(data.next())
				 {			 
					 nombreCondicion = data.getString("nombre");
					 nombresCondiciones.add(nombreCondicion);		
				 }           
				
				            
			 }catch (Exception e) {
				 e.printStackTrace();        	
			 } finally {
		        	try { data.close(); } catch (Exception e) {  }
		        	try { cst.close(); } catch (Exception e) { }
		            try { cn.close(); } catch (Exception e) {  }
		        }return nombresCondiciones;
		 }
		 
	 
	
				
//*********************Funciones UPDATE***********************************

	 //dado un usuario permite modificar el perfil
	 public void actualizarPerfil(String usuario,String nombre,String apellido,String sexo,int edad,double altura,String complexion,String dieta,String rutina/*,String condicion*/) {
		 int usu,diet,routine;
		 Connection cn = null;
		 CallableStatement cst = null;
		 try {
			 cn = getConexion(dbUrl, username, password);
		        	 
			 usu = obtenerIDUsuario(usuario, cn, cst);
			 diet = obtenerIDDieta(dieta, cn, cst);
			 routine = obtenerIDRutina(rutina, cn, cst);
			 
		           	           
			 cst = cn.prepareCall("{call modificarPerfilUsuario(?,?,?,?,?,?,?,?,?)}");
			 cst.setString(1,nombre);
			 cst.setString(2,apellido);
			 cst.setString(3,sexo);
			 cst.setInt(4,edad);
			 cst.setDouble(5,altura);
			 cst.setString(6,complexion);
			 cst.setInt(7,diet);
			 cst.setInt(8,routine);
			 cst.setInt(9,usu);
			 cst.executeUpdate();
		    
			 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally {
	        	try { cst.close(); } catch (Exception e) { }
	            try { cn.close(); } catch (Exception e) {  }
	        }
		        
		 return;
	 }		 
		    
//********************* Funciones Auxiliares******************************		  

		 private int obtenerIDTemporada(String temporada,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDSeason(?)}");
			 cst.setString(1,temporada);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("temporada_id"); 
			 }catch(Exception e) {
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCategoria(String cat,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCategoria(?)}");
			 cst.setString(1,cat);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("categorias_id"); 
			 }catch(Exception e) {
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCondicion(String cond,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCondicion(?)}");
			 cst.setString(1,cond);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("condicion_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDDieta(String dieta,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDDieta(?)}");
			 cst.setString(1,dieta);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("dieta_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDAlimenticio(String nivel,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDAlimenticio(?)}");
			 cst.setString(1,nivel);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("nivel_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDUsuario(String usu,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDUsuario(?)}");
			 cst.setString(1,usu);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("usuario_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDRutina(String rutina,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDRutina(?)}");
			 cst.setString(1,rutina);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("rutina_id"); 
			 }catch(Exception e) {
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDIng(String ing,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDIng(?)}");
			 cst.setString(1,ing);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("ingredientes_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDReceta(String rec,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDReceta(?)}");
			 cst.setString(1,rec);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("recetas_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCondimento(String rec,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCondimento(?)}");
			 cst.setString(1,rec);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("condimentos_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDProcedimiento(String im,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDProcedimiento(?)}");
			 cst.setString(1,im);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("procedimientos_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDPerfil(String nombreUsuario,Connection cn,CallableStatement cst){
			 ResultSet data=null;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDPerfil(?)}");
			 cst.setString(1,nombreUsuario);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("perfil_id"); 
			 }catch(Exception e) { 
				 e.printStackTrace();
		        }finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreIng(int ing,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreIng(?)}");
				 cst.setInt(1,ing);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("nombre");
			 	}catch(Exception e) { 
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreTemporada(int tempo,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreTemporada(?)}");
				 cst.setInt(1,tempo);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) { 
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreCategoria(int cate,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreCategoria(?)}");
				 cst.setInt(1,cate);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) { 
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreCondicion(int cond,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreCondicion(?)}");
				 cst.setInt(1,cond);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreDieta(int dieta,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreDieta(?)}");
				 cst.setInt(1,dieta);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreNivelAlim(int nivel,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreNivelAlim(?)}");
				 cst.setInt(1,nivel);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {  
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		
		 
		 public String obtenerNombreRutina(int rutina,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreRutina(?)}");
				 cst.setInt(1,rutina);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("tipo"); 
			 	}catch(Exception e) { 
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreUsuario(int usu,Connection cn){
			 ResultSet data=null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cst = cn.prepareCall("{call obtenerNombreUsuario(?)}");
				 cst.setInt(1,usu);
				 data = cst.executeQuery();
				 if(data.next())
					 resultado = data.getString("nombreUsuario"); 
			 	}catch(Exception e) { 
			 		 e.printStackTrace();
			 	}finally {
		        	try { data.close(); } catch (Exception e) {  }
		        }
			 return resultado;
		 }
		
		 
		 //devuelve la fecha de consulta de un usuario
		 public  java.sql.Timestamp fechaActual(){
			Calendar calendar = Calendar.getInstance();
		  	java.util.Date now = calendar.getTime();
		   java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
		return currentTimestamp;
		}
		 
	
	
		 
	public void desconectar()
    {
        try {
            miConexion.close();
            } catch (Exception e) {
        }
    }
	

	

}