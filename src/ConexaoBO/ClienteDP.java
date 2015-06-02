package ConexaoBO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Conexao.Conexao;
import ConexaoAtributos.Cliente;

public class ClienteDP {
	private List<Cliente> cliente = new ArrayList<Cliente>();
	Conexao conn = new Conexao();
	private PreparedStatement ptmt = null;
	
	public void inserir(int cod, String n) {
		PreparedStatement pstm;
		try {
			pstm = conn.getConect().prepareStatement(
					"INSERT INTO cliente(cod_cliente, nm_cliente) values(?,?)");
			pstm.setInt(1, cod);
			pstm.setString(2, n);
			
			pstm.execute();
			System.out.println("Cadastro executado com sucesso!");
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void listar() {
		Statement stmt;
		try {
			stmt = conn.getConect().createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from cliente order by cod_cliente asc");
			Cliente temp;
			while (rs.next()) {
				temp = new Cliente();
				temp.setCod_Cliente(rs.getInt("cod_cLiente"));
				temp.setNom_Cliente(rs.getString("nm_cliente"));
				cliente.add(temp);
				System.out.println("-----Cliente----- \n" + "Código: "
						+ temp.getCod_Cliente() + "\n" + "Nome:"
						+ temp.getNom_Cliente() + "\n"
						+ "--------------------------");
			}if(cliente.isEmpty())
			System.err.println("Banco de dados Vazio!".toUpperCase());
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void remover(int cod) {
		try {
			ptmt = conn.getConect().prepareStatement(
					"DELETE FROM `bancocad`.`cliente` WHERE `cliente`.`cod_cliente` = "
							+ cod);
			System.out.println("Cliente removido com sucesso.");
			ptmt .execute();
			ptmt .close();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException n){
			n.getMessage();
		}
	}

	public void atualizar(String n, int cod) {
		PreparedStatement ptmt = null;
		try {
			ptmt = conn.getConect().prepareStatement("UPDATE cliente SET nm_cliente" + "=" + "'" + n + "'"+ " WHERE nm_cliente =" + cod);
			System.out.println("Cadastro atualizado com sucesso.");
			ptmt.execute();
			ptmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}