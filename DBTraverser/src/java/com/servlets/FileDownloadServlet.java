/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import properties.ReadFromProperties;

/**
 *
 * @author sumit
 */
@WebServlet(name = "FileDownloadServlet", urlPatterns = {"/FileDownloadServlet"})
public class FileDownloadServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("application/octet-stream");
        ServletOutputStream out=response.getOutputStream();
        try {
            String path = "";
            ReadFromProperties obj=new ReadFromProperties();
            path=obj.getuploadPath()+File.separator;
            if (request.getParameter("path") != null) {
                path =path+ request.getParameter("path");
            }
           
            File file = new File(path);

            FileInputStream fis = new FileInputStream(file);
            BufferedInputStream bis = new BufferedInputStream(fis);

            response.addHeader("Content-Disposition", "attachment;filename=\"" + file.getName() + "\"");
            response.addHeader("Content-Transfer-Encoding", "binary");
            response.setContentLength((int) file.length());
//------------------------------------------------------------
            int start = 0;
            int length = 1024;
            int offset = -1;
            byte[] buffer = new byte[length];
            while ((offset = bis.read(buffer, start, length)) != -1) {
               out.write(buffer);
            }
            out.flush();
        } catch (Exception e) {
            out.println("<b>Exception in DownloadSevlet : "+e);
        }  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
