

 <%@page import="com.bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.ManageExpertAdviceServices"%>
<%
        ManageExpertAdviceServices objServices = new ManageExpertAdviceServices();
        ArrayList al = objServices.getRequestForAdviceByExpert();
        
           
       
    %>
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>Manage Request For Advise</strong><br />
            </td>
        </tr>
         <% if (request.getParameter("msg") != null) {%>   <tr>    
                <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
        <tr>
            <td>
                <table class="styled" align="center" border="1" cellpadding="5" cellspacing="0">
                    <tr class="header">
                        <th>                 S.NO      </th>
                        <th>     Query Request            </th>
                        <th>            Request Date      </th>
                        <th>        Request By        </th>
                        <th>          &nbsp;     </th>
                    </tr>
                   
                        <%
                            if (al.size() > 0) {
                                for (int i = 0; i < al.size(); i++) {
                                    QueryBean objBean = (QueryBean) al.get(i);
                                    String strClass = "";
                                    if (i % 2 == 0) {
                                        strClass = "alt";
                                    }
                        %>
                        <tr class="<%=strClass%>">
                            <td><%=i + 1%></td>
                        <td><%=objBean.getTxtQueryRequest()%></td>
                            <td><%=objBean.getTxtPostDate()%></td>
                            <td><%=objBean.getTxtUserName()%></td>
                        <td>    <a href="PostQueryResponse_mp.jsp?requestid=<%=objBean.getTxtRequestId()%>">View</a>        </td>
                    </tr>
                    <% }}else{ 
                    %>
                    <tr><td colspan="6"> No record found</td></tr>
                    <%
}%>
                    
                </table>
            </td>
        </tr>
    </table>

