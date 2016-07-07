
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
								Lista Clientes
							</li>
							
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Lista de Clientes
							</h1>
						</div>
						
						
						 <p><a class="btn" href="ClienteController?action=insert"><i class="ace-icon  glyphicon-plus align-top bigger-125"></i> Adicionar novo cliente</a></p>
					        

						<table id="simple-table" class="table table-striped table-bordered table-hover">
           				 <thead>
					                 <tr>
						                    <th class="center">Nome</th>
						                    <th class="center">Tipo</th>
						                    <th class="center">Numero</th>
						                    <th class="center">Alterar</th>
					                    	<th class="center">Deletar</th>
						                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${clientes}" var="cliente">
						                
						                <tr>
					                        <td><c:out value="${cliente.nome_cliente}" /></td>
					                        <td><c:out value="${cliente.tipo_cliente}" /></td>
					                        <td><c:out value="${cliente.numero_cliente}" /></td>
					                        
					                     
					                        <td>
					                        <center><a href="ClienteController?action=edit&clienteId=<c:out value="${cliente.id_cliente}"/>" class="btn btn-xs btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></a></center>
											</td>
											 <td>
					                        <center><a href="ClienteController?action=edit&clienteId=<c:out value="${cliente.id_cliente}"/>" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a></center>
											</td>
											
					                    </tr>
					                    
					                </c:forEach>
					            </tbody>
					        </table>
					   </div>
					 </div>
					 </div>
						<!-- /.page-header -->