<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.ManageFAQServices"%>
<%@page import="com.bean.ManageFAQBean"%>
<%

    ManageFAQServices service = new ManageFAQServices();
    List list = service.getFaq();
    ManageFAQBean objBean = null;
%>

<table  align="center" >
    <tr><td align="center"><h3>View FAQ</h3></td></tr>
    <tr>
        <td >

            <fieldset style="width: 92%" >
                <table align="center" class="styled" >
                    <tr class="header">
                        <th>Question</th>
                        <th>Answer</th>
                    </tr>
                    <%
                        if (list.size() > 0) {
                            for (int a = 0; a < list.size(); a++) {
                                objBean = (ManageFAQBean) list.get(a);
                                String strClass = "";
                                if (a % 2 != 0) {
                                    strClass = "alt";
                                }
                    %>
                    <tr class="<%=strClass%>">
                        <td align="left">
                            <b> <%=objBean.getFaq()%></b>
                        </td>
                        <td align="left">
                            <%=objBean.getAnswer()%>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>



                  
                </table>
            </fieldset>

        </td>
    </tr>
</table>