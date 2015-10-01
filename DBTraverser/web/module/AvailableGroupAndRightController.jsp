

<%@page import="com.DBTraverser.RegisteredUserServices"%>
<%@page import="com.DBTraverser.AvailableGroupRightsServices"%>
<%

    // To Buy Available Group and Rights
    if (request.getParameter("flag") != null) {
        String userid = session.getAttribute("id").toString();
        AvailableGroupRightsServices objServices = new AvailableGroupRightsServices();
        String result = objServices.buyAvailableGroup(userid, request.getParameter("groupid"));
        response.sendRedirect("AvailableGroupsAndRights_mp.jsp?msg=" + result);

    } else if (request.getParameter("btnUpdateUser") != null) {
        RegisteredUserServices obj = new RegisteredUserServices();
        obj.changeStatusUser(request.getParameter("txtUserId"), request.getParameter("rbtnStatus"));
        response.sendRedirect("ManageRegisteredUser_mp.jsp");
    }
%>