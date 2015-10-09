package clases;

public class PerfilDiabeticoHipertenso {
	private String condicionPreexistente;
	
	public PerfilDiabeticoHipertenso(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
