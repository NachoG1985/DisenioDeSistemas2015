package clases;

public class GestorDeEstadisticasYReportes
{
		//Atributos
		private Tipo tipo;
		
		//Metodos
		public GestorDeEstadisticasYReportes(Tipo tipoNuevo)
			{
				setTipo(tipoNuevo);
			}

		public Tipo getTipo() {
			return tipo;
		}

		public void setTipo(Tipo tipo) {
			this.tipo = tipo;
		}
		
		public void generarReporteoEstadistica()
		{
			tipo.generar();
		}
}

