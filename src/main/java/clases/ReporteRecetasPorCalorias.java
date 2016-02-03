package clases;

import java.util.*;
import static java.lang.System.out;

public class ReporteRecetasPorCalorias implements Tipo
{
	public double inicio;
	public double fin;
	
		
	public ReporteRecetasPorCalorias(double inicio,double fin) {
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





	public ArrayList<String> generar()
	{
		ArrayList<String> datos = new ArrayList<String>();
		HashSet<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaSegunCalorias(inicio,fin);
		Iterator<Receta> iterator = recetas.iterator();
		out.println("guacho");
		String renglon;
		while(iterator.hasNext()) 
		{
			Receta elemento = iterator.next();
			renglon = elemento.getNombre() /*+" " + Float.toString(elemento.getCaloriasTotales())*/;
			datos.add(renglon);
			
		}
		return datos;
	}

}