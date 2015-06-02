package ConexaoAtributos;

public class Cliente {
	int Cod_Cliente;
	String Nom_Cliente;
	
	public int getCod_Cliente() {
		return this.Cod_Cliente;
	}
	public void setCod_Cliente(int cod_Cliente) {
		this.Cod_Cliente = cod_Cliente;
	}
	public String getNom_Cliente() {
		return  this.Nom_Cliente;
	}
	public void setNom_Cliente(String nom_Cliente) {
		 this.Nom_Cliente = nom_Cliente;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (Cod_Cliente != other.Cod_Cliente)
			return false;
		if (Nom_Cliente == null) {
			if (other.Nom_Cliente != null)
				return false;
		} else if (!Nom_Cliente.equals(other.Nom_Cliente))
			return false;
		return true;
	}
}