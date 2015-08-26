package clases;

public class Calificacion {

	// Atributos de la clase
	private String usuario;
	private int calificacion;

	// Constructor de la clase
	public Calificacion(String nombre, int nota) {
		setUsuario(nombre);
		setCalificacion(nota);
	}
	
	public int getCalificacion() {
		return calificacion;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

}
