<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="ConexaoAtributos.SolicitanteTipo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="beanSolicitanteDP" class="ConexaoBO.SolicitanteDP" scope="page"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<div class="panel panel-info">
  <div class="panel-heading">
	<h2>Adicionar Solicitante</h2>
  </div>
  <div class="panel-body">
	<div class="col-sm-12">
		<form id="FormID" name="forms" method="POST" class="form-horizontal">
		<input type="hidden" id="codSolicitanteID" name="codSolicitante" value="MA==">
			<div class="row">
			  <!-- /.col-lg-6 -->
			  <div class="col-sm-6">
			    <div class="form-group col-sm-12" id="divNomeID">
			      <label for="nomeID" class="col-sm-3 control-label">Nome</label>
			      <div class="input-group col-sm-8 pull-left">
			      	 <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
				 	 <input type="text" class="form-control" id="nomeID" name="nome" placeholder="Nome">
			      </div>
				</div>
				<div class="form-group col-sm-12" id="divEmailID">
			      <label for="nomeID" class="col-sm-3 control-label">Email</label>
			      <div class="input-group col-sm-8 pull-left">
			      	 <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
				 	 <input type="text" class="form-control" id="emailID" name="email" placeholder="Email">
			      </div>
				</div>
			  </div>
			  <!-- /.col-lg-6 -->
			  <div class="col-sm-6">
			    <div class="form-group col-sm-12" id="divTelefoneID">
			      <label for="nomeID" class="col-sm-3 control-label">Telefone</label>
			      <div class="input-group col-sm-8 pull-left">
			      	 <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
				 	 <input type="text" class="form-control" id="telefoneID" name="telefone" placeholder="Telefone">
			      </div>
				</div>
				<div class="form-group col-sm-12" id="divCodTipoID">
					<label for="codTipoID" class="col-xs-12 col-sm-3 control-label">Tipo</label>
					<div class="input-group col-sm-8 pull-left">
			      	 	<span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
						<select id="codTipoID" name="codTipo" class="select2" data-placeholder="Selecione o tipo solicitante">
							<option></option> 
							<%  
							 List<SolicitanteTipo> tipos = beanSolicitanteDP.Tipo();
						 	 for(int i = 0; i < tipos.size(); i++) {  
						 		SolicitanteTipo linhaLocal = tipos.get(i);  
							%> 
							<option value=<%=linhaLocal.getCod_tipo()%>> <%=linhaLocal.getDsc_tipo()%></option> 
							<% } %>
						</select>
					</div>
				</div>
			  </div>
			  <!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
			
			<br />
			<div class="clearfix form-actions">
				<label class="col-sm-5 control-label"> </label>
				<button type="submit" class="btn btn-primary" id="submit" name="submit" value="1">
					Salvar
				</button>
				<button type="button" class="btn btn-warning" id="cancel"
					onclick="javascript:window.location='./';">
					Voltar
				</button>
			</div>
			<br />
			<div id="divAlertID" class="alert alert-danger hidden" role="alert">
			  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			  <span id="divHelpAlertID"></span>
			</div>
		</form>
	  </div>
  </div>
</div>
<script type="text/javascript" charset="%CHARSET%">
$('#codTipoID').css('width','100%').select2({allowClear:true});
$('#cidadeResidencia').css('width','100%').select2({allowClear:true});

var url   = window.location.href; 
if(url.indexOf("id")!=-1){
	$.ajax({
		type:	"GET", 
		url:	"solicitanteDP.jsp?id=" + _GET("id"),
		success: function(resultado) {
			if(resultado != ""){
				var regex = new RegExp("<Cod#(.*?)#>", "g");
				var match = regex.exec(resultado);
				$('#codSolicitanteID').val(btoa(match[1]));
				
				var regex = new RegExp("<Nome#(.*?)#>", "g");
				var match = regex.exec(resultado);
				$('#nomeID').val(match[1]);
				
				var regex = new RegExp("<Telefone#(.*?)#>", "g");
				var match = regex.exec(resultado);
				$('#telefoneID').val(match[1]); 
				
				var regex = new RegExp("<Email#(.*?)#>", "g");
				var match = regex.exec(resultado);
				$('#emailID').val(match[1]); 
				
				var regex = new RegExp("<Tipo#(.*?)#>", "g");
				var match = regex.exec(resultado);
				$('#codTipoID').select2('val',match[1]); 
			}
		}
	});
}

