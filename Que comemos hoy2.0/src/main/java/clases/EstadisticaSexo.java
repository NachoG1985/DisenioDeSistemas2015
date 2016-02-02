package clases;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

public class EstadisticaSexo implements Tipo {

	private String sexo;
	private Timestamp fechaInicio;
	private Timestamp fechaFin;
	
		
	public EstadisticaSexo(String unSexo, Timestamp inicio, Timestamp fin) {
		setSexo(unSexo);
		setFechaInicio(inicio);
		setFechaFin(fin);
	}



	public void generar()
	{
		ArrayList<String> tiposRecetas = ConsultorBaseDeDatos.getInstance().estadisticaSegunSexo(sexo, fechaInicio, fechaFin);
		Iterator<String> iterador = tiposRecetas.iterator();
		String tipoReceta;
		int puesto = 1;
		while (iterador.hasNext())
		{
			tipoReceta = iterador.next();
			String elemento = Integer.toString(puesto) + " " + tipoReceta;
			System.out.println(elemento);
			puesto ++;
		}
	}


	public String getSexo() {
		return sexo;
	}



	public void setSexo(String sexo) {
		this.sexo = sexo;
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



	public void setFechaFin(java.sql.Timestamp fechaFin) {
		this.fechaFin = fechaFin;
	}
	
	
	
}
