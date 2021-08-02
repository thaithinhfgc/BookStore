/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book;

import cart.CartDTO;
import category.CategoryDTO;
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
public class BookDAO {

    public List<BookDTO> getAllBook() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID, title, image, decs, price, categoryName FROM tblBooks B join tblCategories C on B.categoryID = C.categoryID";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String title = rs.getString("title");
                    String image = rs.getString("image");
                    int price = rs.getInt("price");
                    String decs = rs.getString("decs");
                    String categoryID = rs.getString("categoryName");
                    list.add(new BookDTO(bookID, title, "", categoryID, decs, price, 1, image, ""));
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

    public List<BookDTO> getListBook(String search) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID, title, image, decs, price, categoryName FROM tblBooks B join tblCategories C on B.categoryID = C.categoryID WHERE title like ? or author like ? or categoryName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + search + "%");
                stm.setString(3, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String title = rs.getString("title");
                    String image = rs.getString("image");
                    int price = rs.getInt("price");
                    String decs = rs.getString("decs");
                    String categoryID = rs.getString("categoryName");
                    list.add(new BookDTO(bookID, title, "", categoryID, decs, price, 1, image, ""));
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

    public BookDTO getABook(String bookID) throws SQLException {
        BookDTO book = new BookDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID, title, author, categoryName, decs, price, quantity, image FROM tblBooks B JOIN tblCategories C on B.categoryID=C.categoryID WHERE bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    String categoryID = rs.getString("categoryName");
                    String decs = rs.getString("decs");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    book = new BookDTO(bookID, title, author, categoryID, decs, price, quantity, image, "1");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return book;
    }

    public boolean checkQuantity(String bookID, int quantity) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int bookQuantity;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT quantity FROM tblBooks WHERE bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    bookQuantity = rs.getInt("quantity");
                    if (quantity > bookQuantity) {
                        result = false;
                    } else {
                        result = true;
                    }
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
        return result;
    }

    public boolean decreaseQuantity(String bookID, int quantity) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblBooks SET quantity=quantity-? WHERE bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, bookID);
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
