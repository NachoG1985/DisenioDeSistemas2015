package clases;

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
	private Usuario nombreCreador;
	private Fecha fechaDeCreacion;

	// Cosntructor de la clase
	public Receta(String nombreNuevo, IngredienteEnReceta nuevoIngredientePrincipal, int valorDificultad, String temporadaNueva,
			float calorias, Usuario creador, Fecha fechaNueva) {
		setNombre(nombreNuevo);
		setIngredientePrincipal(nuevoIngredientePrincipal);
		setDificultad(valorDificultad);
		setTemporada(temporadaNueva);
		setCaloriasTotales(calorias);
		setNombreCreador(creador);
		setFechaDeCreacion(fechaNueva);
		Set<IngredienteEnReceta> ingredientesReceta =  new HashSet<IngredienteEnReceta>();
		setIngredientes(ingredientesReceta);
		Set<Condimento> condimentosReceta = new HashSet<Condimento>();
		setCondimentos(condimentosReceta);
		ArrayList<PasoDeReceta> procedimientoReceta = new ArrayList<PasoDeReceta>();
		setProcedimiento(procedimientoReceta);
		Set<Calificacion> calificacionesReceta = new HashSet<Calificacion>();
		setCalificaciones(calificacionesReceta);
		Set<Categoria> categoriasReceta = new HashSet<Categoria>();
		setCategorias(categoriasReceta);
		
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

	public Set<Categoria> getCategorias() {
		return categorias;
	}

	public void setCategorias(Set<Categoria> categorias) {
		this.categorias = categorias;
	}
	public Usuario getNombreCreador() {
		return nombreCreador;
	}
	public void setNombreCreador(Usuario nombreCreador) {
		this.nombreCreador = nombreCreador;
	}
	public Fecha getFechaDeCreacion() {
		return fechaDeCreacion;
	}
	public void setFechaDeCreacion(Fecha fechaDeCreacion) {
		this.fechaDeCreacion = fechaDeCreacion;
	}
	
	

}
