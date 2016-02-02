package clases;

import java.util.*;

public class ReporteRecetasNuevas implements Tipo
{
    public ReporteRecetasNuevas(){
    	
    }
	public void generar()
	{
		HashSet<Receta> recetas = ConsultorBaseDeDatos.getInstance().recetaCreadasPorTodosLosUsuarios();
		
	}

}