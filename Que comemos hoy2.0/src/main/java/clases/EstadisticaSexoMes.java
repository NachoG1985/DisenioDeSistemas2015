package clases;

import java.util.Set;

public class EstadisticaSexoMes implements Tipo
{
 	public String sexo;
	
 	public EstadisticaSexoMes(String unSexo) {
		setSexo(unSexo);
	}


	public String getSexo() {
		return sexo;
	}


	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	public void generar()
	{
		
	}

}
