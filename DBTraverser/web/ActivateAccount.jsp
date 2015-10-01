
<form action="ActivationController.jsp" method="POST">
    <table align="center" width="60%" border="2"  >
        <%        if (request.getParameter("msg") != null) {%>
        <tr> 
            <td style="color: red"><label id="lblMessage"><%=request.getParameter("msg")%> </label></td>
        </tr>
        <% }%>
        <tr>
            <td>
                Enter Activation code provided in your mail to activate your account:
            </td>
        </tr>    

        <tr> 
            <td>
                <input type="text" name="txt" id="txt" /><br>
            </td>
        </tr>
        <tr><td>
                <input type="submit" name="sbtnSubmit" value="Activate!" id="sbtnSubmit" class="blue" />
            </td>
        </tr>
    </table>
</form>