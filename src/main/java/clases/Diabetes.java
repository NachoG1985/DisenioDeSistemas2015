package clases;


public class Diabetes extends CondicionPreexistente implements Visitable{
	
	public String aceptar(Visitante visitor){
		return visitor.visitar(this);
	}
	
	public String getNombre()
	{
		return "Diabetes";
	}
}
