package ConexaoBO;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import Conexao.Conexao;
import ConexaoAtributos.OrdemServico;
import ConexaoAtributos.Login;

public class ordemServicoDP {
	Conexao conn = new Conexao();
	Login l;

	public boolean cadastrar(OrdemServico os) {
		PreparedStatement pstm;
		boolean cadastrado = false;
		String querySQL = null;
		try {
			if (os.getCod_os() != 0) {
				querySQL = "UPDATE tab_os SET DSC_OS = ?, DAT_PRAZO = ?, DAT_DATA_OS = ?"
						+ "WHERE COD_SOLICITANTE = ?";
			} else {
				querySQL = "INSERT INTO tab_os(NOM_TITULO, DSC_OS, DAT_PRAZO, DAT_DATA_OS, DSC_STATUS_OS) "
						+ "VALUES (?, ?, ?, ?, ?)";
			}

			pstm = conn.getConect().prepareStatement(querySQL);
			pstm.setString(1, os.getNom_titulo());
			pstm.setString(2, os.getDsc_os());
			pstm.setDate(3, os.getDat_prazo());
			pstm.setDate(4, os.getDat_data_os());
			pstm.setString(5, os.getDsc_status_os());
			if (os.getCod_os() != 0) {
				pstm.setInt(6, os.getCod_os());
				int rs = pstm.executeUpdate();
				if (rs != 0) {
					System.out.println("O.S. alterado com sucesso!");
					cadastrado = true;
				} else {
					System.out.println("Ocorreu um erro ao alterar!");
					cadastrado = false;
				}
			} else {
				pstm.setInt(6, l.getCod_login());
				boolean rs = pstm.execute();
				if (rs != true) {
					System.out.println("Solicitante cadastrado com sucesso!");
					cadastrado = true;
				} else {
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
}