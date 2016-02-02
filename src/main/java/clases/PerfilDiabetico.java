package clases;

import java.util.HashSet;


public class PerfilDiabetico extends PerfilUsuario{
	
		
public PerfilDiabetico(String nombre,String apellido, String nuevoSexo,
			int nuevaEdad, int nuevaAltura, String nuevaComplexion,
			String nuevaDieta, String[] nuevasPreferencias, String nuevaRutina,
			HashSet<String> nuevasCondiciones){
			super( nombre, apellido,nuevoSexo,nuevaEdad,nuevaAltura,nuevaComplexion,nuevaDieta,nuevasPreferencias,nuevaRutina,nuevasCondiciones);
	}

}


