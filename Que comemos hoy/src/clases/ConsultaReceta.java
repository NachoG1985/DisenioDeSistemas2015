package clases;

public class ConsultaReceta {

	// Atributos de la clase
	private String fecha;
	

	// Constructor de la clase
	public ConsultaReceta(String fechaNueva) 
		{
			fecha = fechaNueva;
		}


	public String getFecha() {
		return fecha;
	}


	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
}