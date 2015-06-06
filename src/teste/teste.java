package teste;

import java.util.List;

import ConexaoAtributos.Login;
import ConexaoAtributos.Solicitante;
import ConexaoAtributos.SolicitanteTipo;
import ConexaoBO.ClienteDP;
import ConexaoBO.LoginDP;
import ConexaoBO.SolicitanteDP;

/**
 * @author Rafael
 *
 */
public class teste { 
	
	public static void main(String []args){
		//new ClienteDP().inserir(13,"Rafael");
		//new ClienteDP().inserir(14,"de souza".toUpperCase());
		//new ClienteDP().inserir(15,"santana".toUpperCase());
		//new ClienteDP().remover(14);
		//new ClienteDP().remover(13);
		//new ClienteDP().remover(15);
		//new ClienteDP().listar();
		
		 /*SolicitanteDP d = new SolicitanteDP();
		
		 List<SolicitanteTipo> tipos = d.Tipo();
	 	 for(int i = 0; i < tipos.size(); i++) {  
	 		SolicitanteTipo linhaLocal = (SolicitanteTipo) tipos.get(i);  
			System.out.println(linhaLocal.getDsc_tipo());
	 	 }*/
		
		Login l = new Login(); 
		SolicitanteDP d = new SolicitanteDP();
		l.setCod_login(124);
		List<Solicitante> lista = d.listar(l);
	 	for(int i = 0; i < lista.size(); i++) {  
	 		Solicitante linhaLocal = (Solicitante) lista.get(i);  
	 		System.out.println(linhaLocal.getNom_solicitante());
	 	}
	} 
}