
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.List"%>
<%@page import="com.common.QueryToolServices"%>
<%@page import="java.io.PrintWriter"%>

<%
    PrintWriter out1 = response.getWriter();
    QueryToolServices services = new QueryToolServices();
    List u = services.getTableColumnData(request.getParameter("user"), request.getParameter("password"), request.getParameter("dbname"), request.getParameter("tbname"), request.getParameter("url"));

    List s = services.getTableData(request.getParameter("user"), request.getParameter("password"), request.getParameter("dbname"), request.getParameter("tbname"), request.getParameter("url"));
    out1.println("<table class=\"styled\" width=100% border=1 height=170px>");
    out1.println("<tr style=\"max-height: 4px\">");
    for (int y = 0; y < u.size(); y++) {
        out1.println("<th  align=\"center\"><b>");
        out1.println(u.get(y));
        out1.println("</b></th>");


    }
    out1.println("</tr>");

    for (int i = 0; i < s.size(); i++) {

        out1.println("<tr>");
        String a[] = (String[]) s.get(i);
        int l = 100 / a.length;
        for (int p = 0; p < a.length; p++) {
            out1.println("<td width=\"33%\">");
            out1.print(a[p]);
            out1.println("</td>");
        }
        out1.println("</tr>");

    }
    out1.println("</table>");



%>