<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">Tables</a>
							</li>
							<li class="active">Simple &amp; Dynamic</li>
						</ul><!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Pesquisar ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								Tables
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Static &amp; Dynamic Tables
								</small>
							</h1>
						</div>
						
						<table border=1>
           				 <thead>
					                <tr>
					                    <th>Nome</th>
					                    <th colspan=2>Action</th>
					                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${categorias}" var="categoria">
					                    <tr>
					                        <td><c:out value="${categoria.nome_categoria}" /></td>
					                        <td><a href="CategoriaController?action=edit&categoriaId=<c:out value="${categoria.id_categoria}"/>">Update</a></td>
					                        <td><a href="CategoriaController?action=delete&categoriaId=<c:out value="${categoria.id_categoria}"/>">Delete</a></td>
					                    </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					        <p><a href="CategoriaController?action=insert">Add Categoria</a></p>
					        <p><a href="index.jsp">Home</a></p>
        
						</div>
						<!-- /.page-header -->