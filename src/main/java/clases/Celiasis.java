package clases;


public class Celiasis implements Visitable{
	
	public String aceptar(Visitante visitor){
		return visitor.visitar(this);
	}
	
	public String getNombre()
	{
		return "Celiasis";
	}
}
