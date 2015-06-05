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
		try {
			pstm = conn.getConect().prepareStatement(
					"INSERT INTO tab_solicitante(COD_LOGIN, NOM_SOLICITANTE, NUM_TEL_SOLICITANTE, EMAIL_SOLICITANTE, TIPO_SOLICITANTE) "
					+ "VALUES (?, ?, ?, ?, ?)");
			pstm.setInt(1, s.getCod_login());
			pstm.setString(2, s.getNom_solicitante());
			pstm.setString(3, s.getNum_tel_solicitante());
			pstm.setString(4, s.getEmail_solicitante());
			pstm.setInt(5, s.getTipo_solicitante());
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
	
	public List<SolicitanteTipo> Tipo(){
		List<SolicitanteTipo> linhas = new ArrayList<SolicitanteTipo>(); 
		PreparedStatement pstm;
		try {
			pstm = conn.getConect().prepareStatement(
					"SELECT * FROM tab_solicitante_tipo");
			ResultSet rs = pstm.executeQuery();  
	        while(rs.next()){  
	        	SolicitanteTipo t = new SolicitanteTipo();  
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
