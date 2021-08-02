/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderDetail;

import book.BookDTO;
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
public class OrderDetailDAO {

    public boolean addDetail(int quantity, String bookID, int price, int orderID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrderDetails(orderID, bookID, quantity, price) VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderID);
                stm.setString(2, bookID);
                stm.setInt(3, quantity);
                stm.setInt(4, price);
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

    public List<BookDTO> getOrderDetail(int orderID) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT B.bookID, title, author, categoryName, B.price, O.quantity, image, decs FROM tblBooks B join tblOrderDetails O on B.bookID = O.bookID join tblCategories C on B.categoryID = C.categoryID WHERE O.orderID=?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, orderID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String bookID = rs.getString("bookID");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String categoryName = rs.getString("categoryName");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("image");
                String decs = rs.getString("decs");
                list.add(new BookDTO(bookID, title, author, categoryName, decs, price, quantity, img, "1"));
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

}
