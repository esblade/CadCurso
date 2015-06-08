<%@page import="ConexaoAtributos.Solicitante"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<jsp:useBean id="beanLogin" class="ConexaoAtributos.Login" scope="page"></jsp:useBean>
<jsp:useBean id="beanLoginDP" class="ConexaoBO.LoginDP" scope="page"></jsp:useBean> 
<jsp:useBean id="beanSolicitante" class="ConexaoAtributos.Solicitante" scope="page"></jsp:useBean>
<jsp:useBean id="beanSolicitanteDP" class="ConexaoBO.SolicitanteDP" scope="page"></jsp:useBean>
<%
try {
	String id 	    		= request.getParameter("id");
	String solicitante  	= request.getParameter("codSolicitante");
	String codSolicitante	= "";
	if(solicitante != null){
		byte[] decodeCod		= Base64.decodeBase64(solicitante.getBytes());
		codSolicitante	= new String (decodeCod);
	}
	
	String action   = "";
	if(id != null){
		byte[] decodeId = Base64.decodeBase64(id);
		action   = new String (decodeId);
	}

	byte[] decode = Base64.decodeBase64(session.getAttribute("loginUsuario").toString().getBytes());
	String login  = new String (decode);
	beanLogin.setLogin(login);
	int login_ = beanLoginDP.logado(beanLogin);

	if(codSolicitante != ""){
		String cod_tipo			= request.getParameter("codTipo");
		String nome 			= request.getParameter("nome");
		String telefone 		= request.getParameter("telefone");
		String email 			= request.getParameter("email");
		
		beanSolicitante.setCod_solicitante(Integer.parseInt(codSolicitante));
		beanSolicitante.setCod_login(login_);
		beanSolicitante.setCod_tipo(Integer.parseInt(cod_tipo));
		beanSolicitante.setNom_solicitante(nome);
		beanSolicitante.setNum_tel_solicitante(telefone);
		beanSolicitante.setEmail_solicitante(email);
		
		if( beanSolicitanteDP.cadastrar(beanSolicitante) == true){
			out.print(true);
		}else{
			out.print(false);
		}
	}else if(action.contains("excluir")){
		String cod_solicitante = action.substring(action.indexOf("&codigo=")+8);
		
		beanSolicitante.setCod_solicitante(Integer.parseInt(cod_solicitante));
		
		if( beanSolicitanteDP.excluir(beanSolicitante) == true){
			out.print(true);
		}else{
			out.print(false);
		}
	}
} catch (NumberFormatException n) {
	n.getMessage();
}

%>
