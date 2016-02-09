package clases;




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
	
}
