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
			int mesNacimiento, int a�oNacimiento) {
		nombreUsuario = nuevoNombre;
		email = nuevoEmail;
		historicoRecetas = new HistorialRecetas();
		amigos = new HashSet<Usuario>();
		fechaNacimiento = new Fecha(diaNacimiento, mesNacimiento, a�oNacimiento);

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

}
