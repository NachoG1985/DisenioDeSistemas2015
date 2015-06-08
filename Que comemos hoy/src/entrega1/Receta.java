package entrega1;

import java.util.ArrayList;
import java.util.Set;

public class Receta {

	// Atributos de la clase
	private IngredienteEnReceta ingredientePrincipal;
	private Set<IngredienteEnReceta> ingredientes;
	private Set<Condimento> condimentos;
	private ArrayList<PasoDeReceta> procedimiento;
	private int dificultad;
	private String temporada;
	private int caloriasTotales;
	private Set<Calificacion> calificaciones;
	private Set<Categoria> categorias;

	// Cosntructor de la clase
	public Receta() {
		// TODO Auto-generated constructor stub
	}

	// Metodos de la clase
	private void calcularCalorias() {
		// iterar sobre los ingredientes y sumar las calorias en funcion de la
		// cantidad
	}

}
