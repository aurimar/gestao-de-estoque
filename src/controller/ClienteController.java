package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import model.Cliente;

/**
 * Servlet implementation class ClienteController
 */
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/cliente.jsp";
	private static String LIST_USER = "/listcliente.jsp";
	private ClienteDao dao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClienteController() {
		super();
		dao = new ClienteDao();
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
			String clienteId = request.getParameter("clienteId");
			dao.deleteCliente(clienteId);
			;
			forward = LIST_USER;
			request.setAttribute("clientes", dao.getAllClientes());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String clienteId = request.getParameter("clienteId");
			Cliente cliente = dao.getClienteById(clienteId);
			request.setAttribute("cliente", cliente);
		} else if (action.equalsIgnoreCase("listCliente")) {
			forward = LIST_USER;
			request.setAttribute("clientes", dao.getAllClientes());
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
		Cliente cliente = new Cliente();
        cliente.setNome_cliente(request.getParameter("nome_cliente"));
        cliente.setTipo_cliente(request.getParameter("tipo_cliente"));
        cliente.setNumero_cliente(request.getParameter("numero_cliente"));
        String clienteid = request.getParameter("id_cliente");
        if (clienteid == null || clienteid.isEmpty()) {
            dao.addCliente(cliente);
        } else {
            cliente.setId_cliente(Long.parseLong(clienteid));
            dao.updateCliente(cliente);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("clientes", dao.getAllClientes());
        view.forward(request, response);
	}

}
