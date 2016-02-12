package clases;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.*;

public class RecomendadorDeRecetas implements Visitante{
	
	public final String recomendacionesDiabetes = "Se recomienda reemplazar el azucar, por Stevia, Neotame o Polioles ,entre otros. Si la receta es con edulcorante no olvide consultar cuanta cantidad de cada uno de ellos equivale a una cucharada de azucar (generalmente se cuentra en el envace del producto) para que no quede demasiado dulce. Por ejemplo, 6 gotas de stevia equivalen a una cucharada de azucar.En cuanto al pescado se recomienda utilizar aquellos de piel azul o blanca" ;
	public final String recomendacionesHipertension = "En cualquiera de la recetas mostradas a continuacion se puede usar tanto sal sin sodio como sal hecha a base de vegetales bajos en sodio. Sin embargo la mas recomendable es la primera, ya que las recetas están hechas para que no se pierda sabor a pesar de no usar sal con sodio. Por último recuerde que si la receta es con atún, se recomienda utilizar aquel que es al agua no el que viene en aceite. En cuanto al pescado se recomienda utilizar aquellos de piel azul." ;
	public final String recomendacionesCeliasis = "Recuerde que los alimentos como mortadela, queso, conservas, entre otros, puede contener gluten. Se recomienda verificar esto antes de usar uno de estos alimentos en la receta. Además se recomienda tomar en su estado natural a aquellos alimentos naturales que no contienen gluten, pero no en conserva.";
	
	public RecomendadorDeRecetas(){
		
	}



	public String visitar(Diabetes condicion){
		return recomendacionesDiabetes;
	}
	
	public String visitar(Celiasis condicion){
		return recomendacionesCeliasis;
	}

	public String visitar(Hipertension condicion){
		return recomendacionesHipertension;
	}
	
	public ArrayList<String> recomendacionesPreparacion(PerfilUsuario perfil){
		Iterator<Object> iterator = perfil.getCondicionPreexistente().iterator();
		Object elemento;
		ArrayList<String> recomendaciones = new ArrayList<String>();
		RecomendadorDeRecetas recomendador = new RecomendadorDeRecetas();
		while(iterator.hasNext()) 
		{
			elemento = iterator.next();
			if(elemento.getClass() == Hipertension.class){
				recomendaciones.add(((Hipertension)elemento).aceptar(recomendador));
			}
			if(elemento.getClass() == Celiasis.class){
				recomendaciones.add(((Celiasis)elemento).aceptar(recomendador));
			}
			if(elemento.getClass() == Diabetes.class){
				recomendaciones.add(((Diabetes)elemento).aceptar(recomendador));
			}
		}
		return recomendaciones;
	}
	
	public HashSet<Receta> recomendacionesRecetas(Usuario usuario)
	{
		HashSet<Receta> recomendaciones = new HashSet<Receta>();
		Iterator<Object> iterator = usuario.getPerfil().getCondicionPreexistente().iterator();
		Object elemento;
		while(iterator.hasNext()) {
				elemento = iterator.next();
				String condicion = elemento.getClass().toString();
				String nombreUsuario = usuario.getNombreUsuario();
				HashSet<Receta> recetasCondicion = new HashSet<Receta>();//cuando esta lista la funcion cambiar por consultor.getInstance().consulta(nombreUsuario,condicion);
				recomendaciones.addAll(recetasCondicion);
		}	
		return recomendaciones;
	}
}
