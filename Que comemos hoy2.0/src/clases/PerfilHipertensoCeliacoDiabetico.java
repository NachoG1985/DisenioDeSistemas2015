package clases;

public class PerfilHipertensoCeliacoDiabetico {
	private String condicionPreexistente;
	
	public PerfilHipertensoCeliacoDiabetico(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
