package clases;

import java.util.HashSet;
import java.util.Set;

public class PerfilUsuario implements Visitable{

	// Atributos de la clase
	private String nombre;
	private String apellido;


	private String sexo;
	private int edad;
	private double altura;
	private String complexion;
	private String dieta;
	private String[] preferencias;
	private String rutina;
	private static HashSet<String> condicionPreexistente;

	// Constructor de la clase
	public PerfilUsuario(String nombre,String apellido, String nuevoSexo,
			int nuevaEdad, double nuevaAltura, String nuevaComplexion,
			String nuevaDieta, String[] nuevasPreferencias, String nuevaRutina,
			HashSet<String> condicion) {

		setNombre(nombre);
		setApellido(apellido);
		setSexo(nuevoSexo);
		setEdad(nuevaEdad);
		setAltura(nuevaAltura);
		setComplexion(nuevaComplexion);
		setDieta(nuevaDieta);
		setPreferencias(nuevasPreferencias);
		setRutina(nuevaRutina);
		setCondicionPreexistente(condicion);
	}

	// Metodos de la clase
	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
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

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
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

	
	public HashSet<String> getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public static void setCondicionPreexistente(HashSet<String> condicion) {
		PerfilUsuario.condicionPreexistente = condicion;
	}

	public void aceptar(Visitante visitor){
		Set<Receta> recetas =  visitor.visitar(this);
		// MOSTRAR CUANDO TENGAMOS EL FORMATO!!!
	}
}
