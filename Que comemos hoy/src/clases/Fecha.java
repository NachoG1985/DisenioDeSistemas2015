package clases;

public class Fecha {
	private int dia;
	private int mes;
	private int a�o;

	public Fecha(int nuevoDia, int nuevoMes, int nuevoA�o) {
		setDia(nuevoDia);
		setMes(nuevoMes);
		setA�o(nuevoA�o);
	}

	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getA�o() {
		return a�o;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public void setA�o(int a�o) {
		this.a�o = a�o;
	}
	
	

}
