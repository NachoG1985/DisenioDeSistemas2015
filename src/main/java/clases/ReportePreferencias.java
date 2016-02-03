package clases;

import java.util.*;

public class ReportePreferencias //implements Tipo
{
	public ReportePreferencias(){
		
	}
	
	
	//VOLVER A VER LA CONSULTA!!
	public void generar()
	{
		Set<Receta> recetas = new HashSet<Receta>();// reemplazar por = ConsultorBaseDeDatos.getInstance().consultaCorrespondiente() cuando este la consulta
		Iterator<Receta> iterador = recetas.iterator();
		Receta receta;
		while (iterador.hasNext())
		{
			receta = iterador.next();
			receta.mostrarReceta();
		}
	}

}