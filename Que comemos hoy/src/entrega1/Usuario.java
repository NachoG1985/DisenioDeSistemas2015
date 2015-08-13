package entrega1;

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
			int mesNacimiento, int añoNacimiento) {
		nombreUsuario = nuevoNombre;
		email = nuevoEmail;
		historicoRecetas = new HistorialRecetas();
		amigos = new HashSet<Usuario>();
		fechaNacimiento = new Fecha(diaNacimiento, mesNacimiento, añoNacimiento);

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
}
