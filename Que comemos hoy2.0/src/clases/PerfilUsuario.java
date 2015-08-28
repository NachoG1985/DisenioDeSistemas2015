/**
 * 
 */
package clases;

public class PerfilUsuario {

	// Atributos de la clase
	private String nombre;
	private String sexo;
	private int edad;
	private int altura;
	private String complexion;
	private String dieta;
	private String[] preferencias;
	private String rutina;
	private String[] condicionPreexistente;

	// Constructor de la clase
	public PerfilUsuario(String nombreYapellido, String nuevoSexo,
			int nuevaEdad, int nuevaAltura, String nuevaComplexion,
			String nuevaDieta, String[] nuevasPreferencias, String nuevaRutina,
			String[] nuevasCondiciones) {

		setNombre(nombreYapellido);
		setSexo(nuevoSexo);
		setEdad(nuevaEdad);
		setAltura(nuevaAltura);
		setComplexion(nuevaComplexion);
		setDieta(nuevaDieta);
		setPreferencias(nuevasPreferencias);
		setRutina(nuevaRutina);
		setCondicionPreexistente(nuevasCondiciones);
	}

	// Metodos de la clase
	private void verificarDatos() {

	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public int getAltura() {
		return altura;
	}

	public void setAltura(int altura) {
		this.altura = altura;
	}

	public String getComplexion() {
		return complexion;
	}

	public void setComplexion(String complexion) {
		this.complexion = complexion;
	}

	public String getDieta() {
		return dieta;
	}

	public void setDieta(String dieta) {
		this.dieta = dieta;
	}

	public String[] getPreferencias() {
		return preferencias;
	}

	public void setPreferencias(String[] preferencias) {
		this.preferencias = preferencias;
	}

	public String getRutina() {
		return rutina;
	}

	public void setRutina(String rutina) {
		this.rutina = rutina;
	}

	public String[] getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String[] condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
	
	

}
