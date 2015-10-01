<%@page import="com.bean.HistoryBean"%>
<%@page import="com.DBTraverser.encode"%>
<%@page import="java.util.List"%>
<%@page import="com.DBTraverser.CommonServices"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<%

CommonServices services = new CommonServices();
    List list=services.getrecentActivity((Integer)session.getAttribute("id"));
    HistoryBean objBean = null;
    encode e = new encode();

%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form>
            <table border="1" align="center" width="60%">
                <tr><td align="center"><b>Last 30 Days Activities</b></td></tr>
               
                <tr>
                    <td >
                       
                            <fieldset style="width: 92%" >
                                <table class="styled" border="1" align="center">
                                    <tr>
                                        <th><b>Date</b></th>
                                        <th><b>Query</b></th>
                                    </tr>
                                      <%
                            if(list.size() > 0)
                            {
                                for(int i=0;i<list.size();i++)
                                {
                                    objBean =(HistoryBean) list.get(i);
                                
                            
                            %>
                                    <tr>
                                        <td align="left">
                                            <b> <%=objBean.getDate()%></b>
                                        </td>
                                        <td align="left">
                                            <%=e.decoder((String)(objBean.getQuery()))%>
                                        </td>
                                    </tr>
                                        <%
                                                                           }
                                                               }
    else
               {
        out.println("no record found");
    }
    %>
                                    
                                    
                                    <tr>
                                        <td align="center" colspan="3">
                                            <input type="button" name="btnClose" id="btnClose" onclick="window.location='QueryingTool_mp.jsp?query='" class="blue" value="Close"/>
                                        </td>
                                </table>
                            </fieldset>
                       
                    </td>
                </tr>
            </table>
        </form>
        

    </body>
</html>
