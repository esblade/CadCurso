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
	
	public boolean forget(Login l){
		PreparedStatement pstm;
		boolean existe = false;
		try {
			pstm = conn.getConect().prepareStatement(
					"SELECT * FROM tab_login WHERE email = (?)");
			pstm.setString(1, l.getEmail());
			ResultSet rs = pstm.executeQuery();  
	        boolean retorno = rs.next(); 
	        if(retorno == true){
	        	System.out.println("Email existente!");
	        	existe = true;
	        }else{
	        	System.out.println("Email invalido!");
	        	existe = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return existe;
	}
	
	public boolean newSenha(Login l){
		PreparedStatement pstm;
		boolean alterada = false;
		System.out.println(l.getEmail() + l.getSenha());
		try {
			pstm = conn.getConect().prepareStatement(
					"UPDATE tab_login SET SENHA = md5(?) WHERE EMAIL = ?");
			pstm.setString(1, l.getSenha());
			pstm.setString(2, l.getEmail());
			int rs = pstm.executeUpdate(); 
			
	        if(rs == 1){
	        	System.out.println("Senha alterada com sucesso!");
	        	alterada = true;
	        }else{
	        	System.out.println("Erro ao alterar a senha!");
	        	alterada = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alterada;
	}
}
