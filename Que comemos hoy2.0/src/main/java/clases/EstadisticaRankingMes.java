package clases;

import java.util.*;

public class EstadisticaRankingMes implements Tipo
{
 	public EstadisticaRankingMes(){
 		
 	}
	
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
