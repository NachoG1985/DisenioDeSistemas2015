package clases;

import java.sql.*;


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
	
	
    public void desconectar()
    {
        try {
            miConexion.close();
            } catch (Exception e) {
        }
    }
	

	

}