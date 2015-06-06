package ConexaoBO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conexao.Conexao;
import ConexaoAtributos.Login;
import ConexaoAtributos.Solicitante;
import ConexaoAtributos.SolicitanteTipo;

public class SolicitanteDP {
	Conexao conn = new Conexao();
	
	public boolean cadastrar(Solicitante s) {
		PreparedStatement pstm;
		boolean cadastrado = false;
		try {
			pstm = conn.getConect().prepareStatement(
					"INSERT INTO tab_solicitante(COD_LOGIN, NOM_SOLICITANTE, NUM_TEL_SOLICITANTE, EMAIL_SOLICITANTE, COD_TIPO) "
					+ "VALUES (?, ?, ?, ?, ?)");
			pstm.setInt(1, s.getCod_login());
			pstm.setString(2, s.getNom_solicitante());
			pstm.setString(3, s.getNum_tel_solicitante());
			pstm.setString(4, s.getEmail_solicitante());
			pstm.setInt(5, s.getCod_tipo());
			boolean rs = pstm.execute();  
	        if(rs != true){
	        	System.out.println("Solicitante cadastrado com sucesso!");
	        	cadastrado = true;
	        }else{
	        	System.out.println("Ocorreu um erro ao cadastrar!");
	        	cadastrado = false;
	        }
			pstm.close();
			conn.getConect().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cadastrado;
	}
	
	public List<Solicitante> listar(Login login){
		List<Solicitante> linhas = new ArrayList<Solicitante>(); 
		PreparedStatement pstm;
		try {
			pstm = conn.getConect().prepareStatement(
					"SELECT s.*, t.DSC_TIPO FROM tab_solicitante AS s INNER JOIN tab_solicitante_tipo AS t ON s.cod_tipo = t.cod_tipo WHERE COD_LOGIN = ?");
			pstm.setInt(1, login.getCod_login());
			ResultSet rs = pstm.executeQuery();  
	        while(rs.next()){  
	        	Solicitante s = new Solicitante(); 
	        	s.setCod_solicitante(rs.getInt("cod_solicitante")); 
	        	s.setDsc_tipo_fk(rs.getString("dsc_tipo"));
	            s.setNom_solicitante(rs.getString("nom_solicitante"));
	            s.setNum_tel_solicitante(rs.getString("num_tel_solicitante"));
	            s.setEmail_solicitante(rs.getString("email_solicitante"));
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
}
