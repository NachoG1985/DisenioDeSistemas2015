package clases;


public class Hipertension extends CondicionPreexistente implements Visitable{
	
	public String aceptar(Visitante visitor){
		return visitor.visitar(this);
	}
}
