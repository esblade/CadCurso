<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="ConexaoAtributos.Solicitante"%>
<%@page import="java.util.List"%>
<%@page import="ConexaoAtributos.Login"%>
<%@page import="ConexaoBO.SolicitanteDP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="beanLogin" class="ConexaoAtributos.Login" scope="page"></jsp:useBean>
<jsp:useBean id="beanLoginDP" class="ConexaoBO.LoginDP" scope="page"></jsp:useBean>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<div id="divPainelList">
<div class="panel panel-info">
  <div class="panel-heading">
	<h2>Listar Cursos</h2>
  </div>
<div class="panel-body">
  <div class="col-sm-12">
  <form id="FormID" id="buscaID" class="form-horizontal">
			<div class="row">
			  <div class="col-md-12">
  			    <div class="form-group col-sm-12" id="divNomeID">
			      <label for="nomeID" class="col-xs-12 col-sm-3 control-label">Nome</label>
			      <div class="input-group col-sm-5 pull-left">
			      	 <span class="input-group-addon"><i class="glyphicon glyphicon-copyright-mark"></i></span>
				 	 <input type="text" class="form-control" id="nomeID" name="nome" placeholder="Nome" aria-describedby="basic-addon1" onKeyup="digitado(event)" required>
			      </div>
				</div>
			  </div>
			  <!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
			
			<br />
			<div class="clearfix form-actions">
				<label class="col-sm-4 control-label"> </label>
				<button type="submit" class="btn btn-primary" id="submit">
					Pesquisar
				</button>
				<button type="button" class="btn btn-warning" id="cancel"
					onclick="javascript:window.location='./';">
					Voltar
				</button>
			</div>
			<br />
   <div>
<table id="GCliID" class="table table-condensed table-hover table-striped table-bordered bootstrap-datatable datatable display  dataTable no-footer" role="grid" aria-describedby="GCliID_info">
	<thead>
	<tr role="row">
		<th style="width:20%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">NOME</th>
		<th style="width:10%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">TELEFONE</th>
		<th style="width:15%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">EMAIL</th>
		<th style="width:10%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">TIPO</th>
		<th style="width:5%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">EDITAR</th>
		<th style="width:5%; text-align:center;" class="sorting" tabindex="0" aria-controls="GCliID" rowspan="1" colspan="1">REMOVER</th>
	</tr>
	</thead>
	<tbody>
		<% 
		
		byte[] decode = Base64.decodeBase64(session.getAttribute("loginUsuario").toString().getBytes());
		String login = new String (decode);
		beanLogin.setLogin(login);
		int login_ = beanLoginDP.logado(beanLogin);
		
		SolicitanteDP d = new SolicitanteDP();
		Solicitante s   = new Solicitante();
		// Valor 0 lista todos - outros valores captura para o alterar
		s.setCod_solicitante(0);
		s.setCod_login(login_);
		String nome 	= request.getParameter("nome");
		
		// Busca true habilita busca por nome
		boolean buscar  = false;
		if(nome != null){
			s.setNom_solicitante(nome);
			buscar = true;
		}

		List<Solicitante> lista = d.listar(s, buscar);
	 	for(int i = 0; i < lista.size(); i++) {  
	 		Solicitante linhaLocal = (Solicitante) lista.get(i); 
			
			byte[] encodedAlt = Base64.encodeBase64(String.valueOf("#?acao=alterar&codigo=" + linhaLocal.getCod_solicitante()).getBytes());
			String alt = new String (encodedAlt);
			
			byte[] encodedExc = Base64.encodeBase64(String.valueOf("#?acao=excluir&codigo=" + linhaLocal.getCod_solicitante()).getBytes());
			String exc = new String (encodedExc);
	 		%> 
	 		<tr role="row" class="odd" id="<%=exc%>">
				<td style="text-align: center;" id="nome"><%=linhaLocal.getNom_solicitante()%></td>
				<td style="text-align: center;" id="telefone"><%=linhaLocal.getNum_tel_solicitante()%></td>
				<td style="text-align: center;" id="email"><%=linhaLocal.getEmail_solicitante()%></td>
				<td style="text-align: center;" id="tipo"><%=linhaLocal.getDsc_tipo_fk()%></td>
				<td style="text-align: center;"><a href="javascript:alterar('<%=alt%>');" data-toggle="tooltip" data-trigger="click hover" data-animation="true" data-title="Editar"><i class="glyphicon glyphicon-pencil"></i></a></td>
				<td style="text-align: center;"><a href="javascript:excluir('<%=exc%>');" data-toggle="tooltip" data-trigger="click hover" data-animation="true" data-title="Excluir"><i class="glyphicon glyphicon-remove"></i></a></td>
			</tr>
			<%
	 	}  
		%> 
	</tbody>
</table>
	</div>
	</form>
	</div>
  </div>
	<div id="divSucessID" class="alert alert-danger hidden" role="alert">
	  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
	  <span id="divHelpSucessID"></span>
	</div> 
</div>
</div>

<script type="text/javascript" charset="%CHARSET%">
$('#FormID').submit(function(e) {
	var nome = $('#FormID').serialize();
	$('#divPainelList').load( "solicitanteLis.jsp", nome );
	return false; 
});

function excluir(codigo){
	$.ajax({
		type:	"GET", 
		url:	"solicitanteDP.jsp?id=" + codigo,
		success: function(resultado) {
			if(resultado.match(/true/)){
				$("#" + codigo).html("");
				$("#divSucessID").removeClass("hidden");
				$("#divHelpSucessID").html("<b>Solicitante removido com sucesso.</b>");
			}else if(resultado.match(/true/)){
				$("#divSucessID").removeClass("hidden");
				$("#divHelpSucessID").html("<b>Ocorreu um erro ao remover o solicitante.</b>");
			}
		},
		error:function (){
			$("#divSucessID").removeClass("hidden");
			$("#divHelpSucessID").html("<b>Ocorreu um erro ao remover o solicitante.</b>");
		}
	});
}

function alterar(codigo){
	window.location.assign("#?id=" + codigo);
    $('#divPainelList').load( "solicitanteCad.jsp" );
}
</script>
