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
@WebServlet(name = "Test", urlPatterns = {"/Test"})
public class Test extends HttpServlet {

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
            String query = request.getParameter("query").toLowerCase();
            QueryToolServices execute = new QueryToolServices();
            int id1 = (Integer) session.getAttribute("id");
            String privelege = execute.getUserpriviledge(id1);
            String am = (String) session.getAttribute("serverIp");
            String user = (String) session.getAttribute("connectionUsername");
            String password = (String) session.getAttribute("connectionPassword");
            String dbname = (String) session.getAttribute("databaseName");
            String url = (String) session.getAttribute("connectionUrl");
            if (query.startsWith("select") || query.startsWith("show") || query.startsWith("desc")) {
                if (query.startsWith("show") && query.contains("databases")) {
                    out.println("Don't have privelege to show  databases ");
                } else {
                    List listAllData = execute.selectTableData(query, url, user, password, id1);
                    List u = (List) listAllData.get(0);
                    String error = (String) u.get(0);
                    if (error.startsWith("Exception   :")) {
                        out.println(error);
                    } else {

                        List s = (List) listAllData.get(1);



                        out.println("<table valign=\"top\" class=\"styled\" width=100% border=1 height=170px>");
                        out.println("<tr>");
                        for (int y = 0; y < u.size(); y++) {
                            out.println("<th valign=\"top\" style=\"height: 10px\" align=\"center\"><b>");
                            out.println(u.get(y));
                            out.println("</b></th>");
                        }
                        out.println("</tr>");

                        for (int i = 0; i < s.size(); i++) {
                            out.println("<tr>");
                            String a[] = (String[]) s.get(i);
                            for (int p = 0; p < a.length; p++) {
                                out.println("<td valign=\"top\" width=\"33%\">");
                                out.print(a[p]);
                                out.println("</td>");
                            }

                            out.println("</tr>");

                        }

                        out.println("</table>");
                    }
                }
            } else if (query.startsWith("update") && privelege.contains("update") || query.startsWith("drop") && privelege.contains("drop") || query.startsWith("delete") && privelege.contains("delete") || query.startsWith("alter") && privelege.contains("alter") || query.startsWith("truncate") && privelege.contains("truncate")) {
                String insert = execute.InsertQueryCName(query, url, user, password, id1);
                out.println(insert);
            } else if (query.startsWith("create")) {
                if (query.contains("database")) {
                    out.println(-5);
                } else {
                    String insert = execute.InsertQueryCName(query, url, user, password, id1);
                    out.println(insert);
                }

            } else if (query.startsWith("insert")) {
                String insert = execute.InsertQueryCName(query, url, user, password, id1);
                System.out.println("insert " + insert);
                out.println(insert);
            } else {
                out.println("Don't have privelege to execute query");

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
