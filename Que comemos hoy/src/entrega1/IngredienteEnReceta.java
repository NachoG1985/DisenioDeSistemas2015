package entrega1;

public class IngredienteEnReceta {

	// Atributos de la clase
	private Ingrediente ingrediente;
	private int cantidad;

	// Constructor de la clase
	public IngredienteEnReceta(Ingrediente nuevoIngrediente, int nuevaCantidad) {
		ingrediente = nuevoIngrediente;
		cantidad = nuevaCantidad;
	}

	// Metodos de la clase
	public float calcularCalorias() {
		float calorias;

		calorias = ingrediente.calcularCaloriasPorCantidad(cantidad);

		return calorias;
	}
}
