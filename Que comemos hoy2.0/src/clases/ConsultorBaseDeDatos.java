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
	private Connection getConexion(String BD, String usuario, String contraseņa)
	{
        try {
            //llamar a la clase o driver de jdbc
            Class.forName("com.mysql.jdbc.Driver");
            //String servidor = "jdbc:mysql://localhost:3306/" + BD;
            String servidor = "jdbc:mysql://localhost/" + BD ;
            
            miConexion = DriverManager.getConnection(servidor,usuario,contraseņa);
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
	             cst.setDate(3,fecha);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDUsuario(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             data.next();
	             resultado=data.getInt("usuario_id");
	                                  
	            
	        }catch (Exception e) {
	        	
	        }
	        
	        return resultado;
	 }  
	 
	 
	 public int insertarReceta(String nombre,String ingrediente,int dificultad,String temporada,String cat,double calorias,String condicion,String dieta) {
		 	ResultSet data;
		 	int resultado=0;
		 	int temp,ing,categ,cond,diet;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	        	 
	           	 temp = obtenerIDTemporada(temporada, cn, cst);
	           	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 categ = obtenerIDCategoria(cat, cn, cst); 
	           	 cond = obtenerIDCondicion(condicion, cn, cst);
	           	 diet = obtenerIDDieta(dieta, cn, cst);
	           	 
	           	 
	             cst = cn.prepareCall("{call insertarReceta(?,?,?,?,?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,ing);
	             cst.setInt(3,dificultad);
	             cst.setInt(4,temp);
	             cst.setInt(5,categ);
	             cst.setDouble(6,calorias);
	             cst.setInt(7,cond);
	             cst.setInt(8,diet);
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
	             cst.setInt(10,cond);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call obtenerIDPerfil(?,?)}");
	             cst.setString(1,nombre);
	             cst.setString(2,apellido);
	             data = cst.executeQuery();
	             data.next();
	             resultado = data.getInt("perfil_id");         
	                
	                         
	        }catch (Exception e) {
	        	
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
	 
	 public int insertarIngReceta(String receta,String ingrediente) {
		 	ResultSet data;
		 	int resultado=0;
		 	int ing, rec;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	 
	        	 ing = obtenerIDIng(ingrediente, cn, cst);
	        	 rec = obtenerIDReceta(receta, cn, cst);
	        	 
	             cst = cn.prepareCall("{call insertarIngReceta(?,?)}");
	             cst.setInt(1,rec);
	             cst.setInt(2,ing);
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
	 
	 
//****************Funciones de Consulta**************************
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
	
	
 
	//devuelve los ingredientes y cant de una receta en un Set
		 public Set<String> obtenerIngyCant(String nombre) {
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
		 
		 
		 //devuelve los condimentos de una receta en un Set
		 public Set<String> obtenerCondimentos(String nombre) {
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
			 cst = cn.prepareCall("{call obtenerIDSeason(?)}");
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