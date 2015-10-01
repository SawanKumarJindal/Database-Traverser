/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common;


import com.bean.LoginBean;
import com.bean.settingsBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AuthenticationServlet", urlPatterns = {"/AuthenticationServlet"})
public class AuthenticationServlet extends HttpServlet {

    HttpSession logins = null;
    RequestDispatcher rd = null;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String username = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            QueryToolServices objServices = new QueryToolServices();
            LoginBean obj = objServices.getData(username, password);
            if (obj != null) {
                if (obj.getStatus() == 1) {
                   
                        objServices.updateLoginTime(obj.getUser_Id());

                        logins = request.getSession();
                        logins.setAttribute("username", obj.getUser_Name());
                        logins.setAttribute("id", obj.getUser_Id());
                        logins.setAttribute("status", obj.getStatus());
                        logins.setAttribute("type", obj.getUser_Type());
                        if (obj.getUser_Type().equalsIgnoreCase("user")) {
                            try {

                                 settingsBean obj1 = objServices.settings(obj.getUser_Id());
                                logins.setAttribute("databaseName", obj1.getDatabaseName());
                                logins.setAttribute("connectionPassword", obj1.getConnectionPassword());
                                logins.setAttribute("connectionUsername", obj1.getConnectionUsername());
                                logins.setAttribute("connectionUrl", obj1.getConnectionUrl());
                                logins.setAttribute("databaseSettingsId", obj1.getDatabaseSettingsId());
                                logins.setAttribute("isActive", obj1.getIsActive());
                                logins.setAttribute("port", obj1.getPort());
                                logins.setAttribute("serverIp", obj1.getServerIp());
                            } catch (Exception e) {
                                System.out.println("in AuthenticationServlet internal " + e);
                            }
                        }

                        response.sendRedirect("module/HomePage.jsp");
                   
                } else if (obj.getStatus() == -1) {
                    response.sendRedirect("ActivateAccount_mp.jsp");
                } else {
                    response.sendRedirect("Login_mp.jsp?msg=Access denied by administrator");
                }

            } else {
                response.sendRedirect("Login_mp.jsp?msg=Invalid username or Password");

            }

        } catch (Exception e) {
            System.out.println("in AuthenticationServlet  " + e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
