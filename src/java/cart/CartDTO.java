/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import book.BookDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ACER
 */
public class CartDTO {

    private String userID;
    private String bookID;
    private int quantity;

    public CartDTO() {
    }

    public CartDTO(String userID, String bookID, int quantity) {
        this.userID = userID;
        this.bookID = bookID;
        this.quantity = quantity;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