$('#FormID').submit(function(e) {
	var url   = window.location.href; 
	if(url.indexOf("id")!=-1){
		msg = "alterada";
	} else {
		msg = "cadastrada";
	}
	
	var vOk  = validaInfo();
	if(!vOk) return false;
	
	$.ajax({
		type:	"POST", 
		url:	"solicitanteDP.jsp",
		data:	$('#FormID').serialize(),
		success: function(resultado) {
			if(resultado.match(/true/)){
				disabled();
				$("#divAlertID").removeClass("hidden");
				$("#divHelpAlertID").html("<b>Informações "+msg+" com sucesso.</b>");
			}else if(resultado.match(/false/)){
				$("#divAlertID").removeClass("hidden");
				$("#divHelpAlertID").html("<b>Ocorreu um erro ao ser "+msg+".</b>");
			}
		},
		error:function (){
			$("#divAlertID").removeClass("hidden");
			$("#divHelpAlertID").html("<b>Ocorreu um erro ao ser cadastrado.</b>");
		}
	});
	
	return false; 
});

function _GET(name)
{
  var url   = window.location.hash.replace("#?", "");
  var itens = url.split("&");

  for(n in itens)
  {
    if( itens[n].match(name) )
    {
      return decodeURIComponent(itens[n].replace(name+"=", ""));
    }
  }
  return null;
}

function disabled() {
	//# Dabilita todos os campos do tipo input
	$("input").each(function () {
        $(this).attr('disabled',true);
    });
	//# Dabilita todos os campos do tipo select
	$("select").each(function () {
        $(this).attr('disabled',true);
    });
	$("#submit").html("Novo");
}

function restart(){
	//# Limpa todos os campos menos o select
	jQuery.fn.reset = function () {
	  $(this).each (function() { this.reset(); });
	}
	//# Limpa e habilita todos os campos do tipo select
	$("select").each(function () {
        $(this).select2('val',''); 
        $(this).removeAttr('disabled');
    });
	//# Habilita todos os campos do tipo input
	$("input").each(function () {
        $(this).removeAttr('disabled');
    });
	
	$('#FormID').reset();
}

function validaInfo() {
	$("#divAlertID").addClass("hidden");
	var vNome			= $('#nomeID').val();
	var vCodTipo		= $('#codTipoID').val();
	var vCodTipoSelect	= $('#codTipoID option:selected').val();
	var vSubmit			= $('#submit').html();
	var vOK				= true;

	if(vSubmit == "Novo"){
		restart();
		$("#submit").html("Salvar");
		vOK = false;
	}
	
	// Nome
	if (!vNome) {
		$('#divNomeID').addClass('has-error');
		$('#divAlertID').removeClass('hidden');
		$("#divHelpAlertID").html("<b>Nome é obrigatório.</b>");
		vOK = false;
	}else{
		$('#divNomeID').removeClass('has-error');
		$('#divAlertID').addClass('hidden');
		$("#divHelpAlertID").html('');
	}
	
	// Tipo
	if (!vCodTipo) {
		$('#divCodTipoID').addClass('has-error');
		$('#divAlertID').removeClass('hidden');
		$("#divHelpAlertID").html("<b>Tipo é obrigatório.</b>");
		vOK = false;
	}else{
		$('#divCodTipoID').removeClass('has-error');
		$('#divAlertID').addClass('hidden');
		$("#divHelpAlertID").html('');
	}
	
	//vOK = false;
	if (vOK == true) {
		return true;
	}else{
		return vOK;
	}
}
</script>
