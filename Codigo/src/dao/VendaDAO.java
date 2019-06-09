
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Venda;

public class VendaDAO extends dao.DbConnection {

    private Connection conn;
   private final String sqlInsert = "";
    private final String sqlUpdate = "";
    private final String sqlRemove = "";
    private final String sqlList = "";
    
    public void insert(Venda venda) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlInsert);
            ps.setInt(1, venda.getCliente());
            ps.setInt(3, venda.getFuncionario());
            ps.setString(4, venda.getData());
            ps.execute();
            
        } finally {
            ps.close();
            close(conn);
        }

    }

    public void update(Venda venda) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlUpdate);
            ps.setInt(1, venda.getCliente());
            ps.setInt(3, venda.getFuncionario());
            ps.setString(4, venda.getData());
            ps.setInt(5, venda.getId());
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
            ps.setString(1, Integer.toString(id));
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }

    }

    public ArrayList<Venda> list() throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlList);
            rs = ps.executeQuery();
            ArrayList<Venda> list = new ArrayList<>();
            Venda venda;
            while (rs.next()) {
                venda = new Venda();
                venda.setId(rs.getInt("id"));
                venda.setCliente(rs.getInt("cliente"));
                venda.setFuncionario(rs.getInt("funcionario"));
                venda.setData(rs.getString("data"));

                list.add(venda);
            }
            return list;
        } finally {
            rs.close();
            ps.close();
            close(conn);
        }
    }

   
}
