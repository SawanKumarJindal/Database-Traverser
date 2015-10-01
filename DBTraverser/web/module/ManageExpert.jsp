

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.ManageExpertBean"%>
<%@page import="com.DBTraverser.ManageExpertServices"%>
<%
    ManageExpertServices objServices=new ManageExpertServices();
    List al=new ArrayList();
    if(request.getParameter("sbtnSearch")!=null){
        al=objServices.getExpertData(request.getParameter("txtName"));
    }else{       
        al=objServices.getExpertData();
    }
%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>Manage Experts</strong>
        </td>
    </tr>
    <% if (request.getParameter("msg") != null) {%>   <tr>    
        <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>        </td>    </tr><% }%>

    <tr>
        <td>
            <form action="#" method="post" onsubmit="return ValidateManageExpertForm()">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td align="left">
                            <input onclick="window.location='AddExpert_mp.jsp'" class="blue" id="btnAddExpert" value="Add Expert" name="btnAddExpert" type="button">&nbsp;
                        </td>
                        </td>
                        <td colspan="2" align="right">
                            Name&nbsp;<input class="txtStyle" id="txtName" size="10" name="txtName" type="text">
                            &nbsp;<input class="blue" id="sbtnSearch" value="Search" name="sbtnSearch" type="submit">
                        </td>
                    </tr>
                </table>
            </form> </td> </tr>
    <tr>
        <td>
            <table class="styled" border="1" cellpadding="3" cellspacing="1">
                <tr class="header">
                    <th>                S.No.           </th>
                    <th>             User Name         </th>
                    <th>            Name           </th>
                    <th>            DOB         </th>
                    <th>            Gender         </th>
                    <th>          Contact     </th>
                    <th>        Dept/Deg    </th>
                    <th>        Status </th>
                    <th>      &nbsp;      </th>
                </tr>
                <%
                    if(al.size()>0){
                        for(int i=0;i<al.size();i++){
                        ManageExpertBean objBean=(ManageExpertBean)al.get(i);
                       String strClass = "";
                            if (i % 2 == 0) {
                                strClass = "alt";
                            }
                %>
                <tr class="<%=strClass%>">
                    <td>          <%=i+1%>      </td>
                    <td>          <%=objBean.getUser_Name() %>      </td>
                    <td>     <%=objBean.getName() %>  </td>
                    <td>      <%=objBean.getDOB() %>   </td>
                    <td>   <%=objBean.getGender() %> </td>
                    <td>       <%=objBean.getContact() %>        </td>
                    <td>       <%=objBean.getDepartment() %> </td>
                    <td>
                        <a href="AddEditExpertController.jsp?userid=<%=objBean.getUser_Id() %>&status=<%=objBean.getStatus() %>"><%=objBean.getStatus() %></a>&nbsp;
                    </td>
                    <td>
                        <a href="EditExpert_mp.jsp?userid=<%=objBean.getUser_Id() %>">View & Edit</a>&nbsp;
                    </td>
                </tr>
                <%
                 }
    }else{
        %>
        <tr><td colspan="7">No Record found ..</td></tr>
                <%
}
%>
               
            </table>
        </td>
    </tr>
</table>

