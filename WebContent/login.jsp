<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
if(session.getAttribute("loginUsuario") != null){
	response.sendRedirect("index.jsp");
}else{
%>
<jsp:useBean id="beanLogin" class="ConexaoAtributos.Login" scope="page"></jsp:useBean>
<jsp:useBean id="beanLoginDP" class="ConexaoBO.LoginDP" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
  </head>
  <body>
  	<%
  	try {
  		String submit = request.getParameter("submit");
	  	if(submit != null){
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
	
			beanLogin.setLogin(login);
			beanLogin.setSenha(senha);
			
			if( beanLoginDP.logar(beanLogin) == true){
				byte[] encoded = Base64.encodeBase64(login.getBytes());
				session = request.getSession(true); 
				session.setMaxInactiveInterval(60*60*2);  
				session.setAttribute("loginUsuario",new String( encoded )); 
				response.sendRedirect("index.jsp");
			}else{
				response.sendRedirect("login.jsp?invalido");
			}
	  	}
	} catch (NumberFormatException n) {
		n.getMessage();
	}	
	%>
    <div class="container">
      <form class="form-signin" action="" method="POST">
        <h3 class="form-signin-heading">Login</h3>
        <label for="inputNome" class="sr-only">Nome</label>
        <input type="text" id="login" name="login" class="form-control" placeholder="Login" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Logar ªè</button>
      </form>
		<div id="alert" class="col-md-offset-5 col-sm-2 alert alert-danger fade in hidden">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Error!</strong><span id="alertResul"></span>
		</div>
    </div> 
  </body>
<script type='text/javascript' src='jquery/jquery-2.1.3.min.js'></script>
<script type="text/javascript" charset="%CHARSET%">
	var url   = window.location.href; 
	if(url.indexOf("?invalido") != -1){
		$('#alert').removeClass( "hidden" );
		$('#alertResul').html( " Login invalido!" );
	}
</script>  
</html>
<% 
}
%>
