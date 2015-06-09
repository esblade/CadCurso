package teste;

import java.util.List;

import ConexaoAtributos.Login;
import ConexaoAtributos.Solicitante;
import ConexaoAtributos.SolicitanteTipo;
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
		
		/** Lista combobox **/
		 /*SolicitanteDP d = new SolicitanteDP();
		
		 List<SolicitanteTipo> tipos = d.Tipo();
	 	 for(int i = 0; i < tipos.size(); i++) {  
	 		SolicitanteTipo linhaLocal = (SolicitanteTipo) tipos.get(i);  
			System.out.println(linhaLocal.getDsc_tipo());
	 	 }*/
		
		/** Listar **/
		/*Login l = new Login(); 
		SolicitanteDP d = new SolicitanteDP();
		l.setCod_login(124);
		Solicitante s = new Solicitante();
		s.setCod_solicitante(64);
		List<Solicitante> lista = d.listar(l, s);
	 	for(int i = 0; i < lista.size(); i++) {  
	 		Solicitante linhaLocal = (Solicitante) lista.get(i);  
	 		System.out.println(linhaLocal.getNom_solicitante());
	 	}*/
		
		
		/** Excluir **/
		/*SolicitanteDP d = new SolicitanteDP();
		Solicitante s = new Solicitante();
		s.setCod_solicitante(16);
		d.excluir(s);*/
		
		/** Alterar **/
		/*SolicitanteDP d = new SolicitanteDP();
		Solicitante s = new Solicitante();
		s.setCod_solicitante(17);
		s.setCod_tipo(2);
		s.setNom_solicitante("Alterado 1");
		s.setNum_tel_solicitante("Tel 2");
		s.setEmail_solicitante("Email 3");
		d.alterar(s);*/
		
		SolicitanteDP d = new SolicitanteDP();
		Solicitante s = new Solicitante();
		s.setNom_solicitante("Alterado 1 - Alt");
		s.setCod_login(124);
		List<Solicitante> lista = d.listar(s, true);
	 	for(int i = 0; i < lista.size(); i++) {  
	 		Solicitante linhaLocal = (Solicitante) lista.get(i);  
	 		System.out.println(linhaLocal.getNom_solicitante());
	 	}
	}
}