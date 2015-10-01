
<div class="menu">
    <%

        if (session.getAttribute("type") != null) {
            String type = session.getAttribute("type").toString();
            if (type.equalsIgnoreCase("Administrator")) {
    %>

    <ul>
        <li><a href="HomePage.jsp"> Home</a></li>

        <li><a href="#">     Users   </a>
            <ul>
                <li><a href="ManageRegisteredUser_mp.jsp">Manage&nbsp;User</a></li>
                <li><a href="ManageExpert_mp.jsp">Manage&nbsp;Expert</a></li>
            </ul>
        </li>
        
        <li><a href="#"> Database </a>
            <ul>
                <li><a href="ManageAutoQuerySyntax_mp.jsp">Manage&nbsp;Auto&nbsp;Queries</a></li>
                <li><a href="ManageGroup_mp.jsp">Manage&nbsp;Group</a></li>
            </ul>
        </li>
        <li><a href="#"> Report</a>
            <ul>
                <li><a href="TotalCollectionReport_mp.jsp">Total&nbsp;Collection</a></li>
                <li><a href="../RegisteredUserReportServlet">User&nbsp;Report</a></li>
                <li><a href="../GroupServlet">Group&nbsp;Report</a></li>
            </ul>
        </li>
        <li><a href="ManageProfileRegisteredUser_mp.jsp" > Edit&nbsp;Profile</a></li>
         <li><a href="ChangePassword_mp.jsp">Change&nbsp;Password</a></li>
        <li><a href="../LogoutController.jsp">Logout</a></li> 

    </ul>

    <%    } else if (type.equalsIgnoreCase("user")) {
    %>

    <ul>
        <li><a href="../module/HomePage.jsp"> Home</a>

        </li>

        <li><a href="#">Request/Advise</a>
            <ul>
                <li><a href="ExpertAdvise_mp.jsp">Expert&nbsp;Query</a></li>
            </ul>
        </li>
        <li><a href="#"> Group/Rights       </a>
            <ul>
                <li><a href="AvailableGroupsAndRights_mp.jsp">Manage&nbsp;Groups</a></li>
            </ul>
        </li>

        <li><a href="QueryingTool_mp.jsp?query="> Querying&nbsp;Tool</a></li>


        <li><a href="ManageProfileRegisteredUser_mp.jsp" >Edit&nbsp;Profile</a> </li>
       
        <li><a href="ChangePassword_mp.jsp">Change&nbsp;Password</a></li>

        <li><a href="../LogoutController.jsp">Logout</a></li> 
    </ul>
    <%    } else if (type.equalsIgnoreCase("QueryExpert")) {
    %>
    <ul>
        <li><a href="HomePage.jsp">Home</a></li>
        <li><a href="ManageRequestForAdvice_mp.jsp"> Manage&nbsp;Advise </a></li>
        <li><a href="ManageExpertProfile_mp.jsp" >Edit&nbsp;Profile </a></li>
        <li><a href="ChangePassword_mp.jsp" >Change&nbsp;Password</a></li>
        <li><a href="../LogoutController.jsp">Logout</a></li> 
    </ul>
    <%            } else {
                response.sendRedirect("../Login_mp.jsp");
            }

        } else {

            response.sendRedirect("../Login_mp.jsp");
        }
    %>

</div>