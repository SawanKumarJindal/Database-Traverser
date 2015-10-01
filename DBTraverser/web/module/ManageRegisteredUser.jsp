


<%@page import="com.bean.RegisteredUserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.RegisteredUserServices"%>
<%
    RegisteredUserServices objServices = new RegisteredUserServices();
    ArrayList al = new ArrayList();
    if (request.getParameter("sbtnSearch") != null) {
        al = objServices.getRegisteredUser(request.getParameter("txtSearch").trim());
           } else {
        if (request.getParameter("status") != null) {
            objServices.changeStatusOfUser(request.getParameter("userid"), request.getParameter("status"));
        }
        al = objServices.getRegisteredUser("");

    }

%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form>
            <table align="center" width="70%">
                <tr>
                    <td align="center">
                        <b>Manage Registered User(s)</b>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="text" class="txtStyle" id="txtSearch"  name="txtSearch"/>
                        <input type="submit" id="btnSearch"class="blue"  name="sbtnSearch" value="Search"/>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table align="center" width="100%" border="1" class="styled">
                            <tr class="header">
                                <th>                <b>S.no</b>                     </th>
                                <th>              <b> Name</b>              </th>
                                <th>                     <b>Gender</b>            </th>
                                <th>                    <b>DOB</b>                </th>
                                <th>                 <b>Email Id</b>            </th>
                                <th>                <b>Contact</b>   </th>
                                <th>                <b>Status</b>       </th>
                                <th>                         </th>
                            </tr>
                            <%
                                if (al.size() > 0) {
                                    for (int i = 0; i < al.size(); i++) {
                                        RegisteredUserBean objBean = (RegisteredUserBean) al.get(i);
                                        String strClass = "";
                            if (i % 2 == 0) {
                                strClass = "alt";
                            }
                            %>
                            <tr class="<%=strClass%>">
                                <td><%=i + 1%></td>
                                <td><%=objBean.getTxtName()%></td>
                                <td><%=objBean.getRbGender()%></td>
                                <td><%=objBean.getTxtBirth()%></td>
                                <td><%=objBean.getTxtEmail()%></td>
                                <td><%=objBean.getTxtMobile()%></td>
                                <td><%=objBean.getTxtStatus()%> <a href="ManageRegisteredUser_mp.jsp?userid=<%=objBean.getTxtUserId()%>&status=<%=objBean.getTxtStatus()%>">Change</a></td>
                                <td><a href="ViewDetailsOfRegisteredUser_mp.jsp?userid=<%=objBean.getTxtUserId()%>">View</a></td>
                            </tr>
                            <%  }
                            } else {
                            %>
                            <tr><td colspan="8"> No Record Found</td></tr>
                            <%                                }
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
