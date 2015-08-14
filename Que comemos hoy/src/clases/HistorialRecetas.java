package clases;

import java.util.ArrayList;
import java.util.List;

public class HistorialRecetas {

	// Atributos de la clase
	private List<Receta> recetasConsultadas;
	private List<Receta> recetasConfirmadas;
	private List<Receta> recetasCalificadas;

	// Constructos de la clase
	public HistorialRecetas() {
		recetasConsultadas = new ArrayList<Receta>();
		recetasConfirmadas = new ArrayList<Receta>();
		recetasCalificadas = new ArrayList<Receta>();
	}

	// Metodos de la clase
	public void agregarConsultada(Receta nuevaReceta) {
		if (!recetasConsultadas.contains(nuevaReceta))
			recetasConsultadas.add(nuevaReceta);
		return;
	}

	public void agregarConfirmada(Receta nuevaReceta) {
		if (!recetasConfirmadas.contains(nuevaReceta))
			recetasConfirmadas.add(nuevaReceta);
		return;
	}

	public void agregarCalificada(Receta nuevaReceta) {
		if (!recetasConsultadas.contains(nuevaReceta))
			recetasCalificadas.add(nuevaReceta);
		return;
	}
}
