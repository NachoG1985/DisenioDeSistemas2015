package clases;

public class PasoDeReceta {

	// Atributos de la clase
	private String descripcion;
	private String imagen;

	// Constructor de la clase
	public PasoDeReceta(String paso, String ruta) {
		setDescripcion(paso);
		setImagen(ruta);
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	

}
