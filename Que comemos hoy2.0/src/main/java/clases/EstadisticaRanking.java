package clases;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;


public class EstadisticaRanking implements Tipo{
	
	Timestamp fechaInicio;
	Timestamp fechaFin;
	
	public EstadisticaRanking(Timestamp inicio, Timestamp fin) {
		setFechaInicio(inicio);
		setFechaFin(fin);
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
	
	public void generar(){
		ArrayList<String> recetas = ConsultorBaseDeDatos.getInstance().estadisticaRankingRecetaConsultada(fechaInicio, fechaFin);
		Iterator<String> iterador = recetas.iterator();
		String nombreReceta;
		int puesto = 1;
		while (iterador.hasNext())
		{
			nombreReceta = iterador.next();
			String elemento = Integer.toString(puesto) + " " + nombreReceta;
			System.out.println(elemento);
			puesto ++;
		}
	}
	
}
