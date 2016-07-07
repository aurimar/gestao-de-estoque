package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Categoria;
import util.Database;

public class CategoriaDao {

	private Connection connection;

    public CategoriaDao() {
        connection = Database.getConnection();
    }

    public void addCategoria(Categoria categoria) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_categoria (nome_categoria) VALUES (?)");
            preparedStatement.setString(1, categoria.getNome_categoria());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategoria(String categoriaId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM tbl_categoria WHERE id_categoria=?");
            // Parameters start with 1
            preparedStatement.setString(1, categoriaId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCategoria(Categoria categoria) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tbl_categoria SET nome_categoria=? WHERE id_categoria=?");
            // Parameters start with 1
            preparedStatement.setString(1, categoria.getNome_categoria());
            preparedStatement.setLong(2, categoria.getId_categoria());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Categoria> getAllCategorias() {
        List<Categoria> categorias = new ArrayList<Categoria>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM tbl_categoria");
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId_categoria(rs.getInt("id_categoria"));
                categoria.setNome_categoria(rs.getString("nome_categoria"));
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorias;
    }

    public Categoria getCategoriaById(String categoriaId) {
        Categoria categoria = new Categoria();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tbl_categoria WHERE id_categoria=?");
            preparedStatement.setString(1, categoriaId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                categoria.setId_categoria(rs.getLong("id_categoria"));
                categoria.setNome_categoria(rs.getString("nome_categoria"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoria;
    }
	
}
