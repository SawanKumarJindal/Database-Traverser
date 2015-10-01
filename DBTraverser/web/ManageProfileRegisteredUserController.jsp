<%@page import="com.DBTraverser.ManageProfileRegisteredUserServices"%>

<jsp:useBean id="objBean" class="com.bean.ManageProfileRegisteredUserBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%

    if (request.getParameter("sbtnSubmit") != null) {
        ManageProfileRegisteredUserServices obj = new ManageProfileRegisteredUserServices();

       
        String result= obj.update(objBean);
        if(result.equalsIgnoreCase("updated")){
            session.setAttribute("msg", "Profile detail Updated Successfully");
        response.sendRedirect("module/HomePage.jsp?msg=Profile detail Updated Successfully");
        
        }else{
        response.sendRedirect("module/ManageProfileRegisteredUser_mp.jsp?msg=Error in updating profile");
        }


    }

   
%>