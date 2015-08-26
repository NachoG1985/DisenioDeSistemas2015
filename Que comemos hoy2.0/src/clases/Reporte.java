package clases;

public class Reporte implements Tipo 
{

	SubtipoDeReporte subtipo;
	//constructor
	public Reporte()
	{
		
	}
	
	public void generar()
	{
		Reporte reporteNuevo = new Reporte();
	}

	public SubtipoDeReporte getSubtipo() {
		return subtipo;
	}

	public void setSubtipo(SubtipoDeReporte subtipo) {
		this.subtipo = subtipo;
	}
	
	
    
}