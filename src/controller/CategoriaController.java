package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDao;
import model.Categoria;

/**
 * Servlet implementation class CategoriaController
 */
public class CategoriaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/categoria.jsp";
	private static String LIST_USER = "/listcategoria.jsp";
	private CategoriaDao dao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoriaController() {
		super();
		dao = new CategoriaDao();
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
			String categoriaId = request.getParameter("categoriaId");
			dao.deleteCategoria(categoriaId);
			;
			forward = LIST_USER;
			request.setAttribute("categorias", dao.getAllCategorias());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String categoriaId = request.getParameter("categoriaId");
			Categoria categoria = dao.getCategoriaById(categoriaId);
			request.setAttribute("categoria", categoria);
		} else if (action.equalsIgnoreCase("listCategoria")) {
			forward = LIST_USER;
			request.setAttribute("categorias", dao.getAllCategorias());
		} else {
			forward = INSERT_OR_EDIT;
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
		Categoria categoria = new Categoria();
		categoria.setNome_categoria(request.getParameter("nome_categoria"));
		String categoriaid = request.getParameter("id_categoria");
		if (categoriaid == null || categoriaid.isEmpty()) {
			dao.addCategoria(categoria);
		} else {
			categoria.setId_categoria(Long.parseLong(categoriaid));
			dao.updateCategoria(categoria);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("categorias", dao.getAllCategorias());
		view.forward(request, response);

	}

}
