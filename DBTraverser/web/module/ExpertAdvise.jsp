<%@page import="com.bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.ManageExpertAdviceServices"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="validations.js"></script>
        <script type="text/javascript">
            
            function check()
            {
                var search = document.getElementById("txtSearch").value;
                
                if(search=="")
                {
                    alert("Enter Search Parameters");      
                       
                    return false;
                         
                }           
                return true;
            }
             
        </script>
    </head>
    <%
        ManageExpertAdviceServices objServices = new ManageExpertAdviceServices();
        ArrayList al = new ArrayList();
        int userid = Integer.parseInt(session.getAttribute("id").toString());
        if (request.getParameter("sbtnSearch") != null) {
            al = objServices.getExpertAdviceForUser(userid, request.getParameter("txtSearch"));
        } else {
            al = objServices.getExpertAdviceForUser(userid,"");
        }
    %>
    <body>
        <table align="center" width="70%">
            <tr>
                <td align="center" colspan="4">
                    <b>Expert Advise</b>
                </td>
            </tr>
            <% if (request.getParameter("msg") != null) {%>   <tr>    
                <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
            <tr>

            </tr>
            <tr>
                <td align="left" >
                    <form action="ExpertAdvise_mp.jsp" method="POST" onsubmit="return check()">
                        <table width="100%">
                            <tr>
                                <td ><input type="button" class="blue"  id="txtPostNewQuery" name="txtPostNewQuery" value="Post New Query" onclick="window.location='PostNewQuery_mp.jsp'"/></td>
                                <td colspan="3" align="right"><input type="text" name="txtSearch" id="txtSearch"/> <input type="submit" name="sbtnSearch" value="Search"/> </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    <table width="100%" class="styled" border="2">
                        <tr>
                            <th><b>S.No</b></th>
                            <th><b>Query Request</b></th>
                            <th><b>Post Date</b></th>
                            <th><b>Solution Available</b></th>
                            <th><b></b></th>
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
                            <td><%=objBean.getTaDescription()%></td>

                            <td><a href="ViewQueryDetail_mp.jsp?requestid=<%=objBean.getTxtRequestId()%>">View Details</a></td>
                        </tr>
                        <%                          }
                            } else{ 
    %>
    <tr><td colspan="5"> No Records Found !!!</td></tr>
                        <%
    } %>
                    </table>
                </td>
            </tr>
        </table>

    </body>
</html>
