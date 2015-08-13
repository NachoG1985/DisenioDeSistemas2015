package entrega1;

import java.util.HashSet;
import java.util.Set;

public class Grupo {

	// Atributos de la clase Usuario
	private String nombreCreador;
	private String nombreGrupo;
	private String descripcionGrupo;
	private Set<Usuario> usuariosGrupo;

	// Constructor de la clase
	public Grupo(String creador, String grupo, string descripcion)
		{
			nombreCreador = creador;
			nombreGrupo = grupo;
			descripcionGrupo = descripcion;
			usuariosGrupo = new HashSet<Usuario>();;

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
}