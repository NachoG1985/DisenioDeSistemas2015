package entrega1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Receta {

	// Atributos de la clase
	private String nombre;
	private IngredienteEnReceta ingredientePrincipal;
	private Set<IngredienteEnReceta> ingredientes;
	private Set<Condimento> condimentos;
	private ArrayList<PasoDeReceta> procedimiento;
	private int dificultad;
	private String temporada;
	private float caloriasTotales;
	private Set<Calificacion> calificaciones;
	private Set<Categoria> categorias;

	// Cosntructor de la clase
	public Receta() {
		ingredientes = new HashSet<IngredienteEnReceta>();
		condimentos = new HashSet<Condimento>();
		procedimiento = new ArrayList<PasoDeReceta>();
		calificaciones = new HashSet<Calificacion>();
		categorias = new HashSet<Categoria>();
	}

	// Metodos de la clase
	// Calcula las calorias totales de las recetas en base a sus ingredientes
	private float calcularCalorias() {

		float calorias = 0;
		calorias = calorias + ingredientePrincipal.calcularCalorias();

		// Defino el iterador para la coleccion de ingredientes
		Iterator<IngredienteEnReceta> it = ingredientes.iterator();

		// iterar sobre los ingredientes y sumar las calorias en funcion de la
		// cantidad
		while (it.hasNext()) {
			calorias = calorias + (it.next()).calcularCalorias();
		}

		return calorias;
	}

	// Carga los datos de la receta
	public void cargarReceta() {
		// Implementar la interaccion con la pantalla de cargar receta para
		// obtener los valores de las variables

		caloriasTotales = this.calcularCalorias();
	}

}
