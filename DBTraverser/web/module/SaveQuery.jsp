

        <form method="Get" action="../SavedQueryController.jsp">
            <table  align="center" width="40%">
                <tr><td align="center"><b>Save Query</b></td></tr>
                 <% if (request.getParameter("msg") != null) {%>   <tr>    
            <td align="left"><label id="lblMsg"><%=request.getParameter("msg")%></label>   </td>    </tr><% }%>
                <tr>
                    <td align="center">

                        <fieldset style="width: 92%" >
                            <legend><b>Group Information</b></legend>
                            <table align="center">
                                 <tr>
                                    <td align="left">
                                        <b> Title:</b>
                                        <input type="text" id="txtTitle" size="10" name="txtTitle"/> 
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <textarea id="taArea" name="taArea" cols="30" /><%=request.getParameter("query") %></textarea>
                                </tr>
                            </table>
                        </fieldset>

                    </td>
                </tr>
                <tr>
                    <td align="center" >
                        <input type="submit"  class="blue" name="btnSave" id="btnSave" value="Save"/>
                        <input type="reset"  class="blue" name="btnReset" id="btnReset" value="Reset"/>
                        <input type="button" onclick="window.location='QueryingTool_mp.jsp'" class="blue" name="btnCancel" id="btnCancel" value="Cancel"/>
                    </td>
                </tr>
            </table>
        </form>
