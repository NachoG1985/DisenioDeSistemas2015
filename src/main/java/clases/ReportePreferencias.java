package clases;

import java.util.*;
import java.sql.Timestamp;

public class ReportePreferencias implements Tipo
{
	Timestamp fechaInicio;
	Timestamp fechaFin;
	
	
	public ReportePreferencias(Timestamp inicio, Timestamp fin) {
		fechaInicio = inicio;
		fechaFin = fin;
	}

	


	public Timestamp getFechaInicio() {
		return fechaInicio;
	}




	public void setFechaInicio(Timestamp fechaInicio) {
		this.fechaInicio = fechaInicio;
	}




	public Timestamp getFechaFin() {
		return fechaFin;
	}




	public void setFechaFin(Timestamp fechaFin) {
		this.fechaFin = fechaFin;
	}




	
	public ArrayList<String> generar()
	{
		ArrayList<String> resultado = new ArrayList<String>();
		HashSet<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaSegunPreferenciaPorPeriodo(fechaInicio, fechaFin);
		Iterator<Receta> iterador = recetas.iterator();
		Receta receta;
		while (iterador.hasNext())
		{
			receta = iterador.next();
			resultado.add(receta.getNombre());
		}
		return resultado;
	}

}