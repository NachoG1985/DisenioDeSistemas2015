package clases;

import java.sql.Timestamp;
import java.util.*;

public class EstadisticaDificultad implements Tipo{
		public Timestamp fechaInicio;
		public Timestamp fechaFin;
		
		
		public EstadisticaDificultad(Timestamp inicio, Timestamp fin) {
			fechaInicio = inicio;
			fechaFin = fin;
		}
		public Timestamp getFechaInicio() {
			return fechaInicio;
		}
		public void setFechaInicio(Timestamp fechaInicio) {
			this.fechaInicio = fechaInicio;
		}
		public Timestamp getFechaFin() {
			return fechaFin;
		}
		public void setFechaFin(Timestamp fechaFin) {
			this.fechaFin = fechaFin;
		}
		
		public ArrayList<String> generar(){
			   ArrayList<String> resultado = ConsultorBaseDeDatos.getInstance().estadisticaRecetaDificultad(fechaInicio, fechaFin);
			   return resultado;
		}
		
		
}
