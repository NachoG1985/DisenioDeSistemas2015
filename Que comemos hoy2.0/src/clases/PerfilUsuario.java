/**
 * 
 */
package clases;

public class PerfilUsuario {

	// Atributos de la clase
	private String nombre;
	private String sexo;
	private int edad;
	private float altura;
	private String complexion;
	private String dieta;
	private String[] preferencias;
	private String rutina;
	private String[] condicionPreexistente;

	// Constructor de la clase
	public PerfilUsuario(String nombreYapellido, String nuevoSexo,
			int nuevaEdad, float nuevaAltura, String nuevaComplexion,
			String nuevaDieta, String[] nuevasPreferencias, String nuevaRutina,
			String[] nuevasCondiciones) {

		nombre = nombreYapellido;
		sexo = nuevoSexo;
		edad = nuevaEdad;
		altura = nuevaAltura;
		complexion = nuevaComplexion;
		dieta = nuevaDieta;
		preferencias = nuevasPreferencias;
		rutina = nuevaRutina;
		condicionPreexistente = nuevasCondiciones;
	}

	// Metodos de la clase
	private void verificarDatos() {

	}

}
