package ConexaoAtributos;

import java.sql.Date;

public class OrdemServico {
	private int cod_os;
	private String nom_titulo;
	private String dsc_os;
	private Date dat_prazo;
	private Date dat_data_os;
	private String dsc_status_os;
	
	public int getCod_os() {
		return cod_os;
	}
	public void setCod_os(int cod_os) {
		this.cod_os = cod_os;
	}
	public String getNom_titulo() {
		return nom_titulo;
	}
	public void setNom_titulo(String nom_titulo) {
		this.nom_titulo = nom_titulo;
	}
	public String getDsc_os() {
		return dsc_os;
	}
	public void setDsc_os(String dsc_os) {
		this.dsc_os = dsc_os;
	}
	public Date getDat_prazo() {
		return dat_prazo;
	}
	public void setDat_prazo(Date dat_prazo) {
		this.dat_prazo = dat_prazo;
	}
	public Date getDat_data_os() {
		return dat_data_os;
	}
	public void setDat_data_os(Date dat_data_os) {
		this.dat_data_os = dat_data_os;
	}
	public String getDsc_status_os() {
		return dsc_status_os;
	}
	public void setDsc_status_os(String dsc_status_os) {
		this.dsc_status_os = dsc_status_os;
	}
}