package clases;

public class Usuario {
	private String name;
	private String mail;
	private String password1;
	private String password2;

	public Usuario(String nombre, String email, String contrase�a1, String contrase�a2)
	{
		setName(nombre);
		setMail(email);
		setPassword(contrase�a1);
		setPassword2(contrase�a2);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword(String password) {
		this.password1 = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
}