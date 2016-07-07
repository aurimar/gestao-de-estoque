package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompraDao;
import dao.ItemDao;
import model.Item;

/**
 * Servlet implementation class ItemController
 */
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_USER = "/listcompra.jsp";
	private static String EDIT = "/compra.jsp";
	private static String INSERT = "/listcompra.jsp";
	private ItemDao dao;
	private CompraDao Cdao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemController() {
		super();
		dao = new ItemDao();
		Cdao = new CompraDao();
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
			String clienteId = request.getParameter("itemId");
			dao.deleteItem(clienteId);
			request.setAttribute("compras", Cdao.getAllCompras());
			forward = LIST_USER;
		} else if (action.equalsIgnoreCase("edit")) {
			forward = EDIT;
		} else if (action.equalsIgnoreCase("listCompra")) {
			forward = LIST_USER;
		} else {
			forward = INSERT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		request.setAttribute("compras", Cdao.getAllCompras());
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Item item = new Item();
		item.setId_compra(Integer.parseInt(request.getParameter("id_compra")));
		item.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
		item.setQuantidade_produto(Integer.parseInt(request.getParameter("quantidade_produto")));
		String itemid = request.getParameter("id_item");
		if (itemid == null || itemid.isEmpty()) {
			dao.addItem(item);
		} else {
			item.setId_item(Long.parseLong(itemid));
			dao.updateItem(item);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("compras", Cdao.getAllCompras());
		view.forward(request, response);
	}

}
