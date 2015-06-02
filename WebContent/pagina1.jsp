<%@page import="Conexao.Conexao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="beanClienteDP" class="ConexaoBO.ClienteDP" scope="page"></jsp:useBean>
<jsp:useBean id="beanCliente" class="ConexaoAtributos.Cliente" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Cliente</title>
</head>
<body>
	<%
		try {
			String nome = request.getParameter("txtnome");
			int c = Integer.parseInt((String) request.getParameter("txtcod"));

			beanCliente.setCod_Cliente(c);
			beanCliente.setNom_Cliente(nome);

			out.println("<br>");
			beanClienteDP.inserir(beanCliente.getCod_Cliente(),	beanCliente.getNom_Cliente());			
			out.println("<h3>Cliente cadastrado.</h3><br><br>");
		} catch (NumberFormatException n) {
			n.getMessage();
		}
	%>
	<h1>Cadastrar Cliente</h1>
	<form method="post" class="navbar-form navbar-left">
		<div class="form-group">
			<h3>Código:</h3>
			<input type="text" class="form-control" name="txtcod"><br>
			<h3>Nome:</h3>
			<input type="text" class="form-control" name="txtnome"><br>
		</div>
		<button type="submit" class="btn btn-default">Cadastrar Cliente</button><br><br><br>
	</form>
</body>
</html>