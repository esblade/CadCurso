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
    <script type='text/javascript' src='jquery/jquery-2.1.3.min.js'></script>
  </head>
  <%
  	try {
  		String submit 	 = request.getParameter("submit");
  		String forget	 = request.getParameter("submitForget");
  		String newLogin  = request.getParameter("submitNewLogin");
  		String cadastrar = request.getParameter("submitCadastrar");

	  	
  		if(cadastrar != null){
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
	
			beanLogin.setEmail(email);
			beanLogin.setLogin(login);
			beanLogin.setSenha(senha);
			
			if( beanLoginDP.cadastrar(beanLogin) == true){
				response.sendRedirect("index.jsp");
			}else{
				response.sendRedirect("login.jsp?cadInvalido");
			}
	  	}else if(submit != null){
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
	  	}else if(forget != null){
	  		String email = request.getParameter("email");
	  		
			beanLogin.setEmail(email);

			if( beanLoginDP.forget(beanLogin) == true){
				response.sendRedirect("login.jsp?newLogin&email=" + email);
			}else{
				response.sendRedirect("login.jsp?emailinvalido");
			}
	  	}else if(newLogin != null){
	  		String email  = request.getParameter("email");
			String senha  = request.getParameter("senha");
	  		String senha2 = request.getParameter("senha2");
			log(email);
	  		if (senha.equals(senha2) == true){
	  			beanLogin.setEmail(email);
	  			beanLogin.setSenha(senha);
				
				if( beanLoginDP.newSenha(beanLogin) == true){
					response.sendRedirect("login.jsp");
				}else{
					response.sendRedirect("login.jsp?erroSenha");
				}
	  		}else{
	  			response.sendRedirect("login.jsp?erroSenha");
	  		}
	  	}
	} catch (NumberFormatException n) {
		n.getMessage();
	}	
	%>
  <body>
    <div class="container">
      
	  <!-- Logar -->
      <form id="logar" class="form-signin" action="" method="POST">
        <h3 class="form-signin-heading">Login</h3>
        <label for="inputNome">Nome</label>
        <input type="text" id="login" name="login" class="form-control" placeholder="Login" required autofocus>
        <label for="inputPassword">Senha</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
        <label><a href="?forget" id="forget" class="text" tabindex="5">Esqueceu a senha?</a></label>
        <button class="btn btn-lg btn-success btn-block" type="submit" name="submit">Logar ªè</button>
        <a href="?cadastrar" id="cadastrar" name="cadastrar" class="btn btn-lg btn-primary btn-block">Registrar ªè</a>
      </form>
      <!-- Cadastrar -->
      <form id="cadastrarDP" class="form-signin hidden" action="" method="POST">
        <h3 class="form-signin-heading">Login</h3>
        <label for="inputNome">Email</label>
        <input type="text" id="email" name="email" class="form-control" placeholder="Email" required autofocus>
        <label for="inputNome">Nome</label>
        <input type="text" id="login" name="login" class="form-control" placeholder="Login" required>
        <label for="inputPassword">Senha</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
        <button class="btn btn-lg btn-success btn-block" type="submit" name="submitCadastrar">Cadastrar ªè</button>
      </form>
      <!-- Recuperar Senha -->
      <form id="forgetDP" class="form-signin hidden" action="" method="POST">
        <h3 class="form-signin-heading">Recuperar</h3>
        <label for="inputNome">Email</label>
        <input type="text" id="email" name="email" class="form-control" placeholder="email" required autofocus>
        <label></label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submitForget">Recuperar ªè</button>
      </form>
      <!-- Nova Senha -->
      <form id="newLogin" class="form-signin hidden" action="" method="POST">
        <h3 class="form-signin-heading">Recuperar</h3>
        <label for="inputPassword">Senha</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
        <label for="inputPassword">Confirmar senha</label>
        <input type="password" id="senha2" name="senha2" class="form-control" placeholder="Confirmar senha" required>
        <input type="hidden" id="email" name="email" value="">
        <label></label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submitNewLogin">Nova Senha ªè</button>
      </form>
      <ul class="form-signin pager">
	    <li class="previous"><a href="./"><span aria-hidden="true">&larr;</span> Voltar</a></li>
	  </ul>
	  
		<div id="alert" class="col-md-offset-5 col-sm-2 alert alert-danger fade in hidden">
			<strong>Error!</strong><span id="alertResul"></span>
		</div>
    </div> 
  </body>
<script type="text/javascript" charset="%CHARSET%">
	function getUrlVars()
	{
	    var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++)
	    {
	        hash = hashes[i].split('=');
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
	}
	
	var url   = window.location.href;
	if(url.indexOf("?cadastrar") != -1){
		$('#logar').addClass( "hidden" );
		$('#cadastrarDP').removeClass( "hidden" );
	}
	if(url.indexOf("?invalido") != -1){
		$('#alert').removeClass( "hidden" );
		$('#alertResul').html( " Login invalido!" );
	}
	if(url.indexOf("?cadInvalido") != -1){
		$('#logar').addClass( "hidden" );
		$('#cadastrarDP').removeClass( "hidden" );
		$('#alert').removeClass( "hidden" );
		$('#alertResul').html( " Erro ao cadastrar!" );
	}
	if(url.indexOf("?forget") != -1){
		$('#logar').addClass( "hidden" );
		$('#forgetDP').removeClass( "hidden" );
	}
	if(url.indexOf("?emailinvalido") != -1){
		$('#logar').addClass( "hidden" );
		$('#forgetDP').removeClass( "hidden" );
		$('#alert').removeClass( "hidden" );
		$('#alertResul').html( " Email invalido!" );
	}
	if(url.indexOf("?erroSenha") != -1){
		$('#logar').addClass( "hidden" );
		$('#forgetDP').addClass( "hidden" );
		$('#newLogin').removeClass( "hidden" );
		
		$('#alert').removeClass( "hidden" );
		$('#alertResul').html( " Senhas n„o correspondem ou ocorreu um erro!" );
	}
	if(url.indexOf("?newLogin") != -1){
		$('#logar').addClass( "hidden" );
		$('#forgetDP').addClass( "hidden" );
		$('#newLogin').removeClass( "hidden" );
		$('input[name=email]').val( getUrlVars()["email"] );
	}
</script>  
</html>
<% 
}
%>
