
<%@page import="com.bean.OpenSavedQueryBean"%>
<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.OpenSavedQueryServices"%>
<%
    OpenSavedQueryServices service = new OpenSavedQueryServices();
    String id = request.getParameter("id");
    List list = null;
    OpenSavedQueryBean objBean = null;
    String msg = "";
    if (request.getParameter("sbtnSearch") != null) {
        list = service.searchQuery(id, request.getParameter("txtSearch"));
    } else {
         if (request.getParameter("queryid") != null) {
             service.deleteQuery(request.getParameter("queryid"));
        }
        list = service.getQuery(id);
    }



%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="OpenSavedQuery_mp.jsp?id=<%=id%>" method="post">
            <table align="center" width="70%" border="1">
                <tr>
                    <td align="center"><b>Open Saved Query</b></td>
                </tr>
                <%
        if (request.getParameter("msg") != null) {
    %>
    <tr><td align="left"><label id ="lblMsg"><%=request.getParameter("msg")%></label></td></tr>
    <% }%>
                <tr>
                    <td align="right">
                        <input type="text" id="txtSearch" name="txtSearch"/>
                        <input type="submit" name="sbtnSearch" class="blue"  id="btnSearch" value="Search">
                    </td>
                </tr>
                <tr>
                    <td>
                        <table align="center" border="1" width="100%" class="styled">
                            <tr>
                                <th><b>S.No</b></th>
                                <th><b>Title</b></th>
                                <th><b>Query</b></th>
                                <th><b>Create Date</b></th>
                                <th><b></b></th>
                                <th><b></b></th>
                            </tr>
                            <%
                                if (list.size() > 0) {
                                    for (int a = 0; a < list.size(); a++) {
                                        objBean = (OpenSavedQueryBean) list.get(a);
                            %>
                            <tr>
                                <td><%=a + 1%></td>
                                <td><%=objBean.getTitle()%></td>
                                <td><%=objBean.getQuery()%></td>
                                <td><%=objBean.getUpdateDate()%></td>
                                <td><a href="../SavedQueryController.jsp?id=<%=objBean.getId()%>">Open</a></td>
                                <td><a href="OpenSavedQuery_mp.jsp?queryid=<%=objBean.getId()%>&id=<%=id%>">Delete</a></td>
                            </tr>
                            <%                                         }
                                } else {
        %>
        <tr><td colspan="6">No query Found</td></tr>
                            <%
                              
                                }
                            %>


                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>

</html>
