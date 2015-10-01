


<%@page import="com.DBTraverser.CommonServices"%>
<%
    String userid = session.getAttribute("id").toString();
    String password = request.getParameter("txtCPassword");
    String npassword = request.getParameter("txtNPassword");
    CommonServices log = new CommonServices();


    String result = log.passChange(userid, npassword, password);
    if (result.equalsIgnoreCase("changed")) {
        session.setAttribute("msg", "Password Changed Successfully");
        response.sendRedirect("module/HomePage.jsp?msg=Password Changed Successufully");
    } else {
        response.sendRedirect("module/ChangePassword_mp.jsp?msg=Wrong password try again....");
    }






%>