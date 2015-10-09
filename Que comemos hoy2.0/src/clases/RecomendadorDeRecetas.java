package clases;

public class RecomendadorDeRecetas implements Visitante{
	
	public String visitar(PerfilDiabetico perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilCeliaco perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilHipertenso perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilDiabeticoCeliaco perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilDiabeticoHipertenso perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilHipertensoCeliaco perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilHipertensoCeliacoDiabetico perfil){
		return perfil.getCondicionPreexistente();
	};
	public String visitar(PerfilNormal perfil){
		return perfil.getCondicionPreexistente();
	};

}
