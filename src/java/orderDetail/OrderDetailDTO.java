/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderDetail;

/**
 *
 * @author ACER
 */
public class OrderDetailDTO {
    private int orderID;
    private String bookID;
    private int quanity;
    private int price;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int orderID, String bookID, int quanity, int price) {
        this.orderID = orderID;
        this.bookID = bookID;
        this.quanity = quanity;
        this.price = price;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    
    
}
