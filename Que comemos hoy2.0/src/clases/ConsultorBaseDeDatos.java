package clases;

import java.sql.*;



enum temporada { 
    Invierno,Verano,Otonio,Primavera
}


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
	public void insertarUsuario(String nombre,String mail,String fecha,String pass) {
	 	ResultSet data;
	 	Connection cn = null;
	 	CallableStatement cst = null;
        try {
        	 cn = getConexion("disenio", "root", "");
           	           
             cst = cn.prepareCall("{call insertarUsuario(?,?,?,?)}");
             cst.setString(1,nombre);
             cst.setString(2,mail);
             cst.setString(3,fecha);
             cst.setString(4,pass);
             cst.executeUpdate();
             cst = cn.prepareCall("{call test(?)}");
             cst.setString(1,nombre);
             data = cst.executeQuery();
             if (data != null) 
             {
            	 System.out.println(" usuario_id      nombreUsuario      email      fechaNac      contrasenia");
                 System.out.println("--------------------------------");
                 while (data.next())
                	{
                    System.out.println(""+data.getInt("usuario_id")+"    "+data.getString("nombreUsuario")+"    "+data.getString("email")+"    "+data.getString("fechaNac")+"    "+data.getString("contrasenia"));
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
	 public void insertarReceta(String nombre,int dificultad,temporada temporada,int calorias) {
		 	ResultSet data;
		 	Connection cn = null;
		 	CallableStatement cst = null;
	        try {
	        	 cn = getConexion("disenio", "root", "");
	           	           
	             cst = cn.prepareCall("{call insertarReceta(?,?,?,?)}");
	             cst.setString(1,nombre);
	             cst.setInt(2,dificultad);
	             cst.setString(3,temporada.name());
	             cst.setInt(4,calorias);
	             cst.executeUpdate();
	             cst = cn.prepareCall("{call test(?)}");
	             cst.setString(1,nombre);
	             data = cst.executeQuery();
	             if (data != null) 
	             {
	            	 System.out.println(" recetas_id      nombre      dificultad      temporada      calorias");
	                 System.out.println("--------------------------------");
	                 while (data.next())
	                	{
	                    System.out.println(""+data.getInt("recetas_id")+"    "+data.getString("nombre")+"    "+data.getInt("dificultad")+"    "+data.getString("temporada")+"    "+data.getInt("calorias"));
	                	}                 
	                
	             }else{System.out.println("No existe usuario con ese nombre");}
	            
	        }catch (Exception e) {
	        	
	        }
	 }  
	 
	
    public void desconectar()
    {
        try {
            miConexion.close();
            } catch (Exception e) {
        }
    }
	

	

}