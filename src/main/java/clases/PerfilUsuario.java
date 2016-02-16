package clases;


import java.util.*;

public class PerfilUsuario{

	// Atributos de la clase
	private String nombre;
	private String apellido;


	private String sexo;
	private int edad;
	private double altura;
	private String complexion;
	private String dieta;
	private HashSet<String> preferencias;
	private String rutina;
	private ArrayList<Object> condicionPreexistente;

	// Constructor de la clase
	public PerfilUsuario(String nombre,String apellido, String nuevoSexo,
			int nuevaEdad, double nuevaAltura, String nuevaComplexion,
			String nuevaDieta, HashSet<String> nuevasPreferencias, String nuevaRutina,ArrayList<Object> nuevasCondiciones) {

		setNombre(nombre);
		setApellido(apellido);
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

	public HashSet<String> getPreferencias() {
		return preferencias;
	}

	public void setPreferencias(HashSet<String> preferencias) {
		this.preferencias = preferencias;
	}

	public String getRutina() {
		return rutina;
	}

	public void setRutina(String rutina) {
		this.rutina = rutina;
	}

	
	public ArrayList<Object> getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(ArrayList<Object> condiciones) {
		this.condicionPreexistente = condiciones;
	}
	
	
	
	public String mostrarCondiciones()
	{
		String condiciones = new String();
		Iterator<Object> iterador = condicionPreexistente.iterator();
		
		while(iterador.hasNext())
		{
			Object aux = iterador.next();
			
			if(aux.getClass() == Diabetes.class)
				condiciones = condiciones + "Diabetes  ";
			
			if(aux.getClass() == Hipertension.class)
				condiciones = condiciones + "Hipertension  ";
			
			if(aux.getClass() == Celiasis.class)
				condiciones = condiciones + "Celiasis  ";
				
		}
		
		return condiciones;
		
	}

	
}
