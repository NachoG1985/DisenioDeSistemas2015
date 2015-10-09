package clases;

public class PerfilNormal {
	private String condicionPreexistente;
	
	public PerfilNormal(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}
