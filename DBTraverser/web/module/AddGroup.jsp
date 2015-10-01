
<%@page import="com.bean.SQLRightBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.ManageGroupServices"%>
<%
    ManageGroupServices objServices = new ManageGroupServices();
    ArrayList alRights = new ArrayList();
    alRights = objServices.getSQLLevelRight();

%>
<form action="AddEditGroupController.jsp" method="post" onsubmit="return ValidateAddGroupForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top">
                <strong>Add Group</strong>
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
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>Title</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtTitle" name="txtTitle" type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <strong>Description</strong>
                                        </td>
                                        <td>
                                            <textarea class="txtStyle" id="taDescription" cols="23" rows="2" name="taDescription"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Cost</strong>
                                        </td>
                                        <td>
                                            <input class="txtStyle" id="txtCost" name="txtCost" type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Is Unlimited</strong>
                                        </td>
                                        <td>
                                            <input type="radio" name="rbUnlimited" value="1" id="rbYes" onchange="ValidityVisibility(this)" >Yes
                                            <input type="radio" name="rbUnlimited" value="0" id="rbNo" onchange="ValidityVisibility(this)" checked="checked">No
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="dvValidity">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <strong>Validity</strong>
                                                        </td>
                                                        <td>
                                                            <input class="txtStyle" id="txtValidity" name="txtValidity" type="text">
                                                        </td></tr>
                                                </table>


                                            </div>
                                        </td>
                                    </tr>
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
                                                    for (int i = 0; i < alRights.size(); i++) {
                                                        SQLRightBean objRightsBean = (SQLRightBean) alRights.get(i);
                                                        String strClass = "";
                                                        if (i % 2 == 0) {
                                                            strClass = "alt";
                                                        }
                                                %>
                                                <tr class="<%=strClass%>">
                                                    <td>
                                                        <input type="checkbox" id="chkSelect0" name="chkSelect" value="<%=objRightsBean.getTxtRightId()%>">
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
                                            <input type="radio" name="rbStatus" value="1" id="rbActive" checked>Active
                                            <input type="radio" name="rbStatus" value="0" id="rbInactive">Inactive
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <input class="blue" id="sbtnSave" value="Save" name="sbtnSave" type="submit">&nbsp;
                            <input class="blue" id="sbtnSaveAndAddNew" value="Save &amp; Add New" name="sbtnSaveAndAddNew"
                                   type="submit">&nbsp;
                            <input class="blue" id="rbtnReset" value="Reset" name="sbtnReset" type="Reset">&nbsp;
                            <input onclick="window.location='ManageGroup_mp.jsp'" class="blue" id="btnCancel" value="Cancel" name="btnCancel" type="button">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

