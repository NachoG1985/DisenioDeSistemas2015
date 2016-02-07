package clases;

import java.sql.Timestamp;
import java.util.*;

public class EstadisticaRanking implements Tipo{
		public Timestamp fechaInicio;
		public Timestamp fechaFin;
		
		public EstadisticaRanking(Timestamp inicio, Timestamp fin) {
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
			ArrayList<String> resultado = ConsultorBaseDeDatos.getInstance().estadisticaRankingRecetaConsultada(fechaInicio, fechaFin);
			return resultado;
		}
		

}
