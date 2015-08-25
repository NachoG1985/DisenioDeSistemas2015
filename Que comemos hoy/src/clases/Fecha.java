package clases;

public class Fecha {
	private int dia;
	private int mes;
	private int año;

	public Fecha(int nuevoDia, int nuevoMes, int nuevoAño) {
		setDia(nuevoDia);
		setMes(nuevoMes);
		setAño(nuevoAño);
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

	public void setDia(int dia) {
		this.dia = dia;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public void setAño(int año) {
		this.año = año;
	}
	
	

}
