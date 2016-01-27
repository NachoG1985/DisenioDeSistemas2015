package clases;

import java.util.*;

public class ReporteRecetasPorCalorias implements Tipo
{
	public int inicio;
	public int fin;
	
		
	public ReporteRecetasPorCalorias(int inicio, int fin) {
		setInicio(inicio);
		setFin(fin);
	}


	public int getInicio() {
		return inicio;
	}


	public void setInicio(int inicio) {
		this.inicio = inicio;
	}


	public int getFin() {
		return fin;
	}


	public void setFin(int fin) {
		this.fin = fin;
	}


	public void generar()
	{
		Set<Receta> recetas = new HashSet<Receta>();// reemplazar por = ConsultorBaseDeDatos.getInstance().consultaCorrespondiente() cuando este la consulta
		Iterator<Receta> iterator = recetas.iterator();
		while(iterator.hasNext()) 
		{
			Receta elemento = iterator.next();
			elemento.mostrarReceta();
		}
	}

}