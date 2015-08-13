package entrega1;

public class ConsultorBaseDeDatos {

	// Atributos de la clase
	private  static PerfilUsuario instance= null;
	private String rutaBaseDeDatos;
	
	
	// Metodos de la clase
	
	// Constructor de la clase
	private ConsultorBaseDeDatos(String ruta )
		{
			rutaBaseDeDatos = ruta;					
		}

	
	public static ConsultorBaseDeDatos getInstance()
	{
		if(instance == null)  
		{
			instance = new ConsultorBaseDeDatos ;
		}
		return instance;
	}
	
	public realizarConsulta()
	{
		
	}


}