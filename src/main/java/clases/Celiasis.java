package clases;


public class Celiasis  extends CondicionPreexistente implements Visitable{
	
	public String aceptar(Visitante visitor){
		return visitor.visitar(this);
	}
}
