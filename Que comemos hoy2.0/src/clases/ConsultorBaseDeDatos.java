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
	
	//Inserta un Usuario y lo muestra
	 public void insertarUsuario(String nombre,String mail,String pass, int dia,int mes,int anio) {
		 	ResultSet data;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	           
	             cst = cn.prepareCall("{call insertarUsuario(?,?,?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setString(2,mail);
	             cst.setString(3,pass);
	             cst.setInt(4,dia);
	             cst.setInt(5,mes);
	             cst.setInt(6,anio);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call test(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             if (data != null) 
	             {
	            	 System.out.println(" usuario_id      nombreUsuario      email      contrasenia      dia      mes      anio");
	                 System.out.println("----------------------------------------------------------------");
	                 while (data.next())
	                	{
	                    System.out.println(""+data.getInt("usuario_id")+"    "+data.getString("nombreUsuario")+"    "+data.getString("email")+"    "+data.getString("contrasenia")+"    "+data.getInt("dia")+"    "+data.getInt("mes")+"    "+data.getInt("anio"));
	                	}                 
	                
	             }else{System.out.println("No existe usuario con ese nombre");}
	            
	        }catch (Exception e) {
	        	
	        }
	 }  
	
	public ResultSet consultarUsuario(String nombre) {
	 	ResultSet data=null;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call test(?)}");
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
           	           
             cst = cn.prepareCall("{call testReceta(?)}");
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
	
	public void insertarReceta(String nombre,String ingrediente,int dificultad,String temporada,String cat1,String cat2,String cat3,String cat4,int calorias, String creador,int dia,int mes,int anio) {
	 	ResultSet data;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call insertarReceta(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
             cst.setString(1,nombre);
             cst.setString(2,ingrediente);
             cst.setInt(3,dificultad);
             cst.setString(4,temporada);
             cst.setString(5,cat1);
             cst.setString(6,cat2);
             cst.setString(7,cat3);
             cst.setString(8,cat4);
             cst.setInt(9,calorias);
             cst.setString(10,creador);
             cst.setInt(11,dia);
             cst.setInt(12,mes);
             cst.setInt(13,anio);
             cst.executeUpdate();
             cst = cn.prepareCall("{call testReceta(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
             if (data != null) 
             {
            	 System.out.println(" recetas_id      nombre      ingrediente      dificultad      temporada      categoria1      categoria2      categoria3      categoria4      calorias      creador      dia      mes      anio");
                 System.out.println("-----------------------------------------------------------");
                 while (data.next())
                	{
                    System.out.println(""+data.getInt("recetas_id")+"    "+data.getString("nombre")+"    "+data.getString("ingrediente_ppal")+"    "+data.getInt("dificultad")+"    "+data.getString("temporada")+"    "+data.getString("categoria1")+"    "+data.getString("categoria2")+"    "+data.getString("categoria3")+"    "+data.getString("categoria4")+"    "+data.getInt("caloriasTotales")+"    "+data.getString("creador")+"    "+data.getInt("dia")+"    "+data.getInt("mes")+"    "+data.getInt("anio"));
                	}                 
                
             }else{System.out.println("No existe receta con ese nombre");}
            
        }catch (Exception e) {
        	
        }
 }  
 
	//devuelve los ingredientes y cant de una receta en un Set
		 public Set obtenerIngyCant(String nombre) {
			 	ResultSet data2=null;
			 	ResultSet data3=null;
			 	Connection cn = null;
			 	CallableStatement cst = null;
			 	CallableStatement cst2 = null;
			 	Set<String> lista = new HashSet<>();
			 	int nombre_id,ing_id;
			 	try {
		        	 cn = getConexion("disenio", "root", "");
		           	           
		             cst = cn.prepareCall("{call obtenerIDReceta(?)}");
		             cst.setString(1,nombre);
		             data2 = cst.executeQuery();
		             cst = null;
		             if (data2 != null) 
		             {
		            	data2.next();
		            	nombre_id = data2.getInt("recetas_id");
		            	data2.close();
		            	//System.out.println(" "+nombre_id);
		                cst = cn.prepareCall("{call obtenerIDIng(?)}");
		                cst.setInt(1,nombre_id);
		                data2 = cst.executeQuery();
		                
		                cst = null;
		                data2.next();
		                while (data2 != null)
	                	{
		                	ing_id = data2.getInt("ingredientes_id");
		                	//System.out.println(" "+ing_id);
		                	cst2 = cn.prepareCall("{call obtenerIng(?)}");
		                	cst2.setInt(1,ing_id);
			                data3 = cst2.executeQuery();
			                data3.next();
			                lista.add(data3.getString("nombre"));
			                lista.add(""+data2.getInt("cantidad"));
			                //System.out.println(" "+data3.getString("nombre")+"    " +data2.getInt("cantidad"));
			                data2.next();
	                	}               
		                
		             }else{System.out.println("No existe receta con ese nombre");}
		                
		            
		        }catch (Exception e) {
		        	//System.out.println("Error");
		        } return lista;
		 }  
		 

		//Inserta la consulta de un usuario el parametro fecha debe usarse con la funcion fechaActual
		 public void insertarConsultaUsuario(String usuario,String receta,java.sql.Timestamp fecha) {
			 	ResultSet data;
			 	
			 	Connection cn = null;
			 	CallableStatement cst = null;
		        try {
		        	 cn = getConexion("disenio", "root", "");
		           	           
		             cst = cn.prepareCall("{call obtenerIDUsuario(?)}");
		             cst.setString(1,usuario);
		             data=cst.executeQuery();
		             data.next();
		             int id_usuario = data.getInt("usuario_id");
		             data.close();
		             cst = cn.prepareCall("{call obtenerIDReceta(?)}");
		             cst.setString(1,receta);
		             data = cst.executeQuery();
		             data.next();
		             int id_receta = data.getInt("recetas_id");
		             
		             cst = cn.prepareCall("{call insertarConsulta(?,?,?)}");
		             cst.setTimestamp(1,fecha);
		             cst.setInt(2,id_usuario);
		             cst.setInt(3,id_receta);
		             cst.executeUpdate();
		                    
		             System.out.println(" usuario_id      recetas_id");
		             System.out.println("--------------------------------");
		                       	
		             System.out.println(""+id_usuario+"    "+id_receta);
		                	               
		        }catch (Exception e) {  
		        	
		        }
		 }  	          
		    
		  

		//devuelve la fecha de consulta de un usuario
		 public  java.sql.Timestamp fechaActual(){
			Calendar calendar = Calendar.getInstance();
		  	java.util.Date now = calendar.getTime();
		   java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
		return currentTimestamp;
		}
		 
		 //devuelve los condimentos de una receta en un Set
		 public Set obtenerCondimentos(String nombre) {
			 	ResultSet data2=null;
			 	ResultSet data3=null;
			 	Connection cn = null;
			 	CallableStatement cst = null;
			 	CallableStatement cst2 = null;
			 	Set<String> list = new HashSet<>();
			 	int receta_id,condimento_id;
			 	try {
		        	 cn = getConexion("disenio", "root", "");
		           	           
		             cst = cn.prepareCall("{call obtenerIDReceta(?)}");
		             cst.setString(1,nombre);
		             data2 = cst.executeQuery();
		             cst = null;
		             if (data2 != null) 
		             {
		            	data2.next();
		            	receta_id = data2.getInt("recetas_id");
		            	data2.close();
		            	cst = cn.prepareCall("{call obtenerIDCondimentos(?)}");
		                cst.setInt(1,receta_id);
		                data2 = cst.executeQuery();
		                
		                cst = null;
		                data2.next();
		                while (data2 != null)
	                	{
		                	condimento_id = data2.getInt("condimentos_id");
		                	cst2 = cn.prepareCall("{call obtenerCondimentos(?)}");
		                	cst2.setInt(1,condimento_id);
			                data3 = cst2.executeQuery();
			                data3.next();
			                list.add(data3.getString("nombre"));
			                data2.next();
	                	}               
		                
		             }else{System.out.println("No existe receta con ese nombre");}
		                
		            
		        }catch (Exception e) {
		        	//System.out.println("Error");
		        } return list;
		 }  
    
	
		 
	public void desconectar()
    {
        try {
            miConexion.close();
            } catch (Exception e) {
        }
    }
	

	

}