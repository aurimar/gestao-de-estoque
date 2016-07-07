
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
								Lista Compras
							</li>
							
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Lista de Compras
							</h1>
						</div>
						
						
						 <p><a class="btn" href="CompraController?action=insert"><i class="ace-icon  glyphicon-plus align-top bigger-125"></i> Adicionar nova Compra</a></p>
					        

						<table id="simple-table" class="table table-striped table-bordered table-hover">
           				 <thead>
					                 <tr>
						                    <th class="center">Cliente/Fornecedor</th>
						                    <th class="center">Valor</th>
						                    <th class="center">Alterar</th>
					                    	<th class="center">Deletar</th>
						                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${compras}" var="compra">
						                
						                <tr>
					                       <td><c:out value="${compra.nome_cliente}" /></td>
					                        
					                         <td>
					                            <fmt:setLocale value="pt_BR"/>
					                            <fmt:formatNumber value="${compra.preco_compra}" type="currency"/>
					                        </td>
					                        
					                        <td>
					                        <center><a href="CompraController?action=edit&compraId=<c:out value="${compra.id_compra}"/>" class="btn btn-xs btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></a></center>
											</td>
											 <td>
					                        <center><a href="CompraController?action=edit&compraId=<c:out value="${compra.id_compra}"/>" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a></center>
											</td>
											
					                    </tr>
					                    
					                </c:forEach>
					            </tbody>
					        </table>
					   </div>
					 </div>
					 </div>
						<!-- /.page-header -->