package clases;

import java.sql.Timestamp;

public class GestorDeEstadisticasYReportes
{
		//Atributos
		private Tipo tipo;
		
		//Metodos
		public GestorDeEstadisticasYReportes(Tipo tipoNuevo)
			{
				tipo = tipoNuevo;
			}
		
		public void generarReporteoEstadistica()
		{
			
		}
		
		public Tipo getTipo() {
			return tipo;
		}
	
		
		// tipos de reportes
	
		public void setTipoPreferencias() {
			tipo = new ReportePreferencias();
		}
		
		public void setTipoCalorias(int valorInicial,int valorFin)
		{
			tipo = new ReporteRecetasPorCalorias(valorInicial,valorFin);
		}
		
		public void setTipoRecetasConsultadas(Timestamp inicio, Timestamp fin,String nombre){
			tipo = new ReporteRecetasConsultadas(inicio,fin,nombre);
		}
				
		public void setTipoRecetasNuevas(){
			tipo = new ReporteRecetasNuevas();
		}
		
		// tipo de estadisticas 
		

		public void setTipoSexo(String sexo,Timestamp inicio, Timestamp fin) {
			tipo = new EstadisticaSexo(sexo,inicio,fin);
		}
				
		public void setTipoDificultad(Timestamp fechaInicio,Timestamp fechaFin) {
			tipo = new EstadisticaDificultad(fechaInicio,fechaFin);
		}
				
		public void setTipoRanking(Timestamp inicio, Timestamp fin) {
			tipo = new EstadisticaRanking(inicio,fin);
		}
		
		
		
}

