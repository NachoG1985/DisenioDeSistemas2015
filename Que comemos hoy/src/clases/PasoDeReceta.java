package clases;

public class PasoDeReceta {

	// Atributos de la clase
	private String descripcion;
	private Object imagen;

	// Constructor de la clase
	public PasoDeReceta(String descripcionNueva,Object imagenNueva) {
		setDescripcion(descripcionNueva);
		setImagen(imagenNueva);
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Object getImagen() {
		return imagen;
	}

	public void setImagen(Object imagen) {
		this.imagen = imagen;
	}
	
	

}
