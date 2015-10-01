

<%@page import="com.DBTraverser.ManageExpertServices"%>
<%    
    ManageExpertServices objServices = new ManageExpertServices();
    if (request.getParameter("status") != null) {
        objServices.changeStatusOfExpert(request.getParameter("userid"), request.getParameter("status"));
        response.sendRedirect("ManageExpert_mp.jsp");
    }else{
    %>
    <jsp:useBean id="obj" class="com.bean.AddEditExpertBean">
        <jsp:setProperty name="obj" property="*"/>
    </jsp:useBean>
<%     
        String result="not ";
        if(request.getParameter("sbtnSave")!=null){
            
            result=objServices.addQueryExpert(obj);
            if(result.equalsIgnoreCase("added")){
                response.sendRedirect("ManageExpert_mp.jsp?msg="+result);
            }else{
                response.sendRedirect("AddExpert_mp.jsp?msg="+result);
            }
        }else if(request.getParameter("sbtnSaveAddNew")!=null){
            result=objServices.addQueryExpert(obj);
            response.sendRedirect("AddExpert_mp.jsp?msg="+result);
        }
        else if(request.getParameter("sbtnUpdate")!=null){
            result=objServices.editQueryExpert(obj);
            if(result.equalsIgnoreCase("updated")){
                response.sendRedirect("ManageExpert_mp.jsp?msg=Record updated sucessfully");
            }else{
                response.sendRedirect("EditExpert_mp.jsp?msg=Record not updated sucessfully&userid="+request.getParameter("txtUserId"));
            }
        }
        else if(request.getParameter("sbtnUpdateProfile")!=null){
            result=objServices.editQueryExpert(obj);
            if(result.equalsIgnoreCase("updated")){
                response.sendRedirect("HomePage.jsp?msg=Record updated sucessfully");
            }else{
                response.sendRedirect("HomePage.jsp?msg=Record not updated sucessfully");
            }
        }else{
            response.sendRedirect("HomePage.jsp");
        }
    
    }
    
%>