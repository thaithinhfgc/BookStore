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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;

/**
 *
 * @author ACER
 */
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewABookController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String bookID = request.getParameter("bookID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            CartDAO dao = new CartDAO();
            boolean checkABook = dao.checkABook(user.getUserID(), bookID);
            if (checkABook) {
                CartDTO cart = new CartDTO(user.getUserID(), bookID, quantity);
                boolean updateCart = dao.updateCart(cart);
                if (updateCart) {
                    url = SUCCESS;
                    request.setAttribute("CART_MESSAGE", "Add to cart success!");
                }
            } else {
                CartDTO cart = new CartDTO(user.getUserID(), bookID, quantity);
                boolean addToCart = dao.addToCart(cart);
                if (addToCart) {
                    url = SUCCESS;
                    request.setAttribute("CART_MESSAGE", "Add to cart success!");
                }
            }

        } catch (Exception e) {
            log("Error at ViewCartController: " + e.toString());
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
