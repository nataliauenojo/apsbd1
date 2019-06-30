package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Produto;

public class ProdutoDAO extends dao.DbConnection {

    private Connection conn;
    private final String sqlInsert = "INSERT INTO Produto (id ,nome, quantidade, preco, categoria) VALUES (?, ?, ?, ?, ?)";
    private final String sqlUpdate = "UPDATE Produto SET id = ?, nome = ?, quantidade = ? , preco = ?, categoria = ? WHERE id = ? ";
    private final String sqlRemove = "DELETE FROM Produto WHERE id = ?";
    private final String sqlList = "SELECT id, nome, quantidade, preco, categoria FROM Produto ORDER BY id";
    private final String sqlFind = "SELECT id, nome, quantidade , preco, categoria FROM Categoria WHERE id = ?";

    public void insert(Produto produto) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlInsert);
            ps.setInt(1, produto.getId());
            ps.setString(2, produto.getNome());
            ps.setInt(3, produto.getQuantidade());
            ps.setDouble(4, produto.getPreco());
            ps.setString(5, produto.getCategoria());
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }

    }

    public void update(Produto produto) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlUpdate);
            ps.setInt(1,produto.getId());
            ps.setString(2, produto.getNome());
            ps.setInt(3, produto.getQuantidade());
            ps.setDouble(4, produto.getPreco());
            ps.setString (5, produto.getCategoria());
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }
    }

    public void remove(int id) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlRemove);
            ps.setInt(1, id);
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }

    }

    public ArrayList<Produto> list() throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlList);
            rs = ps.executeQuery();
            ArrayList<Produto> list = new ArrayList<>();
            Produto produto;
            while (rs.next()) {
                produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setQuantidade(rs.getInt("quantidade"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setCategoria(rs.getString("categoria"));
                list.add(produto);
            }
            return list;
        } finally {
            rs.close();
            ps.close();
            close(conn);
        }
    }

}
