package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	private Connection conn = null;

	public Connection getConect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bancocad", "root", "");
			//System.out.println("Conexão retornou sucesso ");
		} catch (ClassNotFoundException e) {
			System.out.println("Problemas para carregar a classe "+ e.getMessage());
		} catch (SQLException e) {
			System.out.println("Problemas na conexão " + e.getMessage());
		}
		return conn;
	}
}