package clases;

import java.util.Set;

public interface Visitante 
{
	public Set<Receta> visitar(PerfilDiabetico perfil);
	public Set<Receta> visitar(PerfilCeliaco perfil);
	public Set<Receta> visitar(PerfilHipertenso perfil);
	public Set<Receta> visitar(PerfilDiabeticoCeliaco perfil);
	public Set<Receta> visitar(PerfilDiabeticoHipertenso perfil);
	public Set<Receta> visitar(PerfilHipertensoCeliaco perfil);
	public Set<Receta> visitar(PerfilHipertensoCeliacoDiabetico perfil);
	public Set<Receta> visitar(PerfilUsuario perfil); // este es el que no tiene ninguna condicion preexistente
}
