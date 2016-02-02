package clases;

import java.util.*;
import java.sql.Timestamp;

public class ReporteRecetasConsultadas implements Tipo
{
	Timestamp fechaInicio;
	Timestamp fechaFin;
	String nombreUsuario;
		
	public ReporteRecetasConsultadas(Timestamp inicio, Timestamp fin,String nombre) {
		setFechaInicio(inicio);
		setFechaFin(fin);
		setNombreUsuario(nombre);
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

	public String getNombreUsuario() {
		return nombreUsuario;
	}


	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}


	// agregar periodo de tiempo
 	public void generar()
	{
 		ArrayList<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaMasConsultada(fechaInicio, fechaFin, nombreUsuario);
		
	}

}