package ConexaoBO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Conexao.Conexao;
import ConexaoAtributos.Login;

public class LoginDP {
	Conexao conn = new Conexao();
	
	public boolean logar(Login l) {
		PreparedStatement pstm;
		boolean logado = false;
		try {
			pstm = conn.getConect().prepareStatement(
					"SELECT * FROM tab_login WHERE login = (?) AND senha = md5(?)");
			pstm.setString(1, l.getLogin());
			pstm.setString(2, l.getSenha());
			ResultSet rs = pstm.executeQuery();  
	        boolean retorno = rs.next(); 
	        if(retorno == true){
	        	System.out.println("Logado com sucesso!");
	        	logado = true;
	        }else{
	        	System.out.println("Login invalido!");
	        	logado = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logado;
	}
}
