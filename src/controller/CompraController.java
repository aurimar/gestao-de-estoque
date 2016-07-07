package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import dao.CompraDao;
import dao.ItemDao;
import dao.ProdutoDao;
import model.Compra;

/**
 * Servlet implementation class CompraController
 */
public class CompraController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT = "/compra.jsp";
	private static String EDIT = "/compra.jsp";
	private static String LIST_USER = "/listcompra.jsp";
	private CompraDao dao;
	private ProdutoDao Pdao;
	private ClienteDao Cdao;
	private ItemDao Idao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompraController() {
		super();
		dao = new CompraDao();
		Pdao = new ProdutoDao();
		Cdao = new ClienteDao();
		Idao = new ItemDao();
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
			String compraId = request.getParameter("compraId");
			dao.deleteCompra(compraId);
			request.setAttribute("compras", dao.getAllCompras());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = EDIT;
			String compraId = request.getParameter("compraId");
			Compra compra = dao.getCompraById(compraId);
			request.setAttribute("compra", compra);
			request.setAttribute("produtos", Pdao.getAllProdutos());
			request.setAttribute("clientes", Cdao.getAllClientes());
			request.setAttribute("itens", Idao.getItemById(compraId));
		} else if (action.equalsIgnoreCase("listCompra")) {
			forward = LIST_USER;
			request.setAttribute("compras", dao.getAllCompras());
		} else {
			forward = INSERT;
			request.setAttribute("clientes", Cdao.getAllClientes());
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
		Compra compra = new Compra();
		compra.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
		String compraid = request.getParameter("id_compra");
		if (compraid == null || compraid.isEmpty()) {
			dao.addCompra(compra);
		} else {

			compra.setPreco_compra(Double.parseDouble(request.getParameter("preco_compra")));
			compra.setId_compra(Long.parseLong(compraid));
			dao.updateCompra(compra);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("compras", dao.getAllCompras());
		view.forward(request, response);
	}

}
