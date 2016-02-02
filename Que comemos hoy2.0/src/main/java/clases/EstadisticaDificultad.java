package clases;

import java.sql.Timestamp;
import java.util.*;

public class EstadisticaDificultad implements Tipo{
	
	Timestamp fechaInicio;
	Timestamp fechaFin;
	
	public EstadisticaDificultad(Timestamp inicio, Timestamp fin) {
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
		ArrayList<String> estadistica = ConsultorBaseDeDatos.getInstance().estadisticaRecetaDificultad(fechaInicio, fechaFin);
		Iterator<String> iterador = estadistica.iterator();
		String informacion;
		int puesto = 1;
		while (iterador.hasNext())
		{
		    informacion = iterador.next();
			String elemento = Integer.toString(puesto) + " " + informacion;
			System.out.println(elemento);
			puesto ++;
		}
	}
	
	

}
