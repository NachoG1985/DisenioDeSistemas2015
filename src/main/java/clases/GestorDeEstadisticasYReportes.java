package clases;


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
		
		public void setTipoRecetasConsultadas(){
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
		}
		
		
		
}

