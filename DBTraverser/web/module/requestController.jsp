
<%@page import="com.DBTraverser.ManageRequestServices"%>
<%

    if (request.getParameter("sbtnSubmit") != null) {
        ManageRequestServices obj = new ManageRequestServices();
        String title = request.getParameter("txtRTitle");
        String desc = request.getParameter("taDescription");
        int id = (Integer) session.getAttribute("id");
        String result = obj.postRequest(title, desc, id);
        response.sendRedirect("ManageRequest_mp.jsp?msg=" + result);

    }

    if (request.getParameter("sbtnPost") != null) {
        ManageRequestServices obj = new ManageRequestServices();
        String res = request.getParameter("taResponse");
        String id = request.getParameter("h");
        String result=obj.postResponse(id, res);
        response.sendRedirect("../module/ManageRequestAdmin_mp.jsp?msg="+result);

    }

    if (request.getParameter("sbtnEdit") != null) {
        ManageRequestServices obj = new ManageRequestServices();
        String res = request.getParameter("taResponse");
        String id = request.getParameter("h");
        String title = request.getParameter("title");
        String desc = request.getParameter("desc");
        String date = request.getParameter("date");
        obj.editResponse(id, res);
        System.out.println("ho gya..");
        response.sendRedirect("../module/ManageRequestAdmin_mp.jsp");

    }
%>