/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFileChooser;
import properties.ReadFromProperties;

/**
 *
 * @author student
 */
@WebServlet(name = "DownloadScriptServlet", urlPatterns = {"/DownloadScriptServlet"})
public class DownloadScriptServlet extends HttpServlet {

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

        try {


            Runtime rt = Runtime.getRuntime();
            //Process pr = rt.exec("cmd /c dir");
            Process pr = rt.exec("mysqldump -u root " + request.getParameter("dbname"));

            BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));

            String fileName = request.getParameter("dbname") + "_Script.sql";
            ReadFromProperties obj = new ReadFromProperties();
            String path = obj.getuploadPath();
            String line = null;
            FileWriter fw = new FileWriter(path + File.separator + fileName);
            while ((line = input.readLine()) != null) {

                fw.write(line + "\n");
            }
            fw.close();



            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.addHeader("Content-Transfer-Encoding", "binary");

            FileInputStream fileIn = new FileInputStream(path + File.separator + fileName);
            ServletOutputStream out1 = response.getOutputStream();

            byte[] outputByte = new byte[1024];
            int i = 0;
//copy binary contect to output stream
            while ((i = fileIn.read(outputByte)) != -1) {
                out1.write(outputByte, 0, i);
            }
            fileIn.close();
            out1.flush();
            out1.close();

        } catch (Exception e) {
            System.out.println("" + e);

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
