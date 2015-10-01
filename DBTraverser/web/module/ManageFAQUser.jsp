

<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.ManageFAQServices"%>
<%@page import="com.bean.ManageFAQBean"%>
<%
    ManageFAQServices service = new ManageFAQServices();
    List list = service.getFaq();
    ManageFAQBean objBean = null;
    String msg = "";


%>
<html>
    <head>

        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form method="Get">
            <table align="center" width="70%">
                <tr>
                    <td align="center"><b>FAQ</b></td>
                </tr>
               
                <tr>
                    <td>
                        <table align="center" border="1" width="100%" class="styled">
                            <tr>
                                <th><b>FAQ&nbsp;Id</b></th>
                                <th><b>FAQ </b></th>
                                <th><b>Answer</b></th>
                                <th><b>Status</b></th>

                            </tr>
                            <%
                                if (list.size() > 0) {
                                    for (int a = 0; a < list.size(); a++) {
                                        objBean = (ManageFAQBean) list.get(a);
                            %>
                            <tr>
                                <td><%=objBean.getFaqId()%></td>
                                <td><%=objBean.getFaq()%></td>
                                <td><%=objBean.getAnswer()%></td>
                                <td>
                                    <%
                                        int name = (Integer) objBean.getIsActive();
                                        if (name == 1) {

                                    %>  Active
                                    <%} else {%>
                                    Inactive
                                    
                                    <%}%>


                                </td>

                            </tr>
                            <%                                         }
                                    }  else {
                                    out.println("No record Found");
                                }
                            %>

                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>

</html>
