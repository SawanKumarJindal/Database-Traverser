

<%@page import="com.DBTraverser.ManageProfileRegisteredUserServices"%>
<%

    if (request.getParameter("sbtnSubmit") != null) {
        ManageProfileRegisteredUserServices obj = new ManageProfileRegisteredUserServices();
        String code = request.getParameter("txt");

        String s = obj.checkCode(code);

        if (s.equalsIgnoreCase("success")) {
            response.sendRedirect("Login_mp.jsp?msg=Account Activated Successfully");
        } else {
            response.sendRedirect("ActivateAccount_mp.jsp?msg=Incorrect Activation Code");
        }
    }
%>