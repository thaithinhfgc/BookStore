/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import book.BookDAO;
import book.BookDTO;
import cart.CartDAO;
import cart.CartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import orderDetail.OrderDetailDAO;
import orderDetail.OrderDetailDTO;
import user.UserDTO;
import utils.SendEmail;

/**
 *
 * @author ACER
 */
public class AddOrderController extends HttpServlet {

    private static final String ERROR = "ViewCartController";
    private static final String SUCCESS = "ViewCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String address = user.getAddress();
            Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
            Date date = calendar.getTime();
            int day = calendar.get(Calendar.DATE);
            int month = calendar.get(Calendar.MONTH) + 1;
            int year = calendar.get(Calendar.YEAR);
            String orderDate = String.valueOf(day) + "-" + String.valueOf(month) + "-" + String.valueOf(year);
            String paymentStatus = request.getParameter("paymentStatus");
            int totalMoney = Integer.parseInt(request.getParameter("total"));
            BookDAO bookDao = new BookDAO();
            boolean orderQuantity = true;
            List<BookDTO> bookDto = (List<BookDTO>) session.getAttribute("LIST_CART");
            for (BookDTO book : bookDto) {
                boolean checkQuantity = bookDao.checkQuantity(book.getBookID(), book.getQuantity());
                if (!checkQuantity) {
                    orderQuantity = false;
                    request.setAttribute("ORDER_MESSAGE", "Please check quantity again!");
                }
            }
            if (orderQuantity) {
                OrderDAO orderDao = new OrderDAO();
                boolean order = orderDao.addOrder(userID, address, totalMoney, orderDate, paymentStatus);
                Integer orderID = null;
                if (order) {
                    orderID = orderDao.getOrderID(userID);
                    bookDto = (List<BookDTO>) session.getAttribute("LIST_CART");
                    for (BookDTO book : bookDto) {
                        OrderDetailDAO detail = new OrderDetailDAO();
                        boolean addDetail = detail.addDetail(book.getQuantity(), book.getBookID(), book.getPrice(), orderID);
                        boolean decreaseQuantity = bookDao.decreaseQuantity(book.getBookID(), book.getQuantity());
                    }
                    CartDAO cartDao = new CartDAO();
                    boolean delete = cartDao.deleteCart(userID);
                    if (delete) {
                        url = SUCCESS;
                        request.setAttribute("ORDER_MESSAGE", "Order success!");
                        session.removeAttribute("LIST_CART");
                        String link = "Thank you for purchase! Please click this link to confirm your order: http://localhost:8084/BOOKSTORE/MainController?orderID=" + orderID.toString() + "&action=ConfirmOrder";
                        SendEmail.sendEmail(user.getEmail(), link);
                    }

                }
            }

        } catch (Exception e) {
            log("Error at AddOrderController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
