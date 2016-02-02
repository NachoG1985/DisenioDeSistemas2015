package clases;

import java.util.*;

public class ReporteRecetasPorCalorias implements Tipo
{
	public double inicio;
	public double fin;
	
		
	public ReporteRecetasPorCalorias(double inicio, double fin) {
		setInicio(inicio);
		setFin(fin);
	}


	public double getInicio() {
		return inicio;
	}

	public void setInicio(double inicio) {
		this.inicio = inicio;
	}


	public double getFin() {
		return fin;
	}

	public void setFin(double fin) {
		this.fin = fin;
	}


	public void generar()
	{
		HashSet<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaSegunRangoCalorias(inicio, fin);
		
	}

}