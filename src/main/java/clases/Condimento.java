package clases;

public class Condimento {

	// Atributos de la clase
	private String nombreCondimento;
	private String tipoCondimento;

	// Constructor de la clase
	// Constructor de la clase
		public Condimento(String nombre, String tipo) {
			setNombreCondimento(nombre);
			setTipoCondimento(tipo);
		}
	public String getNombreCondimento() {
		return nombreCondimento;
	}

	public void setNombreCondimento(String nombreCondimento) {
		this.nombreCondimento = nombreCondimento;
	}

	public String getTipoCondimento() {
		return tipoCondimento;
	}

	public void setTipoCondimento(String tipoCondimento) {
		this.tipoCondimento = tipoCondimento;
	}
	
	

}
