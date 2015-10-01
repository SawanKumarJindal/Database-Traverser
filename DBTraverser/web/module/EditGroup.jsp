
<%@page import="com.bean.SQLRightBean"%>
<%@page import="com.bean.AddEditGroupBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.ManageGroupServices"%>
<%
    ManageGroupServices objServies = new ManageGroupServices();
    AddEditGroupBean objBean = objServies.viewGroupDetail(request.getParameter("groupid"));
    ArrayList alRights = new ArrayList();
    alRights = objServies.getSQLLevelRight();

%>
<form action="AddEditGroupController.jsp" method="post" onsubmit="return ValidateEditGroupForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Edit Group</strong>
            </td>
        </tr>
        <%
            if (request.getParameter("msg") != null) {
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
                                <table class="box" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td><input type="hidden" value="<%=request.getParameter("groupid")%>" name="txtGroupId"</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Title</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtTitle" name="txtTitle" type="text" value="<%=objBean.getTxtTitle()%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <strong>Description</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" id="taDescription" cols="23" rows="2" name="taDescription"><%=objBean.getTaDescription()%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Cost</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" value="<%=objBean.getTxtCost()%>" id="txtCost" name="txtCost" type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Is Unlimited</strong>
                                        </td>
                                        <% if (objBean.getRbUnlimited().equalsIgnoreCase("1")) {%>
                                        <td>
                                            <input type="radio" name="rb" id="rbYes" value="1" checked="checked"  onchange="ValidityVisibility(this)">Yes
                                            <input type="radio" name="rb" id="rbNo" value="0"  onchange="ValidityVisibility(this)">No
                                        </td>
                                        <% } else {
                                        %>
                                        <td>
                                            <input type="radio" name="rb" id="rbYes" value="1" onchange="ValidityVisibility(this)">Yes
                                            <input type="radio" name="rb" id="rbNo" value="0" checked="checked" onchange="ValidityVisibility(this)"/>No
                                        </td>
                                        <%                                            }%>
                                    </tr>

                                    <% if (!objBean.getTxtValidity().equalsIgnoreCase("0")) {%>
                                    <tr>
                                        <td colspan="2">
                                            <div id="dvValidity">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <strong>Validity</strong>
                                                        </td>
                                                        <td>
                                                            <input class="txtStyle" id="txtValidity" name="txtValidity" value="<%=objBean.getTxtValidity()%>" type="text">
                                                        </td></tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td>
                                            <strong>Rights</strong>
                                        </td>
                                    <tr>
                                    <tr>
                                        <td colspan="4">
                                            <table class="styled" border="1" cellpadding="5" cellspacing="0" wi>
                                                <tr class="header">
                                                    <th>
                                                        <input type="checkbox" id="chkSelectAll" name="chkSelectAll" onclick="MarkAll(this)">
                                                    </th>
                                                    <th>
                                                        Title
                                                    </th>
                                                    <th>
                                                        Description
                                                    </th>
                                                </tr>
                                                <%
                                                    String str[] = objBean.getChkSelect();
                                                    int j = 0;
                                                    for (int i = 0; i < alRights.size(); i++) {
                                                        SQLRightBean objRightsBean = (SQLRightBean) alRights.get(i);
                                                        String strClass = "";
                                                        String check = "";
                                                        if (i % 2 == 0) {
                                                            strClass = "alt";
                                                        }
                                                        try {
                                                            if (str != null) {
                                                                // System.out.println("str.length   "+str.length);
                                                                if (str.length > 0 && j < str.length) {
                                                                    //System.out.println("str.length   "+str.length+"    "+str[j]+"           "+objRightsBean.getTxtRightId());
                                                                    if (str[j].equalsIgnoreCase(objRightsBean.getTxtRightId())) {
                                                                        check = "checked";
                                                                        j++;
                                                                        //   System.out.println(""+objRightsBean.getTxtRightId()+check);
                                                                    }
                                                                }
                                                            }
                                                        } catch (Exception e) {
                                                            System.out.println("" + e);
                                                        }
                                                %>
                                                <tr class="<%=strClass%>">
                                                    <td>
                                                        <input type="checkbox" id="chkSelect1" <%=check%> name="chkSelect" value="<%=objRightsBean.getTxtRightId()%>">
                                                    </td>
                                                    <td>
                                                        <%=objRightsBean.getTxtTitle()%>
                                                    </td>
                                                    <td>
                                                        <%=objRightsBean.getTaDescription()%>
                                                    </td>
                                                </tr>
                                                <% }%>

                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <strong>Status</strong>
                                            <%
                                                if (objBean.getRbStatus().equalsIgnoreCase("Active")) {
                                            %>
                                            <input type="radio" name="rbStatus" id="rbActive" value="1" checked >Active
                                            <input type="radio" name="rbStatus" id="rbInactive" value="0">Inactive

                                            <%        } else {
                                            %>
                                            <input type="radio" name="rbStatus" id="rbActive" value="1"  >Active
                                            <input type="radio" name="rbStatus" id="rbInactive" checked value="0">Inactive

                                            <%                                                }
                                            %>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <input class="blue" id="sbtnUpdate" value="Update" name="sbtnUpdate" type="submit">&nbsp;
                            <input class="blue" id="rbtnReset" value="Reset" name="sbtnReset" type="Reset">&nbsp;
                            <input onclick="window.location='ManageGroup_mp.jsp'" class="blue" id="btnCancel" value="Cancel" name="btnCancel" type="button">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

