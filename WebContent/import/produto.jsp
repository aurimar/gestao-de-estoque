
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
								Cadatrar novo produto
							</li>
							
						</ul><!-- /.breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Adicionar novo produto
							</h1>
						</div>
						
						
						 <form class="form-horizontal" role="form" method="POST" action='ProdutoController' name="frmAddProduto">
						 	
						  				 <%
							                String action = request.getParameter("action");
							                System.out.println(action);
							            %>
							            <% if (action.equalsIgnoreCase("edit")) {%>
							            
							            <div class="form-group">
							            
							            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> ID  </label>
							            
								             <div class="col-sm-9">
								            <input type="text" name="id_produto" placeholder="Id" value="<c:out value="${produto.id_produto}" />" readonly="readonly"/><br /> 
								            </div>
							            </div>
							            <%}%>
							            
							            <div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nome </label>
								                
								                <div class="col-sm-9">
								                <input type="text" name="nome_produto" placeholder="Nome" value="<c:out value="${produto.nome_produto}" />" />
											</div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Especial </label>
								                
								                <div class="col-sm-9">
								                <input type="text" name="especial_produto" placeholder="Especial" value="<c:out value="${produto.especial_produto}" />" />
											</div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Categoria </label>
								                
								                <div class="col-sm-9">
									           <select name="id_categoria">
									                <option value=""></option>   
									                <c:forEach items="${categorias}" var="val"> 
									                    <option value="${val.id_categoria}" ${produto.id_categoria == val.id_categoria ? 'selected' : ''}><c:out value="${val.nome_categoria}" ></c:out></option>   
									                </c:forEach>                     
									            </select> 
							                 
								           </div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Valor </label>
								                
								                <div class="col-sm-9">
								                <input type="number" name="preco_produto" placeholder="Valor" value="<c:out value="${produto.preco_produto}" />" />
											</div>
										</div>
										
										<div class="form-group">
								          		
								          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Estoque </label>
								                
								                <div class="col-sm-9">
								                <input type="number" name="estoque_produto" placeholder="Estoque" value="<c:out value="${produto.estoque_produto}" />" />
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