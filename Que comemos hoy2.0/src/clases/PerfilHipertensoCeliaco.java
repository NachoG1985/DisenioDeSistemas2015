package clases;

public class PerfilHipertensoCeliaco {
	private String condicionPreexistente;
	
	public PerfilHipertensoCeliaco(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
