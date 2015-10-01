<%@page import="java.util.ArrayList"%>
<%@page import="com.DBTraverser.AvailableGroupRightsServices"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML >
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        AvailableGroupRightsServices objServices = new AvailableGroupRightsServices();
        ArrayList al = new ArrayList();
        if (request.getParameter("sbtnProceed") != null) {
            al = objServices.getTotalCollection(request.getParameter("txtStartDate"), request.getParameter("txtEndDate"));
        }

    %>
    <body>
        <form>
            <table align="center" width="50%">
                <tr>
                    <td align="center">
                        <b>Report- Total Collection</b>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b><I>Date Range</I></b>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <fieldset>
                            <table width="100%" align="left">
                                <tr>
                                    <td>
                                        <b>Start Date</b>
                                    </td>
                                    <td>
                                        <input class="txtStyle" type="text" id="txtStartDate" name="txtStartDate" readonly/>
                                    </td>
                                    <td>
                                        <b>End Date</b>
                                    </td>
                                    <td>
                                        <input class="txtStyle" type="text" id="txtEndDate" name="txtEndDate" readonly/>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <input type="submit" class="blue"  id="sbtnProceed" name="sbtnProceed" value="Proceed"/>
                                        <input type="reset" id="rbtnReset" class="blue"  name="rbtnReset" value="Reset"  />
                                    </td>
                                </tr>
                            </table>
                            `                   
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <table align="left" border="1" width="100%" class="styled">
                            <tr>
                                <th align="center"><b>Date</b></th>
                                <th align="center"><b>Received Amount</b></th>
                            </tr>
                            <%
                                if (al.size() > 0) {
                                    for (int i = 0; i < al.size(); i++) {
                                        ArrayList alst = (ArrayList) al.get(i);
                                        String strClass = "";
                            if (i % 2 == 0) {
                                strClass = "alt";
                            }
            %>
            <tr class="<%=strClass%>">
                                <td><%=alst.get(1)%></td>
                                <td><%=alst.get(0)%></td>
                            </tr>
                            <%
                                }
                            } else {

                            %>
                            <tr><td colspan="3"> No Record Found</td></tr>
                            <%                          }
                            %>


                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
