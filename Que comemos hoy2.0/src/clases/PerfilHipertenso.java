package clases;

public class PerfilHipertenso {
	private String condicionPreexistente;
	
	public PerfilHipertenso(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
