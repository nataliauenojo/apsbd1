package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cliente;

public class ClienteDAO extends dao.DbConnection {

    private Connection conn;
    private final String sqlInsert = "";
    private final String sqlUpdate = "";
    private final String sqlRemove = "";
    private final String sqlList = "";

    public void insert(Cliente cliente) throws SQLException {

    }

    public void update(Cliente cliente) throws SQLException {

    }

    public void remove(int id) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlRemove);
            ps.setString(1, Integer.toString(id));
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }

    }

    public ArrayList<Cliente> list() throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlList);
            rs = ps.executeQuery();
            ArrayList<Cliente> list = new ArrayList<>();
            Cliente cliente;
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setCpf(rs.getInt("cpf"));
                cliente.setNome(rs.getString("nome"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEndereco(rs.getString("endereco"));

                list.add(cliente);
            }
            return list;
        } finally {
            rs.close();
            ps.close();
            close(conn);
        }
    }

}
