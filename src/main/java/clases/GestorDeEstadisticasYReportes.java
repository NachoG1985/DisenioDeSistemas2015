package clases;
import java.sql.Timestamp;
import java.util.*;



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
	
		public void setTipoPreferencias(Timestamp inicio, Timestamp fin) {
			tipo = new ReportePreferencias(inicio,fin);
		}
		
		public void setTipoCalorias(double valorInicial,double valorFin)
		{
			tipo = new ReporteRecetasPorCalorias(valorInicial,valorFin);
		}
		
		public void setTipoRecetasConsultadas(Timestamp inicio, Timestamp fin, String nombreUsuario){
			tipo = new ReporteRecetasConsultadas(inicio,fin,nombreUsuario);
		}
				
		public void setTipoRecetasNuevas(){
			tipo = new ReporteRecetasNuevas();
		}
		
		// tipo de estadisticas  */
		

		public void setTipoSexo(Timestamp inicio, Timestamp fin, String unSexo) {
			tipo = new EstadisticaSexo(inicio,fin,unSexo);
		}
				
		public void setTipoDificultad(Timestamp inicio,Timestamp fin) {
			tipo = new EstadisticaDificultad(inicio,fin);
		}
				
		public void setTipoRanking(Timestamp inicio,Timestamp fin) {
			tipo = new EstadisticaRanking(inicio,fin);
		}
		

		public ArrayList<String> generar(){
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
		
		public Boolean comprobarPeriodo(Timestamp comienzo,Timestamp fin)
		{
			Boolean comprobar = comienzo.after(fin) || comienzo.getTime() == fin.getTime();
			return comprobar;
		}
		
		public Boolean comprobarUsuario(String nombreUsuario){
			Boolean resultado;
			Usuario usuario = ConsultorBaseDeDatos.getInstance().consultarUsuario(nombreUsuario);
			if(usuario == null)
			{
				resultado = true;
			}
			else{
				resultado = false;
			}
			return resultado;
		}
		
		public Boolean comprobarRangoCalorias(Double inicio,Double fin){
			return inicio > fin;
		}
}

