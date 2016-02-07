package clases;

import static java.lang.System.out;
import java.sql.Timestamp;
import java.util.*;

public class ReporteRecetasConsultadas implements Tipo
{
	Timestamp inicio;
	Timestamp fin;
	String nombreUsuario;
	
	
	public ReporteRecetasConsultadas(Timestamp inicio, Timestamp fin, String nombreUsuario) {
		this.inicio = inicio;
		this.fin = fin;
		this.nombreUsuario = nombreUsuario;
	}


	public Timestamp getInicio() {
		return inicio;
	}


	public void setInicio(Timestamp inicio) {
		this.inicio = inicio;
	}


	public Timestamp getFin() {
		return fin;
	}


	public void setFin(Timestamp fin) {
		this.fin = fin;
	}


	public String getNombreUsuario() {
		return nombreUsuario;
	}


	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}


	public ArrayList<String> generar()
	{
		ArrayList<String> datos = new ArrayList<String>();
		ArrayList<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaMasConsultada(inicio,fin,nombreUsuario);
		Iterator<Receta> iterator = recetas.iterator();
		out.println("guacho");
		String renglon;
		while(iterator.hasNext()) 
		{
			Receta elemento = iterator.next();
			renglon = elemento.getNombre();
			datos.add(renglon);
			
		}
		return datos;
	}

}