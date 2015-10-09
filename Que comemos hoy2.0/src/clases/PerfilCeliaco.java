package clases;

public class PerfilCeliaco {
	private String condicionPreexistente;
	
	public PerfilCeliaco(String condicion) {
		setCondicionPreexistente(condicion);
	}

	public String getCondicionPreexistente() {
		return condicionPreexistente;
	}

	public void setCondicionPreexistente(String condicionPreexistente) {
		this.condicionPreexistente = condicionPreexistente;
	}
}


