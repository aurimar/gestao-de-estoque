package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Item;
import util.Database;

public class ItemDao {
	
	private Connection connection;

    public ItemDao() {
        connection = Database.getConnection();
    }

    public void addItem(Item item) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_itens_compra_produto (id_compra, id_produto, quantidade_produto) VALUES (?,?,?)");
            preparedStatement.setInt(1, item.getId_compra());
            preparedStatement.setInt(2, item.getId_produto());
            preparedStatement.setInt(3, item.getQuantidade_produto());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteItem(String itemId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM tbl_itens_compra_produto WHERE id_item=?");
            preparedStatement.setString(1, itemId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateItem(Item item) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tbl_itens_compra_produto SET id_compra=?, id_produto=?, quantidade_produto=?  WHERE id_itens=?");
            // Parameters start with 1
            preparedStatement.setInt(1, item.getId_compra());
            preparedStatement.setInt(2, item.getId_produto());
            preparedStatement.setInt(3, item.getQuantidade_produto());
            preparedStatement.setLong(4, item.getId_item());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Item> getAllItens() {
        List<Item> itens = new ArrayList<Item>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM tbl_itens_compra_produto");
            while (rs.next()) {
                Item item = new Item();
                item.setId_item(rs.getInt("id_item"));
                item.setId_compra(rs.getInt("id_compra"));
                item.setId_produto(rs.getInt("id_produto"));
                item.setQuantidade_produto(rs.getInt("quantidade_produto"));
                itens.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itens;
    }

    public List<Item> getItemById(String itemId) {
        List<Item> itens = new ArrayList<Item>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(""
                    + "SELECT CP.id_item, CP.id_compra, produtos.nome_produto, produtos.preco_produto, CP.quantidade_produto, (produtos.preco_produto * CP.quantidade_produto) AS total "
                    + "FROM tbl_itens_compra_produto AS CP "
                    + "INNER JOIN tbl_produto AS produtos ON produtos.id_produto = CP.id_produto "
                    + "WHERE id_compra=?");
            preparedStatement.setString(1, itemId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setId_item(rs.getInt("id_item"));
                item.setId_compra(rs.getInt("id_compra"));
                item.setNome_produto(rs.getString("nome_produto"));
                item.setPreco(rs.getInt("preco_produto"));
                item.setQuantidade_produto(rs.getInt("quantidade_produto"));
                item.setTotal(rs.getInt("total"));
                itens.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itens;
    }

}
