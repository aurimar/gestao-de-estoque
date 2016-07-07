package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Compra;
import util.Database;

public class CompraDao {
	
	private Connection connection;

    public CompraDao() {
        connection = Database.getConnection();
    }

    public void addCompra(Compra compra) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_compra (id_cliente) VALUES (?)");
            preparedStatement.setInt(1, compra.getId_cliente());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCompra(String compraId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM tbl_compra WHERE id_compra=?");
            // Parameters start with 1
            preparedStatement.setString(1, compraId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCompra(Compra compra) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tbl_compra SET id_cliente=?, preco_compra=? WHERE id_compra=?");
            // Parameters start with 1
            preparedStatement.setInt(1, compra.getId_cliente());
            preparedStatement.setDouble(2, compra.getPreco_compra());
            preparedStatement.setLong(3, compra.getId_compra());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Compra> getAllCompras() {
        List<Compra> compras = new ArrayList<Compra>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT C.id_compra ,clientes.nome_cliente, preco_compra FROM tbl_compra AS C "
                    + "INNER JOIN tbl_cliente AS clientes ON clientes.id_cliente = C.id_cliente ");
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId_compra(rs.getInt("id_compra"));
                compra.setNome_cliente(rs.getString("nome_cliente"));
                compra.setPreco_compra(rs.getInt("preco_compra"));
                compras.add(compra);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return compras;
    }

    public Compra getCompraById(String compraId) {
        Compra compra = new Compra();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_compra WHERE id_compra=?");
            preparedStatement.setString(1, compraId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                compra.setId_compra(rs.getLong("id_compra"));
                compra.setId_cliente(rs.getInt("id_cliente"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return compra;
    }

}
