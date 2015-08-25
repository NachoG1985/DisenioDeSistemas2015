package clases;

public class Categoria {

	// Atributos de la clase
	private String nombreCategoria;
	private int horaMax;
	private int horaMin;

	// Constructor de la clase
	public Categoria(String nombre, int max, int min) {
		nombreCategoria = nombre;
		horaMax = max;
		horaMin = min;
	}

	public String getNombreCategoria() {
		return nombreCategoria;
	}

	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}

	public int getHoraMax() {
		return horaMax;
	}

	public void setHoraMax(int horaMax) {
		this.horaMax = horaMax;
	}

	public int getHoraMin() {
		return horaMin;
	}

	public void setHoraMin(int horaMin) {
		this.horaMin = horaMin;
	}

}
