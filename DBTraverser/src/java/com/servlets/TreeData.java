/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.common.QueryToolServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author student
 */
@WebServlet(name = "TreeData", urlPatterns = {"/TreeData"})
public class TreeData extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();
            String str = request.getParameter("query");
            if (str.trim().equalsIgnoreCase("table created successfully")) {
                QueryToolServices obj1 = new QueryToolServices();
                String user = (String) session.getAttribute("connectionUsername");
                String password = (String) session.getAttribute("connectionPassword");
                String dbname = (String) session.getAttribute("databaseName");
                String url = (String) session.getAttribute("connectionUrl");
                try {
                    List list = obj1.getTables(dbname, url, user, password);
                    if (list.size() > 0) {
                        for (int a = 0; a < list.size(); a++) {

                            String name = (String) list.get(a);
                            out.println("<dd id='dd1'>+<a href=\"Javascript:void(0)\" onclick=\"elem('"+name+"')\">"+name+"</a></dd>");

                        }
                    }
                } catch (Exception e) {
                    System.out.println("DD " + e);

                }
            } else {
                out.println(-5);
            }
            
        } finally {
            out.close();
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
