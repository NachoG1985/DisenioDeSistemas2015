package clases;

import java.sql.Timestamp;
import java.util.*;

public class Fecha {
	private int dia;
	private int mes;
	private int anio;

	public Fecha(int nuevoDia, int nuevoMes, int nuevoAnio) {
		setDia(nuevoDia);
		setMes(nuevoMes);
		setAnio(nuevoAnio);
	}


	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getAnio() {
		return anio;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}
	
	public Date ADate(){
		Date nuevaFecha;
		Calendar calendario = new GregorianCalendar();
		calendario.set(Calendar.MONTH, mes - 1);
		calendario.set(Calendar.YEAR, anio);
		calendario.set(Calendar.DAY_OF_MONTH,dia);
		nuevaFecha = calendario.getTime();
		return nuevaFecha;
	}


}
