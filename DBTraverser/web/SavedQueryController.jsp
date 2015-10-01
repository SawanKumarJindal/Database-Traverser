
<%@page import="com.DBTraverser.OpenSavedQueryServices"%>
<%
    int id1 = (Integer) session.getAttribute("id");

    if (request.getParameter("id") != null) {
        String id = request.getParameter("id");
        OpenSavedQueryServices service = new OpenSavedQueryServices();
        String query = service.getQuery1(id);

        response.sendRedirect("module/QueryingTool_mp.jsp?query=" + query);
    }

      else  if (request.getParameter("btnSave") != null) {
        String title = request.getParameter("txtTitle");

        String query = request.getParameter("taArea");
        OpenSavedQueryServices services = new OpenSavedQueryServices();
        String result=services.saveQuery(title, query, id1);
        System.out.println("result  "+result);
        response.sendRedirect("module/QueryingTool_mp.jsp?query=" + query);
    }
   

%>