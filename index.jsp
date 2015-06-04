<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(session.getAttribute("loginUsuario") == null){
	response.sendRedirect("login.jsp");
}else{
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
	<script>
	$(document).ready(function(){	
		$("#idCliente").click( function() {
			$('#idPage1').addClass( "active" );
			$('#home').removeClass( "active" );
	        $('#jumbotron').addClass( "hidden" );
	        $('#conteudo').load( "cliente.jsp" );
		});
	
		var url   = window.location.hash; 
		if(url.indexOf("alterar")!=-1){
			$('#jumbotron').addClass( "hidden" );
			$('#GCliID').addClass( "hidden" );
			$('#conteudo').load( "addInfo.html" );
		}else if(url.indexOf("cliente")!=-1){
			$('#idPage1').addClass( "active" );
			$('#home').removeClass( "active" );
	        $('#jumbotron').addClass( "hidden" );
	        $('#conteudo').load( "cliente.jsp" );
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
            <li id="idPage1"><a href="#cliente" id="idCliente">Cliente</a></li>
            <li id="idPage2"><a href="#curso" id="idCurso">Services</a></li>
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
  </body>
</html>
<% 
}
%>