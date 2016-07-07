
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
								Lista Produtos
							</li>
							
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Lista de Produtos
							</h1>
						</div>
						
						
						 <p><a class="btn" href="ProdutoController?action=insert"><i class="ace-icon  glyphicon-plus align-top bigger-125"></i> Adicionar novo Produto</a></p>
					        

						<table id="simple-table" class="table table-striped table-bordered table-hover">
           				 <thead>
					                 <tr>
						                    <th class="center">Nome</th>
						                    <th class="center">Categoria</th>
						                    <th class="center">valor</th>
						                    <th class="center">Estoque</th>
						                    <th class="center">Alterar</th>
					                    	<th class="center">Deletar</th>
						                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${produtos}" var="produto">
						                
						                <tr>
					                        <td><center><c:out value="${produto.nome_produto}" /></center></td> 
					                        
					                        <td><center><c:forEach items="${categorias}" var="val"> 
					                                			<c:out value="${produto.id_categoria == val.id_categoria ? val.nome_categoria : ''}"/>
					                            		</c:forEach>
					                            </center>
					                        </td>                        
					                     
					                        <td>
					                            <fmt:setLocale value="pt_BR"/>
					                            <fmt:formatNumber value="${produto.preco_produto}" type="currency"/>
					                        </td>
					                        
					                        <td><c:out value="${produto.estoque_produto}" /></td>
					                        
					                        <td>
					                        <center><a href="ProdutoController?action=edit&produtoId=<c:out value="${produto.id_produto}"/>" class="btn btn-xs btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></a></center>
											</td>
											 <td>
					                        <center><a href="ProdutoController?action=delete&produtoId=<c:out value="${produto.id_produto}"/>" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a></center>
											</td>
											
					                    </tr>
					                    
					                </c:forEach>
					            </tbody>
					        </table>
					   </div>
					 </div>
					 </div>
						<!-- /.page-header -->