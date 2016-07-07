
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
								Cadatrar nova categoria
							</li>
							
						</ul><!-- /.breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Adicionar nova categoria
							</h1>
						</div>
						
						
						 <form class="form-horizontal" role="form"  method="POST" action='CategoriaController' name="frmAddCategoria">
						 	
						  				<%
							                String action = request.getParameter("action");
							                System.out.println(action);
							            %>
							            <% if (action.equalsIgnoreCase("edit")) {%>
							            <div class="form-group">
							            
							            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> ID  </label>
							            
								             <div class="col-sm-9">
								            <input type="text" name="id_categoria" placeholder="Id" value="<c:out value="${categoria.id_categoria}" />" readonly="readonly"/><br /> 
								            </div>
							            </div>
							            <%}%>
							            <div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nome </label>
								                
								                <div class="col-sm-9">
								                <input type="text" name="nome_categoria" placeholder="Categoria" value="<c:out value="${categoria.nome_categoria}" />" />
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