package clases;

public class Calificacion {

	// Atributos de la clase
	private String usuario;
	private int calificacion;

	// Constructor de la clase
	// Constructor de la clase
	public Calificacion(String nombre, int nota) {
		setUsuario(nombre);
		setCalificacion(nota);
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public int getCalificacion() {
		return calificacion;
	}

	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}
	
	

}
