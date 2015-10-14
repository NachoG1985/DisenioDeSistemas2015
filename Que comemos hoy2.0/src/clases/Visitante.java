package clases;

public interface Visitante {
	
	public String visitar(PerfilDiabetico perfil);
	public String visitar(PerfilCeliaco perfil);
	public String visitar(PerfilHipertenso perfil);
	public String visitar(PerfilDiabeticoCeliaco perfil);
	public String visitar(PerfilDiabeticoHipertenso perfil);
	public String visitar(PerfilHipertensoCeliaco perfil);
	public String visitar(PerfilHipertensoCeliacoDiabetico perfil);
	public String visitar(PerfilUsuario perfil); // este es el que no tiene ninguna condicion preexistente
}
