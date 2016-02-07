package clases;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.sql.Date;
public class Receta {

	// Atributos de la clase
	private String nombre;
	private String nombreIngredientePrincipal;
	private Set<IngredienteEnReceta> ingredientes;
	private Set<Condimento> condimentos;
	private ArrayList<PasoDeReceta> procedimiento;
	private int dificultad;
	private HashSet<String> temporada;
	private double caloriasTotales;
	private Set<Calificacion> calificaciones;
	private String nombreCreador;
	private Date fechaDeCreacion;
	private HashSet<String> dietasAptas;
	private HashSet<String> aptaPara;
	private HashSet<String> categorias;
	
	
	
	// Constructor de la clase
	public Receta(String nuevoNombre, String ingredientePrincipal, int valorDificultad, float calorias, String creador, Date fecha) {
		ingredientes =  new HashSet<IngredienteEnReceta>();
		condimentos = new HashSet<Condimento>();
		procedimiento= new ArrayList<PasoDeReceta>();
		calificaciones = new HashSet<Calificacion>();
		setNombre(nuevoNombre);
		setNombreIngredientePrincipal(ingredientePrincipal);
		setDificultad(valorDificultad);
		temporada = new HashSet<String>();
		setCaloriasTotales(calorias);
		setNombreCreador(creador);
		setFechaDeCreacion(fecha);
		aptaPara =  new HashSet<String>();
		dietasAptas = new HashSet<String>();
		categorias = new HashSet<String>();
		}
	

	
	public void agregarCalificacion(Calificacion calificacionCorrespondiente){
		calificaciones.add(calificacionCorrespondiente);
	}
	
	public void agregarTemporada(String nuevatemporada){
		temporada.add(nuevatemporada);
	}
	
	public void agregarCategoria(String nuevacategoria){
		categorias.add(nuevacategoria);
	}
	
	public void agregarCondicionApta(String nuevaCondicion){
		aptaPara.add(nuevaCondicion);
	}
	
	public void agregarDietaApta(String nuevaDieta){
		dietasAptas.add(nuevaDieta);
	}
	
	public void agregarPasoDeReceta(PasoDeReceta nuevoPaso){
		procedimiento.add(nuevoPaso);
	}
	
	public String getNombreCreador() {
		return nombreCreador;
	}

	public void agregarCondimento(Condimento condimento)
	{
		condimentos.add(condimento);
	}
	
	public void agregarIngrediente(IngredienteEnReceta nuevoIngrediente)
	{
		ingredientes.add(nuevoIngrediente);
	}

	public HashSet<String> getDietasAptas() {
		return dietasAptas;
	}


	public void setDietasAptas(HashSet<String> dietasAptas) {
		this.dietasAptas = dietasAptas;
	}


	public HashSet<String> getAptaPara() {
		return aptaPara;
	}


	public void setAptaPara(HashSet<String> aptaPara) {
		this.aptaPara = aptaPara;
	}

	public void setNombreCreador(String nombreCreador) {
		this.nombreCreador = nombreCreador;
	}




	public Date getFechaDeCreacion() {
		return fechaDeCreacion;
	}




	public void setFechaDeCreacion(Date fechaDeCreacion) {
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

	public HashSet<String> getTemporada() {
		return temporada;
	}

	public void setTemporada(HashSet<String> temporada) {
		this.temporada = temporada;
	}

	public double getCaloriasTotales() {
		return caloriasTotales;
	}

	public void setCaloriasTotales(double caloriasTotales) {
		this.caloriasTotales = caloriasTotales;
	}

	public Set<Calificacion> getCalificaciones() {
		return calificaciones;
	}

	public void setCalificaciones(Set<Calificacion> calificaciones) {
		this.calificaciones = calificaciones;
	}

	public HashSet<String> getCategorias() {
		return categorias;
	}

	public void setCategorias(HashSet<String> categoriasReceta) {
		this.categorias = categoriasReceta;
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
	public float calcularCalorias() {

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

	
	public void mostrarReceta(){
		
	}

}
