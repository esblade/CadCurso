package ConexaoAtributos;

import java.sql.Date;

public class Reserva {
	int Cod_Cliente;
	int Cod_Curso;
	Date Dat_Reserva;
	String Des_Obs;
	
	public int getCod_Cliente() {
		return Cod_Cliente;
	}
	public void setCod_Cliente(int cod_Cliente) {
		Cod_Cliente = cod_Cliente;
	}
	public int getCod_Curso() {
		return Cod_Curso;
	}
	public void setCod_Curso(int cod_Curso) {
		Cod_Curso = cod_Curso;
	}
	public Date getDat_Reserva() {
		return Dat_Reserva;
	}
	public void setDat_Reserva(Date dat_Reserva) {
		Dat_Reserva = dat_Reserva;
	}
	public String getDes_Obs() {
		return Des_Obs;
	}
	public void setDes_Obs(String des_Obs) {
		Des_Obs = des_Obs;
	}

}
