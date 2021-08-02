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
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author ACER
 */
public class UserCreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String roleID = request.getParameter("roleID");
            String address = request.getParameter("address");
            String statusID = "1";
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserError userError = new UserError("", "", "", "", "", "", "");
            boolean check = true;
            if (userID.length() < 3) {
                userError.setUserIDError("User ID must be at least 3 character!");
                check = false;
            }
            if (fullName.length() < 5) {
                userError.setFullNameError("Full name must be at least 5 character!");
                check = false;
            }
            if (email.length() < 10) {
                userError.setEmailError("Invalid Email");
                check = false;
            }
            if (!roleID.equals("US") && !roleID.equals("AD")) {
                userError.setRoleIDError("Role must be ADMIN or USER");
                check = false;
            }
            if (address.length() < 2) {
                userError.setAddressError("Address must be at least 2 character!");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmPasswordError("Not match password!");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                boolean checkDuplicateUserID = dao.checkDuplicateUserID(userID);
                if (checkDuplicateUserID) {
                    userError.setUserIDError("This User ID is already taken!");
                    request.setAttribute("USER_ERROR", userError);
                }
                 boolean checkDuplicateEmail = dao.checkDuplicateEmail(email);
                if (checkDuplicateEmail) {
                    userError.setEmailError("This Email is already used!");
                    request.setAttribute("USER_ERROR", userError);
                } else {
                    UserDTO user = new UserDTO(userID, email, fullName, roleID, password, statusID, address);
                    boolean checkInsert = dao.insertUser(user);
                    if (checkInsert) {
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at UserCreateController: " + e.toString());
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
