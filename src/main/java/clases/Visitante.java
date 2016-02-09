package clases;



public interface Visitante 
{
	public String visitar(Diabetes condicion);
	public String visitar(Hipertension condicion);
	public String visitar(Celiasis condicion);
}
