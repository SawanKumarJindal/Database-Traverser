/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.common.ConnectDB;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;

/**
 *
 * @author sumit
 */
@WebServlet(name = "GroupServlet", urlPatterns = {"/GroupServlet"})
public class GroupServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("application/pdf");
        ServletOutputStream out = response.getOutputStream();
        String fileName = "module/GroupReport.jrxml";

        try {
          
            ServletContext ctx = this.getServletConfig().getServletContext();
            String filePath = ctx.getRealPath(fileName);
            File jrxmlFile = new File(filePath);
            InputStream inputStream = new FileInputStream(jrxmlFile);
            JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
            Map parameter = new HashMap();
           
            Connection con = ConnectDB.connect();
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, con);

            JRPdfExporter exporter1 = new JRPdfExporter();
            exporter1.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter1.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter1.exportReport();
        } catch (Exception e) {
            System.out.println("in servlet"      + e.getMessage());
        } finally {
            out.close();
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
