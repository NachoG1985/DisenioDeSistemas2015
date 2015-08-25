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
		nombreIngrediente = nombre;
		porcion = tamanioPorcion;
		caloriasPorPorcion = calorias;
		nivelPiramideAlimenticia = nivelPiramide;
	}

	public float calcularCaloriasPorCantidad(int cantidad) {
		float calorias;
		calorias = (cantidad * caloriasPorPorcion) / porcion;

		return calorias;
	}

}
