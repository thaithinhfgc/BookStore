/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

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
public class CartDAO {

    public boolean checkABook(String userID, String bookID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, bookID FROM tblCarts WHERE userID=? AND bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, bookID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean addToCart(CartDTO cart) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblCarts(userID, bookID, quantity) VALUES(?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cart.getUserID());
                stm.setString(2, cart.getBookID());
                stm.setInt(3, cart.getQuantity());
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

    public boolean updateCart(CartDTO cart) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblCarts SET quantity=quantity+? WHERE userID=? AND bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, cart.getQuantity());
                stm.setString(2, cart.getUserID());
                stm.setString(3, cart.getBookID());
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

    public List<BookDTO> viewCart(String userID) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT C.bookID,title,categoryName, author, price,C.quantity,image FROM tblBooks B join tblCarts C on B.bookID = C.bookID JOIN tblCategories CT on B.categoryID=CT.categoryID WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String title = rs.getString("title");
                    String category = rs.getString("categoryName");
                    String author = rs.getString("author");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    list.add(new BookDTO(bookID, title, author, category, "", price, quantity, image, ""));
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

    public boolean removeCart(String userID, String bookID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "DELETE tblCarts WHERE userID=? AND bookID=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, bookID);
            result = stm.executeUpdate() > 0 ? true : false;
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

    public boolean deleteCart(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "DELETE tblCarts WHERE userID=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            result = stm.executeUpdate() > 0 ? true : false;
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

    public boolean updateCart1(CartDTO cart) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblCarts SET quantity=? WHERE userID=? AND bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, cart.getQuantity());
                stm.setString(2, cart.getUserID());
                stm.setString(3, cart.getBookID());
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
