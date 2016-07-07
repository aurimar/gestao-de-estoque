package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDao;
import dao.ProdutoDao;
import model.Produto;

/**
 * Servlet implementation class ProdutoController
 */
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/produto.jsp";
	private static String LIST_USER = "/listproduto.jsp";
	private ProdutoDao Pdao;
	private CategoriaDao Cdao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProdutoController() {
		super();
		Pdao = new ProdutoDao();
		Cdao = new CategoriaDao();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			String produtoId = request.getParameter("produtoId");
			Pdao.deleteProduto(produtoId);
			;
			forward = LIST_USER;
			request.setAttribute("produtos", Pdao.getAllProdutos());
			request.setAttribute("categorias", Cdao.getAllCategorias());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String produtoId = request.getParameter("produtoId");
			Produto produto = Pdao.getProdutoById(produtoId);
			request.setAttribute("produto", produto);
			request.setAttribute("categorias", Cdao.getAllCategorias());
		} else if (action.equalsIgnoreCase("listProduto")) {
			forward = LIST_USER;
			request.setAttribute("produtos", Pdao.getAllProdutos());
			request.setAttribute("categorias", Cdao.getAllCategorias());
		} else {
			forward = INSERT_OR_EDIT;
			request.setAttribute("categorias", Cdao.getAllCategorias());

		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Produto produto = new Produto();
		produto.setNome_produto(request.getParameter("nome_produto"));
		produto.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
		produto.setPreco_produto(Double.parseDouble(request.getParameter("preco_produto")));
		produto.setEstoque_produto(Integer.parseInt(request.getParameter("estoque_produto")));
		String produtoid = request.getParameter("id_produto");
		if (produtoid == null || produtoid.isEmpty()) {
			Pdao.addProduto(produto);
		} else {
			produto.setId_produto(Long.parseLong(produtoid));
			Pdao.updateProduto(produto);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("produtos", Pdao.getAllProdutos());
		request.setAttribute("categorias", Cdao.getAllCategorias());
		view.forward(request, response);
	}

}
