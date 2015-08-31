package clases;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Receta {

	// Atributos de la clase
	private String nombre;
	private String nombreIngredientePrincipal;
	private Set<IngredienteEnReceta> ingredientes;
	private Set<Condimento> condimentos;
	private ArrayList<PasoDeReceta> procedimiento;
	private int dificultad;
	private String temporada;
	private float caloriasTotales;
	private Set<Calificacion> calificaciones;
	private Set<String> categorias;
	private String nombreCreador;
	private Fecha fechaDeCreacion;
	
	
	
	// Constructor de la clase
	public Receta(String nuevoNombre, String ingredientePrincipal, int valorDificultad, String temporadaReceta, float calorias, String creador, Fecha fecha) {
		ingredientes =  new HashSet<IngredienteEnReceta>();
		condimentos = new HashSet<Condimento>();
		procedimiento= new ArrayList<PasoDeReceta>();
		calificaciones = new HashSet<Calificacion>();
		setNombre(nuevoNombre);
		setNombreIngredientePrincipal(ingredientePrincipal);
		setDificultad(valorDificultad);
		setTemporada(temporadaReceta);
		setCaloriasTotales(calorias);
		setNombreCreador(creador);
		setFechaDeCreacion(fecha);
		}
	
	
	public void agregarCategoria(String nombreCategoria){
		categorias.add(nombreCategoria);
	}
	
	public void agregarCalificacion(Calificacion calificacionCorrespondiente){
		calificaciones.add(calificacionCorrespondiente);
	}
	
	public String getNombreCreador() {
		return nombreCreador;
	}




	public void setNombreCreador(String nombreCreador) {
		this.nombreCreador = nombreCreador;
	}




	public Fecha getFechaDeCreacion() {
		return fechaDeCreacion;
	}




	public void setFechaDeCreacion(Fecha fechaDeCreacion) {
		this.fechaDeCreacion = fechaDeCreacion;
	}




	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public IngredienteEnReceta getIngredientePrincipal() {
		return ingredientePrincipal;
	}

	public void setIngredientePrincipal(IngredienteEnReceta ingredientePrincipal) {
		this.ingredientePrincipal = ingredientePrincipal;
	}

	public Set<IngredienteEnReceta> getIngredientes() {
		return ingredientes;
	}

	public void setIngredientes(Set<IngredienteEnReceta> ingredientes) {
		this.ingredientes = ingredientes;
	}

	public Set<Condimento> getCondimentos() {
		return condimentos;
	}

	public void setCondimentos(Set<Condimento> condimentos) {
		this.condimentos = condimentos;
	}

	public ArrayList<PasoDeReceta> getProcedimiento() {
		return procedimiento;
	}

	public void setProcedimiento(ArrayList<PasoDeReceta> procedimiento) {
		this.procedimiento = procedimiento;
	}

	public int getDificultad() {
		return dificultad;
	}

	public void setDificultad(int dificultad) {
		this.dificultad = dificultad;
	}

	public String getTemporada() {
		return temporada;
	}

	public void setTemporada(String temporada) {
		this.temporada = temporada;
	}

	public float getCaloriasTotales() {
		return caloriasTotales;
	}

	public void setCaloriasTotales(float caloriasTotales) {
		this.caloriasTotales = caloriasTotales;
	}

	public Set<Calificacion> getCalificaciones() {
		return calificaciones;
	}

	public void setCalificaciones(Set<Calificacion> calificaciones) {
		this.calificaciones = calificaciones;
	}

	public Set<String> getCategorias() {
		return categorias;
	}

	public void setCategorias() {
		this.categorias = new HashSet<String>();
	}

	private IngredienteEnReceta ingredientePrincipal;
	public String getNombreIngredientePrincipal() {
		return nombreIngredientePrincipal;
	}

	public void setNombreIngredientePrincipal(String nombreIngredientePrincipal) {
		this.nombreIngredientePrincipal = nombreIngredientePrincipal;
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
