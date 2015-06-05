package ConexaoAtributos;

public class Login {
	int cod_login;
	String login;
	String senha;
	String email;
	
	public int getCod_login() {
		return cod_login;
	}
	public void setCod_login(int cod_login) {
		this.cod_login = cod_login;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}