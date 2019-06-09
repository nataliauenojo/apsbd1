package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Fornecedor;

public class FornecedorDAO extends dao.DbConnection {

    private Connection conn;
    private final String sqlInsert = "";
    private final String sqlUpdate = "";
    private final String sqlRemove = "";
    private final String sqlList = "";

    public void insert(Fornecedor filial) throws SQLException {

    }

    public void update(Fornecedor filial) throws SQLException {

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

}
