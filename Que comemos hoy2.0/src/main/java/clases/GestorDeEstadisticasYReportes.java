package clases;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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
		
		
		// FUNCIONES PARA OBTENER LAS FECHAS REQUERIDAS POR LOS REPORTES Y
		// ESTADISTICAS

		public Date obtenerPrimerDiaDelMes(int mes, int anio) {
			Calendar calendario = new GregorianCalendar();

			// Le resto uno xq para el calendar enero es el mes 0
			calendario.set(Calendar.MONTH, mes - 1);
			calendario.set(Calendar.YEAR, anio);
			// Seteo como dia del calendario el minimo dia del mes
			calendario.set(Calendar.DAY_OF_MONTH,
					calendario.getMinimum(Calendar.DAY_OF_MONTH));

			Date primerDia = calendario.getTime();

			return primerDia;
		}

		public Date obtenerUltimoDiaDelMes(int mes, int anio) {
			Calendar calendario = new GregorianCalendar();

			// Le resto uno xq para el calendar enero es el mes 0
			calendario.set(Calendar.MONTH, mes - 1);
			calendario.set(Calendar.YEAR, anio);
			// Seteo como dia del calendario el minimo dia del mes
			calendario.set(Calendar.DAY_OF_MONTH,
					calendario.getMaximum(Calendar.DAY_OF_MONTH));

			Date ultimoDia = calendario.getTime();

			return ultimoDia;
		}

		public Date obtenerPrimerDiaDeSemana(int mes, int anio, int numeroDeSemana) {
			Calendar calendario = new GregorianCalendar();
			Date primerDia = null;

			calendario.setMinimalDaysInFirstWeek(1);

			// Le resto uno xq para el calendar enero es el mes 0
			calendario.set(Calendar.MONTH, mes - 1);
			calendario.set(Calendar.YEAR, anio);

			if (calendario.getActualMaximum(Calendar.WEEK_OF_MONTH) >= numeroDeSemana) {
				calendario.set(Calendar.WEEK_OF_MONTH, numeroDeSemana);
				calendario.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

				while (calendario.get(Calendar.MONTH) != (mes - 1))
					calendario.add(Calendar.DATE, 1);

				primerDia = calendario.getTime();
			}

			return primerDia;

		}

		public Date obtenerUltimoDiaDeSemana(int mes, int anio, int numeroDeSemana) {
			Calendar calendario = new GregorianCalendar();
			Date primerDia = null;
			calendario.setMinimalDaysInFirstWeek(1);

			// Le resto uno xq para el calendar enero es el mes 0
			calendario.set(Calendar.MONTH, mes - 1);
			calendario.set(Calendar.YEAR, anio);

			if (calendario.getActualMaximum(Calendar.WEEK_OF_MONTH) >= numeroDeSemana) {
				calendario.set(Calendar.WEEK_OF_MONTH, numeroDeSemana);
				calendario.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);

				while (calendario.get(Calendar.MONTH) != (mes - 1))
					calendario.add(Calendar.DATE, -1);

				primerDia = calendario.getTime();
			}

			return primerDia;

		}
		
		
}

