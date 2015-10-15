package clases;

import java.util.*;

public class ReporteRecetasPorCategorias implements Tipo
{
	public void generar(Set<Receta> recetas)
	{
		Iterator<Receta> iterator = recetas.iterator();
		while(iterator.hasNext()) 
		{
			Receta elemento = iterator.next();
			elemento.mostrarReceta();
		}
	}

}