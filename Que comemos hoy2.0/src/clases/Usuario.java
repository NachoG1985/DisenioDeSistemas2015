package clases;

import java.util.HashSet;
import java.util.Set;

public class Usuario {

	// Atributos de la clase Usuario
	private String nombreUsuario;
	private String email;
	private String contrase�a;
	private PerfilUsuario perfil;
	private HistorialRecetas historicoRecetas;
	private Set<Usuario> amigos;
	private Fecha fechaNacimiento;

	// Constructor de la clase
	public Usuario(String nuevoNombre, String nuevoEmail, Fecha nuevaFecha, String nuevaContrase�a) 
	{
		nombreUsuario = nuevoNombre;
		email = nuevoEmail;
		fechaNacimiento = nuevaFecha;
		amigos = new HashSet<Usuario>();
		contrase�a = nuevaContrase�a;
	}

	// Metodos de la clase
	public void cargarPerfil(PerfilUsuario nuevoPerfil) {
		perfil = nuevoPerfil;
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
