<%@page import="ConexaoAtributos.Solicitante"%>
<%@page import="java.util.List"%>
<%@page import="ConexaoAtributos.Login"%>
<%@page import="ConexaoBO.SolicitanteDP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta charset="ISO-8859-1">
<div id="divPainelList">
<div class="panel panel-info">
  <div class="panel-heading">
	<h2>Listar Cursos</h2>
  </div>
  <div class="panel-body">
	<div class="col-sm-12">
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
		Login l = new Login(); 
		SolicitanteDP d = new SolicitanteDP();
		l.setCod_login(124);
		List<Solicitante> lista = d.listar(l);
	 	for(int i = 0; i < lista.size(); i++) {  
	 		Solicitante linhaLocal = (Solicitante) lista.get(i);  
	 		%> 
	 		<tr role="row" class="odd" id="<%=linhaLocal.getCod_login()%>">
				<td style="text-align: center;" id="nome"><%=linhaLocal.getNom_solicitante()%></td>
				<td style="text-align: center;" id="telefone"><%=linhaLocal.getNum_tel_solicitante()%></td>
				<td style="text-align: center;" id="email"><%=linhaLocal.getEmail_solicitante()%></td>
				<td style="text-align: center;" id="tipo"><%=linhaLocal.getDsc_tipo_fk()%></td>
				<td style="text-align: center;"><a href="javascript:alterar('#?acao=alterar&codigo=');" data-toggle="tooltip" data-trigger="click hover" data-animation="true" data-title="Editar"><i class="glyphicon glyphicon-pencil"></i></a></td>
				<td style="text-align: center;"><a href="javascript:remover();" data-toggle="tooltip" data-trigger="click hover" data-animation="true" data-title="Excluir"><i class="glyphicon glyphicon-remove"></i></a></td>
			</tr>
			<%
	 	}  
		%> 
	</tbody>
</table>
	</div>
	</div>
  </div>
	<div id="divSucessID" class="alert alert-danger hidden" role="alert">
	  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
	  <span id="divHelpSucessID"></span>
	</div> 
</div>
</div>

<script type="text/javascript" charset="%CHARSET%">
function remover(codigo){
	$.ajax({
		type:	"GET", 
		url:	"LisCurso.php?codigo=" + codigo, /** #Servlet **/
		success: function(html) {
			$("#" + codigo).html("");
			$("#divSucessID").removeClass("hidden");
			$("#divHelpSucessID").html("<b>Curso removido com sucesso.</b>");
		},
		error:function (){
			$("#divSucessID").removeClass("hidden");
			$("#divHelpSucessID").html("<b>Ocorreu um erro ao remover o curso.</b>");
		}
	});
}

function alterar(codigo){
	window.location.assign(codigo);
	$('#divPainelList').load( "addCurso.html" );
}
</script>
