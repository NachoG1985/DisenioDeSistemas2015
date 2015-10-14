package clases;

public class RecomendadorDeRecetas implements Visitante{
	
	private final String sinCondicion="Ninguna";
	private final String diabetico="Diabetico";
	private final String celiaco="Celiaco";
	private final String hipertenso="Hipertenso";
	
	public String visitar(PerfilDiabetico perfil){
		return diabetico;
	};
	public String visitar(PerfilCeliaco perfil){
		return celiaco;
	};
	public String visitar(PerfilHipertenso perfil){
		return hipertenso;
	};
	public String visitar(PerfilDiabeticoCeliaco perfil){
		return diabetico + celiaco;
	};
	public String visitar(PerfilDiabeticoHipertenso perfil){
		return diabetico + hipertenso;
	};
	public String visitar(PerfilHipertensoCeliaco perfil){
		return hipertenso + celiaco;
	};
	public String visitar(PerfilHipertensoCeliacoDiabetico perfil){
		return hipertenso + celiaco + diabetico;
	};
	public String visitar(PerfilUsuario perfil){
		return sinCondicion;
	};
	
	

}
