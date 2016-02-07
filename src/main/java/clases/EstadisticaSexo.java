package clases;

import java.sql.Timestamp;
import java.util.*;

public class EstadisticaSexo implements Tipo {
	public	Timestamp fechaInicio;
	public	Timestamp fechaFin;
	public	String sexo;
	public EstadisticaSexo(Timestamp inicio, Timestamp fin, String unSexo) {
		fechaInicio = inicio;
		fechaFin = fin;
		sexo = unSexo;
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
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	
	public ArrayList<String> generar()
	{
		ArrayList<String> resultado = ConsultorBaseDeDatos.getInstance().estadisticaSegunSexo(sexo,fechaInicio,fechaFin);
		return resultado;
		
		
	}
	


}

