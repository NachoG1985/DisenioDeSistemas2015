package clases;

public class PerfilDiabetico {
	
	private String condicionPreexistente;
	
	public PerfilDiabetico(String condicion) {
		setCondicionPreexistente(condicion);
	}

	

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
