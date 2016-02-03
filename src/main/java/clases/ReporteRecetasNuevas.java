package clases;

import static java.lang.System.out;

import java.util.*;

public class ReporteRecetasNuevas implements Tipo
{
    public ReporteRecetasNuevas(){
    	
    }
	public ArrayList<String> generar()
	{
		ArrayList<String> datos = new ArrayList<String>();
		HashSet<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaCreadasPorTodosLosUsuarios();
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