package ConexaoBO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Conexao.Conexao;
import ConexaoAtributos.Solicitante;
import ConexaoAtributos.SolicitanteTipo;

public class SolicitanteDP {
	Conexao conn = new Conexao();
	
	public boolean cadastrar(Solicitante s) {
		PreparedStatement pstm;
		boolean cadastrado = false;
		String querySQL = null;
		try {
			if(s.getCod_solicitante() != 0){
				querySQL = "UPDATE tab_solicitante SET NOM_SOLICITANTE = ?, NUM_TEL_SOLICITANTE = ?, EMAIL_SOLICITANTE = ?, COD_TIPO = ? "
							+ "WHERE COD_SOLICITANTE = ?";
			}else{
				querySQL = "INSERT INTO tab_solicitante(NOM_SOLICITANTE, NUM_TEL_SOLICITANTE, EMAIL_SOLICITANTE, COD_TIPO, COD_LOGIN) "
							+ "VALUES (?, ?, ?, ?, ?)";
			}
			
			pstm = conn.getConect().prepareStatement(querySQL);
			pstm.setString(1, s.getNom_solicitante());
			pstm.setString(2, s.getNum_tel_solicitante());
			pstm.setString(3, s.getEmail_solicitante());
			pstm.setInt(4, s.getCod_tipo());
			if(s.getCod_solicitante() != 0){
				pstm.setInt(5, s.getCod_solicitante());
				int rs = pstm.executeUpdate();  
		        if(rs != 0){
		        	System.out.println("Solicitante alterado com sucesso!");
		        	cadastrado = true;
		        }else{
		        	System.out.println("Ocorreu um erro ao alterar!");
		        	cadastrado = false;
		        }
			}else{
				pstm.setInt(5, s.getCod_login());
				boolean rs = pstm.execute();  
		        if(rs != true){
		        	System.out.println("Solicitante cadastrado com sucesso!");
		        	cadastrado = true;
		        }else{
		        	System.out.println("Ocorreu um erro ao cadastrar!");
		        	cadastrado = false;
		        }	
			}
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cadastrado;
	}
	
	public List<Solicitante> listar(Solicitante cod_s, boolean busca){
		List<Solicitante> linhas = new ArrayList<Solicitante>(); 
		PreparedStatement pstm;
		String querySQL = null;
		
		try {
			if(busca == true){
				querySQL= "SELECT s.*, t.DSC_TIPO FROM tab_solicitante AS s INNER JOIN tab_solicitante_tipo AS t ON s.cod_tipo = t.cod_tipo WHERE COD_LOGIN = ? AND UPPER(NOM_SOLICITANTE) LIKE ?";
			}else if(cod_s.getCod_solicitante() != 0 && busca == false){
				querySQL= "SELECT s.*, t.DSC_TIPO FROM tab_solicitante AS s INNER JOIN tab_solicitante_tipo AS t ON s.cod_tipo = t.cod_tipo WHERE COD_LOGIN = ? AND COD_SOLICITANTE = ?";
			}else{
				querySQL= "SELECT s.*, t.DSC_TIPO FROM tab_solicitante AS s INNER JOIN tab_solicitante_tipo AS t ON s.cod_tipo = t.cod_tipo WHERE COD_LOGIN = ?";
			}
			
			pstm = conn.getConect().prepareStatement(querySQL);
			pstm.setInt(1, cod_s.getCod_login());
			if(busca == true){
				pstm.setString(2, "%" + cod_s.getNom_solicitante() + "%");
			}else if(cod_s.getCod_solicitante() != 0 && busca == false){
				pstm.setInt(2, cod_s.getCod_solicitante());
			}
			ResultSet rs = pstm.executeQuery();  
	        while(rs.next()){  
	        	Solicitante s = new Solicitante(); 
	        	s.setCod_solicitante(rs.getInt("cod_solicitante")); 
	        	s.setDsc_tipo_fk(rs.getString("dsc_tipo"));
	            s.setNom_solicitante(rs.getString("nom_solicitante"));
	            s.setNum_tel_solicitante(rs.getString("num_tel_solicitante"));
	            s.setEmail_solicitante(rs.getString("email_solicitante"));
	            s.setCod_tipo(rs.getInt("cod_tipo")); 
	            linhas.add(s);  
	         }  
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return linhas;
	}
	
	public List<SolicitanteTipo> Tipo(){
		List<SolicitanteTipo> linhas = new ArrayList<SolicitanteTipo>(); 
		PreparedStatement pstm;
		try {
			pstm = conn.getConect().prepareStatement(
					"SELECT * FROM tab_solicitante_tipo");
			ResultSet rs = pstm.executeQuery();  
	        while(rs.next()){  
	        	SolicitanteTipo t = new SolicitanteTipo(); 
	        	t.setCod_tipo(rs.getInt(1)); 
	            t.setDsc_tipo(rs.getString(2));  
	            linhas.add(t);  
	         }  
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return linhas;
	}
	
	public boolean excluir(Solicitante s){
		PreparedStatement pstm;
		boolean excluido = false;
		try {
			pstm = conn.getConect().prepareStatement(
					"DELETE FROM tab_solicitante WHERE COD_SOLICITANTE = ?");
			pstm.setInt(1, s.getCod_solicitante());
			boolean rs = pstm.execute();  
	        if(rs != true){
	        	System.out.println("Solicitante excluido com sucesso!");
	        	excluido = true;
	        }else{
	        	System.out.println("Ocorreu um erro ao excluir!");
	        	excluido = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return excluido;
	}
	
	public boolean alterar(Solicitante s){
		PreparedStatement pstm;
		boolean alterado = false;
		try {
			pstm = conn.getConect().prepareStatement(
					"UPDATE tab_solicitante SET COD_TIPO = ?, NOM_SOLICITANTE = ?, NUM_TEL_SOLICITANTE = ?, EMAIL_SOLICITANTE = ?"
					+ "WHERE COD_SOLICITANTE = ?");
			pstm.setInt(1, s.getCod_tipo());
			pstm.setString(2, s.getNom_solicitante());
			pstm.setString(3, s.getNum_tel_solicitante());
			pstm.setString(4, s.getEmail_solicitante());
			pstm.setInt(5, s.getCod_solicitante());
			int rs = pstm.executeUpdate();  
	        if(rs != 0){
	        	System.out.println("Solicitante alterado com sucesso!");
	        	alterado = true;
	        }else{
	        	System.out.println("Ocorreu um erro ao alterar!");
	        	alterado = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alterado;
	}
}
