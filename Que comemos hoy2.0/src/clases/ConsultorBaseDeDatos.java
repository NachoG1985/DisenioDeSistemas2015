package clases;

import java.sql.*;

import java.util.*;





public class ConsultorBaseDeDatos {

	// Atributos de la clase
	private static String rutaBaseDeDatos;
	private  static ConsultorBaseDeDatos instance;
	private Connection miConexion;
	
	
	
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
            String BaseDeDatos = "jdbc:mysql://localhost/test?user=usuario&password=123";
            setConexion(DriverManager.getConnection(BaseDeDatos));
            if(getConexion("disenio", "root", "") != null){
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
	private Connection getConexion(String BD, String usuario, String contraseña)
	{
        try {
            //llamar a la clase o driver de jdbc
            Class.forName("com.mysql.jdbc.Driver");
            //String servidor = "jdbc:mysql://localhost:3306/" + BD;
            String servidor = "jdbc:mysql://localhost/" + BD ;
            
            miConexion = DriverManager.getConnection(servidor,usuario,contraseña);
        } 
        catch (ClassNotFoundException e)
        {
            System.err.println("No se encontro Driver");
            miConexion = null;
        }
        catch(SQLException ex)
        {
            System.err.println("No se pudo conectar a la base de datos");
            miConexion = null;
        }
        
        return miConexion;
    }

	//Metodo que ejecuta las sentencias INSERT, UPDATE, DELETE, y devuelve true o false en caso de exito o fallo
	public boolean ejecutar(String sql)
	{
        try {
            Statement sentencia = getConexion("disenio", "root", "").createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
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
            Statement sentencia = getConexion("disenio", "root", "").createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }        return resultado;
    }
	

//******************* Funciones Insert*************************
	
	 public int insertarUsuario(String nombre,String mail,String pass,java.sql.Date fecha) {
		 	ResultSet data;
		 	int resultado=0;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	           
	             cst = cn.prepareCall("{call insertarUsuario(?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setString(2,mail);
	             cst.setString(3,pass);
	             cst.setDate(4,fecha);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDUsuario(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             data.next();
	             resultado=data.getInt("usuario_id");
	                                  
	            
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }
	        
	        return resultado;
	 }  
	 
	 
	 public int insertarReceta(String nombre,String ingrediente,int dificultad,String temporada,String cat,double calorias,String condicion,String dieta,String imagen1) {
		 	ResultSet data;
		 	int resultado=0;
		 	int temp,ing,categ,cond,diet,im1;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	        	 
	           	 temp = obtenerIDTemporada(temporada, cn, cst);
	           	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 categ = obtenerIDCategoria(cat, cn, cst); 
	           	 cond = obtenerIDCondicion(condicion, cn, cst);
	           	 diet = obtenerIDDieta(dieta, cn, cst);
	           	 im1 = obtenerIDProcedimiento(imagen1, cn, cst);
	           	 
	           	 
	             cst = cn.prepareCall("{call insertarReceta(?,?,?,?,?,?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,ing);
	             cst.setInt(3,dificultad);
	             cst.setInt(4,temp);
	             cst.setInt(5,categ);
	             cst.setDouble(6,calorias);
	             cst.setInt(7,cond);
	             cst.setInt(8,diet);
	             cst.setInt(9,im1);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDReceta(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("recetas_id");         
	                
	                         
	        }catch (Exception e) {	        	
	        }
	        
	        return resultado;
	 }  
	
	 
	 public int insertarIngrediente(String nombre,int porcion,double calorias,String nivel) {
		 	ResultSet data;
		 	int resultado=0;
		 	int level; 
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 level= obtenerIDAlimenticio(nivel, cn, cst);
	             cst = cn.prepareCall("{call insertarIngrediente(?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,porcion);
	             cst.setDouble(3,calorias);
	             cst.setInt(4,level);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDIng(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("ingredientes_id");         
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 public int insertarCondimento(String nombre) {
		 	ResultSet data;
		 	int resultado=0;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	           
	             cst = cn.prepareCall("{call insertarCondimento(?)}");
	             cst.setString(1,nombre);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDCondimento(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("condimentos_id");         
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 
	 public int insertarPerfil(String usuario,String nombre,String apellido,String sexo,int edad,double altura,String complexion,String dieta,String rutina,String condicion) {
		 	ResultSet data;
		 	int resultado=0;
		 	int usu,diet,routine,cond;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	        	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 diet = obtenerIDDieta(dieta, cn, cst);
	        	 routine = obtenerIDRutina(rutina, cn, cst);
	        	 cond = obtenerIDCondicion(condicion, cn, cst);
	           	           
	             cst = cn.prepareCall("{call insertarPerfil(?,?,?,?,?,?,?,?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setString(2,nombre);
	             cst.setString(3,apellido);
	             cst.setString(4,sexo);
	             cst.setInt(5,edad);
	             cst.setDouble(6,altura);
	             cst.setString(7,complexion);
	             cst.setInt(8,diet);
	             cst.setInt(9,routine);
	             cst.setInt(10,cond);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDPerfil(?,?)}");
	             cst.setString(1,nombre);
	             cst.setString(2,apellido);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("perfil_id");         
	                
	                         
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }
	        
	        return resultado;
	 }  
	 
	 public int insertarCondimentoReceta(String receta,String condimento) {
		 	ResultSet data;
		 	int resultado=0;
		 	int cond, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 cond = obtenerIDCondimento(condimento, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarCondReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,cond);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDCondReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,cond);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("condim_recet_id");         
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 public int insertarIngReceta(String receta,String ingrediente,int cantidad) {
		 	ResultSet data;
		 	int resultado=0;
		 	int ing, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarIngReceta(?,?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,ing);
	             cst.setInt(3,cantidad);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDIngReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,ing);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("ingred_recet_id");         
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 public int insertarRecUsuario(String usuario,String receta) {
		 	ResultSet data;
		 	int resultado=0;
		 	int usu, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarRecUsuario(?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDRecUsuario(?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("recet_usuario_id");         
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 public void insertarEventoEnHistorial(String usuario,String receta,String operacion) {
		 	int usu, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 usu = obtenerIDUsuario(usuario, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarEventoEnHistorial(?,?,?)}");
	             cst.setInt(1,usu);
	             cst.setInt(2,rec);
	             cst.setString(3,operacion);
	             cst.executeUpdate();
	               
	                
	                         
	        }catch (Exception e) {
	        	
	        }
	        
	 } 
	 
	 public void insertarProcedimiento(String im1,java.lang.String pas1,String im2,java.lang.String pas2,String im3,java.lang.String pas3,String im4,java.lang.String pas4,String im5,java.lang.String pas5) {
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	           
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
	        }
	        
	        return ;
	 }  
	 
	 
	 
//****************Funciones de Consulta**************************
//Devuelve todos los datos de un usuario	
	 public ResultSet consultarUsuario(String nombre) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call consultaUsuario(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
            
            
        }catch (Exception e) {
        	System.out.println("Error");
        } return data;
 }  
	
	
	 public ResultSet consultarReceta(String nombre) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call consultaReceta(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
            
        }catch (Exception e) {
        	System.out.println("Error");
        } return data;
 }  
	
	public ResultSet mostrarRecetasDB( ) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call mostrarRecetasDB()}");
             data = cst.executeQuery();
            
            
        }catch (Exception e) {
        	System.out.println("Error");
        } return data;
 }  
	
	
 
	//devuelve los ingredientes y cant de una receta en un Set
	 public Set<String> obtenerIngyCant(String nombre) {
		 	ResultSet data=null;
		 	Connection cn = null;
		 	CallableStatement cst = null;
		 	Set<String> lista = new HashSet<>();
		 	int rec;
		 	try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 rec = obtenerIDReceta(nombre, cn, cst);
	        	 
	             cst = cn.prepareCall("{call ingYCantSegunReceta(?)}");
	             cst.setInt(1,rec);
	             data = cst.executeQuery();
	             data.next();
	             while (data != null)
	             {
	            	  	 		                	
	            	 lista.add(data.getString("nombre"));
	            	 lista.add(""+data.getInt("cantidad"));
	            	 data.next();
	             }               
	                          
	            
	        }catch (Exception e) {
	        	
	        } return lista;
	 }  
		 
		 //devuelve los condimentos de una receta en un Set
	 public Set<String> obtenerCondimentos(String nombre) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 Set<String> lista = new HashSet<>();
		 int rec;
		 try {
			 cn = getConexion("disenio", "root", "");
	           	 
			 rec = obtenerIDReceta(nombre, cn, cst);
	        	 
			 cst = cn.prepareCall("{call condSegunReceta(?)}");
			 cst.setInt(1,rec);
			 data = cst.executeQuery();
			 data.next();
			 while (data != null)
			 {
	            	   	 		                	
				 lista.add(data.getString("nombre"));
				 data.next();
			 }               
	                          
	            
		 }catch (Exception e) {
	        	
		 } return lista;
	 }  

	//devuelve las recetas segun condimento dado 
	 public ResultSet recetaSegunCond(String condim) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
			 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			 
			 cst = cn.prepareCall("{call recetaSegunCondimento(?)}");
			 cst.setString(1,condim);
			 data = cst.executeQuery();
		                           
		                
		 }catch (Exception e) {
		        	
		 } return data;
	 }  
		 
	 //devuelve las recetas segun dieta dada 
	 public ResultSet recetaSegunDieta(String dieta) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			 
			 cst = cn.prepareCall("{call recetaSegunDieta(?)}");
			 cst.setString(1,dieta);
			 data = cst.executeQuery();
			             
			                
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
			 
	 //devuelve las recetas segun dieta dada 
	 public ResultSet recetaSegunNivelAlimenticio(String nivel) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			           	   	      	 
			 cst = cn.prepareCall("{call recetaSegunNivelAlimenticio(?)}");
			 cst.setString(1,nivel);
			 data = cst.executeQuery();
			                           
			                
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
			 
	 //devuelve las recetas segun los gustos del usuario dado 
	 public ResultSet recetaSegunPreferencia(String nombreUsuario) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 int usu;	 
		 try {
			 cn = getConexion("disenio", "root", "");
			 usu = obtenerIDUsuario(nombreUsuario, cn, cst);  	      	 
			 cst = cn.prepareCall("{call recetaSegunPreferencia(?)}");
			 cst.setInt(1,usu);
			 data = cst.executeQuery();
			                           
			 
		 }catch (Exception e) {
			        	
		 } return data;
	 } 
			 
	 //devuelve las recetas segun ing ppal dado 
	 public ResultSet recetaSegunIngPpal(String ingrediente) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			 
			 cst = cn.prepareCall("{call recetaSegunIngPpal(?)}");
			 cst.setString(1,ingrediente);
			 data = cst.executeQuery();
			                       
			                
		 }catch (Exception e) {
			 
		 } return data;
	 }  
			 
	 public ResultSet recetaSegunDificultad(int dificultad) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			           	  	      	 
			 cst = cn.prepareCall("{call recetaSegunDificultad(?)}");
			 cst.setInt(1,dificultad);
			 data = cst.executeQuery();
			                           
			                
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
			 
	 //segun un rango de calorias devuelve las recetas con calorias dentro de ese rango
	 public ResultSet recetaSegunCalorias(double cal1,double cal2) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			           	  	      	 
			 cst = cn.prepareCall("{call reporteRangoCalorias(?,?)}");
			 cst.setDouble(1,cal1);
			 cst.setDouble(2,cal2);
			 data = cst.executeQuery();
			             
			                
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
			 
	//Devuelve las recetas mas consultadas dado un periodo de tiempo		 
	 public ResultSet recetaMasConsultada(java.sql.Timestamp fecha1,java.sql.Timestamp fecha2) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			           	  	      	 
			 cst = cn.prepareCall("{call recetaMasConsultada(?,?)}");
			 cst.setTimestamp(1,fecha1);
			 cst.setTimestamp(2,fecha2);
			 data = cst.executeQuery();
			                    
			             
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
		
	 // devuelve las recetas creadas por un usuario	 
	 public ResultSet recetaCreadas(String usuario) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			           	  	      	 
			 cst = cn.prepareCall("{call mostrarRecetasCreadas(?)}");
			 cst.setString(1,usuario);
			 data = cst.executeQuery();
			                    
			             
		 }catch (Exception e) {
			        	
		 } return data;
	 }

	 //devuelve todos los ing de la db
	 public ResultSet mostrarIngredientesDB( ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 try {
			 cn = getConexion("disenio", "root", "");
			           	           
			 cst = cn.prepareCall("{call listarIngredientes()}");
			 data = cst.executeQuery();
			            
			            
		 }catch (Exception e) {
			        	
		 } return data;
	 }
	
	 //devuelve todos los condimentos de la db 
	 public ResultSet mostrarCondimentosDB( ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 try {
			 cn = getConexion("disenio", "root", "");
			           	           
			 cst = cn.prepareCall("{call listarCondimentos()}");
			 data = cst.executeQuery();
			            
			            
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
	 
	 //devuelve el perfil del usuario
	 public ResultSet mostrarPerfilUsuario(String usuario ) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
		 try {
			 cn = getConexion("disenio", "root", "");
			           	           
			 cst = cn.prepareCall("{call obtenerPerfil(?)}");
			 cst.setString(1,usuario);
			 data = cst.executeQuery();
			            
			            
		 }catch (Exception e) {
			        	
		 } return data;
	 }  
	 
	//devuelve recetas con calificacion 5 dada una temporada
	 public ResultSet recetaTopTemporada(String temporada) {
		 ResultSet data=null;
		 Connection cn = null;
		 CallableStatement cst = null;
				 		 
		 try {
			 cn = getConexion("disenio", "root", "");
			 
			 cst = cn.prepareCall("{call recetaTopTemporada(?)}");
			 cst.setString(1,temporada);
			 data = cst.executeQuery();
			                       
			                
		 }catch (Exception e) {
			 
		 } return data;
	 }  
	 
	//devuelve recetas con calificacion 5 dada una temporada
		 public ResultSet recetaSegunRangoCalorias(double cal1,double cal2) {
			 ResultSet data=null;
			 Connection cn = null;
			 CallableStatement cst = null;
					 		 
			 try {
				 cn = getConexion("disenio", "root", "");
				 
				 cst = cn.prepareCall("{call reporteRangoCalorias(?,?)}");
				 cst.setDouble(1,cal1);
				 cst.setDouble(2,cal2);
				 data = cst.executeQuery();
				                       
				                
			 }catch (Exception e) {
				 
			 } return data;
		 }  
				
		
		    
//********************* Funciones Auxiliares******************************		  

		 private int obtenerIDTemporada(String temporada,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDSeason(?)}");
			 cst.setString(1,temporada);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("temporada_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCategoria(String cat,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCategoria(?)}");
			 cst.setString(1,cat);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("categorias_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCondicion(String cond,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCondicion(?)}");
			 cst.setString(1,cond);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("condicion_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDDieta(String dieta,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDDieta(?)}");
			 cst.setString(1,dieta);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("dieta_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDAlimenticio(String nivel,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDAlimenticio(?)}");
			 cst.setString(1,nivel);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("nivel_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDUsuario(String usu,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDUsuario(?)}");
			 cst.setString(1,usu);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("usuario_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDRutina(String rutina,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDRutina(?)}");
			 cst.setString(1,rutina);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("rutina_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDIng(String ing,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDIng(?)}");
			 cst.setString(1,ing);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("ingredientes_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDReceta(String rec,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDReceta(?)}");
			 cst.setString(1,rec);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("recetas_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDCondimento(String rec,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDCondimento(?)}");
			 cst.setString(1,rec);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("condimentos_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 private int obtenerIDProcedimiento(String im,Connection cn,CallableStatement cst){
			 ResultSet data;
			 int resultado = 0;
			 try{
			 cst = cn.prepareCall("{call obtenerIDProcedimiento(?)}");
			 cst.setString(1,im);
			 data = cst.executeQuery();
	         data.next();
	         resultado = data.getInt("procedimientos_id"); 
			 }catch(Exception e) {       	
		        }
			 return resultado;
		 }
		 
		 public String obtenerNombreIng(int ing){
			 ResultSet data;
			 Connection cn = null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cn = getConexion("disenio", "root", "");
				 cst = cn.prepareCall("{call obtenerNombreIng(?)}");
				 cst.setInt(1,ing);
				 data = cst.executeQuery();
				 data.next();
				 resultado = data.getString("nombre"); 
			 	}catch(Exception e) {       	
			 	}
			 return resultado;
		 }
		 
		 public String obtenerNombreTemporada(int tempo){
			 ResultSet data;
			 Connection cn = null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cn = getConexion("disenio", "root", "");
				 cst = cn.prepareCall("{call obtenerNombreTemporada(?)}");
				 cst.setInt(1,tempo);
				 data = cst.executeQuery();
				 data.next();
				 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {       	
			 	}
			 return resultado;
		 }
		 
		 public String obtenerNombreCategoria(int cate){
			 ResultSet data;
			 Connection cn = null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cn = getConexion("disenio", "root", "");
				 cst = cn.prepareCall("{call obtenerNombreCategoria(?)}");
				 cst.setInt(1,cate);
				 data = cst.executeQuery();
				 data.next();
				 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {       	
			 	}
			 return resultado;
		 }
		 
		 public String obtenerNombreCondicion(int cond){
			 ResultSet data;
			 Connection cn = null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cn = getConexion("disenio", "root", "");
				 cst = cn.prepareCall("{call obtenerNombreCondicion(?)}");
				 cst.setInt(1,cond);
				 data = cst.executeQuery();
				 data.next();
				 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {       	
			 	}
			 return resultado;
		 }
		 
		 public String obtenerNombreDieta(int dieta){
			 ResultSet data;
			 Connection cn = null;
			 CallableStatement cst = null;
			 String resultado = null;
			 try{
				 cn = getConexion("disenio", "root", "");
				 cst = cn.prepareCall("{call obtenerNombreDieta(?)}");
				 cst.setInt(1,dieta);
				 data = cst.executeQuery();
				 data.next();
				 resultado = data.getString("tipo"); 
			 	}catch(Exception e) {       	
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