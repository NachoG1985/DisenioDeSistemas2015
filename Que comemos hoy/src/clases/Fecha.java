package clases;

public class Fecha {
	private int dia;
	private int mes;
	private int año;

	public Fecha(int nuevoDia, int nuevoMes, int nuevoAño) {
		dia = nuevoDia;
		mes = nuevoMes;
		año = nuevoAño;
	}

	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getAño() {
		return año;
	}

}
