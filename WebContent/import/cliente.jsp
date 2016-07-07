
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="/gestao-de-estoque/">Home</a>
							</li>
							<li>
								Cadatrar novo cliente
							</li>
							
						</ul><!-- /.breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Adicionar novo cliente
							</h1>
						</div>
						
						
						 <form class="form-horizontal" role="form"  method="POST" action='ClienteController' name="frmAddCliente">
						 	
						  				<%
							                String action = request.getParameter("action");
							                System.out.println(action);
							            %>
							            <% if (action.equalsIgnoreCase("edit")) {%>
							            <div class="form-group">
							            
							            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> ID  </label>
							            
								             <div class="col-sm-9">
								            <input type="text" name="id_categoria" placeholder="Id" value="<c:out value="${cleinte.id_cliente}" />" readonly="readonly"/><br /> 
								            </div>
							            </div>
							            <%}%>
							            
							            <div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nome </label>
								                
								                <div class="col-sm-9">
								                <input type="text" name="nome_cliente" placeholder="Nome" value="<c:out value="${cliente.nome_cliente}" />" />
											</div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tipo </label>
								                
								                <div class="col-sm-9">
								                <input type="text" name="tipo_cliente" placeholder="Tipo" value="<c:out value="${cliente.tipo_cliente}" />" />
											</div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Numero </label>
								                
								                <div class="col-sm-9">
								                <input type="number" name="numero_cliente" placeholder="Tipo" value="<c:out value="${cliente.numero_cliente}" />" />
											</div>
										</div>
							                
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
										
										<input class="btn btn-info" type="submit" value="Confirmar" />
										
										</div>
									</div>
									
									</form>
					   </div>
					 </div>
					 </div>
						<!-- /.page-header -->