/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book;

/**
 *
 * @author ACER
 */
public class BookDTO {

    private String bookID;
    private String title;
    private String author;
    private String categoryID;
    private String decs;
    private int price;
    private int quantity;
    private String image;
    private String statusID;

    public BookDTO() {
    }

    public BookDTO(String bookID, String title, String author, String categoryID, String decs, int price, int quantity, String image, String statusID) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.categoryID = categoryID;
        this.decs = decs;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.statusID = statusID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getDecs() {
        return decs;
    }

    public void setDecs(String decs) {
        this.decs = decs;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

   

}

