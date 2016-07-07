
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
								Lista Categoria
							</li>
							
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Lista de Categorias
							</h1>
						</div>
						
						
						 <p><a class="btn" href="CategoriaController?action=insert"><i class="ace-icon  glyphicon-plus align-top bigger-125"></i> Adicionar nova Categoria</a></p>
					        

						<table id="simple-table" class="table table-striped table-bordered table-hover">
           				 <thead>
					                <tr>
					                	<th class="center">Código</th>
					                    <th class="center">Categoria</th>
					                    <th class="center">Alterar</th>
					                    <th class="center">Deletar</th>
					                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${categorias}" var="categoria">
					                    <tr>
					                        <td><center><c:out value="${categoria.id_categoria}" /></center></td>
					                        <td><c:out value="${categoria.nome_categoria}" /></td>
					                        <td>
					                        <center><a href="CategoriaController?action=edit&categoriaId=<c:out value="${categoria.id_categoria}"/>" class="btn btn-xs btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></a></center>
											</td>
											 <td>
					                        <center><a href="CategoriaController?action=delete&categoriaId=<c:out value="${categoria.id_categoria}"/>" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a></center>
											</td>
									   </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					   </div>
					 </div>
					 </div>
						<!-- /.page-header -->