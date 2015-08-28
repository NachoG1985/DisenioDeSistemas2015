package clases;

public class Ingrediente {

	// Atributos de la clase
	private String nombreIngrediente;
	private int porcion;
	private int caloriasPorPorcion;
	private int nivelPiramideAlimenticia;

	// Constructor de la clase
	public Ingrediente(String nombre, int tamanioPorcion, int calorias,
			int nivelPiramide) {
		setNombreIngrediente(nombre);
		setPorcion(tamanioPorcion);
		setCaloriasPorPorcion(calorias);
		setNivelPiramideAlimenticia(nivelPiramide);
	}

	public float calcularCaloriasPorCantidad(int cantidad) {
		float calorias;
		calorias = (cantidad * caloriasPorPorcion) / porcion;

		return calorias;
	}

	public String getNombreIngrediente() {
		return nombreIngrediente;
	}

	public void setNombreIngrediente(String nombreIngrediente) {
		this.nombreIngrediente = nombreIngrediente;
	}

	public int getPorcion() {
		return porcion;
	}

	public void setPorcion(int porcion) {
		this.porcion = porcion;
	}

	public int getCaloriasPorPorcion() {
		return caloriasPorPorcion;
	}

	public void setCaloriasPorPorcion(int caloriasPorPorcion) {
		this.caloriasPorPorcion = caloriasPorPorcion;
	}

	public int getNivelPiramideAlimenticia() {
		return nivelPiramideAlimenticia;
	}

	public void setNivelPiramideAlimenticia(int nivelPiramideAlimenticia) {
		this.nivelPiramideAlimenticia = nivelPiramideAlimenticia;
	}
	
	

}
