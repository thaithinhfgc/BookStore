/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDAO {

    public boolean addOrder(String userID, String address, int totalMoney, String orderDate, String paymentStatus) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders(userID, address, totalMoney, orderDate, paymentStatus, orderConfirm) VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, address);
                stm.setInt(3, totalMoney);
                stm.setString(4, orderDate);
                stm.setString(5, paymentStatus);
                stm.setString(6, "Not Confirmed");

                check = stm.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getOrderID(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int orderID = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT TOP 1 orderID FROM tblOrders WHERE userID=? ORDER BY orderID DESC";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    orderID = rs.getInt("orderID");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderID;
    }

    public List<OrderDTO> getListOrder(String userID) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT orderID, userID, address, totalMoney, orderDate, paymentStatus, orderConfirm FROM tblOrders WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String address = rs.getString("address");
                    int totalMoney = rs.getInt("totalMoney");
                    String orderDate = rs.getString("orderDate");
                    String paymentStatus = rs.getString("paymentStatus");
                    String orderConfirm = rs.getString("orderConfirm");
                    list.add(new OrderDTO(orderID, userID, address, totalMoney, orderDate, paymentStatus, orderConfirm));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean confirmOrder(String orderID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblOrders SET orderConfirm=? WHERE orderID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "Confirmed");
                stm.setString(2, orderID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

}
