<table border="0" cellpadding="0" cellspacing="0" style="width: 980px; margin: 0 auto;"
       class="footer">
    <tr>
        <td colspan="2" style="border-bottom: 5px solid #3a477a;">
        </td>
    </tr>
    <tr>
        <td align="left">
            <a href="AboutUs_mp.jsp">About Us</a> |
            <a href="ContactUS_mp.jsp">Contact Us</a> |
            <a href="ManageFAQUser_mp.jsp">FAQ</a> |
            <%
                if (session.getAttribute("type") != null) {
                    if (!session.getAttribute("type").toString().equalsIgnoreCase("Administrator")) {
            %>
            <a href="GiveFeedback_mp.jsp">Feedback</a>
            <%                    }
                }
            %>


        </td>
        <td align="right">
            <span>&copy; 2012 Alpha Net Technologies Pvt. Ltd. All rights reserved.</span>
        </td>
    </tr>
</table>