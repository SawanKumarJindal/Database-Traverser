
<%@page import="com.DBTraverser.CommonServices"%>

<jsp:useBean id="objRegUserBean" class="com.bean.RegisteredUserBean">
    <jsp:setProperty property="*" name="objRegUserBean"/>
</jsp:useBean>
<%

    if (request.getParameter("sbtnSubmitSign") != null) {

       
        CommonServices obj = new CommonServices();
        String random = obj.getCode();
        String result = obj.signup(objRegUserBean, random);
        if (result.equalsIgnoreCase("User Created Successfully")) {
            response.sendRedirect("SignRedirect.jsp?msg=" + result);

        } else {
            response.sendRedirect("AccountInformation_mp.jsp?msg=" + result);


        }

    }







%>