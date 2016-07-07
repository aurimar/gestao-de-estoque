package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Cliente;
import util.Database;

public class ClienteDao {
	
	private Connection connection;

    public ClienteDao() {
        connection = Database.getConnection();
    }

    public void addCliente(Cliente cliente) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_cliente (nome_cliente, tipo_cliente, numero_cliente) VALUES (?,?,?)");
            preparedStatement.setString(1, cliente.getNome_cliente());
            preparedStatement.setString(2, cliente.getTipo_cliente());
            preparedStatement.setString(3, cliente.getNumero_cliente());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCliente(String clienteId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM tbl_cliente WHERE id_cliente=?");
            // Parameters start with 1
            preparedStatement.setString(1, clienteId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCliente(Cliente cliente) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tbl_cliente SET nome_cliente=?, tipo_cliente=?, numero_cliente=?  WHERE id_cliente=?");
            // Parameters start with 1
            preparedStatement.setString(1, cliente.getNome_cliente());
            preparedStatement.setString(2, cliente.getTipo_cliente());
            preparedStatement.setString(3, cliente.getNumero_cliente());
            preparedStatement.setLong(4, cliente.getId_cliente());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cliente> getAllClientes() {
        List<Cliente> clientes = new ArrayList<Cliente>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM tbl_cliente");
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId_cliente(rs.getInt("id_cliente"));
                cliente.setNome_cliente(rs.getString("nome_cliente"));
                cliente.setTipo_cliente(rs.getString("tipo_cliente"));
                cliente.setNumero_cliente(rs.getString("numero_cliente"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clientes;
    }

    public Cliente getClienteById(String clienteId) {
        Cliente cliente = new Cliente();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_cliente WHERE id_cliente=?");
            preparedStatement.setString(1, clienteId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                cliente.setId_cliente(rs.getLong("id_cliente"));
                cliente.setNome_cliente(rs.getString("nome_cliente"));
                cliente.setTipo_cliente(rs.getString("tipo_cliente"));
                cliente.setNumero_cliente(rs.getString("numero_cliente"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cliente;
    }

}
