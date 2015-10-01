

<%@page import="com.bean.ManageGroupBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.ManageGroupServices"%>
<%
    ManageGroupServices objServices = new ManageGroupServices();
    ArrayList al = new ArrayList();
    if (request.getParameter("sbtnSearch") != null) {
        al = objServices.searchGroupDetail(request.getParameter("txtSearch"));
    } else {
        if (request.getParameter("status") != null) {
            objServices.changeStatusOfGroup(request.getParameter("groupid"), request.getParameter("status"));
        }
        al = objServices.getGroupDetail();
    }

%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>Manage Group</strong>
        </td>
    </tr>
    <%        if (request.getParameter("msg") != null) {%>
    <tr><td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label></td> </tr><% }%>
    <tr>
        <td>
            <form action="" method="post" onsubmit="return ValidateManageGroupForm()">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td align="left">
                            <input onclick="window.location='AddGroup_mp.jsp'" class="blue" id="btnAddGroup" name="btnAddGroup" type="button" value="Add Group" />
                        </td>
                        <td align="right">
                            <input class="txtStyle" size="15" id="txtSearch" name="txtSearch" type="text" />&nbsp;&nbsp;&nbsp;
                            <input class="blue" id="sbtnSearch" name="sbtnSearch" type="submit" value="Search" />&nbsp;
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table class="styled" border="1" cellpadding="3" cellspacing="1">
                <tr>
                    <th>             S.NO            </th>
                    <th>             Title            </th>
                    <th>               Cost         </th>
                    <th>      Validity <br/>(In days)     </th>
                    <th>       Is Unlimited            </th>
                    <th>           Status            </th>
                    <th>         &nbsp;        </th>
                </tr>
                <%
                    if (al.size() > 0) {
                        for (int i = 0; i < al.size(); i++) {
                            ManageGroupBean objBean = (ManageGroupBean) al.get(i);
                            String strClass = "";
                            if (i % 2 == 0) {
                                strClass = "alt";
                            }
                %>
                <tr class="<%=strClass%>">
                    <td>  <%=i + 1%>     </td>
                    <td>    <%=objBean.getTxtTitle()%>    </td>
                    <td>  <%=objBean.getTxtCost()%>              </td>
                    <td>        <%=objBean.getTxtValidity()%>     </td>
                    <td>         <%=objBean.getTxtUnlimited()%>            </td>
                    <td>             <%=objBean.getTxtActive()%>  <a href="ManageGroup_mp.jsp?groupid=<%=objBean.getTxtGroupId()%>&status=<%=objBean.getTxtActive()%>">Change</a>    </td>
                    <td>      <a href="EditGroup_mp.jsp?groupid=<%=objBean.getTxtGroupId()%> ">View & Edit</a>  </td>
                </tr>
                <%
                    }
                } else {
                %><tr><td colspan="7">No records founds ............</td></tr>
                <%                       }
                %>
            </table>
        </td>
    </tr>
</table>

