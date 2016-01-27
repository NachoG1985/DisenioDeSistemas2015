package clases;

import java.util.HashSet;
import java.util.Set;
import java.sql.Date;
public class Usuario {

	// Atributos de la clase Usuario
	private String nombreUsuario;
	private String email;
	private String contrasenia;
	private PerfilUsuario perfil;
	private HistorialRecetas historicoRecetas;
	private Set<Usuario> amigos;
	private Date fechaNacimiento;
	
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

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
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

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	// Constructor de la clase
	public Usuario(String nuevoNombre, String nuevoEmail, Date nuevaFecha, String nuevaContrasenia) 
	{
		setNombreUsuario(nuevoNombre);
		setEmail(nuevoEmail);
		setFechaNacimiento(nuevaFecha);
		amigos = new HashSet<Usuario>();
		setContrasenia(nuevaContrasenia);
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
	
	

}
