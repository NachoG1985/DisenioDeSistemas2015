package clases;

public class PerfilDiabeticoCeliaco {
	private String condicionPreexistente;
	
	public PerfilDiabeticoCeliaco(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
