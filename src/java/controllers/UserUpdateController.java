/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author ACER
 */
public class UserUpdateController extends HttpServlet {

    private static final String ERROR = "UserSearchController";
    private static final String SUCCESS = "UserSearchController";
    private static final String LOGOUT = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String statusID = request.getParameter("statusID");
            UserError userError = new UserError("", "", "", "", "", "", "");
            boolean check = true;
            if (fullName.length() < 5) {
                userError.setFullNameError("Full Name must be at least 5 Character");
                check = false;
            }
            if ((!roleID.equals("AD")) && (!roleID.equals("US"))) {
                userError.setRoleIDError("Role ID must be AD or US");
                check = false;
            }
            if (address.length() < 2) {
                userError.setAddressError("Adress must be at least 2 character");
                check = false;
            }
            if (statusID.equals("active")) {
                statusID = "1";
            } else {
                statusID = "0";
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, email, fullName, roleID, "***", statusID, address);
                boolean checkUpdate = dao.updateUser(user);
                if (checkUpdate) {
                    url = SUCCESS;
                    if (userID.equals(loginUser.getUserID()) && loginUser.getRoleID().equals("AD")) {
                        session = request.getSession(false);
                        if (session != null) {
                            session.invalidate();
                        }
                        url = LOGOUT;
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            log("Error at UserUpdateController" + e.toString());
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
