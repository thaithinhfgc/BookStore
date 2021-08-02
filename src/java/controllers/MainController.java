/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String DELETE_USER = "UserDeleteController";
    private static final String SEARCH_USER = "UserSearchController";
    private static final String UPDATE_USER = "UserUpdateController";
    private static final String LOGOUT = "LogoutController";
    private static final String CREATE_USER = "UserCreateController";
    private static final String UPDATE_STATUS_USER = "UserStatusController";
    private static final String VIEW_BOOK = "ViewBookController";
    private static final String SEARCH_BOOK = "BookSearchController";
    private static final String VIEW_A_BOOK = "ViewABookController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String VIEW_CART = "ViewCartController";
    private static final String REMOVE_CART = "RemoveCartController";
    private static final String VIEW_PROFILE = "ViewProfileController";
    private static final String UPDATE_PROFILE = "UpdateProfileController";
    private static final String ADD_ORDER = "AddOrderController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String VIEW_ORDER = "ViewOrderController";
    private static final String VIEW_ORDER_DETAIL = "ViewOrderDetailController";
    private static final String CONFIRM_ORDER = "ConfirmOrderController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Search".equals(action)) {
                url = SEARCH_USER;
            } else if ("Delete".equals(action)) {
                url = DELETE_USER;
            } else if ("Update".equals(action)) {
                url = UPDATE_USER;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("CreateUser".equals(action)) {
                url = CREATE_USER;
            } else if ("UpdateStatus".equals(action)) {
                url = UPDATE_STATUS_USER;
            } else if ("ViewBook".equals(action)) {
                url = VIEW_BOOK;
            } else if ("SearchBook".equals(action)) {
                url = SEARCH_BOOK;
            } else if ("ViewABook".equals(action)) {
                url = VIEW_A_BOOK;
            } else if ("AddToCart".equals(action)) {
                url = ADD_TO_CART;
            } else if ("ViewCart".equals(action)) {
                url = VIEW_CART;
            } else if ("RemoveCart".equals(action)) {
                url = REMOVE_CART;
            } else if ("ViewProfile".equals(action)) {
                url = VIEW_PROFILE;
            } else if ("UpdateProfile".equals(action)) {
                url = UPDATE_PROFILE;
            } else if ("AddOrder".equals(action)) {
                url = ADD_ORDER;
            } else if ("UpdateCart".equals(action)) {
                url = UPDATE_CART;
            } else if ("ViewOrder".equals(action)) {
                url = VIEW_ORDER;
            } else if ("ViewOrderDetail".equals(action)) {
                url = VIEW_ORDER_DETAIL;
            } else if ("ConfirmOrder".equals(action)) {
                url = CONFIRM_ORDER;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Funtion is not available");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
