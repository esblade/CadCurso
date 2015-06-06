<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="beanLogin" class="ConexaoAtributos.Login" scope="page"></jsp:useBean>
<jsp:useBean id="beanLoginDP" class="ConexaoBO.LoginDP" scope="page"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(session.getAttribute("loginUsuario") == null){
	response.sendRedirect("login.jsp");
}else{
byte[] decode = Base64.decodeBase64(session.getAttribute("loginUsuario").toString().getBytes());
String login = new String (decode);
beanLogin.setLogin(login);
int login_ = beanLoginDP.logado(beanLogin);
%>
<html lang="pt">
  <head>
    <meta name="charset" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Justified Nav Template for Bootstrap</title>

    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/justified-nav.css" rel="stylesheet">
    <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>
    <script type='text/javascript' src='jquery/jquery-2.1.3.min.js'></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
	<script src="http://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
	<script>
	$(document).ready(function(){	
		$("#idCliente").click( function() {
			//# Desmarca os botoes de navegacao
			$("li").each(function () {
		        $(this).removeClass( "active" );
		    });
			$('#idPage1').addClass( "active" );
	        $('#jumbotron').addClass( "hidden" );
	        $('#conteudo').load( "cliente.jsp" );
		});
		$("#idSolicitanteCad").click( function() {
			//# Desmarca os botoes de navegacao
			$("li").each(function () {
		        $(this).removeClass( "active" );
		    });
			$('#idPage2').addClass( "active" );
	        $('#jumbotron').addClass( "hidden" );
	        $('#conteudo').load( "solicitanteCad.jsp" );
		});
		$("#idSolicitanteLis").click( function() {
			//# Desmarca os botoes de navegacao
			$("li").each(function () {
		        $(this).removeClass( "active" );
		    });
			$('#idPage2').addClass( "active" );
	        $('#jumbotron').addClass( "hidden" );
	        $('#conteudo').load( "solicitanteLis.jsp" );
		});
	
		var url   = window.location.hash; 
		if(url.indexOf("alterar")!=-1){
			$('#jumbotron').addClass( "hidden" );
			$('#GCliID').addClass( "hidden" );
			$('#conteudo').load( "addInfo.html" );
		}
	});
	</script>
  </head>

  <body>
    <div class="container">
      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active" id="home"><a href="./">Home</a></li>
            <li id="idPage1"><a href="#" id="idCliente">Cliente</a></li>
            <li id="idPage2">
		      <a href="" data-toggle="dropdown" aria-expanded="false">Solicitante <span class="caret"></span></a>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#" id="idSolicitanteCad">Cadastrar</a></li>
		        <li><a href="#" id="idSolicitanteLis">Listar</a></li>
		        <li><a href="#">Pesquisar</a></li>
		      </ul>
		    </li>
            <li id="idPage3"><a href="#" id="idCurso">Services</a></li>
            <li><a href="#">Downloads</a></li>
            <li><a href="#">About</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </nav>
        <br />
        <div id='conteudo'></div>
      </div>
	  	
      <div class="jumbotron" id="jumbotron">
        <h1>Marketing stuff!</h1>
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Get started today</a></p>
      </div>
      
      <footer class="footer">
        <p>&copy; Developed by Jalon - Rafael - Romy | 2015</p>
      </footer>

    </div>

    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
<% 
}
%>