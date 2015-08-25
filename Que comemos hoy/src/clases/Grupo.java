package clases;

import java.util.HashSet;
import java.util.Set;

public class Grupo {

	// Atributos de la clase Usuario
	private String nombreCreador;
	private String nombreGrupo;
	private String descripcionGrupo;
	private Set<Usuario> usuariosGrupo;

	// Constructor de la clase
	public Grupo(String creador, String grupo, String descripcion)
		{
			setNombreCreador(creador);
			setNombreGrupo(grupo);
			setDescripcionGrupo(descripcion);
			usuariosGrupo = new HashSet<Usuario>();

		}

	// Metodos de la clase
	private void agregarMiembro(String nombreUsuario)
		{
		
		}
	
	private void eliminarMiembro(String nombreUsuario) 
		{
		
		}

	private void eliminarGrupo(String nombre)
		{
		
		}
	
	private void modificarDescripcion(String descripcion) 
		{
		
		}

	public String getNombreCreador() {
		return nombreCreador;
	}

	public void setNombreCreador(String nombreCreador) {
		this.nombreCreador = nombreCreador;
	}

	public String getNombreGrupo() {
		return nombreGrupo;
	}

	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}

	public String getDescripcionGrupo() {
		return descripcionGrupo;
	}

	public void setDescripcionGrupo(String descripcionGrupo) {
		this.descripcionGrupo = descripcionGrupo;
	}

	public Set<Usuario> getUsuariosGrupo() {
		return usuariosGrupo;
	}

	public void setUsuariosGrupo(Set<Usuario> usuariosGrupo) {
		this.usuariosGrupo = usuariosGrupo;
	}
	
	
}