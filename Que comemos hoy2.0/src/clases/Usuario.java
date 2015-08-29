package clases;

import java.util.HashSet;
import java.util.Set;

public class Usuario {

	// Atributos de la clase Usuario
	private String nombreUsuario;
	private String email;
	private String contraseña;
	private PerfilUsuario perfil;
	private HistorialRecetas historicoRecetas;
	private Set<Usuario> amigos;
	private Fecha fechaNacimiento;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public PerfilUsuario getPerfil() {
		return perfil;
	}

	public void setPerfil(PerfilUsuario perfil) {
		this.perfil = perfil;
	}

	public HistorialRecetas getHistoricoRecetas() {
		return historicoRecetas;
	}

	public void setHistoricoRecetas(HistorialRecetas historicoRecetas) {
		this.historicoRecetas = historicoRecetas;
	}

	public Set<Usuario> getAmigos() {
		return amigos;
	}

	public void setAmigos(Set<Usuario> amigos) {
		this.amigos = amigos;
	}

	public Fecha getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Fecha fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	// Constructor de la clase
	public Usuario(String nuevoNombre, String nuevoEmail, Fecha nuevaFecha, String nuevaContraseña) 
	{
		setNombreUsuario(nuevoNombre);
		setEmail(nuevoEmail);
		setFechaNacimiento(nuevaFecha);
		amigos = new HashSet<Usuario>();
		setContraseña(nuevaContraseña);
	}

	// Metodos de la clase
	

	public void CargarReceta() {
		// Implementar interaccion con la pantalla de cargar receta
	}

	public void seleccionarReceta() {
		// Implementar interaccion con la pantalla de seleccion de receta
	}
	
	public void consultarReceta() {
		// Implementar interaccion con la pantalla de consultar receta
	}
	
	public void confirmarReceta() {
		// Implementar interaccion con la pantalla de confirmar receta
	}

        public void calificarReceta(Receta recetaACalificar, int cantEstrellas) {
        	Calificacion calificacionNueva = new Calificacion(nombreUsuario,cantEstrellas);
        	recetaACalificar.agregarCalificacion(calificacionNueva);
	}
	
	public void clasificarReceta(Receta recetaAClasificar, String categoriaCorrespondiente) {
		recetaAClasificar.agregarCategoria(categoriaCorrespondiente);
	}
	
	private Receta crearReceta(String nombre,String ingredientePrincipal,int dificultad,String temporada,float calorias,String creador,Fecha fecha){
		Receta receta = new Receta(nombre,ingredientePrincipal,dificultad,temporada,calorias,creador,fecha);
		return receta;
	}
}
