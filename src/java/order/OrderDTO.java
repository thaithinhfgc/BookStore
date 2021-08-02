/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class OrderDTO {

    private int orderID;
    private String userID;
    private String address;
    private int totalMoney;
    private String orderDate;
    private String paymentStatus;
    private String orderConfirm;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String userID, String address, int totalMoney, String orderDate, String paymentStatus, String orderConfirm) {
        this.orderID = orderID;
        this.userID = userID;
        this.address = address;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.paymentStatus = paymentStatus;
        this.orderConfirm = orderConfirm;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getOrderConfirm() {
        return orderConfirm;
    }

    public void setOrderConfirm(String orderConfirm) {
        this.orderConfirm = orderConfirm;
    }

}
