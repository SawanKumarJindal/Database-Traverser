/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.DBTraverser.ManageExpertAdviceServices;
import com.bean.QueryBean;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import properties.ReadFromProperties;

/**
 *
 * @author sumit
 */
@WebServlet(name = "PostQueryServlet", urlPatterns = {"/PostQueryServlet"})
public class PostQueryServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            ReadFromProperties obj = new ReadFromProperties();
            String uploadDirPath = obj.getuploadPath();
            String  filePath = "";
            int flag = 0;
            QueryBean objBean = new QueryBean();
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List list = upload.parseRequest(request);
                Iterator itr = list.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    boolean chkFileOrFormField = item.isFormField();
                    if (chkFileOrFormField == false) {
                        if (item.getName().length() != 0) {
                            String fileName = item.getName();
                            if (fileName.lastIndexOf(File.separator) > -1) {
                                fileName = fileName.substring(fileName.lastIndexOf(File.separator) + 1);
                            }
                            filePath = uploadDirPath + File.separator + fileName;
                            File chkDirectory = new File(uploadDirPath);
                            File chkFile = new File(filePath);
                            boolean isDir = chkDirectory.isDirectory();
                            if (isDir) {
                                    item.write(chkFile);
                                    flag = 1;
                            } else {
                                boolean b = chkDirectory.mkdirs();
                                if (b) {
                                    item.write(chkFile);
                                    flag = 1;
                                }
                            }
                            if(flag==1){
                                objBean.setFlQueryScriptFile(fileName);
                            }
                        } 
                    }


                    if (chkFileOrFormField == true) {                        
                        if (item.getFieldName().equalsIgnoreCase("txtUserId")) {
                            objBean.setTxtUserId(Integer.parseInt(item.getString()));
                          }
                        if (item.getFieldName().equalsIgnoreCase("txtQueryRequest")) {
                            objBean.setTxtQueryRequest(item.getString());
                        }
                        if (item.getFieldName().equalsIgnoreCase("taDescription")) {
                            objBean.setTaDescription(item.getString());
                            }
                       
                        
                    }
                }
                if (flag == 1) {
                    ManageExpertAdviceServices objServices=new ManageExpertAdviceServices();
                            boolean f=objServices.addQueryExpert(objBean);
                            if(f){
                             response.sendRedirect("module/ExpertAdvise_mp.jsp?msg=Query posted successfully ");
                            }else{
                                 response.sendRedirect("module/ExpertAdvise_mp.jsp?msg=Query posted");
                            }
                           
                } else {
                    response.sendRedirect("module/PostNewQuery_mp.jsp?msg=Query posted");
                }
            } catch (Exception e) {
                System.out.println("<h2 style=\"color:red;\">Exception in FileUploadServlet : " + e);
            }
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
