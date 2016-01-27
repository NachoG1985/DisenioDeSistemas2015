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

	public List<Receta> getRecetasConsultadas() {
		return recetasConsultadas;
	}

	public void setRecetasConsultadas(List<Receta> recetasConsultadas) {
		this.recetasConsultadas = recetasConsultadas;
	}

	public List<Receta> getRecetasConfirmadas() {
		return recetasConfirmadas;
	}

	public void setRecetasConfirmadas(List<Receta> recetasConfirmadas) {
		this.recetasConfirmadas = recetasConfirmadas;
	}

	public List<Receta> getRecetasCalificadas() {
		return recetasCalificadas;
	}

	public void setRecetasCalificadas(List<Receta> recetasCalificadas) {
		this.recetasCalificadas = recetasCalificadas;
	}
	
	
}
