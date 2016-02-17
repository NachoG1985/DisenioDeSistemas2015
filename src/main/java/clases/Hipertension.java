package clases;


public class Hipertension implements Visitable{
	
	public String aceptar(Visitante visitor){
		return visitor.visitar(this);
	}
	
	public String getNombre()
	{
		return "Hipertension";
	}
}
