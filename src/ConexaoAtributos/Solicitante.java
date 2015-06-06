package ConexaoAtributos;

public class Solicitante {

	int cod_solicitante;
	int cod_login;
	String nom_solicitante;
	String num_tel_solicitante;
	String email_solicitante;
	int cod_tipo;
	String dsc_tipo_fk;
	
	public String getDsc_tipo_fk() {
		return dsc_tipo_fk;
	}
	public void setDsc_tipo_fk(String dsc_tipo_fk) {
		this.dsc_tipo_fk = dsc_tipo_fk;
	}
	public int getCod_solicitante() {
		return cod_solicitante;
	}
	public void setCod_solicitante(int cod_solicitante) {
		this.cod_solicitante = cod_solicitante;
	}
	public int getCod_login() {
		return cod_login;
	}
	public void setCod_login(int cod_login) {
		this.cod_login = cod_login;
	}
	public String getNom_solicitante() {
		return nom_solicitante;
	}
	public void setNom_solicitante(String nom_solicitante) {
		this.nom_solicitante = nom_solicitante;
	}
	public String getNum_tel_solicitante() {
		return num_tel_solicitante;
	}
	public void setNum_tel_solicitante(String num_tel_solicitante) {
		this.num_tel_solicitante = num_tel_solicitante;
	}
	public String getEmail_solicitante() {
		return email_solicitante;
	}
	public void setEmail_solicitante(String email_solicitante) {
		this.email_solicitante = email_solicitante;
	}
	public int getCod_tipo() {
		return cod_tipo;
	}
	public void setCod_tipo(int cod_tipo) {
		this.cod_tipo = cod_tipo;
	}
	
}
