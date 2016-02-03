package clases;
import java.sql.Timestamp;
import java.util.*;
import static java.lang.System.out;


public class GestorDeEstadisticasYReportes
{
		//Atributos
		private Tipo tipo;
		
		//Metodos
		public GestorDeEstadisticasYReportes(Tipo tipoNuevo)
			{
				tipo = tipoNuevo;
			}
		
	
		
		public Tipo getTipo() {
			return tipo;
		}
	
		
		// tipos de reportes
	
/*		public void setTipoPreferencias() {
			tipo = new ReportePreferencias();
		}
		*/
		public void setTipoCalorias(int valorInicial,int valorFin)
		{
			tipo = new ReporteRecetasPorCalorias(valorInicial,valorFin);
		}
		
	/*	public void setTipoRecetasConsultadas(){
			tipo = new ReporteRecetasConsultadas();
		}
				
		public void setTipoRecetasNuevas(){
			tipo = new ReporteRecetasNuevas();
		}
		
		// tipo de estadisticas mensuales
		

		public void setTipoSexoMes(String sexo) {
			tipo = new EstadisticaSexoMes(sexo);
		}
		
		public void setTipoDificultadMes() {
			tipo = new EstadisticaDificultadMes();
		}
		
		public void setTipoRankingMes() {
			tipo = new EstadisticaRankingMes();
		}

		// tipo de estadisticas semanales
		

		public void setTipoSexoSemana(String sexo) {
			tipo = new EstadisticaSexoSemana(sexo);
		}
				
		public void setTipoDificultad() {
			tipo = new EstadisticaDificultadSemana();
		}
				
		public void setTipoRankingSemana() {
			tipo = new EstadisticaRankingSemana();
		}*/
		public ArrayList<String> generar(){
			
			out.println("guacho");
			ArrayList<String> resultado = tipo.generar();
			return resultado;
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

