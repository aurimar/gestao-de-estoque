
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
				Cadatrar nova compra
			</li>
			
		</ul><!-- /.breadcrumb -->
	
</div>

<div class="page-content">
	<div class="page-header">
		<h1>
			Adicionar nova compra
		</h1>
	</div>
	
	  <c:set var="total" value="${0}"/>
        <form class="form-horizontal" role="form" method="POST" action='CompraController' name="frmAddCompra">
            <table>
                <tbody>
                    <tr>
                        <%
                            String action = request.getParameter("action");
                            System.out.println(action);
                        %>
                        <% if (action.equalsIgnoreCase("edit")) {%>
                		<input type="hidden" name="id_compra"
                       value="<c:out value="${compra.id_compra}" />" readonly="readonly"/><br /> 
                       
                       <div class="form-group">
								          		
			          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Cliente/Fornecedor </label>
			                
			                <div class="col-sm-9">
			                <select name="id_cliente" disabled="disabled">
			                    <option value=""></option>   
			                    <c:forEach items="${clientes}" var="val"> 
			                        <option value="${val.id_cliente}" ${compra.id_cliente == val.id_cliente ? 'selected' : ''}><c:out value="${val.nome_cliente}" ></c:out></option>   
			                    </c:forEach>                     
			                </select>
                
						</div>
					</div> 
                </tr>
                </tbody>
            </table>
        </form>
        <form class="form-horizontal" role="form" method="POST" action='ItemController' name="frmAddItens">
            <table>
                <tbody>
                    <tr>
               		
               		 <input type="hidden" name="id_compra"
                       value="<c:out value="${compra.id_compra}" />" readonly="readonly"/><br /> 
                
               		 <div class="form-group">
								          		
			          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Produto </label>
			                
			                <div class="col-sm-9">
			                <select name="id_produto">
			                    <option value=""></option>   
			                    <c:forEach items="${produtos}" var="val1"> 
			                        <option value="${val1.id_produto}"><c:out value="${val1.nome_produto}" ></c:out></option>   
			                    </c:forEach>                     
			                </select>
			                </div>
					</div> 
					
					 <div class="form-group">
								          		
			          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Quantidade </label>
			                
			                <div class="col-sm-9">
			                <input type="number" name="quantidade_produto" value="" />
			                </div>
					</div> 
					
                </tr>
                </tbody>
            </table>
            <input class="btn"  type="submit" value="Adicionar compra" />
        </form>
        
        </br></br></br>
    
            <table id="simple-table" class="table table-striped table-bordered table-hover">
		      				 <thead>
		                 <tr>
			                       <th class="center">Cliente</th>
				                    <th class="center">Produto</th>
				                    <th class="center">Preço</th>
				                    <th class="center">Estoque</th>
				                    <th class="center">Total</th>
				                    <th class="center">Deletar</th>
			                </tr>
		            </thead>
		            <tbody>
	                <c:forEach items="${itens}" var="item">
	                    <tr>
	                        <td><c:out value="${item.id_compra}" /></td>
	                        <td><c:out value="${item.nome_produto}" /></td>
	                        <td>
	                            <fmt:setLocale value="pt_BR"/>
	                            <fmt:formatNumber value="${item.preco}" type="currency"/>
	                        </td>
	                        <td><c:out value="${item.quantidade_produto}" /></td>
	                        <td>
	                            <fmt:setLocale value="pt_BR"/>
	                            <fmt:formatNumber value="${item.total}" type="currency"/>
	                        </td>
	                        
	                        <td>
	                        <center><a href="ItemController?action=delete&itemId=<c:out value="${item.id_item}"/>" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a></center>
							</td>
	                    </tr>
	                    <c:set var="total" value="${total + item.total}" />
	                </c:forEach>
	            </tbody>
		        </table>
						        
	        </table>
        
        SubTotal: 
        <fmt:setLocale value="pt_BR"/>
        <fmt:formatNumber value="${total}" type="currency"/>
        </br></br>

        <form method="POST" action='CompraController' name="frmAddCompra">
            <input type="hidden" name="id_compra"
                   value="<c:out value="${compra.id_compra}" />"/>
            <input type="hidden" name="id_cliente"
                   value="<c:out value="${compra.id_cliente}" />"/>
            <input type="hidden" name="preco_compra"
                   value="<c:out value="${total}" />"/>
            <input class="btn"  type="submit" value="Fechar Conta" />

            <%} else {%>
           
            <form class="form-horizontal" role="form"  method="POST" action='CompraController' name="frmAddCompra">
                <table>
                    <tbody>
                        <tr>
                        
                        <div class="form-group">
								          		
			          		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Cliente/Fornecedor </label>
			                
			                <div class="col-sm-9">
			                <select name="id_cliente">
		                        <option value=""></option>   
		                        <c:forEach items="${clientes}" var="val"> 
		                            <option value="${val.id_cliente}" ${compra.id_cliente == val.id_cliente ? 'selected' : ''}><c:out value="${val.nome_cliente}" ></c:out></option>   
		                        </c:forEach>                     
		                    </select>
                
						</div>
						
                    <input class="btn"  type="submit" value="Add" />
                    </tr>
                    </tbody>
                </table>
            </form>
            
            <%}%>

        </table>
	
   </div>
 </div>
 </div>

