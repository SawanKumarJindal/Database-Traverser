


<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.AvailableGroupRightsBean"%>
<%@page import="com.DBTraverser.AvailableGroupRightsServices"%>
<%
    String userid = session.getAttribute("id").toString();
    AvailableGroupRightsServices objServices = new AvailableGroupRightsServices();

    ArrayList alPresent= objServices.getPresentGroupAndRight(userid);
    ArrayList alAvailable= objServices.getAvailableGroupAndRight(userid);
     String title = "";

     
%>

<form action="#" method="post">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Available Groups And Rights</strong>
            </td>
        </tr>
            <%
if(request.getParameter("msg")!=null){
%>
    <tr>
        <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>
        </td>
    </tr><% }%>
        <tr>
            <td>
                <table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Group Information</em></strong> </legend>
                                <table class="box" border="0" cellpadding="5" cellspacing="0" width="100z0%">
                                    <tr>
                                        <td colspan="6">
                                            <fieldset><legend>Present Group</legend>
                                                <table>
                                                <%
                                               
                                                if(alPresent.size()>0){ 
                                                    for(int j=0;j<alPresent.size();j++){
                                                        AvailableGroupRightsBean objBean=(AvailableGroupRightsBean)alPresent.get(j);
                                                
%>
                                            
                                                <tr>
                                                    <td>
                                                        <strong></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <strong>Group</strong>
                                                    </td>
                                                    <td align="center">
                                                        <%=objBean.getTxtTitle()%>
                                                    </td>
                                                    <td>
                                                        <strong>Cost</strong>
                                                    </td>
                                                    <td>
                                                        <%=objBean.getTxtCost()%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="right">
                                                        <strong>Description</strong>
                                                    </td>
                                                    <td colspan="3">
                                                        <textarea class="txtStyle" id="taDescription" readonly cols="30" rows="2" name="taDescription"><%=objBean.getTaDescription()%></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="right">
                                                        <strong>Rights</strong>
                                                    </td>
                                                    <td align="left">
                                                        <ul>
                                                            <%
                                                                
                                                                if(objBean.getAlRights()!=null){
                                                                ArrayList al = objBean.getAlRights();
                                                                if (al.size() > 0) {
                                                                    for (int i = 0; i < al.size(); i++) {
                                                                        title = (String) al.get(i);

                                                            %>
                                                            <li><%=title%></li>
                                                            <%    } }
                                                    }%>
                                                        </ul>
                                                    </td>
                                                    <td valign="top">
                                                        <strong>Unlimited</strong></br> 
                                                        <label>
                                                            <%=objBean.getTxtUnlimited()%></label>
                                                    </td>
                                                    <td valign="top"><strong>Valid till</strong>

                                                        <label>
                                                            <%=objBean.getTxtValidity()%></label>
                                                    </td>
                                                </tr>
                                               
                                            
                                            <%    }
                                                    
                                                } else{ 
                                                %>
                                                <tr><td colspan="6"> No Group Founds</td></tr>
                                                <%
        
    } %>
                                            </table></fieldset>
                                        </td>
                                    </tr>
                        <!--                Other available group                                      -->
                                            <%  
                                            
                                                if(alAvailable.size()>0){ 
                                            %>
                                    <tr>
                                        <td colspan="6">
                                            
                                            <fieldset><legend >Other Available Group(s)</legend >
                                                <%
                                                for(int j=0;j<alAvailable.size();j++){
                                                    AvailableGroupRightsBean objBean1=(AvailableGroupRightsBean)alAvailable.get(j);
                                                    

%>
                                                <table>

                                                    <tr>
                                                        <td align="right">
                                                            <strong>Group</strong>
                                                        </td>
                                                        <td align="center">
                                                             <%=objBean1.getTxtTitle()%>
                                                        </td>
                                                        <td>
                                                            <strong>Cost</strong>
                                                        </td>
                                                        <td>     <%=objBean1.getTxtCost()%>       </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="right">
                                                            <strong>Description</strong>
                                                        </td>
                                                        <td colspan="3">
                                                            <textarea class="txtStyle" id="taDescription" cols="30" rows="2" name="taDescription"> <%=objBean1.getTaDescription()%> </textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="right">
                                                            <strong>Rights</strong>
                                                        </td>
                                                        <td align="left">
                                                            <ul>
                                                                 <%
                                                                title = "";
                                                                if(objBean1.getAlRights()!=null){
                                                                ArrayList al1 = objBean1.getAlRights();
                                                                if (al1.size() > 0) {
                                                                    for (int i = 0; i < al1.size(); i++) {
                                                                        title = (String) al1.get(i);

                                                            %>
                                                            <li><%=title%></li>
                                                            <%    } }
                                                    }%>
                                                            </ul>
                                                        </td>
                                                        <td valign="top"><strong>Unlimited</strong></br> 
                                                        <label><%=objBean1.getTxtUnlimited()%></label>
                                                    </td>
                                                    <td valign="top"><strong>Valid For</strong>

                                                        <label><%=objBean1.getTxtValidity()%></label>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="4">
                                                            <input class="blue" type="button" name="sbtnBuy" value="Buy Now" id="sbtnBuy" onclick="window.location='AvailableGroupAndRightController.jsp?groupid=<%=objBean1.getTxtGroupId()%>&flag=1'"/>
                                                        </td>
                                                    </tr>
                                                </table> 
                                                        <% }%>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <% }%>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
