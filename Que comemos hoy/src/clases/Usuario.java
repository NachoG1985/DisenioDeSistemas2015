package clases;

import java.util.HashSet;
import java.util.Set;

public class Usuario {

	// Atributos de la clase Usuario
	private String nombreUsuario;
	private String email;
	private PerfilUsuario perfil;
	private HistorialRecetas historicoRecetas;
	private Set<Usuario> amigos;
	private Fecha fechaNacimiento;

	// Constructor de la clase
	public Usuario(String nuevoNombre, String nuevoEmail, int diaNacimiento,
			int mesNacimiento, int anioNacimiento) {
		setNombreUsuario(nuevoNombre);
		setEmail(nuevoEmail);
		historicoRecetas = new HistorialRecetas();
		amigos = new HashSet<Usuario>();
		Fecha fechaNueva =  new Fecha(diaNacimiento, mesNacimiento, anioNacimiento);
		setFechaNacimiento(fechaNueva);

	}

	// Metodos de la clase
	private void cargarPerfil() {
		// Implementar interaccion con la pantalla de cargar perfil para obtener
		// los valores de la variable
	}

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

        public void calificarReceta() {
		// Implementar interaccion con la pantalla de calificar receta
	}
	
	public void clasificarReceta() {
		// Implementar interaccion con la pantalla de clasificar receta
	}

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
	
	
}
