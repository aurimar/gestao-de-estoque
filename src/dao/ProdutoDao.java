package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Produto;
import util.Database;

public class ProdutoDao {
	
	private Connection connection;

    public ProdutoDao() {
        connection = Database.getConnection();
    }

    public void addProduto(Produto produto) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_produto (nome_produto, especial_produto, id_categoria, preco_produto, estoque_produto) VALUES (?,?,?,?,?)");
            preparedStatement.setString(1, produto.getNome_produto());
            preparedStatement.setString(2, produto.getEspecial_produto());
            preparedStatement.setInt(3, produto.getId_categoria());
            preparedStatement.setDouble(4, produto.getPreco_produto());
            preparedStatement.setInt(5, produto.getEstoque_produto());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduto(String produtoId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM tbl_produto WHERE id_produto=?");
            // Parameters start with 1
            preparedStatement.setString(1, produtoId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduto(Produto produto) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tbl_produto SET nome_produto=?, especial_produto=?, id_categoria=?, preco_produto=?, estoque_produto=?  WHERE id_produto=?");
            // Parameters start with 1
            preparedStatement.setString(1, produto.getNome_produto());
            preparedStatement.setString(2, produto.getEspecial_produto());
            preparedStatement.setInt(3, produto.getId_categoria());
            preparedStatement.setDouble(4, produto.getPreco_produto());
            preparedStatement.setInt(5, produto.getEstoque_produto());
            preparedStatement.setLong(6, produto.getId_produto());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Produto> getAllProdutos() {
        List<Produto> produtos = new ArrayList<Produto>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM tbl_produto");
                        
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId_produto(rs.getInt("id_produto"));
                produto.setNome_produto(rs.getString("nome_produto"));
                produto.setId_categoria(rs.getInt("id_categoria"));
                produto.setPreco_produto(rs.getFloat("preco_produto"));
                produto.setEstoque_produto(rs.getInt("estoque_produto"));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }

    public Produto getProdutoById(String produtoId) {
        Produto produto = new Produto();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_produto WHERE id_produto=?");
            preparedStatement.setString(1, produtoId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                produto.setId_produto(rs.getLong("id_produto"));
                produto.setNome_produto(rs.getString("nome_produto"));
                produto.setEspecial_produto(rs.getString("especial_produto"));
                produto.setId_categoria(rs.getInt("id_categoria"));
                produto.setPreco_produto(rs.getFloat("preco_produto"));
                produto.setEstoque_produto(rs.getInt("estoque_produto"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produto;
    }

}
