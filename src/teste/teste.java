package teste;

import ConexaoBO.ClienteDP;

/**
 * @author Rafael
 *
 */
public class teste { 
	
	public static void main(String []args){
		//new ClienteDP().inserir(13,"Rafael");
		new ClienteDP().inserir(14,"de souza".toUpperCase());
		new ClienteDP().inserir(15,"santana".toUpperCase());
		//new ClienteDP().remover(14);
		//new ClienteDP().remover(13);
		//new ClienteDP().remover(15);
		new ClienteDP().listar();
	} 
}